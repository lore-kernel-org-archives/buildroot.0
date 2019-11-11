From: Grzegorz Blach <grzegorz@blach.pl>
Date: Mon, 11 Nov 2019 15:05:34 +0000
Subject: [Buildroot] [PATCH 1/1] package/pigpio: add sysv and systemd init
 scripts
Message-ID: <20191111150534.1181-1-grzegorz@blach.pl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Grzegorz Blach <grzegorz@blach.pl>
---
 package/pigpio/S50pigpio      | 40 +++++++++++++++++++++++++++++++++++
 package/pigpio/pigpio.mk      | 13 ++++++++++++
 package/pigpio/pigpio.service | 10 +++++++++
 3 files changed, 63 insertions(+)
 create mode 100644 package/pigpio/S50pigpio
 create mode 100644 package/pigpio/pigpio.service

diff --git a/package/pigpio/S50pigpio b/package/pigpio/S50pigpio
new file mode 100644
index 0000000000..7b2e979600
--- /dev/null
+++ b/package/pigpio/S50pigpio
@@ -0,0 +1,40 @@
+#!/bin/sh
+#
+# Starts pigpio daemon.
+#
+
+# Allow a few customizations from a config file
+test -r /etc/default/pigpio && . /etc/default/pigpio
+
+start() {
+	printf "Starting pigpio daemon: "
+	umask 077
+	pigpiod $PIGPIOD_ARGS
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+stop() {
+	printf "Stopping pigpio daemon: "
+	start-stop-daemon -K -q -p /var/run/pigpio.pid
+	[ $? = 0 ] && echo "OK" || echo "FAIL"
+}
+restart() {
+	stop
+	start
+}
+
+case "$1" in
+  start)
+	start
+	;;
+  stop)
+	stop
+	;;
+  restart|reload)
+	restart
+	;;
+  *)
+	echo "Usage: $0 {start|stop|restart}"
+	exit 1
+esac
+
+exit $?
diff --git a/package/pigpio/pigpio.mk b/package/pigpio/pigpio.mk
index 1cf8f50afc..e8c37621d9 100644
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
2.24.0
