From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  8 Dec 2014 23:55:28 +0100
Subject: [Buildroot] [PATCH] triggerhappy: new package
Message-ID: <1418079328-15550-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/Config.in                    |  1 +
 package/triggerhappy/Config.in       | 10 +++++++++
 package/triggerhappy/S10triggerhappy | 40 ++++++++++++++++++++++++++++++++++++
 package/triggerhappy/triggerhappy.mk | 37 +++++++++++++++++++++++++++++++++
 4 files changed, 88 insertions(+)
 create mode 100644 package/triggerhappy/Config.in
 create mode 100755 package/triggerhappy/S10triggerhappy
 create mode 100644 package/triggerhappy/triggerhappy.mk

diff --git a/package/Config.in b/package/Config.in
index 600a68d..bb6587f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -378,6 +378,7 @@ endif
 	source "package/ti-gfx/Config.in"
 	source "package/ti-uim/Config.in"
 	source "package/ti-utils/Config.in"
+	source "package/triggerhappy/Config.in"
 	source "package/uboot-tools/Config.in"
 	source "package/udev/Config.in"
 	source "package/udisks/Config.in"
diff --git a/package/triggerhappy/Config.in b/package/triggerhappy/Config.in
new file mode 100644
index 0000000..3cd1ada
--- /dev/null
+++ b/package/triggerhappy/Config.in
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_TRIGGERHAPPY
+	bool "triggerhappy"
+	help
+	  Triggerhappy is a hotkey daemon developed with small and
+	  embedded systems in mind, e.g. linux based routers. It
+	  attaches to the input device files and interprets the event
+	  data received and executes scripts configured in its
+	  configuration.
+
+	  https://github.com/wertarbyte/triggerhappy
diff --git a/package/triggerhappy/S10triggerhappy b/package/triggerhappy/S10triggerhappy
new file mode 100755
index 0000000..dd975ab
--- /dev/null
+++ b/package/triggerhappy/S10triggerhappy
@@ -0,0 +1,40 @@
+#!/bin/sh
+
+NAME=thd
+DAEMON=/usr/sbin/$NAME
+PIDFILE=/var/run/$NAME.pid
+DAEMON_ARGS="--daemon --triggers /etc/triggerhappy/triggers.d --socket /var/run/thd.socket --pidfile $PIDFILE --user nobody /dev/input/event*"
+
+# Sanity checks
+test -x $DAEMON || exit 0
+
+[ -r /etc/default/triggerhappy ] && . /etc/default/triggerhappy
+
+do_start() {
+        echo -n "Starting $NAME: "
+        start-stop-daemon --start --quiet --pidfile $PIDFILE --exec $DAEMON -- $DAEMON_ARGS \
+                && echo "OK" || echo "FAIL"
+}
+
+do_stop() {
+        echo -n "Stopping $NAME: "
+        start-stop-daemon --stop --quiet --pidfile $PIDFILE \
+                && echo "OK" || echo "FAIL"
+}
+
+case "$1" in
+        start)
+                do_start
+                ;;
+        stop)
+                do_stop
+                ;;
+        restart)
+                do_stop
+                sleep 1
+                do_start
+                ;;
+        *)
+                echo "Usage: $0 {start|stop|restart}"
+                exit 1
+esac
diff --git a/package/triggerhappy/triggerhappy.mk b/package/triggerhappy/triggerhappy.mk
new file mode 100644
index 0000000..d3dfc6a
--- /dev/null
+++ b/package/triggerhappy/triggerhappy.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# triggerhappy
+#
+################################################################################
+
+TRIGGERHAPPY_VERSION = aac9f353a28c0f414b27ac54bbbb2292c152eedc
+TRIGGERHAPPY_SITE = $(call github,wertarbyte,triggerhappy,$(TRIGGERHAPPY_VERSION))
+TRIGGERHAPPY_LICENSE = GPLv3+
+TRIGGERHAPPY_LICENSE_FILES = COPYING
+
+define TRIGGERHAPPY_BUILD_CMDS
+	$(MAKE) $(TARGET_CONFIGURE_OPTS) \
+		LINUX_INPUT_H=$(STAGING_DIR)/usr/include/linux/input.h \
+		-C $(@D) thd th-cmd
+endef
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+define TRIGGERHAPPY_INSTALL_UDEV_RULE
+	$(INSTALL) -D -m 0644 $(@D)/udev/triggerhappy-udev.rules \
+		$(TARGET_DIR)/lib/udev/rules.d/triggerhappy.rules
+endef
+endif
+
+define TRIGGERHAPPY_INSTALL_TARGET_CMDS
+	$(INSTALL) -d $(TARGET_DIR)/etc/triggerhappy/triggers.d
+	$(INSTALL) -D -m 0755 $(@D)/thd $(TARGET_DIR)/usr/sbin/thd
+	$(INSTALL) -D -m 0755 $(@D)/th-cmd $(TARGET_DIR)/usr/sbin/th-cmd
+	$(TRIGGERHAPPY_INSTALL_UDEV_RULE)
+endef
+
+define TRIGGERHAPPY_INSTALL_INIT_SYSV
+	$(INSTALL) -m 0755 -D package/triggerhappy/S10triggerhappy \
+		$(TARGET_DIR)/etc/init.d/S10triggerhappy
+endef
+
+$(eval $(generic-package))
-- 
2.1.3
