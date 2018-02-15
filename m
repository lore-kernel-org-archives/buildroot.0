From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 15 Feb 2018 21:44:55 +0100
Subject: [Buildroot] [git commit branch/next] sunxi-mali-mainline-driver:
 new package
Message-ID: <20180215210545.45D9887414@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4fdf2d642b8d1a7fcabf1a995887c33581fa7aad
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Add allwinner mali kernel driver package.  Used in combination with
userspace Allwinner openGL libraries, it gives possibility to use 3D openGL
SoC acceleration.

[Peter: Rename to sunxi-mali-mainline-driver.  Use revision selection from
	sunxi-mali-mainline package.  Depend on that package and default to
	y if dependencies are met. Tweak Linux config]
Signed-off-by: Giulio Benetti <giulio.benetti@micronovasrl.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 DEVELOPERS                                         |  1 +
 linux/linux.mk                                     |  3 +++
 package/Config.in                                  |  1 +
 package/sunxi-mali-mainline-driver/Config.in       | 25 +++++++++++++++++++++
 .../sunxi-mali-mainline-driver.mk                  | 26 ++++++++++++++++++++++
 5 files changed, 56 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 1b14927228..e2b3901425 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -732,6 +732,7 @@ F:	package/webp/
 
 N:	Giulio Benetti <giulio.benetti@micronovasrl.com>
 F:	package/sunxi-mali-mainline/
+F:	package/sunxi-mali-mainline-driver/
 
 N:	Gregory Dymarek <gregd72002@gmail.com>
 F:	package/ding-libs/
diff --git a/linux/linux.mk b/linux/linux.mk
index 5300b9cfc5..776304e730 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -291,6 +291,9 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_SMACK,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_SECURITY_NETWORK,$(@D)/.config))
+	$(if $(BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER),
+		$(call KCONFIG_ENABLE_OPT,CONFIG_CMA,$(@D)/.config)
+		$(call KCONFIG_ENABLE_OPT,CONFIG_DMA_CMA,$(@D)/.config))
 	$(if $(BR2_PACKAGE_IPTABLES),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_IPTABLES,$(@D)/.config)
 		$(call KCONFIG_ENABLE_OPT,CONFIG_IP_NF_FILTER,$(@D)/.config)
diff --git a/package/Config.in b/package/Config.in
index 87c55e227b..97317fdb5f 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -505,6 +505,7 @@ endmenu
 	source "package/sunxi-cedarx/Config.in"
 	source "package/sunxi-mali/Config.in"
 	source "package/sunxi-mali-mainline/Config.in"
+	source "package/sunxi-mali-mainline-driver/Config.in"
 	source "package/sysstat/Config.in"
 	source "package/targetcli-fb/Config.in"
 	source "package/ti-gfx/Config.in"
diff --git a/package/sunxi-mali-mainline-driver/Config.in b/package/sunxi-mali-mainline-driver/Config.in
new file mode 100644
index 0000000000..c939d2a957
--- /dev/null
+++ b/package/sunxi-mali-mainline-driver/Config.in
@@ -0,0 +1,25 @@
+comment "sunxi-mali-mainline-driver needs a Linux kernel to be built"
+	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_SUNXI_MALI_MAINLINE_DRIVER
+	bool "sunxi-mali-mainline-driver"
+	default y
+	depends on BR2_PACKAGE_SUNXI_MALI_MAINLINE # runtime
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
+	  sunxi-mali-mainline-driver requires a Linux kernel >= 4.4
+	  with the following options enabled:
+
+	  - CONFIG_CMA
+	  - CONFIG_DMA_CMA
+
+	  https://github.com/mripard/sunxi-mali/blob/master/README.md
diff --git a/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
new file mode 100644
index 0000000000..e4871c0bf0
--- /dev/null
+++ b/package/sunxi-mali-mainline-driver/sunxi-mali-mainline-driver.mk
@@ -0,0 +1,26 @@
+################################################################################
+#
+# sunxi-mali-mainline-driver
+#
+################################################################################
+
+SUNXI_MALI_MAINLINE_DRIVER_VERSION = 42c7c139c14103a83bb2ad7e7a1f0ed491f96500
+SUNXI_MALI_MAINLINE_DRIVER_SITE = $(call github,mripard,sunxi-mali,$(SUNXI_MALI_MAINLINE_DRIVER_VERSION))
+SUNXI_MALI_MAINLINE_DRIVER_DEPENDENCIES = linux
+
+SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS = \
+	KDIR=$(LINUX_DIR) \
+	CROSS_COMPILE=$(TARGET_CROSS) \
+	INSTALL_MOD_PATH=$(TARGET_DIR)
+
+define SUNXI_MALI_MAINLINE_DRIVER_BUILD_CMDS
+	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -b
+endef
+
+define SUNXI_MALI_MAINLINE_DRIVER_INSTALL_TARGET_CMDS
+	cd $(@D) && $(SUNXI_MALI_MAINLINE_DRIVER_MAKE_OPTS) \
+		$(SHELL) ./build.sh -r $(SUNXI_MALI_MAINLINE_REV) -i
+endef
+
+$(eval $(generic-package))
