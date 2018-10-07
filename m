From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:46:00 -0300
Subject: [Buildroot] [PATCH v3 3/8] rsyslog: update S01logging
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-4-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix rsyslog startup script for better quality and code
style:

- Indent with tabs, not spaces.
- Support a configuration file at /etc/default (an example file will be
  added in forthcomming patch).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2
- Implement suggestions made by Nicolas Cavallari and Arnout Vandecappelle
Changes v2->v3
- Include /etc/default/logging, not /etc/default/$DAEMON.
---
 package/rsyslog/S01logging | 68 +++++++++++++++++++++++++-------------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
index 8e4a59c2d5..5764780467 100644
--- a/package/rsyslog/S01logging
+++ b/package/rsyslog/S01logging
@@ -1,36 +1,58 @@
 #!/bin/sh
 
+DAEMON="rsyslogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+RSYSLOGD_ARGS=""
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
 start() {
-  printf "Starting rsyslog daemon: "
-  start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
-  [ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x /usr/sbin/rsyslogd -- $RSYSLOGD_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-  printf "Stopping rsyslog daemon: "
-  start-stop-daemon -K -q -p /var/run/rsyslogd.pid
-  [ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 restart() {
-  stop
-  sleep 1
-  start
+	stop
+	sleep 1
+	start
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
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature (does not
+		# reconfigure/restart on SIGHUP, just closes all open files).
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
 esac
-
-exit $?
-- 
2.17.1
