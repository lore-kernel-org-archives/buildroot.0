From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Mon, 10 Dec 2018 22:15:51 +0100
Subject: [Buildroot] [git commit] sysklogd: rewrite init script
Message-ID: <20181210222530.764D78C9D1@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b3c76a435b16c5031a1519810f93972c42869ae0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/sysklogd/S01logging  | 25 -----------------
 package/sysklogd/S01syslogd  | 62 ++++++++++++++++++++++++++++++++++++++++++
 package/sysklogd/S02klogd    | 65 ++++++++++++++++++++++++++++++++++++++++++++
 package/sysklogd/sysklogd.mk |  6 ++--
 4 files changed, 131 insertions(+), 27 deletions(-)

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
