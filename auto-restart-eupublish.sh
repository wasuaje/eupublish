#!/bin/bash

PIDFILE="/local2/applications/publisher/conf/pid2.txt"
PID=`cat $PIDFILE`
ISALIVE=`ps -fea | grep $PID | grep -v grep`

#comando para hacer stop al eupublish
sh /local2/applications/scripts/stop_publisher.sh

until [ $ISALIVE<>""] ;
do
  sleep 2
  ISALIVE=`ps -fea | grep `$PID | grep -v grep`
done

#comando para hacer start al eupublish
sh /local2/applications/scripts/start_publisher.sh

