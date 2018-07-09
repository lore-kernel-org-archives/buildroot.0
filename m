From: Carlos Santos <casantos@datacom.com.br>
Date: Mon,  9 Jul 2018 00:31:29 -0300
Subject: [Buildroot] [PATCH 3/8] rsyslog: update S01logging
In-Reply-To: <20180709033134.22175-1-casantos@datacom.com.br>
References: <20180709033134.22175-1-casantos@datacom.com.br>
Message-ID: <20180709033134.22175-4-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix rsyslog startup script for better quality and code
style:

- Indent with tabs, not spaces.
- Use logic operators && and || to detect/handle errors, which provides
  better readability than nested if/then/else blocks.
- Use brackets for blocking, also improving readability.
- Rewrite restart to report the result of the whole operation instead of
  invoking stop, start and report OK twice.
- Add a "reload" option, implemented as restart, but with a nickname to
  report the result of the expected operation.
- Support a configuration file at /etc/default (an example file will be
  added in forthcomming patch).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
 package/rsyslog/S01logging | 74 ++++++++++++++++++++++++++------------
 1 file changed, 51 insertions(+), 23 deletions(-)

diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
index 8e4a59c2d5..94b5a1bd96 100644
--- a/package/rsyslog/S01logging
+++ b/package/rsyslog/S01logging
@@ -1,36 +1,64 @@
 #!/bin/sh
 
+RSYSLOGD_ARGS=""
+ENABLED="yes"
+
+# shellcheck source=/dev/null
+[ -r /etc/default/logging ] && . /etc/default/logging
+
+DAEMON="rsyslogd"
+
+test "$ENABLED" = "yes" || {
+	printf '%s is disabled\n' "$DAEMON"
+	exit 0
+}
+
 start() {
-  printf "Starting rsyslog daemon: "
-  start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
-  [ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -b -S -q -p /var/run/rsyslogd.pid -x /usr/sbin/rsyslogd -- -n $RSYSLOGD_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
 }
 
 stop() {
-  printf "Stopping rsyslog daemon: "
-  start-stop-daemon -K -q -p /var/run/rsyslogd.pid
-  [ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	{
+		start-stop-daemon -K -q -p /var/run/rsyslogd.pid && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
 }
 
 restart() {
-  stop
-  sleep 1
-  start
+	printf '%s %s: ' "${1:-Restarting}" "$DAEMON"
+	{
+		# shellcheck disable=SC2086 # we need the word splitting
+		start-stop-daemon -K -q -p /var/run/rsyslogd.pid && \
+		sleep 1 && \
+		start-stop-daemon -b -S -q -p /var/run/rsyslogd.pid -x /usr/sbin/rsyslogd -- -n $RSYSLOGD_ARGS && \
+		echo "OK"
+	} || {
+		echo "FAIL"
+		exit 1
+	}
+}
+
+# rsyslogd ignores SIGHUP, SIGUSRx, so simply restart.
+reload() {
+	restart "Reloading"
 }
 
 case "$1" in
-  start)
-    start
-    ;;
-  stop)
-    stop
-    ;;
-  restart|reload)
-    restart
-    ;;
-  *)
-    echo "Usage: $0 {start|stop|restart}"
-    exit 1
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
