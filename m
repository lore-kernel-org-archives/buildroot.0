From: Gary Bisson <bisson.gary@gmail.com>
Date: Thu, 26 Jun 2014 22:24:48 -0700
Subject: [Buildroot] [PATCH v2 05/11] freescale-imx: add imx-vpu package
In-Reply-To: <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
References: <1403150639-29382-1-git-send-email-bisson.gary@gmail.com>
 <1403846694-21974-1-git-send-email-bisson.gary@gmail.com>
Message-ID: <1403846694-21974-6-git-send-email-bisson.gary@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

as of 3.10.17-1.0.0 release, VPU code is now in its own package.

Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
---
 package/freescale-imx/Config.in          |  1 +
 package/freescale-imx/imx-vpu/Config.in  | 16 ++++++++++
 package/freescale-imx/imx-vpu/imx-vpu.mk | 53 ++++++++++++++++++++++++++++++++
 3 files changed, 70 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu/Config.in
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 0626a74..d8c6efc 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -43,6 +43,7 @@ config BR2_PACKAGE_FREESCALE_IMX_PLATFORM
 	default "IMX6Q" if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 
 source "package/freescale-imx/imx-lib/Config.in"
+source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
 source "package/freescale-imx/gpu-viv-bin-mx6q/Config.in"
diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
new file mode 100644
index 0000000..575383f
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -0,0 +1,16 @@
+comment "imx-vpu needs an imx-specific Linux kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_IMX_VPU
+	bool "imx-vpu"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Library of userspace helpers specific for the Freescale i.MX
+	  platform. It wraps the kernel interfaces for the i.MX platform
+	  Video Processing Unit (VPU) driver. It requires a kernel that
+	  includes the i.MX specific headers to be built.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
new file mode 100644
index 0000000..10c7d8b
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -0,0 +1,53 @@
+################################################################################
+#
+# imx-vpu
+#
+################################################################################
+
+IMX_VPU_VERSION = $(FREESCALE_IMX_VERSION)
+IMX_VPU_SITE    = $(FREESCALE_IMX_SITE)
+IMX_VPU_LICENSE = Freescale License
+IMX_VPU_LICENSE_FILES = EULA
+IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
+
+IMX_VPU_INSTALL_STAGING = YES
+
+# imx-vpu needs access to imx-specific kernel headers
+IMX_VPU_DEPENDENCIES += linux
+IMX_VPU_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM) \
+	INCLUDE="-idirafter $(LINUX_DIR)/include"
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (imx-vpu-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info
+# Since there's a EULA in the bin file, extract it to imx-vpu-x.y.z/EULA
+#
+define IMX_VPU_EXTRACT_CMDS
+	awk 'BEGIN      { start=0; } \
+	     /^EOEULA/  { start = 0; } \
+	                { if (start) print; } \
+	     /<<EOEULA/ { start=1; }'\
+	    $(DL_DIR)/$(IMX_VPU_SOURCE) > $(@D)/EULA
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(IMX_VPU_SOURCE) --force --auto-accept
+endef
+
+define IMX_VPU_BUILD_CMDS
+	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define IMX_VPU_INSTALL_STAGING_CMDS
+	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
+endef
+
+define IMX_VPU_INSTALL_TARGET_CMDS
+	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
2.0.0
