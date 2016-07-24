From: Dagg Stompler <daggs@gmx.com>
Date: Sun, 24 Jul 2016 19:35:04 +0300
Subject: [Buildroot] [PATCH 1/3 v4] odroid-scripts: New Package.
Message-ID: <20160724163506.20024-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
v3 -> v4:
 - seperate setting of odroid-scripts from odroidc2 def config (Thomas Petazzoni).
 - fix udev bug so systemd will be supported too (Thomas Petazzoni).
 - fix udev rule install

v2 -> v3:
 - update repo rev to a252de04562dcf8d8a4918a544b45a9e3d46d2fb.
 - update hash

v1 -> v2:
 - fix hash type in hash file.

 package/Config.in                          |  1 +
 package/odroid-scripts/Config.in           |  7 +++++++
 package/odroid-scripts/S50odroidc2_fb      | 20 +++++++++++++++++++
 package/odroid-scripts/odroid-scripts.hash |  2 ++
 package/odroid-scripts/odroid-scripts.mk   | 32 ++++++++++++++++++++++++++++++
 5 files changed, 62 insertions(+)
 create mode 100644 package/odroid-scripts/Config.in
 create mode 100644 package/odroid-scripts/S50odroidc2_fb
 create mode 100644 package/odroid-scripts/odroid-scripts.hash
 create mode 100644 package/odroid-scripts/odroid-scripts.mk

diff --git a/package/Config.in b/package/Config.in
index 72c0be3..4529371 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1690,6 +1690,7 @@ menu "System tools"
 	source "package/ncdu/Config.in"
 	source "package/numactl/Config.in"
 	source "package/nut/Config.in"
+	source "package/odroid-scripts/Config.in"
 	source "package/openvmtools/Config.in"
 	source "package/polkit/Config.in"
 	source "package/powerpc-utils/Config.in"
diff --git a/package/odroid-scripts/Config.in b/package/odroid-scripts/Config.in
new file mode 100644
index 0000000..48544b6
--- /dev/null
+++ b/package/odroid-scripts/Config.in
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_ODROID_SCRIPTS
+	bool "odroid-scripts"
+	depends on BR2_aarch64 || BR2_arm
+	help
+	  Install the scripts for the odroidc2 based systems.
+
+	  https://github.com/mdrjr/c2_bootini
diff --git a/package/odroid-scripts/S50odroidc2_fb b/package/odroid-scripts/S50odroidc2_fb
new file mode 100644
index 0000000..2aae59d
--- /dev/null
+++ b/package/odroid-scripts/S50odroidc2_fb
@@ -0,0 +1,20 @@
+#!/bin/sh
+#
+# Set up frame buffer
+#
+
+case "$1" in
+    start)
+        echo "Setting up display..."
+        /usr/sbin/odroidc2_init_fb.sh
+        ;;
+    stop)
+        ;;
+    restart|reload)
+        ;;
+    *)
+        echo "Usage: $0 {start|stop|restart}"
+        exit 1
+esac
+
+exit $?
diff --git a/package/odroid-scripts/odroid-scripts.hash b/package/odroid-scripts/odroid-scripts.hash
new file mode 100644
index 0000000..8fd4b2c
--- /dev/null
+++ b/package/odroid-scripts/odroid-scripts.hash
@@ -0,0 +1,2 @@
+#  Locally computed hash
+sha256 779e8beccf8c66d51e495a4cc0e6eccf72c295499a1ecdc0740aa4459de786a0 odroid-scripts-a252de04562dcf8d8a4918a544b45a9e3d46d2fb.tar.gz
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
new file mode 100644
index 0000000..34a4501
--- /dev/null
+++ b/package/odroid-scripts/odroid-scripts.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# odroid-scripts
+#
+################################################################################
+
+ODROID_SCRIPTS_VERSION = a252de04562dcf8d8a4918a544b45a9e3d46d2fb
+ODROID_SCRIPTS_SITE = $(call github,mdrjr,c2_bootini,$(ODROID_SCRIPTS_VERSION))
+ODROID_SCRIPTS_LICENSE = unclear
+
+ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
+	define ODROID_SCRIPTS_INSTALL_UDEV_RULES
+		$(INSTALL) -D -m 0644 $(@D)/10-odroid.rules $(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules
+	endef
+endif
+
+define ODROID_SCRIPTS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
+	$(ODROID_SCRIPTS_INSTALL_UDEV_RULES)
+endef
+
+define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/amlogic.service $(TARGET_DIR)/usr/lib/systemd/system/odroidc2_fb.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/odroidc2_fb.service $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroidc2_fb.service
+endef
+
+define ODROID_SCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/odroid-scripts/S50odroidc2_fb $(TARGET_DIR)/etc/init.d/S50odroidc2_fb
+endef
+
+$(eval $(generic-package))
-- 
2.9.2
