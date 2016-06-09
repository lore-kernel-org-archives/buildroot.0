From: Dagg Stompler <daggs@gmx.com>
Date: Thu,  9 Jun 2016 20:59:08 +0300
Subject: [Buildroot] [PATCH 1/2] odroid-scripts: New Package
Message-ID: <20160609175909.12605-1-daggs@gmx.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Dagg Stompler <daggs@gmx.com>
---
 configs/odroidc2_defconfig                 |  1 +
 package/Config.in                          |  1 +
 package/odroid-scripts/Config.in           |  7 +++++++
 package/odroid-scripts/S50odroidc2_fb      | 20 +++++++++++++++++++
 package/odroid-scripts/odroid-scripts.hash |  2 ++
 package/odroid-scripts/odroid-scripts.mk   | 32 ++++++++++++++++++++++++++++++
 6 files changed, 63 insertions(+)
 create mode 100644 package/odroid-scripts/Config.in
 create mode 100644 package/odroid-scripts/S50odroidc2_fb
 create mode 100644 package/odroid-scripts/odroid-scripts.hash
 create mode 100644 package/odroid-scripts/odroid-scripts.mk

diff --git a/configs/odroidc2_defconfig b/configs/odroidc2_defconfig
index 1945983..74b475c 100644
--- a/configs/odroidc2_defconfig
+++ b/configs/odroidc2_defconfig
@@ -6,6 +6,7 @@ BR2_TARGET_GENERIC_HOSTNAME="odroidc2"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/hardkernel/odroidc2/post-image.sh"
+BR2_PACKAGE_ODROID_SCRIPTS=y
 
 # Kernel
 BR2_KERNEL_HEADERS_VERSION=y
diff --git a/package/Config.in b/package/Config.in
index 9f6e0d9..9bd7e7d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1661,6 +1661,7 @@ endif
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
index 0000000..f78603b
--- /dev/null
+++ b/package/odroid-scripts/odroid-scripts.hash
@@ -0,0 +1,2 @@
+#  Locally computed hash
+sha256sum bf34de357180126cb99885e8e131ae3ebb2562a98187da297c8ee10e56e29f65 odroid-scripts-17c88b9c48ad89a78c68392ccaa41b3cd42a622b.tar.gz
diff --git a/package/odroid-scripts/odroid-scripts.mk b/package/odroid-scripts/odroid-scripts.mk
new file mode 100644
index 0000000..993b53b
--- /dev/null
+++ b/package/odroid-scripts/odroid-scripts.mk
@@ -0,0 +1,32 @@
+################################################################################
+#
+# odroid-scripts
+#
+################################################################################
+
+ODROID_SCRIPTS_VERSION = 17c88b9c48ad89a78c68392ccaa41b3cd42a622b
+ODROID_SCRIPTS_SITE = $(call github,mdrjr,c2_bootini,$(ODROID_SCRIPTS_VERSION))
+ODROID_SCRIPTS_LICENSE = unclear
+
+ifeq ($(BR2_PACKAGE_EUDEV),y)
+	ODROID_SCRIPTS_INSTALL_UDEV_RULES = $(INSTALL) -D -m 0644 $(@D)/10-odroid.rules $(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules
+else
+	ODROID_SCRIPTS_INSTALL_UDEV_RULES =
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
2.8.4
