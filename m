From: Carlos Santos <casantos@datacom.com.br>
Date: Sun,  7 Oct 2018 08:46:04 -0300
Subject: [Buildroot] [PATCH v3 7/8] syslog-ng: update S01logging
In-Reply-To: <20181007114605.18153-1-casantos@datacom.com.br>
References: <20181007114605.18153-1-casantos@datacom.com.br>
Message-ID: <20181007114605.18153-8-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Reformat and fix syslog-ng startup script for better quality and code
style:

- Indent with tabs, not spaces.
- Do not kill syslog-ng in "reload". Send a SIGHUP signal, instructing
  it to perform a re-initialization.
- Support a configuration file at /etc/default (an example file will be
  added in forthcomming patch).
- Support a configuration variable that completely disables the service
  and issues a warning message on any invocation.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2:
- Implement changes suggested by Arnout Vandecappelle.
Changes v2->v3:
- Include /etc/default/logging, not /etc/default/$DAEMON.
- Remove stray 'g' spotted by Chris Packham.
---
 package/syslog-ng/S01logging | 73 +++++++++++++++++++++++++-----------
 1 file changed, 51 insertions(+), 22 deletions(-)

diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
index d7c899a1e3..255ca16660 100644
--- a/package/syslog-ng/S01logging
+++ b/package/syslog-ng/S01logging
@@ -1,17 +1,42 @@
 #!/bin/sh
 
+DAEMON="syslog-ng"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SYSLOG_NG_ARGS=""
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
-	printf "Starting syslog-ng daemon: "
-	start-stop-daemon -S -q -p /var/run/syslog-ng.pid \
-		-x /usr/sbin/syslog-ng -- --pidfile /var/run/syslog-ng.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x /usr/sbin/syslog-ng -- $SYSLOG_NG_ARGS
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
 }
 
 stop() {
-	printf "Stopping syslog-ng daemon: "
-	start-stop-daemon -K -q -p /var/run/syslog-ng.pid \
-		-x /usr/sbin/syslog-ng
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
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
@@ -20,19 +45,23 @@ restart() {
 	start
 }
 
+# SIGHUP makes syslog-ng reload its configuration
+reload() {
+	printf 'Stopping %s: ' "$DAEMON"
+	start-stop-daemon -K -s HUP -q -p "$PIDFILE"
+	status=$?
+	if [ "$status" -eq 0 ]; then
+		echo "OK"
+	else
+		echo "FAIL"
+	fi
+	return "$status"
+}
+
 case "$1" in
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
-		exit 1
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
