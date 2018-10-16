From: Oscar Gomez Fuente <oscargomezf@gmail.com>
Date: Tue, 16 Oct 2018 18:44:42 +0200
Subject: [Buildroot] [PATCH 1/1] ntp: added ntpdate support to the S49ntp
 script
Message-ID: <1539708282-23077-1-git-send-email-oscargomezf@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Oscar Gomez Fuente <oscargomezf@gmail.com>
---
 package/ntp/S49ntp | 58 ++++++++++++++++++++++++++++++++----------------------
 1 file changed, 34 insertions(+), 24 deletions(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 35e5874..f5c4cb8 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -1,34 +1,44 @@
 #! /bin/sh
 
 NAME=ntpd
+NTPDATE=/usr/bin/ntpdate
 
 # Read config file if it is present.
-if [ -r /etc/default/$NAME ]
-then
-  . /etc/default/$NAME
+if [ -r /etc/default/$NAME ]; then
+. /etc/default/$NAME
 fi
 
-case "$1" in
-  start)
-    printf "Starting $NAME: "
-    start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-  stop)
-    printf "Stopping $NAME: "
-    start-stop-daemon -K -q -n $NAME
-    [ $? = 0 ] && echo "OK" || echo "FAIL"
-    ;;
-  restart|reload)
-    echo "Restarting $NAME: "
-    $0 stop
-    sleep 1
-    $0 start
-    ;;
-  *)
-    echo "Usage: $0 {start|stop|restart|reload}" >&2
-    exit 1
-    ;;
+case $1 in
+start)
+	printf "Starting $NAME: "
+	if [ -f $NTPDATE ]; then
+		NUM_SERVER=0
+		CURRENT_DATE=$(date | grep "1970")
+		while [ "$NUM_SERVER" != "4" -a "$CURRENT_DATE" != "" ]
+		do
+			$NTPDATE $NUM_SERVER.pool.ntp.org > /dev/null 2>&1
+			CURRENT_DATE=$(date | grep "1970")
+			NUM_SERVER=$(( $NUM_SERVER + 1 ))
+		done
+	fi
+	start-stop-daemon -S -q -x /usr/sbin/ntpd -- -g
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+stop)
+	printf "Stopping $NAME: "
+	start-stop-daemon -K -q -n $NAME
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	;;
+restart|reload)
+	echo "Restarting $NAME: "
+	$0 stop
+	sleep 1
+	$0 start
+	;;
+*)
+	echo "Usage: $0 {start|stop|restart|reload}" >&2
+	exit 1
+	;;
 esac
 
 exit 0
-- 
1.9.1
