From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Tue,  2 Feb 2016 00:38:11 +0100
Subject: [Buildroot] [PATCH v2] kernel-module-imx-gpu-viv: add new package
Message-ID: <1454369891-27330-1-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This is the Vivante kernel driver split from the kernel source code in
order to make it possible to be used in any kernel source since 3.10.53.

The driver source code provided by Freescale needs fixes so the
community forked the code to allow faster development and easier
integration of fixes from the community.

This patch is based on the Yocto equivalent:
https://github.com/Freescale/meta-fsl-arm/commit/32cf391
https://github.com/Freescale/meta-fsl-arm/commit/4249193

This package has been tested with the following commands:
 # modprobe galcore
 # cd /usr/share/examples/viv_samples/vdk/
 # ./tutorial7

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi All,

This is a follow-up of previous series to update Freescale graphics:
http://lists.busybox.net/pipermail/buildroot/2016-February/151133.html

Changelog v1->v2:
- add hash file
- add project URL to Config.in
- switch to KCONFIG_FIXUP_CMDS

Regards,
Gary
---
 linux/linux.mk                                       |  2 ++
 package/freescale-imx/Config.in                      |  1 +
 .../kernel-module-imx-gpu-viv/Config.in              | 14 ++++++++++++++
 .../kernel-module-imx-gpu-viv.hash                   |  2 ++
 .../kernel-module-imx-gpu-viv.mk                     | 20 ++++++++++++++++++++
 5 files changed, 39 insertions(+)
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk

diff --git a/linux/linux.mk b/linux/linux.mk
index 3c53a0b..c9986cd 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -251,6 +251,8 @@ define LINUX_KCONFIG_FIXUP_CMDS
 		$(call KCONFIG_ENABLE_OPT,CONFIG_NF_CONNTRACK_MARK,$(@D)/.config))
 	$(if $(BR2_LINUX_KERNEL_APPENDED_DTB),
 		$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_APPENDED_DTB,$(@D)/.config))
+	$(if $(BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV),
+		$(call KCONFIG_DISABLE_OPT,CONFIG_MXC_GPU_VIV,$(@D)/.config))
 endef
 
 ifeq ($(BR2_LINUX_KERNEL_DTS_SUPPORT),y)
diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index a958dbd..dfb6cc4 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -52,6 +52,7 @@ source "package/freescale-imx/libz160/Config.in"
 endif
 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/imx-gpu-viv/Config.in"
+source "package/freescale-imx/kernel-module-imx-gpu-viv/Config.in"
 endif
 
 endif
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
new file mode 100644
index 0000000..bcc5517
--- /dev/null
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
@@ -0,0 +1,14 @@
+comment "kernel-module-imx-gpu-viv needs a Linux kernel to be built"
+	depends on !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_KERNEL_MODULE_IMX_GPU_VIV
+	bool "kernel-module-imx-gpu-viv"
+	depends on BR2_LINUX_KERNEL
+	help
+	  Kernel loadable module for Vivante GPU.
+
+	  This package uses an exact copy of the GPU kernel driver source code
+	  of the same version as base and include fixes and improvements
+	  developed by FSL Community
+
+	  https://github.com/Freescale/kernel-module-imx-gpu-viv
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
new file mode 100644
index 0000000..7d01afb
--- /dev/null
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.hash
@@ -0,0 +1,2 @@
+# locally computed
+sha256 955037fd86d31cdddaed15c254f377f4b30a8abcf5a5e4f9185bd660ff14b7c3  kernel-module-imx-gpu-viv-eeeb23c0fb1cee01318088d417025263479c44ac.tar.gz
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
new file mode 100644
index 0000000..95b0a6b
--- /dev/null
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -0,0 +1,20 @@
+################################################################################
+#
+# kernel-module-imx-gpu-viv
+#
+################################################################################
+
+KERNEL_MODULE_IMX_GPU_VIV_VERSION = eeeb23c0fb1cee01318088d417025263479c44ac
+KERNEL_MODULE_IMX_GPU_VIV_SITE = \
+	$(call github,Freescale,kernel-module-imx-gpu-viv,$(KERNEL_MODULE_IMX_GPU_VIV_VERSION))
+KERNEL_MODULE_IMX_GPU_VIV_LICENSE = GPLv2
+KERNEL_MODULE_IMX_GPU_VIV_LICENSE_FILES = COPYING
+
+KERNEL_MODULE_IMX_GPU_VIV_MODULE_MAKE_OPTS = \
+	AQROOT=$(@D)/kernel-module-imx-gpu-viv-src \
+	KERNEL_DIR=$(LINUX_DIR)
+
+KERNEL_MODULE_IMX_GPU_VIV_MODULE_SUBDIRS = kernel-module-imx-gpu-viv-src
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.6.4
