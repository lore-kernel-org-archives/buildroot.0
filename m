From: Refik Tuzakli <tuzakli.refik@gmail.com>
Date: Mon,  3 Feb 2020 22:31:50 +0300
Subject: [Buildroot] [PATCH v2 2/7] package/freescale-imx/imx-dpu-g2d: new
 package imx-dpu-g2d package is used by i.MX 8 and i.MX 8X series instead of
 imx-vpu or imx-vpu-hantro.With this commit,
 imx-dpu-g2d is added and is enabled for i.MX 8X.
In-Reply-To: <20200203193155.12657-1-tuzakli.refik@gmail.com>
References: <20200203193155.12657-1-tuzakli.refik@gmail.com>
Message-ID: <20200203193155.12657-2-tuzakli.refik@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Refik Tuzakli <tuzakli.refik@gmail.com>
---
 package/freescale-imx/Config.in               |  7 ++++
 package/freescale-imx/imx-dpu-g2d/Config.in   | 23 ++++++++++++
 .../imx-dpu-g2d/imx-dpu-g2d.hash              |  5 +++
 .../freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk  | 37 +++++++++++++++++++
 4 files changed, 72 insertions(+)
 create mode 100644 package/freescale-imx/imx-dpu-g2d/Config.in
 create mode 100644 package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
 create mode 100644 package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index d23bcdbd9a..586e67ea72 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -75,6 +75,10 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU_HANTRO
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
+config BR2_PACKAGE_FREESCALE_IMX_HAS_DPU
+	bool
+	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8X
+
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
@@ -94,6 +98,9 @@ source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
+if BR2_PACKAGE_FREESCALE_IMX_HAS_DPU
+source "package/freescale-imx/imx-dpu-g2d/Config.in"
+endif
 source "package/freescale-imx/firmware-imx/Config.in"
 source "package/freescale-imx/imx-sc-firmware/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
diff --git a/package/freescale-imx/imx-dpu-g2d/Config.in b/package/freescale-imx/imx-dpu-g2d/Config.in
new file mode 100644
index 0000000000..2675840093
--- /dev/null
+++ b/package/freescale-imx/imx-dpu-g2d/Config.in
@@ -0,0 +1,23 @@
+comment "imx-dpu-g2d needs a glibc toolchain"
+	depends on BR2_aarch64
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
+
+config BR2_PACKAGE_IMX_DPU_G2D
+	bool "imx-dpu-g2d"
+	# Library binaries are linked against libc.so.6
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_IMX_GPU_VIV
+	help
+	  Userspace DPU 2D libraries for Vivante GPU on i.MX platforms.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
+
+if BR2_PACKAGE_IMX_DPU_G2D
+
+config BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES
+	bool "install examples"
+	help
+	  Copy the Vivante DPU examples to the target.
+
+endif
diff --git a/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
new file mode 100644
index 0000000000..22be60077f
--- /dev/null
+++ b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.hash
@@ -0,0 +1,5 @@
+# Locally calculated
+sha256	46c72ce9b98b7116e9f7f53a66aadc8fb66910473477c6553db77ed71e54d7ea  imx-dpu-g2d-1.8.2.bin
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
+
diff --git a/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk
new file mode 100644
index 0000000000..75fb7e21f0
--- /dev/null
+++ b/package/freescale-imx/imx-dpu-g2d/imx-dpu-g2d.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# imx-dpu-g2d
+#
+################################################################################
+
+IMX_DPU_G2D_VERSION = 1.8.2
+IMX_DPU_G2D_SITE = $(FREESCALE_IMX_SITE)
+IMX_DPU_G2D_SOURCE = imx-dpu-g2d-$(IMX_DPU_G2D_VERSION).bin
+IMX_DPU_G2D_DEPENDENCIES = imx-gpu-viv
+IMX_DPU_G2D_INSTALL_STAGING = YES
+
+IMX_DPU_G2D_LICENSE = NXP Semiconductor Software License Agreement
+IMX_DPU_G2D_LICENSE_FILES = EULA COPYING
+IMX_DPU_G2D_REDISTRIBUTE = NO
+
+define IMX_DPU_G2D_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_DPU_G2D_DL_DIR)/$(IMX_DPU_G2D_SOURCE))
+endef
+
+define IMX_DPU_G2D_INSTALL_STAGING_CMDS
+	cp -a $(@D)/g2d/usr/* $(STAGING_DIR)/usr
+endef
+
+ifeq ($(BR2_PACKAGE_IMX_DPU_G2D_EXAMPLES),y)
+define IMX_DPU_G2D_INSTALL_EXAMPLES
+	mkdir -p $(TARGET_DIR)/usr/share/examples/
+	cp -a $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
+endef
+endif
+
+define IMX_DPU_G2D_INSTALL_TARGET_CMDS
+	$(IMX_DPU_G2D_INSTALL_EXAMPLES)
+	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
2.17.1
