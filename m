From: Carlos Santos <casantos@datacom.com.br>
Date: Tue,  6 Nov 2018 22:49:12 -0200
Subject: [Buildroot] [PATCH v5 4/4] syslog-ng: rewrite init script
In-Reply-To: <20181107004912.13349-1-casantos@datacom.com.br>
References: <20181107004912.13349-1-casantos@datacom.com.br>
Message-ID: <20181107004912.13349-5-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Rename it to S01syslog-ng to make every init script be called the same
  as the executable it starts.
- Indent with tabs, not spaces.
- Do not kill syslog-ng in "reload". Send a SIGHUP signal, instructing
  it to perform a re-initialization.
- Support a /etc/default/syslog-ng configuration file.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Supersedes: https://patchwork.ozlabs.org/patch/992674/
---
Changes v1->v2:
- Implement changes suggested by Arnout Vandecappelle.
Changes v2->v3:
- Include /etc/default/logging, not /etc/default/$DAEMON.
- Remove stray 'g' spotted by Chris Packham.
Changes v3-v4:
- Follow the decisions taken at the Buildroot meeting.
- Leave the daemon args themselves on a separate line, as suggested by
  Arnout Vandecappelle.
- Use a less fancy commit message :-)
Changes v4->v5
- None, just series update
---
 package/syslog-ng/S01logging   | 38 ---------------------
 package/syslog-ng/S01syslog-ng | 62 ++++++++++++++++++++++++++++++++++
 package/syslog-ng/syslog-ng.mk |  4 +--
 3 files changed, 64 insertions(+), 40 deletions(-)
 delete mode 100644 package/syslog-ng/S01logging
 create mode 100644 package/syslog-ng/S01syslog-ng

diff --git a/package/syslog-ng/S01logging b/package/syslog-ng/S01logging
deleted file mode 100644
index d7c899a1e3..0000000000
--- a/package/syslog-ng/S01logging
+++ /dev/null
@@ -1,38 +0,0 @@
-#!/bin/sh
-
-start() {
-	printf "Starting syslog-ng daemon: "
-	start-stop-daemon -S -q -p /var/run/syslog-ng.pid \
-		-x /usr/sbin/syslog-ng -- --pidfile /var/run/syslog-ng.pid
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-stop() {
-	printf "Stopping syslog-ng daemon: "
-	start-stop-daemon -K -q -p /var/run/syslog-ng.pid \
-		-x /usr/sbin/syslog-ng
-	[ $? = 0 ] && echo "OK" || echo "FAIL"
-}
-
-restart() {
-	stop
-	sleep 1
-	start
-}
-
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
-		exit 1
-esac
-
-exit $?
diff --git a/package/syslog-ng/S01syslog-ng b/package/syslog-ng/S01syslog-ng
new file mode 100644
index 0000000000..1d74bf8839
--- /dev/null
+++ b/package/syslog-ng/S01syslog-ng
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+DAEMON="syslog-ng"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SYSLOG_NG_ARGS=""
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/usr/sbin/$DAEMON" \
+		-- $SYSLOG_NG_ARGS
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
+# SIGHUP makes syslog-ng reload its configuration
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
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
+case "$1" in
+        start|stop|restart|reload)
+                "$1";;
+        *)
+                echo "Usage: $0 {start|stop|restart|reload}"
+                exit 1
+esac
diff --git a/package/syslog-ng/syslog-ng.mk b/package/syslog-ng/syslog-ng.mk
index 793fea0972..29e284a4bf 100644
--- a/package/syslog-ng/syslog-ng.mk
+++ b/package/syslog-ng/syslog-ng.mk
@@ -93,8 +93,8 @@ SYSLOG_NG_CONF_OPTS += --disable-systemd
 endif
 
 define SYSLOG_NG_INSTALL_INIT_SYSV
-	$(INSTALL) -m 0755 -D package/syslog-ng/S01logging \
-		$(TARGET_DIR)/etc/init.d/S01logging
+	$(INSTALL) -m 0755 -D package/syslog-ng/S01syslog-ng \
+		$(TARGET_DIR)/etc/init.d/S01syslog-ng
 endef
 
 # By default syslog-ng installs a number of sample configuration
-- 
2.17.1
