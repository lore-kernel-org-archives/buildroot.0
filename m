From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:46:02 -0300
Subject: [Buildroot] [PATCH v3 5/8] sysklogd: update S01logging
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-6-casantos@datacom.com.br>
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
- Detect and report start/stop errors (previous version ignored them and
  always reported OK).
- Support a configuration file at /etc/default (an example file will be
  added in forthcomming patch).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.
- Do not kill syslogd in "reload". Send a SIGHUP signal, instructing it
  to perform a re-initialization. Also do not kill klogd. Send a signal
  (default 0, which does nothing). Users can configure this signal in
  /etc/default/logging to either SIGUSR1 or SIGUSR2.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2
- Implement suggestions made by Arnout Vandecappelle
Changes v2->v3
- Include /etc/default/logging, not /etc/default/$DAEMON.
---
 package/sysklogd/S01logging | 90 ++++++++++++++++++++++++++++---------
 1 file changed, 70 insertions(+), 20 deletions(-)

diff --git a/package/sysklogd/S01logging b/package/sysklogd/S01logging
index 1cbfe869fa..9b6e879d8a 100644
--- a/package/sysklogd/S01logging
+++ b/package/sysklogd/S01logging
@@ -1,25 +1,75 @@
 #!/bin/sh
 
-case "$1" in
-	start)
-		printf "Starting logging: "
-		/sbin/syslogd -m 0
-		/sbin/klogd
+DAEMON="sysklogd"
+SPIDFILE="/var/run/syslogd.pid"
+KPIDFILE="/var/run/klogd.pid"
+
+SYSLOGD_ARGS="-m 0"
+KLOGD_ARGS=""
+KLOGD_RELOAD="0"
+ENABLED="yes"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/logging" ] && . "/etc/default/logging"
+
+if [ "$ENABLED" != "yes" ]; then
+	printf '%s is disabled\n' "$DAEMON"
+	exit 0
+fi
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	status=0
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$SPIDFILE" -x /sbin/syslogd -- $SYSLOGD_ARGS || status=$?
+	start-stop-daemon -S -q -p "$KPIDFILE" -x /sbin/klogd -- $KLOGD_ARGS || status=$?
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
+	status=0
+	start-stop-daemon -K -q -p "$SPIDFILE" || status=$?
+	start-stop-daemon -K -q -p "$KPIDFILE" || status=$?
+	if [ "$status" -eq 0 ]; then
 		echo "OK"
-		;;
-	stop)
-		printf "Stopping logging: "
-		[ -f /var/run/klogd.pid ] && kill `cat /var/run/klogd.pid`
-		[ -f /var/run/syslogd.pid ] && kill `cat /var/run/syslogd.pid`
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
+# SIGHUP makes syslogd reload its configuration
+# SIGUSR1 makes klogd reload kernel module symbols
+# SIGUSR2 makes klogd reload static kernel symbols and kernel module symbols
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	status=0
+	start-stop-daemon -K -s HUP -q -p "$SPIDFILE" || status=$?
+	start-stop-daemon -K -s "$KLOGD_RELOAD" -q -p "$KPIDFILE" || status=$?
+	if [ "$status" -eq 0 ]; then
 		echo "OK"
-		;;
-	restart|reload)
-		$0 stop
-		$0 start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		exit 1
-esac
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
 
-exit $?
+case "$1" in
+        start|stop|restart|reload)
+                "$1";;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
-- 
2.17.1
