From: Giulio Benetti <giulio.benetti@micronovasrl.com>
Date: Sat, 25 Nov 2017 23:22:48 +0100
Subject: [Buildroot] [PATCH 1/2] sunxi-mali-driver-mainline: new package
Message-ID: <1511648569-18855-1-git-send-email-giulio.benetti@micronovasrl.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Added kernel allwinner mali driver package.
Used combined with userspace Allwinner openGL libraries,
it gives possibility to use 3D openGL SoC acceleration.

Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
---
 DEVELOPERS                                         |  3 ++
 package/Config.in                                  |  1 +
 package/sunxi-mali-driver-mainline/Config.in       | 38 ++++++++++++++++++++++
 .../sunxi-mali-driver-mainline.mk                  | 30 +++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/sunxi-mali-driver-mainline/Config.in
 create mode 100644 package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk

diff --git a/DEVELOPERS b/DEVELOPERS
index 7621f96..60a934e 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -698,6 +698,9 @@ F:	package/ocrad/
 F:	package/tesseract-ocr/
 F:	package/webp/
 
+N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
+F:	package/sunxi-mali-driver-mainline/
+
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
 F:	package/gengetopt/
diff --git a/package/Config.in b/package/Config.in
index fe5ccc4..e619992 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -497,6 +497,7 @@ endmenu
 	source "package/stm32flash/Config.in"
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
+	source "package/sunxi-mali-driver-mainline/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/sunxi-mali-driver-mainline/Config.in b/package/sunxi-mali-driver-mainline/Config.in
new file mode 100644
index 0000000..1f9ef59
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/Config.in
@@ -0,0 +1,38 @@
+comment "sunxi-mali-driver-mainline needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
+	bool "sunxi-mali-driver-mainline"
+	depends on BR2_LINUX_KERNEL
+	select BR2_LINUX_NEEDS_MODULES # not using kernel-module infra
+	help
+	  This package builds and installs the Linux kernel driver for
+	  the Mali GPU on Allwinner platforms, compatible with recent
+	  Linux kernels (>= 4.4). Note that it should be installed
+	  together with the corresponding userspace OpenGL libraries,
+	  which are provided as binaries only at:
+	  https://github.com/free-electrons/mali-blobs
+
+	  sunxi-mali-driver-mainline requires a Linux kernel >= 4.4 with the
+	  following options enabled:
+
+	  - CONFIG_CMA
+	  - CONFIG_DMA_CMA
+	  - CONFIG_DRM_FBDEV_OVERALLOC >= 200 for double buffer or more
+
+	  https://github.com/mripard/sunxi-mali/blob/master/README.md
+
+if BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE
+
+choice
+	prompt "Version"
+	default BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE_R6P2
+	help
+	  Select the version of the kernel module.
+
+config BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE_R6P2
+	bool "r6p2"
+
+endchoice
+
+endif
diff --git a/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
new file mode 100644
index 0000000..41d145d
--- /dev/null
+++ b/package/sunxi-mali-driver-mainline/sunxi-mali-driver-mainline.mk
@@ -0,0 +1,30 @@
+################################################################################
+#
+# sunxi-mali-driver-mainline
+#
+################################################################################
+
+SUNXI_MALI_DRIVER_MAINLINE_VERSION = 42c7c139c14103a83bb2ad7e7a1f0ed491f96500
+SUNXI_MALI_DRIVER_MAINLINE_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_DRIVER_MAINLINE_VERSION))
+SUNXI_MALI_DRIVER_MAINLINE_DEPENDENCIES = linux
+
+SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS = \
+	KDIR=$(LINUX_DIR) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	INSTALL_MOD_PATH=$(TARGET_DIR)
+
+ifeq ($(BR2_PACKAGE_SUNXI_MALI_DRIVER_MAINLINE_R6P2),y)
+SUNXI_MALI_DRIVER_VER=r6p2
+endif
+
+define SUNXI_MALI_DRIVER_MAINLINE_BUILD_CMDS
+	cd $(@D) && $(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_DRIVER_VER) -b
+endef
+
+define SUNXI_MALI_DRIVER_MAINLINE_INSTALL_TARGET_CMDS
+	cd $(@D) && $(SUNXI_MALI_DRIVER_MAINLINE_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_DRIVER_VER) -i
+endef
+
+$(eval $(generic-package))
-- 
2.7.4
