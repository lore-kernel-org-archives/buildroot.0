From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Thu,  9 Nov 2017 20:18:28 +0100
Subject: [Buildroot] [PATCH v3 1/1] add sunxi-mali mainline kernel
Message-ID: <1510255108-39722-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As it's not present in buildroot,
add support for sunxi-mali mainline kernel driver.

Get https://github.com/mripard/sunxi-mali repository,
build with provided ./build.sh -b
install with provided ./build.sh -i

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
Changes v2 -> v3:
* Remove depends on headers version
* Add help in Config.in

 package/sunxi-mali-driver-mainline/Config.in       | 17 ++++++++++++++
 .../sunxi-mali-driver-mainline.mk                  | 26 ++++++++++++++++++++++
 2 files changed, 43 insertions(+)
 create mode 100644 package/sunxi-mali-driver-mainline/Config.in
 create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk

diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
new file mode 100644
index 0000000..43c7cb1
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/Config.in
@@ -0,0 +1,17 @@
+comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
+	bool "sunxi-mali-driver-mainline"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	help
+	  Install Sunxi Mali Kernel space driver into userspace,
+	  sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 with the
+	  following options enabled:
+
+	  - CONFIG_CMA
+	  - CONFIG_DMA_CMA
+	  - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more
+
+	  https://github.com/mripard/sunxi-mali/blob/master/README.md
\ No newline at end of file
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
