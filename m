From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Mon, 22 Dec 2014 11:27:01 -0300
Subject: [Buildroot] [PATCH 3/3] ntp: adjust initscript
In-Reply-To: <1419258421-18318-1-git-send-email-gustavo@zacarias.com.ar>
References: <1419258421-18318-1-git-send-email-gustavo@zacarias.com.ar>
Message-ID: <1419258421-18318-3-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use proper status messages, make spacing standard instead of a mix of
spacing/tabbing, drop boringly obvious comment from the header.
Also make reload = restart since ntpd doesn't handle reloading resulting
in the old reload being 'stop'.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/ntp/S49ntp | 46 ++++++++++++++++++++--------------------------
 1 file changed, 20 insertions(+), 26 deletions(-)

diff --git a/package/ntp/S49ntp b/package/ntp/S49ntp
index 5721f59..171c200 100755
--- a/package/ntp/S49ntp
+++ b/package/ntp/S49ntp
@@ -1,10 +1,5 @@
 #! /bin/sh
-#
-# System-V init script for the openntp daemon
-#
 
-PATH=/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
-DESC="network time protocol daemon"
 NAME=ntpd
 DAEMON=/usr/sbin/$NAME
 
@@ -14,31 +9,30 @@ test -x $DAEMON || exit 0
 # Read config file if it is present.
 if [ -r /etc/default/$NAME ]
 then
-	. /etc/default/$NAME
+  . /etc/default/$NAME
 fi
 
 case "$1" in
   start)
-	echo -n "Starting $DESC: $NAME"
-	start-stop-daemon -S -q -x $DAEMON -- -g
-	echo "."
-	;;
-  stop) echo -n "Stopping $DESC: $NAME"
-	start-stop-daemon -K -q -n $NAME
-	echo "."
-	;;
-  reload|force-reload) echo -n "Reloading $DESC configuration..."
-	start-stop-daemon -K -q -n $NAME -s 1
-	echo "done."
-  ;;
-  restart) echo "Restarting $DESC: $NAME"
-	$0 stop
-	sleep 1
-	$0 start
-	;;
-  *) echo "Usage: $0 {start|stop|restart|reload|force-reload}" >&2
-	exit 1
-	;;
+    echo -n "Starting $NAME: "
+    start-stop-daemon -S -q -x $DAEMON -- -g
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  stop)
+    echo -n "Stopping $NAME: "
+    start-stop-daemon -K -q -n $NAME
+    [ $? = 0 ] && echo "OK" || echo "FAIL"
+    ;;
+  restart|reload)
+    echo "Restarting $NAME: "
+    $0 stop
+    sleep 1
+    $0 start
+    ;;
+  *)
+    echo "Usage: $0 {start|stop|restart|reload}" >&2
+    exit 1
+    ;;
 esac
 
 exit 0
-- 
2.0.4
