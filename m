From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:14:05 +0100
Subject: [Buildroot] [git commit] rsyslog: rewrite init script
Message-ID: <20181210222530.6F1AC802BE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=5e5c2e2194bc776842a917e6b54a164b8093f42f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Rename it to S01rsyslogd to make every init script be called the same
  as the executable it starts.
- Support a /etc/default/rsyslogd configuration file.
- Indent with tabs, not spaces.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/rsyslog/S01logging  | 36 ------------------------------
 package/rsyslog/S01rsyslogd | 53 +++++++++++++++++++++++++++++++++++++++++++++
 package/rsyslog/rsyslog.mk  |  4 ++--
 3 files changed, 55 insertions(+), 38 deletions(-)

diff --git a/package/rsyslog/S01logging b/package/rsyslog/S01logging
deleted file mode 100644
index 8e4a59c2d5..0000000000
--- a/package/rsyslog/S01logging
+++ /dev/null
@@ -1,36 +0,0 @@
-#!/bin/sh
-
-start() {
-  printf "Starting rsyslog daemon: "
-  start-stop-daemon -S -q -p /var/run/rsyslogd.pid --exec /usr/sbin/rsyslogd
-  [ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-stop() {
-  printf "Stopping rsyslog daemon: "
-  start-stop-daemon -K -q -p /var/run/rsyslogd.pid
-  [ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-restart() {
-  stop
-  sleep 1
-  start
-}
-
-case "$1" in
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
-esac
-
-exit $?
diff --git a/package/rsyslog/S01rsyslogd b/package/rsyslog/S01rsyslogd
new file mode 100644
index 0000000000..e9922d932d
--- /dev/null
+++ b/package/rsyslog/S01rsyslogd
@@ -0,0 +1,53 @@
+#!/bin/sh
+
+DAEMON="rsyslogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+RSYSLOGD_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $RSYSLOGD_ARGS
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
+case "$1" in
+        start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature (does not
+		# reconfigure/restart on SIGHUP, just closes all open files).
+		restart;;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/rsyslog/rsyslog.mk b/package/rsyslog/rsyslog.mk
index 61e08ba765..fcd476cee3 100644
--- a/package/rsyslog/rsyslog.mk
+++ b/package/rsyslog/rsyslog.mk
@@ -72,8 +72,8 @@ RSYSLOG_CONF_OPTS += \
 endif
 
 define RSYSLOG_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/rsyslog/S01logging \
-		$(TARGET_DIR)/etc/init.d/S01logging
+	$(INSTALL) -m 0755 -D package/rsyslog/S01rsyslogd \
+		$(TARGET_DIR)/etc/init.d/S01rsyslogd
 endef
 
 # The rsyslog.service is installed by rsyslog, but the link is not created
