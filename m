From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:45:58 -0300
Subject: [Buildroot] [PATCH v3 1/8] busybox: update S01logging
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix syslogd/klogd startup script for better quality and
code style:

- Detect and report start/stop errors (previous version ignored them and
  always reported OK).
- Use a separate function for restart.
- Implement reload as restart.
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Changes v1->v2
- Implement suggestions made by Nicolas Cavallari and Arnout Vandecappelle
---
 package/busybox/S01logging | 82 +++++++++++++++++++++++++-------------
 1 file changed, 54 insertions(+), 28 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index fcb3e7d236..ddd27bba9a 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -1,40 +1,66 @@
 #!/bin/sh
-#
-# Start logging
-#
 
-SYSLOGD_ARGS=-n
-KLOGD_ARGS=-n
-[ -r /etc/default/logging ] && . /etc/default/logging
+DAEMON="logging"
+SPIDFILE="/var/run/syslogd.pid"
+KPIDFILE="/var/run/klogd.pid"
 
+SYSLOGD_ARGS=""
+KLOGD_ARGS=""
+ENABLED="yes"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+if [ "$ENABLED" != "yes" ]; then
+	printf '%s is disabled\n' "$DAEMON"
+	exit 0
+fi
+
+# BusyBox' syslogd and klogd do not create pidfiles, so use "-m" to instruct
+# start-stop-daemon to create them. This also means that we must pass "-n" to
+# sylogd and klogd in the command line.
 start() {
-	printf "Starting logging: "
-	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS
-	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- $KLOGD_ARGS
-	echo "OK"
+	printf 'Starting %s: ' "$DAEMON"
+	status=0
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -b -S -q -m -p "$SPIDFILE" -x /sbin/syslogd -- -n $SYSLOGD_ARGS || status=$?
+	start-stop-daemon -b -S -q -m -p "$KPIDFILE" -x /sbin/klogd -- -n $KLOGD_ARGS || status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-	printf "Stopping logging: "
-	start-stop-daemon -K -q -p /var/run/syslogd.pid
-	start-stop-daemon -K -q -p /var/run/klogd.pid
-	echo "OK"
+	printf 'Stopping %s: ' "$DAEMON"
+	status=0
+	start-stop-daemon -K -q -p "$SPIDFILE" || status=$?
+	[ "$status" -eq 0 ] && rm -f "$SPIDFILE"
+	start-stop-daemon -K -q -p "$KPIDFILE" || status=$?
+	[ "$status" -eq 0 ] && rm -f "$KPIDFILE"
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
-case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
+restart() {
 	stop
+	sleep 1
 	start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
-esac
+}
 
-exit $?
+case "$1" in
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
-- 
2.17.1
