From: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
Date: Thu,  9 May 2013 19:41:55 +0200
Subject: [Buildroot] [PATCH 3/4] Reflect changes in package/Config.in Remove
	original firmware-imx and imx-lib packages
In-Reply-To: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
References: <1368121316-3645-1-git-send-email-h.fijnvandraat@inter.nl.net>
Message-ID: <1368121316-3645-4-git-send-email-h.fijnvandraat@inter.nl.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Henk Fijnvandraat <h.fijnvandraat@inter.nl.net>
---
 package/Config.in                    |    3 +-
 package/firmware-imx/Config.in       |   13 ---------
 package/firmware-imx/firmware-imx.mk |   39 -------------------------
 package/imx-lib/Config.in            |   53 ----------------------------------
 package/imx-lib/imx-lib.mk           |   41 --------------------------
 5 files changed, 1 insertion(+), 148 deletions(-)
 delete mode 100644 package/firmware-imx/Config.in
 delete mode 100644 package/firmware-imx/firmware-imx.mk
 delete mode 100644 package/imx-lib/Config.in
 delete mode 100644 package/imx-lib/imx-lib.mk

diff --git a/package/Config.in b/package/Config.in
index d980871..6a27455 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -212,9 +212,9 @@ source "package/xfsprogs/Config.in"
 endmenu
 
 menu "Hardware handling"
+source "package/freescale-imx/Config.in"
 menu "Misc devices firmwares"
 source "package/b43-firmware/Config.in"
-source "package/firmware-imx/Config.in"
 source "package/linux-firmware/Config.in"
 source "package/rpi-firmware/Config.in"
 source "package/ux500-firmware/Config.in"
@@ -459,7 +459,6 @@ endmenu
 
 menu "Hardware handling"
 source "package/ccid/Config.in"
-source "package/imx-lib/Config.in"
 source "package/lcdapi/Config.in"
 source "package/libaio/Config.in"
 source "package/libatasmart/Config.in"
diff --git a/package/firmware-imx/Config.in b/package/firmware-imx/Config.in
deleted file mode 100644
index dd96d88..0000000
--- a/package/firmware-imx/Config.in
+++ /dev/null
@@ -1,13 +0,0 @@
-config BR2_PACKAGE_FIRMWARE_IMX
-	bool "firmware-imx"
-	depends on BR2_arm # Only relevant for i.MX
-	help
-	  Firmware blobs for the Freescale i.MX SoCs.
-
-	  It contains blobs for Atheros AR6003, SDMA and VPU.
-
-	  Note: it also contains a blob for ar3k/30101 but upstream
-	  linux-firmware has that as well.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
diff --git a/package/firmware-imx/firmware-imx.mk b/package/firmware-imx/firmware-imx.mk
deleted file mode 100644
index 3b43bef..0000000
--- a/package/firmware-imx/firmware-imx.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-#############################################################
-#
-# buildroot makefile for firmware-imx
-#
-#############################################################
-
-FIRMWARE_IMX_VERSION = 12.09.01
-# No official download site from freescale, just this mirror
-FIRMWARE_IMX_SITE = http://download.ossystems.com.br/bsp/freescale/source
-FIRMWARE_IMX_SOURCE = firmware-imx-$(FIRMWARE_IMX_VERSION).bin
-FIRMWARE_IMX_LICENSE = Freescale Semiconductor Software License Agreement, \
-	Atheros license (ath6k)
-FIRMWARE_IMX_LICENSE_FILES = licenses/vpu/EULA licenses/ath6k/AR6102/License.txt
-# This is a legal minefield: the EULA specifies that
-# the Board Support Package includes software and hardware (sic!)
-# for which a separate license is needed...
-FIRMWARE_IMX_REDISTRIBUTE = NO
-
-FIRMWARE_IMX_BLOBS = ath6k sdma vpu
-
-# The archive is a shell-self-extractor of a bzipped tar. It happens
-# to extract in the correct directory (firmware-imx-x.y.z)
-# The --force makes sure it doesn't fail if the source dir already exists.
-# The --auto-accept skips the license check - not needed for us
-# because we have legal-info.
-define FIRMWARE_IMX_EXTRACT_CMDS
-	cd $(BUILD_DIR); \
-	sh $(DL_DIR)/$(FIRMWARE_IMX_SOURCE) --force --auto-accept
-endef
-
-
-define FIRMWARE_IMX_INSTALL_TARGET_CMDS
-	mkdir -p $(TARGET_DIR)/lib/firmware
-	for blobdir in $(FIRMWARE_IMX_BLOBS); do \
-		cp -r $(@D)/firmware/$${blobdir} $(TARGET_DIR)/lib/firmware; \
-	done
-endef
-
-$(eval $(generic-package))
diff --git a/package/imx-lib/Config.in b/package/imx-lib/Config.in
deleted file mode 100644
index 1617009..0000000
--- a/package/imx-lib/Config.in
+++ /dev/null
@@ -1,53 +0,0 @@
-comment "imx-lib needs an imx-specific kernel to be built"
-	depends on BR2_arm && !BR2_LINUX_KERNEL
-
-config BR2_PACKAGE_IMX_LIB
-	bool "imx-lib"
-	depends on BR2_LINUX_KERNEL
-	depends on BR2_arm # Only relevant for i.MX
-	help
-	  Library of userspace helpers specific for the Freescale i.MX
-	  platform. It wraps the kernel interfaces for some i.MX platform
-	  specific drivers. It requires a kernel that includes the i.MX
-	  specific headers to be built.
-
-	  This library is provided by Freescale as-is and doesn't have
-	  an upstream.
-
-if BR2_PACKAGE_IMX_LIB
-choice
-	prompt "i.MX platform"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
-	bool "imx25-3stack"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
-	bool "imx27ads"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
-	bool "imx37-3stack"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
-	bool "imx50"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
-	bool "imx51"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
-	bool "imx53"
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
-	bool "imx6q"
-
-endchoice
-
-config BR2_PACKAGE_IMX_LIB_PLATFORM
-	string
-	default "IMX25_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX25_3STACK
-	default "IMX27ADS" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX27ADS
-	default "IMX37_3STACK" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX37_3STACK
-	default "IMX50" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX50
-	default "IMX51" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX51
-	default "IMX53" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX53
-	default "IMX6Q" if BR2_PACKAGE_IMX_LIB_PLATFORM_IMX6Q
-endif
diff --git a/package/imx-lib/imx-lib.mk b/package/imx-lib/imx-lib.mk
deleted file mode 100644
index c168c80..0000000
--- a/package/imx-lib/imx-lib.mk
+++ /dev/null
@@ -1,41 +0,0 @@
-#############################################################
-#
-# imx-lib
-#
-#############################################################
-
-IMX_LIB_VERSION = 12.09.01
-# No official download site from freescale, just this mirror
-IMX_LIB_SITE    = http://download.ossystems.com.br/bsp/freescale/source
-IMX_LIB_LICENSE = LGPLv2.1+
-# No license file included
-
-IMX_LIB_INSTALL_STAGING = YES
-
-# imx-lib needs access to imx-specific kernel headers
-IMX_LIB_DEPENDENCIES += linux
-IMX_LIB_INCLUDE = \
-	-I$(LINUX_DIR)/drivers/mxc/security/rng/include \
-	-I$(LINUX_DIR)/drivers/mxc/security/sahara2/include \
-	-idirafter $(LINUX_DIR)/include
-
-IMX_LIB_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE="$(CCACHE) $(TARGET_CROSS)" \
-	PLATFORM=$(BR2_PACKAGE_IMX_LIB_PLATFORM) \
-	INCLUDE="$(IMX_LIB_INCLUDE)"
-
-define IMX_LIB_BUILD_CMDS
-	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D)
-endef
-
-define IMX_LIB_INSTALL_STAGING_CMDS
-	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
-endef
-
-define IMX_LIB_INSTALL_TARGET_CMDS
-	$(IMX_LIB_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
-- 
1.7.10.4
