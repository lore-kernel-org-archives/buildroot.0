From: Simon Rowe <simon.rowe@citrix.com>
Date: Wed, 18 Sep 2019 09:59:35 +0100
Subject: [Buildroot] [PATCH 1/1] package/openvmtools: base SYSV script on
 current template
Message-ID: <1568797175-27707-1-git-send-email-simon.rowe@citrix.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Simon Rowe <simon.rowe@citrix.com>
---
 package/openvmtools/S10vmtoolsd | 73 ++++++++++++++++++++++++++---------------
 1 file changed, 47 insertions(+), 26 deletions(-)

diff --git a/package/openvmtools/S10vmtoolsd b/package/openvmtools/S10vmtoolsd
index 5fdb568..60ee875 100644
--- a/package/openvmtools/S10vmtoolsd
+++ b/package/openvmtools/S10vmtoolsd
@@ -3,33 +3,54 @@
 # Starts vmtoolsd for openvmtools
 #
 
-EXEC="/usr/bin/vmtoolsd"
-ARGS="-b"
-PID="/var/run/vmtoolsd.pid"
+DAEMON="vmtoolsd"
+PIDFILE="/var/run/$DAEMON.pid"
 
-[ -r /etc/default/vmtoolsd ] && . /etc/default/vmtoolsd
+VMTOOLSD_ARGS="-b"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/bin/$DAEMON" \
+		-- $VMTOOLSD_ARGS "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
+stop() {
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
+}
+
+restart() {
+	stop
+	sleep 1
+	start
+}
 
 case "$1" in
-  start)
-    printf "Starting vmtoolsd: "
-    start-stop-daemon -S -q -x $EXEC -- $ARGS $PID
-    if [ $? != 0 ]; then
-      echo "FAILED"
-      exit 1
-    else
-      echo "OK"
-    fi
-  ;;
-  stop)
-    printf "Stopping vmtoolsd: "
-    start-stop-daemon -K -q -p $PID
-    echo "OK"
-  ;;
-  restart|reload)
-    $0 stop
-    $0 start
-  ;;
-  *)
-    echo "Usage: $0 {start|stop|restart}"
-    exit 1
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-- 
1.8.3.1
