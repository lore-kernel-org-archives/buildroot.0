From: Carlos Santos <casantos@datacom.com.br>
Date: Tue,  6 Nov 2018 22:49:11 -0200
Subject: [Buildroot] [PATCH v5 3/4] sysklogd: rewrite init script
In-Reply-To: <20181107004912.13349-1-casantos@datacom.com.br>
References: <20181107004912.13349-1-casantos@datacom.com.br>
Message-ID: <20181107004912.13349-4-casantos@datacom.com.br>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Split it into S01syslogd and S02klogd to make every init script be
  called the same as the executable it starts.
- Implement start, stop, restart and reload as functions, like in other
  init scripts, using start-stop-daemon.
- Indent with tabs, not spaces.
- Detect and report start/stop errors (previous version ignored them and
  always reported OK).
- Support /etc/default/$DAEMON configuration files.
- Do not kill syslogd in "reload". Send a SIGHUP signal, instructing it
  to perform a re-initialization.
- Do not kill klogd in "reload". Send a signal (default 0, which does
  nothing).  Users can configure this signal in /etc/default/klogd to
  either SIGUSR1 or SIGUSR2.

Signed-off-by: Carlos Santos <casantos@datacom.com.br>
Reviewed-by: Matt Weber <matthew.weber@rockwellcollins.com>
---
Supersedes: https://patchwork.ozlabs.org/patch/992676/
---
Changes v1->v2
- Implement suggestions made by Arnout Vandecappelle
Changes v2->v3
- Include /etc/default/logging, not /etc/default/$DAEMON.
Changes v3-v4
- Follow the decisions taken at the Buildroot meeting.
- Leave the daemon args themselves on a separate line, as suggested by
  Arnout Vandecappelle.
- Use a less fancy commit message :-)
Changes v4->v5
- None, just series update
---
 package/sysklogd/S01logging  | 25 --------------
 package/sysklogd/S01syslogd  | 62 ++++++++++++++++++++++++++++++++++
 package/sysklogd/S02klogd    | 65 ++++++++++++++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk |  6 ++--
 4 files changed, 131 insertions(+), 27 deletions(-)
 delete mode 100644 package/sysklogd/S01logging
 create mode 100644 package/sysklogd/S01syslogd
 create mode 100644 package/sysklogd/S02klogd

diff --git a/package/sysklogd/S01logging b/package/sysklogd/S01logging
deleted file mode 100644
index 1cbfe869fa..0000000000
--- a/package/sysklogd/S01logging
+++ /dev/null
@@ -1,25 +0,0 @@
-#!/bin/sh
-
-case "$1" in
-	start)
-		printf "Starting logging: "
-		/sbin/syslogd -m 0
-		/sbin/klogd
-		echo "OK"
-		;;
-	stop)
-		printf "Stopping logging: "
-		[ -f /var/run/klogd.pid ] && kill `cat /var/run/klogd.pid`
-		[ -f /var/run/syslogd.pid ] && kill `cat /var/run/syslogd.pid`
-		echo "OK"
-		;;
-	restart|reload)
-		$0 stop
-		$0 start
-		;;
-	*)
-		echo "Usage: $0 {start|stop|restart}"
-		exit 1
-esac
-
-exit $?
diff --git a/package/sysklogd/S01syslogd b/package/sysklogd/S01syslogd
new file mode 100644
index 0000000000..d0951f0235
--- /dev/null
+++ b/package/sysklogd/S01syslogd
@@ -0,0 +1,62 @@
+#!/bin/sh
+
+DAEMON="syslogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+SYSLOGD_ARGS="-m 0"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+		-- $SYSLOGD_ARGS
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
+# SIGHUP makes syslogd reload its configuration
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
diff --git a/package/sysklogd/S02klogd b/package/sysklogd/S02klogd
new file mode 100644
index 0000000000..93f39e1f0e
--- /dev/null
+++ b/package/sysklogd/S02klogd
@@ -0,0 +1,65 @@
+#!/bin/sh
+
+DAEMON="klogd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+KLOGD_ARGS=""
+
+KLOGD_RELOAD="0"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -p "$PIDFILE" -x "/sbin/$DAEMON" \
+		-- $KLOGD_ARGS
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
+# SIGUSR1 makes klogd reload kernel module symbols
+# SIGUSR2 makes klogd reload static kernel symbols and kernel module symbols
+reload() {
+	printf 'Reloading %s: ' "$DAEMON"
+	start-stop-daemon -K -s "$KLOGD_RELOAD" -q -p "$PIDFILE"
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
diff --git a/package/sysklogd/sysklogd.mk b/package/sysklogd/sysklogd.mk
index c4f064c10b..976438c110 100644
--- a/package/sysklogd/sysklogd.mk
+++ b/package/sysklogd/sysklogd.mk
@@ -23,8 +23,10 @@ define SYSKLOGD_INSTALL_TARGET_CMDS
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSV
-	$(INSTALL) -m 755 -D package/sysklogd/S01logging \
-		$(TARGET_DIR)/etc/init.d/S01logging
+	$(INSTALL) -m 755 -D package/sysklogd/S01syslogd \
+		$(TARGET_DIR)/etc/init.d/S01syslogd
+	$(INSTALL) -m 755 -D package/sysklogd/S02klogd \
+		$(TARGET_DIR)/etc/init.d/S02klogd
 endef
 
 define SYSKLOGD_INSTALL_INIT_SYSTEMD
-- 
2.17.1
