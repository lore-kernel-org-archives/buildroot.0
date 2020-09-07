From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon,  7 Sep 2020 11:34:26 +0200
Subject: [Buildroot] [PATCH] package/pigpio: add sysv and systemd init
 scripts
Message-ID: <20200907093429.11808-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>

---
Changes v1 -> v2:
  - S50pigpio modeled after S01syslogd from busybox package.
---
 package/pigpio/S50pigpio      | 50 +++++++++++++++++++++++++++++++++++
 package/pigpio/pigpio.mk      | 13 +++++++++
 package/pigpio/pigpio.service | 10 +++++++
 3 files changed, 73 insertions(+)
 create mode 100644 package/pigpio/S50pigpio
 create mode 100644 package/pigpio/pigpio.service

diff --git a/package/pigpio/S50pigpio b/package/pigpio/S50pigpio
new file mode 100644
index 0000000000..8b7b6815c8
--- /dev/null
+++ b/package/pigpio/S50pigpio
@@ -0,0 +1,50 @@
+#!/bin/sh
+
+DAEMON="pigpiod"
+PIDFILE="/var/run/pigpio.pid"
+
+PIGPIOD_ARGS=""
+
+[ -r "/etc/default/pigpio" ] && . "/etc/default/pigpio"
+
+start() {
+	printf 'Starting %s: ' "$DAEMON"
+	start-stop-daemon -S -q -x "/usr/bin/$DAEMON" -- $PIGPIOD_ARGS
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
+		rm -f "$PIDFILE"
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
+	start|stop|restart)
+		"$1";;
+	reload)
+		# Restart, since there is no true "reload" feature.
+		restart;;
+	*)
+		echo "Usage: $0 {start|stop|restart|reload}"
+		exit 1
+esac
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 9075274de1..a86533a59e 100644
--- a/package/pigpio/pigpio.mk
+++ b/package/pigpio/pigpio.mk
@@ -38,4 +38,17 @@ define PIGPIO_INSTALL_STAGING_CMDS
 	ln -sf libpigpiod_if2.so.1 $(STAGING_DIR)/usr/lib/libpigpiod_if2.so
 endef
 
+define PIGPIO_INSTALL_INIT_SYSV
+        $(INSTALL) -D -m 755 package/pigpio/S50pigpio \
+                $(TARGET_DIR)/etc/init.d/S50pigpio
+endef
+
+define PIGPIO_INSTALL_INIT_SYSTEMD
+        $(INSTALL) -D -m 644 package/pigpio/pigpio.service \
+                $(TARGET_DIR)/usr/lib/systemd/system/pigpio.service
+        mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+        ln -fs ../../../../usr/lib/systemd/system/pigpio.service \
+                $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/pigpio.service
+endef
+
 $(eval $(generic-package))
diff --git a/package/pigpio/pigpio.service b/package/pigpio/pigpio.service
new file mode 100644
index 0000000000..135624cc43
--- /dev/null
+++ b/package/pigpio/pigpio.service
@@ -0,0 +1,10 @@
+[Unit]
+Description=Pigpio daemon
+After=network.target
+
+[Service]
+EnvironmentFile=-/etc/default/pigpio
+ExecStart=/usr/bin/pigpiod -g $PIGPIOD_ARGS
+
+[Install]
+WantedBy=multi-user.target
-- 
2.24.3 (Apple Git-128)
