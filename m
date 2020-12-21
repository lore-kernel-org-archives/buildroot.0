From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 21 Dec 2020 19:28:58 +0100
Subject: [Buildroot] [PATCH] package/connman: improve SysV init script
Message-ID: <20201221182858.66326-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use a more generic template for SysV init script, similar to packages
like syslog-ng. This includes adding support for both reload and
restart. Add support for sourcing /etc/default/connmand file, so that
new commandline arguments can be added more easily.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/connman/S45connman | 64 ++++++++++++++++++++++++++++----------
 1 file changed, 47 insertions(+), 17 deletions(-)

diff --git a/package/connman/S45connman b/package/connman/S45connman
index d3d4bd5df4..c8e913d3a1 100644
--- a/package/connman/S45connman
+++ b/package/connman/S45connman
@@ -1,22 +1,52 @@
 #!/bin/sh
 
+DAEMON="connmand"
+PIDFILE="/var/run/$DAEMON.pid"
+
+CONNMAND_ARGS="-n"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $CONNMAND_ARGS
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
+
 case "$1" in
-	start)
-		printf "Starting connman ... "
-		start-stop-daemon -S -q -m -b -p /var/run/connmand.pid --exec /usr/sbin/connmand -- -n
-		echo "done."
-		;;
-	stop)
-		printf "Stopping connman ..."
-		start-stop-daemon -K -q -p /var/run/connmand.pid
-		echo "done."
-		;;
-	restart)
-		$0 stop
-		sleep 1
-		$0 start
-		;;
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
 	*)
-		echo "usage: $0 {start|stop|restart}"
-		;;
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
 esac
-- 
2.29.2
