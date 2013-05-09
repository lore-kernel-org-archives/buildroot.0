From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Thu,  9 May 2013 19:41:54 +0200
Subject: [Buildroot] [PATCH 2/4] Move firmware-imx and imx-lib to
	freescale-imx and refactor them
In-Reply-To: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1368121316-3645-3-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/freescale-imx/firmware-imx/Config.in       |   13 +++++
 package/freescale-imx/firmware-imx/firmware-imx.mk |   38 ++++++++++++++
 package/freescale-imx/imx-lib/Config.in            |   53 ++++++++++++++++++++
 package/freescale-imx/imx-lib/imx-lib.mk           |   40 +++++++++++++++
 4 files changed, 144 insertions(+)
 create mode 100644 package/freescale-imx/firmware-imx/Config.in
 create mode 100644 package/freescale-imx/firmware-imx/firmware-imx.mk
 create mode 100644 package/freescale-imx/imx-lib/Config.in
 create mode 100644 package/freescale-imx/imx-lib/imx-lib.mk

diff --git a/package/freescale-imx/firmware-imx/Config.in b/package/freescale-imx/firmware-imx/Config.in
new file mode 100644
index 0000000..dd96d88
--- /dev/null
+++ b/package/freescale-imx/firmware-imx/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_FIRMWARE_IMX
+	bool "firmware-imx"
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Firmware blobs for the Freescale i.MX SoCs.
+
+	  It contains blobs for Atheros AR6003, SDMA and VPU.
+
+	  Note: it also contains a blob for ar3k/30101 but upstream
+	  linux-firmware has that as well.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
diff --git a/package/freescale-imx/firmware-imx/firmware-imx.mk b/package/freescale-imx/firmware-imx/firmware-imx.mk
new file mode 100644
index 0000000..73d7e60
--- /dev/null
+++ b/package/freescale-imx/firmware-imx/firmware-imx.mk
@@ -0,0 +1,38 @@
+#############################################################
+#
+# buildroot makefile for firmware-imx
+#
+#############################################################
+
+FIRMWARE_IMX_VERSION = $(IMX_VERSION_LEVEL)
+FIRMWARE_IMX_SITE    = $(IMX_MIRROR_SITE)
+FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
+FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
+	Atheros license (ath6k)
+FIRMWARE_IMX_LICENSE_FILES = licenses/vpu/EULA licenses/ath6k/AR6102/License.txt
+# This is a legal minefield: the EULA specifies that
+# the Board Support Package includes software and hardware (sic!)
+# for which a separate license is needed...
+FIRMWARE_IMX_REDISTRIBUTE = NO
+
+FIRMWARE_IMX_BLOBS = ath6k sdma vpu
+
+# The archive is a shell-self-extractor of a bzipped tar. It happens
+# to extract in the correct directory (firmware-imx-x.y.z)
+# The --force makes sure it doesn't fail if the source dir already exists.
+# The --auto-accept skips the license check - not needed for us
+# because we have legal-info.
+define FIRMWARE_IMX_EXTRACT_CMDS
+	cd $(BUILD_DIR); \
+	sh $(DL_DIR)/$(FIRMWARE_IMX_SOURCE) --force --auto-accept
+endef
+
+
+define FIRMWARE_IMX_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/lib/firmware
+	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
+		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
+	done
+endef
+
+$(eval $(generic-package))
diff --git a/package/freescale-imx/imx-lib/Config.in b/package/freescale-imx/imx-lib/Config.in
new file mode 100644
index 0000000..1617009
--- /dev/null
+++ b/package/freescale-imx/imx-lib/Config.in
@@ -0,0 +1,53 @@
+comment "imx-lib needs an imx-specific kernel to be built"
+	depends on BR2_arm && !BR2_LINUX_KERNEL
+
+config BR2_PACKAGE_IMX_LIB
+	bool "imx-lib"
+	depends on BR2_LINUX_KERNEL
+	depends on BR2_arm # Only relevant for i.MX
+	help
+	  Library of userspace helpers specific for the Freescale i.MX
+	  platform. It wraps the kernel interfaces for some i.MX platform
+	  specific drivers. It requires a kernel that includes the i.MX
+	  specific headers to be built.
+
+	  This library is provided by Freescale as-is and doesn't have
+	  an upstream.
+
+if BR2_PACKAGE_IMX_LIB
+choice
+	prompt "i.MX platform"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
+	bool "imx25-3stack"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
+	bool "imx27ads"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
+	bool "imx37-3stack"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
+	bool "imx50"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
+	bool "imx51"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
+	bool "imx53"
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
+	bool "imx6q"
+
+endchoice
+
+config BR2_PACKAGE_IMX_LIB_PLATFORM
+	string
+	default "IMX25_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
+	default "IMX27ADS" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
+	default "IMX37_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
+	default "IMX50" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
+	default "IMX51" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
+	default "IMX53" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
+	default "IMX6Q" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
+endif
diff --git a/package/freescale-imx/imx-lib/imx-lib.mk b/package/freescale-imx/imx-lib/imx-lib.mk
new file mode 100644
index 0000000..f87ef0d
--- /dev/null
+++ b/package/freescale-imx/imx-lib/imx-lib.mk
@@ -0,0 +1,40 @@
+#############################################################
+#
+# imx-lib
+#
+#############################################################
+
+FIRMWARE_IMX_VERSION = $(IMX_VERSION_LEVEL)
+FIRMWARE_IMX_SITE    = $(IMX_MIRROR_SITE)
+IMX_LIB_LICENSE = LGPLv2.1+
+# No license file included
+
+IMX_LIB_INSTALL_STAGING = YES
+
+# imx-lib needs access to imx-specific kernel headers
+IMX_LIB_DEPENDENCIES += linux
+IMX_LIB_INCLUDE = \
+	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
+	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
+	-idirafter $(LINUX_DIR)/include
+
+IMX_LIB_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
+	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
+	INCLUDE="$(IMX_LIB_INCLUDE)"
+
+define IMX_LIB_BUILD_CMDS
+	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define IMX_LIB_INSTALL_STAGING_CMDS
+	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
+endef
+
+define IMX_LIB_INSTALL_TARGET_CMDS
+	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
-- 
1.7.10.4
