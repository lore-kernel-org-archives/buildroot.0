From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 22:13:34 +0200
Subject: [Buildroot] [git commit] odroid-scripts: new package
Message-ID: <20160724201351.2548D81E16@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4f61cbb3b9d2ecaabb8fb5883282a0ff44a9dd5a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Dagg Stompler <daggs@gmx.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Config.in                          |  1 +
 package/odroid-scripts/Config.in           |  7 ++++++
 package/odroid-scripts/S50odroidc2_fb      | 20 +++++++++++++++++
 package/odroid-scripts/odroid-scripts.hash |  2 ++
 package/odroid-scripts/odroid-scripts.mk   | 36 ++++++++++++++++++++++++++++++
 5 files changed, 66 insertions(+)

diff --git a/package/Config.in b/package/Config.in
index 04ca8cb..be9b4cb 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -414,6 +414,7 @@ endmenu
 	source "package/nvidia-driver/Config.in"
 	source "package/nvidia-tegra23/Config.in"
 	source "package/nvme/Config.in"
+	source "package/odroid-scripts/Config.in"
 	source "package/ofono/Config.in"
 	source "package/ola/Config.in"
 	source "package/on2-8170-modules/Config.in"
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
index 0000000..858ec37
--- /dev/null
+++ b/package/odroid-scripts/odroid-scripts.mk
@@ -0,0 +1,36 @@
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
+define ODROID_SCRIPTS_INSTALL_UDEV_RULES
+	$(INSTALL) -D -m 0644 $(@D)/10-odroid.rules \
+		$(TARGET_DIR)/etc/udev/rules.d/10-odroid.rules
+endef
+endif
+
+define ODROID_SCRIPTS_INSTALL_TARGET_CMDS
+	$(INSTALL) -D -m 0755 $(@D)/c2_init.sh $(TARGET_DIR)/usr/sbin/odroidc2_init_fb.sh
+	$(ODROID_SCRIPTS_INSTALL_UDEV_RULES)
+endef
+
+define ODROID_SCRIPTS_INSTALL_INIT_SYSTEMD
+	$(INSTALL) -D -m 0644 $(@D)/amlogic.service \
+		$(TARGET_DIR)/usr/lib/systemd/system/odroidc2_fb.service
+	mkdir -p $(TARGET_DIR)/etc/systemd/system/multi-user.target.wants
+	ln -fs ../../../../usr/lib/systemd/system/odroidc2_fb.service \
+		$(TARGET_DIR)/etc/systemd/system/multi-user.target.wants/odroidc2_fb.service
+endef
+
+define ODROID_SCRIPTS_INSTALL_INIT_SYSV
+	$(INSTALL) -D -m 0755 package/odroid-scripts/S50odroidc2_fb \
+		$(TARGET_DIR)/etc/init.d/S50odroidc2_fb
+endef
+
+$(eval $(generic-package))
