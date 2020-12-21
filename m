From: Marcin Niestroj <m.niestroj@grinn-global.com>
Date: Mon, 21 Dec 2020 19:29:20 +0100
Subject: [Buildroot] [PATCH] package/bluez5_utils: add SysV init script
Message-ID: <20201221182920.66448-1-m.niestroj@grinn-global.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Use generic template for SysV init script, similar to packages like
syslog-ng.

Signed-off-by: Marcin Niestroj <m.niestroj@grinn-global.com>
---
 package/bluez5_utils/S40bluetooth    | 61 ++++++++++++++++++++++++++++
 package/bluez5_utils/bluez5_utils.mk |  5 +++
 2 files changed, 66 insertions(+)
 create mode 100755 package/bluez5_utils/S40bluetooth

diff --git a/package/bluez5_utils/S40bluetooth b/package/bluez5_utils/S40bluetooth
new file mode 100755
index 0000000000..ee4abe8b63
--- /dev/null
+++ b/package/bluez5_utils/S40bluetooth
@@ -0,0 +1,61 @@
+#!/bin/sh
+
+DAEMON="bluetoothd"
+PIDFILE="/var/run/$DAEMON.pid"
+
+BLUETOOTHD_ARGS="-n"
+
+# shellcheck source=/dev/null
+[ -r "/etc/default/$DAEMON" ] && . "/etc/default/$DAEMON"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	# shellcheck disable=SC2086 # we need the word splitting
+	start-stop-daemon -S -q -m -b -p "$PIDFILE" -x "/usr/libexec/bluetooth/$DAEMON" \
+		-- $BLUETOOTHD_ARGS
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
+	start|stop|restart|reload)
+		"$1";;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/bluez5_utils/bluez5_utils.mk b/package/bluez5_utils/bluez5_utils.mk
index f2c8cabcff..6596516850 100644
--- a/package/bluez5_utils/bluez5_utils.mk
+++ b/package/bluez5_utils/bluez5_utils.mk
@@ -133,4 +133,9 @@ else
 BLUEZ5_UTILS_CONF_OPTS += --disable-systemd
 endif
 
+define BLUEZ5_UTILS_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/bluez5_utils/S40bluetooth \
+		$(TARGET_DIR)/etc/init.d/S40bluetooth
+endef
+
 $(eval $(autotools-package))
-- 
2.29.2
