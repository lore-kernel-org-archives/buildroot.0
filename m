From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:27 -0300
Subject: [Buildroot] [PATCH 1/8] busybox: update S01logging
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-2-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix syslogd/klogd startup script for better quality and
code style:

- Indent with tabs, not spaces.
- Use logic operators && and || to detect/handle errors, which provides
  better readability than nested if/then/else blocks.
- Use brackets for blocking, also improving readability.
- Detect and report start/stop errors (previous version ignored them and
  always reported OK).
- Use a separate function for restart and report the result of the whole
  operation instead of invoking stop, start and report OK twice.
- Implement reload as restart, but with a nickname to report the result
  of the expected operation.
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

The script still has a bug: if klogd fails to load it reports FAIL but
leaves syslogd running. This is partially attenuated because a "stop"
would kill syslogd, fail on klogd and report "FAIL", but still do its
job. We could fix this by means of more detailed logic or splitting the
script but lets leave as is, since it is not a regression compared to
the previous situation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/busybox/S01logging | 87 ++++++++++++++++++++++++++------------
 1 file changed, 59 insertions(+), 28 deletions(-)

diff --git a/package/busybox/S01logging b/package/busybox/S01logging
index fcb3e7d236..12f20933cc 100644
--- a/package/busybox/S01logging
+++ b/package/busybox/S01logging
@@ -1,40 +1,71 @@
 #!/bin/sh
-#
-# Start logging
-#
 
-SYSLOGD_ARGS=-n
-KLOGD_ARGS=-n
+SYSLOGD_ARGS=""
+KLOGD_ARGS=""
+ENABLED="yes"
+
+# shellcheck source=/dev/null
 [ -r /etc/default/logging ] && . /etc/default/logging
 
+DAEMON="logging"
+
+test "$ENABLED" = "yes" || {
+	printf '%s is disabled\n' "$DAEMON"
+	exit 0
+}
+
+# BusyBox' syslogd and klogd don't create pidfiles, so use "-m" to instruct
+# start-stop-daemon to create them.
 start() {
-	printf "Starting logging: "
-	start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid --exec /sbin/syslogd -- $SYSLOGD_ARGS
-	start-stop-daemon -b -S -q -m -p /var/run/klogd.pid --exec /sbin/klogd -- $KLOGD_ARGS
-	echo "OK"
+	printf 'Starting %s: ' "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
+		start-stop-daemon -b -S -q -m -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
 }
 
 stop() {
-	printf "Stopping logging: "
-	start-stop-daemon -K -q -p /var/run/syslogd.pid
-	start-stop-daemon -K -q -p /var/run/klogd.pid
-	echo "OK"
+	printf 'Stopping %s: ' "$DAEMON"
+	{
+		start-stop-daemon -K -q -p /var/run/syslogd.pid && \
+		start-stop-daemon -K -q -p /var/run/klogd.pid && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
+}
+
+restart() {
+	printf '%s %s: ' "${1:-Restarting}" "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -K -q -p /var/run/syslogd.pid && \
+		start-stop-daemon -K -q -p /var/run/klogd.pid && \
+		sleep 1 && \
+		start-stop-daemon -b -S -q -m -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
+		start-stop-daemon -b -S -q -m -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
+}
+
+# BusyBox' syslogd and klogd ignore SIGHUP, SIGUSRx, so simply restart.
+reload() {
+	restart "Reloading"
 }
 
 case "$1" in
-  start)
-	start
-	;;
-  stop)
-	stop
-	;;
-  restart|reload)
-	stop
-	start
-	;;
-  *)
-	echo "Usage: $0 {start|stop|restart|reload}"
-	exit 1
+        start|stop|restart|reload)
+                "$1";;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
 esac
-
-exit $?
-- 
2.17.1
