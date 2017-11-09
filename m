From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  9 Nov 2017 19:03:41 +0100
Subject: [Buildroot] [PATCH v2 1/1] add sunxi-mali mainline kernel
Message-ID: <1510250621-27660-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it's not present in buildroot,
add support for sunxi-mali mainline kernel driver.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes v1 -> v2:
* use github macros
* use build.sh to compile and install
* add check linux >= 4.4

 package/sunxi-mali-driver-mainline/Config.in       | 10 +++++++++
 .../sunxi-mali-driver-mainline.mk                  | 26 ++++++++++++++++++++++
 2 files changed, 36 insertions(+)
 create mode 100644 package/sunxi-mali-driver-mainline/Config.in
 create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk

diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
new file mode 100644
index 0000000..1d7d313
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/Config.in
@@ -0,0 +1,10 @@
+comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
+	bool "sunxi-mali-driver-mainline"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_4
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	help
+	  Sunxi Mali Kernel space driver
diff --git a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
new file mode 100644
index 0000000..b6125d4
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sunxi-mali-driver-mainline
+#
+################################################################################
+
+SUNXI_MALI_DRIVER_MAINLINE_VERSION = 5b7b3c0b6e1736676c90928816d271debbb09d95
+SUNXI_MALI_DRIVER_MAINLINE_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_DRIVER_MAINLINE_VERSION))
+SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
+
+SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
+	KDIR=$(LINUX_DIR) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	INSTALL_MOD_PATH=$(TARGET_DIR)
+
+define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
+	cd $(@D) &&	$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
+		bash ./build.sh -r r6p2 -b
+endef
+
+define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
+	cd $(@D) &&	$(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
+		bash ./build.sh -r r6p2 -i
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
