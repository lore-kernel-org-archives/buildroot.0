From: Carlos Santos <casantos@datacom.com.br>
Date: Sat,  3 Nov 2018 15:24:25 -0300
Subject: [Buildroot] [PATCH v4 2/4] rsyslog: rewrite init script
In-Reply-To: <20181103182427.11738-1-casantos@datacom.com.br>
References: <20181103182427.11738-1-casantos@datacom.com.br>
Message-ID: <20181103182427.11738-3-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Rename it to S01rsyslogd to make every init script be called the same
  as the executable it starts.
- Support a /etc/default/rsyslogd configuration file.
- Indent with tabs, not spaces.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
---
Changes v1->v2
- Implement suggestions made by Nicolas Cavallari and Arnout Vandecappelle
Changes v2->v3
- Include /etc/default/logging, not /etc/default/$DAEMON.
Changes v3-v4
- Follow the decisions taken at the Buildroot meeting.
- Leave the daemon args themselves on a separate line, as suggested by
  Arnout Vandecappelle.
- Use a less fancy commit message :-)
---
 package/rsyslog/S01logging  | 36 -------------------------
 package/rsyslog/S01rsyslogd | 53 +++++++++++++++++++++++++++++++++++++
 package/rsyslog/rsyslog.mk  |  4 +--
 3 files changed, 55 insertions(+), 38 deletions(-)
 delete mode 100644 package/rsyslog/S01logging
 create mode 100644 package/rsyslog/S01rsyslogd

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
-- 
2.17.1
