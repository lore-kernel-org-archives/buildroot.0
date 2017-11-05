From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sun,  5 Nov 2017 23:19:13 +0100
Subject: [Buildroot] [PATCH 1/1] add sunxi-mali mainline kernel
Message-ID: <1509920353-23438-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 package/sunxi-mali-driver-mainline/Config.in       |  9 +++++
 package/sunxi-mali-driver-mainline/S80mali         | 43 ++++++++++++++++++++++
 .../sunxi-mali-driver-mainline.mk                  | 43 ++++++++++++++++++++++
 3 files changed, 95 insertions(+)
 create mode 100644 package/sunxi-mali-driver-mainline/Config.in
 create mode 100644 package/sunxi-mali-driver-mainline/S80mali
 create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk

diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
new file mode 100644
index 0000000..8f2c960
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/Config.in
@@ -0,0 +1,9 @@
+comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
+	bool "sunxi-mali-driver-mainline"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	help
+	  Sunxi Mali Kernel space driver
diff --git a/package/sunxi-mali-driver-mainline/S80mali b/package/sunxi-mali-driver-mainline/S80mali
new file mode 100644
index 0000000..3db342e
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/S80mali
@@ -0,0 +1,43 @@
+#!/bin/sh -e
+
+install_driver() {
+	DRIVER=$1
+	OPTS=$2
+
+	modprobe $DRIVER $OPTS
+	maj=$(awk "\$2==\"${DRIVER}\" { print \$1; }" /proc/devices)
+
+	rm -f /dev/${DRIVER}
+
+	mknod /dev/${DRIVER} c $maj 0
+	chmod 600 /dev/${DRIVER}
+}
+
+start() {
+	echo "mali: starting driver"
+
+	install_driver mali
+}
+
+stop() {
+	echo "mali: stopping driver"
+
+	rmmod mali
+}
+
+case "$1" in
+start)
+	start
+;;
+stop)
+	stop
+;;
+restart)
+	stop
+	start
+;;
+*)
+	echo "mali: Please use start, stop, or restart."
+	exit 1
+;;
+esac
diff --git a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
new file mode 100644
index 0000000..73f7359
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
@@ -0,0 +1,43 @@
+################################################################################
+#
+# sunxi-mali-driver-mainline
+#
+################################################################################
+
+# last sha1 character dropped to ensure unique filename
+SUNXI_MALI_DRIVER_MAINLINE_VERSION = 88ba3cecfc7082bf8e52d7ded16cbbf0ef9e6ca
+SUNXI_MALI_DRIVER_MAINLINE_SITE = https://github.com/mripard/sunxi-mali.git
+SUNXI_MALI_DRIVER_MAINLINE_SITE_METHOD = git
+
+SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
+
+SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
+	KDIR=$(LINUX_DIR) \
+	USING_UMP=0 \
+	BUILD=release \
+	USING_DVFS=1 \
+	USING_DEVFREQ=1 \
+	CROSS_COMPILE=$(TARGET_CROSS)
+
+define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
+	$(APPLY_PATCHES) $(@D)/r6p2 $(@D)/patches \*.patch
+
+	$(SUNXI_MALI_MAINLINE_MAKE_ENV) $(MAKE) \
+		$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
+		-C $(@D)/r6p2/src/devicedrv/mali
+endef
+
+define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/gpu/
+
+	cp $(@D)/r6p2/src/devicedrv/mali/mali.ko \
+		$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/kernel/gpu/
+
+	echo kernel/gpu/mali.ko >> \
+	$(TARGET_DIR)/lib/modules/$(LINUX_VERSION_PROBED)/modules.dep
+
+	$(INSTALL) -D -m 0755 package/sunxi-mali-driver-mainline/S80mali \
+		$(TARGET_DIR)/etc/init.d/S80mali
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
