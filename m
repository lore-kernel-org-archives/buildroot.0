From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  4 Jan 2018 12:39:35 +0100
Subject: [Buildroot] [PATCH v2 03/15] imx-gpu-g2d: new package
In-Reply-To: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
References: <20180104113947.21235-1-gary.bisson@boundarydevices.com>
Message-ID: <20180104113947.21235-4-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Up until now, the G2D libraries were included inside the imx-gpu-viv
package. However, since next version of the i.MX will use a new
hardware IP to do 2D rendering (DPU), the GPU 2D libraries have been
separated from the 3D GPU package.

Tested with the following commands:
 # /usr/share/examples/g2d_samples/g2d_multiblit_test
 # /usr/share/examples/g2d_samples/g2d_overlay_test
 # /usr/share/examples/g2d_samples/g2d_test
 # gst-launch-1.0 videotestsrc ! imxg2dvideosink

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in                    |  1 +
 package/freescale-imx/imx-gpu-g2d/Config.in        | 25 +++++++++++++++
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash |  1 +
 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk   | 37 ++++++++++++++++++++++
 4 files changed, 64 insertions(+)
 create mode 100644 package/freescale-imx/imx-gpu-g2d/Config.in
 create mode 100644 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
 create mode 100644 package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index e02adf51e3..e1dbdfb3e2 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -82,6 +82,7 @@ source "package/freescale-imx/gpu-amd-bin-mx51/Config.in"
 source "package/freescale-imx/libz160/Config.in"
 endif
 if BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
+source "package/freescale-imx/imx-gpu-g2d/Config.in"
 source "package/freescale-imx/imx-gpu-viv/Config.in"
 source "package/freescale-imx/kernel-module-imx-gpu-viv/Config.in"
 endif
diff --git a/package/freescale-imx/imx-gpu-g2d/Config.in b/package/freescale-imx/imx-gpu-g2d/Config.in
new file mode 100644
index 0000000000..47375788d1
--- /dev/null
+++ b/package/freescale-imx/imx-gpu-g2d/Config.in
@@ -0,0 +1,25 @@
+comment "imx-gpu-g2d needs a glibc toolchain with armhf enabled"
+	depends on BR2_arm
+	depends on !BR2_TOOLCHAIN_USES_GLIBC || !BR2_ARM_EABIHF
+
+config BR2_PACKAGE_IMX_GPU_G2D
+	bool "imx-gpu-g2d"
+	# Pre-built binaries only available for ARM EABIhf
+	depends on BR2_ARM_EABIHF
+	# Library binaries are linked against libc.so.6
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	select BR2_PACKAGE_IMX_GPU_VIV
+	help
+	  Userspace 2D libraries for Vivante GPU on i.MX platforms.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
+
+if BR2_PACKAGE_IMX_GPU_G2D
+
+config BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES
+	bool "install examples"
+	help
+	  Copy the Vivante G2D examples to the target.
+
+endif
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
new file mode 100644
index 0000000000..299ec703f5
--- /dev/null
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.hash
@@ -0,0 +1 @@
+sha256	070a95aa9942bd67e8ba4012962df74143bffb9998301ac097dab5e1437000d8  imx-gpu-g2d-6.2.2.p0.bin
diff --git a/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
new file mode 100644
index 0000000000..0c92b826c4
--- /dev/null
+++ b/package/freescale-imx/imx-gpu-g2d/imx-gpu-g2d.mk
@@ -0,0 +1,37 @@
+################################################################################
+#
+# imx-gpu-g2d
+#
+################################################################################
+
+IMX_GPU_G2D_VERSION = 6.2.2.p0
+IMX_GPU_G2D_SITE = $(FREESCALE_IMX_SITE)
+IMX_GPU_G2D_SOURCE = imx-gpu-g2d-$(IMX_GPU_G2D_VERSION).bin
+IMX_GPU_G2D_DEPENDENCIES = imx-gpu-viv
+IMX_GPU_G2D_INSTALL_STAGING = YES
+
+IMX_GPU_G2D_LICENSE = NXP Semiconductor Software License Agreement
+IMX_GPU_G2D_LICENSE_FILES = EULA COPYING
+IMX_GPU_G2D_REDISTRIBUTE = NO
+
+define IMX_GPU_G2D_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(DL_DIR)/$(IMX_GPU_G2D_SOURCE))
+endef
+
+define IMX_GPU_G2D_INSTALL_STAGING_CMDS
+	cp -a $(@D)/g2d/usr/* $(STAGING_DIR)/usr
+endef
+
+ifeq ($(BR2_PACKAGE_IMX_GPU_G2D_EXAMPLES),y)
+define IMX_GPU_G2D_INSTALL_EXAMPLES
+	mkdir -p $(TARGET_DIR)/usr/share/examples/
+	cp -a $(@D)/gpu-demos/opt/* $(TARGET_DIR)/usr/share/examples/
+endef
+endif
+
+define IMX_GPU_G2D_INSTALL_TARGET_CMDS
+	$(IMX_GPU_G2D_INSTALL_EXAMPLES)
+	cp -a $(@D)/g2d/usr/lib $(TARGET_DIR)/usr
+endef
+
+$(eval $(generic-package))
-- 
2.15.1
