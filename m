From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:31 -0300
Subject: [Buildroot] [PATCH 5/8] sysklogd: update S01logging
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-6-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix syslogd/klogd startup script for better quality and
code style:

- Implement start, stop, restart and reload as functions, like in other
  S01logging scripts, using start-stop-daemon.
- Indent with tabs, not spaces.
- Use logic operators && and || to detect/handle errors, which provides
  better readability than nested if/then/else blocks.
- Use brackets for blocking, also improving readability.
- Detect and report start/stop errors (previous version ignored them and
  always reported OK).
- Use a separate function for restart and report the result of the whole
  operation instead of invoking stop, start and report OK twice.
- Support a configuration file at /etc/default (an example file will be
  added in forthcomming patch).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.
- Do not kill syslogd in "reload". Send a SIGHUP signal, instructing it
  to perform a re-initialization. Also do not kill klogd. Send a signal
  (default 0, which does nothing). Users can configure this signal in
  /etc/default/logging to either SIGUSR1 or SIGUSR2.

The script still has a bug: if klogd fails to load it reports FAIL but
leaves syslogd running. This is partially attenuated because a "stop"
would kill syslogd, fail on klogd and report "FAIL", but still do its
job. We could fix this by means of more detailed logic or splitting the
script but lets leave as is, since it is not a regression compared to
the previous situation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/sysklogd/S01logging | 93 +++++++++++++++++++++++++++++--------
 1 file changed, 74 insertions(+), 19 deletions(-)

diff --git a/package/sysklogd/S01logging b/package/sysklogd/S01logging
index 1cbfe869fa..16e45906dc 100644
--- a/package/sysklogd/S01logging
+++ b/package/sysklogd/S01logging
@@ -1,25 +1,80 @@
 #!/bin/sh
 
-case "$1" in
-	start)
-		printf "Starting logging: "
-		/sbin/syslogd -m 0
-		/sbin/klogd
+SYSLOGD_ARGS="-m 0"
+KLOGD_ARGS=""
+KLOGD_RELOAD="0"
+ENABLED="yes"
+
+# shellcheck source=/dev/null
+[ -r /etc/default/logging ] && . /etc/default/logging
+
+DAEMON="sysklogd"
+
+test "$ENABLED" = "yes" || {
+	printf '%s is disabled\n' "$DAEMON"
+	exit 0
+}
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -b -S -q -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
+		start-stop-daemon -b -S -q -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \
 		echo "OK"
-		;;
-	stop)
-		printf "Stopping logging: "
-		[ -f /var/run/klogd.pid ] && kill `cat /var/run/klogd.pid`
-		[ -f /var/run/syslogd.pid ] && kill `cat /var/run/syslogd.pid`
+	} || {
+		echo "FAIL"
+		exit 1
+	}
+}
+
+stop() {
+	printf 'Stopping %s: ' "$DAEMON"
+	{
+		start-stop-daemon -K -q -p /var/run/syslogd.pid && \
+		start-stop-daemon -K -q -p /var/run/klogd.pid && \
 		echo "OK"
-		;;
-	restart|reload)
-		$0 stop
-		$0 start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
+	} || {
+		echo "FAIL"
 		exit 1
-esac
+	}
+}
 
-exit $?
+restart() {
+	printf 'Restartng %s: ' "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -K -q -p /var/run/syslogd.pid && \
+		start-stop-daemon -K -q -p /var/run/klogd.pid && \
+		sleep 1 && \
+		start-stop-daemon -b -S -q -p /var/run/syslogd.pid -x /sbin/syslogd -- -n $SYSLOGD_ARGS && \
+		start-stop-daemon -b -S -q -p /var/run/klogd.pid -x /sbin/klogd -- -n $KLOGD_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
+}
+
+# SIGHUP makes syslogd reload its configuration
+# SIGUSR1 makes klogd reload kernel module symbols
+# SIGUSR2 makes klogd reload static kernel symbols and kernel module symbols
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	{
+		start-stop-daemon -K -s HUP -q -p /var/run/syslogd.pid && \
+		start-stop-daemon -K -s $KLOGD_RELOAD -q -p /var/run/klogd.pid && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
+}
+
+case "$1" in
+        start|stop|restart|reload)
+                "$1";;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
-- 
2.17.1
