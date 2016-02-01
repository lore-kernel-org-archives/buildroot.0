From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon,  1 Feb 2016 10:37:02 +0100
Subject: [Buildroot] [PATCH 3/4] kernel-module-imx-gpu-viv: add new package
In-Reply-To: <1454319423-13913-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1454319423-13913-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1454319423-13913-4-git-send-email-gary.bisson@boundarydevices.com>
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
As explained in the cover letter, Yocto has a do_configure_append which
allows to modify the kernel configuration and remove the built-in Vivante
driver option.
https://github.com/Freescale/meta-fsl-arm/blob/master/classes/fsl-vivante-kernel-driver-handler.bbclass#L52

In order to have a similar mechanism the kernel module Vivante package
includes a LINUX_POST_CONFIGURE_HOOKS which doesn't really feel right.

Indeed, with this hook in place, the kernel and its modules are re-built
everytime a 'make' is issued. Not sure why it affects the build this way,
any input is appreciated.

Regards,
Gary
---
 package/freescale-imx/Config.in                    |  1 +
 .../kernel-module-imx-gpu-viv/Config.in            | 12 ++++++++++
 .../kernel-module-imx-gpu-viv.mk                   | 28 ++++++++++++++++++++++
 3 files changed, 41 insertions(+)
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
 create mode 100644 package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk

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
index 0000000..0725a89
--- /dev/null
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/Config.in
@@ -0,0 +1,12 @@
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
diff --git a/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
new file mode 100644
index 0000000..9c45f23
--- /dev/null
+++ b/package/freescale-imx/kernel-module-imx-gpu-viv/kernel-module-imx-gpu-viv.mk
@@ -0,0 +1,28 @@
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
+# Modify Linux configuration in case it includes a built-in version of
+# the Vivante driver.
+define LINUX_CONFIGURATION_FIXUP
+	sed -i "/CONFIG_MXC_GPU_VIV[ =]/d" $(LINUX_DIR)/.config
+	echo "# CONFIG_MXC_GPU_VIV is not set" >> $(LINUX_DIR)/.config
+endef
+LINUX_POST_CONFIGURE_HOOKS += LINUX_CONFIGURATION_FIXUP
+
+$(eval $(kernel-module))
+$(eval $(generic-package))
-- 
2.7.0
