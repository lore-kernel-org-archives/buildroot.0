From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Thu, 18 Apr 2019 15:19:56 +0200
Subject: [Buildroot] [PATCH 1/1] package/domoticz: rewrite init script
Message-ID: <20190418131956.3199-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Follow new S02klogd template

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/domoticz/S99domoticz | 61 ++++++++++++++++++++++--------------
 1 file changed, 37 insertions(+), 24 deletions(-)

diff --git a/package/domoticz/S99domoticz b/package/domoticz/S99domoticz
index a16cacadde..e773aceeec 100644
--- a/package/domoticz/S99domoticz
+++ b/package/domoticz/S99domoticz
@@ -1,38 +1,51 @@
 #!/bin/sh
 
-NAME=domoticz
-PIDFILE=/var/run/$NAME.pid
-DAEMON=/opt/domoticz/$NAME
-DAEMON_ARGS="-daemon -www 8080 -sslwww 443"
+DAEMON="domoticz"
+PIDFILE="/var/run/$DAEMON.pid"
+
+DOMOTICZ_ARGS="-daemon -www 8080 -sslwww 443"
+
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
 
 start() {
-	printf "Starting $NAME: "
-	start-stop-daemon -S -q -m -b -p $PIDFILE --exec $DAEMON -- $DAEMON_ARGS
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -b -m -S -q -p "$PIDFILE" -x "/opt/domoticz/$DAEMON" \
+		-- $DOMOTICZ_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
+
 stop() {
-	printf "Stopping $NAME: "
-	start-stop-daemon -K -q -p $PIDFILE
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		rm -f "$PIDFILE"
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
+
 restart() {
 	stop
+	sleep 1
 	start
 }
 
 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	restart
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart}"
-	exit 1
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-
-exit $?
-- 
2.20.1
