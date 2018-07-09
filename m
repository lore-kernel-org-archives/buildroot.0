From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:33 -0300
Subject: [Buildroot] [PATCH 7/8] rsyslog: update S01logging
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-8-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix syslog-ng startup script for better quality and code
style:

- Indent with tabs, not spaces.
- Use logic operators && and || to detect/handle errors, which provides
  better readability than nested if/then/else blocks.
- Use brackets for blocking, also improving readability.
- Rewrite restart to report the result of the whole operation instead of
  invoking stop, start and report OK twice.
- Do not kill syslog-ng in "reload". Send a SIGHUP signal, instructing
  it to perform a re-initialization.
- Support a configuration file at /etc/default (an example file will be
  added in forthcomming patch).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/syslog-ng/S01logging | 83 +++++++++++++++++++++++++-----------
 1 file changed, 58 insertions(+), 25 deletions(-)

diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
index d7c899a1e3..ba2eb226c1 100644
--- a/package/syslog-ng/S01logging
+++ b/package/syslog-ng/S01logging
@@ -1,38 +1,71 @@
 #!/bin/sh
 
+SYSLOG_NG_ARGS=""
+ENABLED="yes"
+
+# shellcheck source=/dev/null
+[ -r /etc/default/logging ] && . /etc/default/logging
+
+DAEMON="syslog-ng"
+
+test "$ENABLED" = "yes" || {
+	printf '%s is disabled\n' "$DAEMON"
+	exit 0
+}
+
 start() {
-	printf "Starting syslog-ng daemon: "
-	start-stop-daemon -S -q -p /var/run/syslog-ng.pid \
-		-x /usr/sbin/syslog-ng -- --pidfile /var/run/syslog-ng.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -b -S -q -p /var/run/syslog-ng.pid -x /usr/sbin/syslog-ng -- -F $SYSLOG_NG_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
 }
 
 stop() {
-	printf "Stopping syslog-ng daemon: "
-	start-stop-daemon -K -q -p /var/run/syslog-ng.pid \
-		-x /usr/sbin/syslog-ng
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	{
+		start-stop-daemon -K -q -p /var/run/syslog-ng.pid && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
 }
 
 restart() {
-	stop
-	sleep 1
-	start
+	printf 'Restartng %s: ' "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -K -q -p /var/run/syslog-ng.pid && \
+		sleep 1 && \
+		start-stop-daemon -b -S -q -p /var/run/syslog-ng.pid -x /usr/sbin/syslog-ng -- -F $SYSLOG_NG_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
 }
 
-case "$1" in
-	start)
-		start
-		;;
-	stop)
-		stop
-		;;
-	restart|reload)
-		restart
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
+# SIGHUP makes syslog-ng reload its configuration
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	{
+		start-stop-daemon -K -s HUP -q -p /var/run/syslog-ng.pid && \
+		echo "OK"
+	} || {
+		echo "FAIL"
 		exit 1
-esac
+	}
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
