From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 27 Nov 2019 15:17:15 +0800
Subject: [Buildroot] [PATCH v3 4/9] package/qoriq-rcw: add target rcw binary
 support
In-Reply-To: <20191127071720.15623-1-jerry.huang@nxp.com>
References: <20191127071720.15623-1-jerry.huang@nxp.com>
Message-ID: <20191127071720.15623-4-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

For NXP QorIQ (PowerPC and Layerscape) platform,
we need to specify the RCW file and build it to binary.

Introduce BR2_PACKAGE_HOST_RCW_BIN to specify the RCW binary file.

Introduce BR2_PACKAGE_HOST_RCW_BOOT_MODE to define the boot mode.
Because the RCW binary can be stored in different media, for example:
SD card - RCW locate in SD card, boot the board from SD card
eMMC    - RCW locate in eMMC chip, boot the board from eMMC chip
flexSPI - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
QSPI    - RCW locate in QSPI flash, boot the board from QSPI flash

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v2:
1. modify the patch descrition
2. more detail for BR2_PACKAGE_HOST_QORIQ_RCW_BIN
3. remove two options not used in this patch
4. add the condition detection in makefile for QorIQ RCW 

changes since v1:
1. add option BR2_PACKAGE_HOST_RCW_ATF for ATF.
---
 package/nxp/qoriq-rcw/Config.in.host | 12 ++++++++++++
 package/nxp/qoriq-rcw/qoriq-rcw.mk   | 15 +++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/package/nxp/qoriq-rcw/Config.in.host b/package/nxp/qoriq-rcw/Config.in.host
index 8f78a40908..9bf55894e8 100644
--- a/package/nxp/qoriq-rcw/Config.in.host
+++ b/package/nxp/qoriq-rcw/Config.in.host
@@ -25,4 +25,16 @@ config BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
 	  included for use in the SDK or with post scripts but no
 	  RCW binary will not be generated.
 
+config BR2_PACKAGE_HOST_QORIQ_RCW_BIN
+	string "Custom RCW"
+	depends on !BR2_PACKAGE_HOST_QORIQ_RCW_CUSTOM_PATH
+	help
+	  This option is used to specify the RCW binary file for board.
+	  which is composed with platform/serdes_value/rcw_file, platform
+	  is the platform name, serdes_value is the setting of the Serdes,
+	  rcw_file is the file name of RCW, for example:
+	  "ls1028ardb/R_SQPP_0x85bb/rcw_1300_sdboot.bin"
+
+	  If this option is empty, no rcw file is used.
+
 endif
diff --git a/package/nxp/qoriq-rcw/qoriq-rcw.mk b/package/nxp/qoriq-rcw/qoriq-rcw.mk
index 7a0494adc6..bbd085f277 100644
--- a/package/nxp/qoriq-rcw/qoriq-rcw.mk
+++ b/package/nxp/qoriq-rcw/qoriq-rcw.mk
@@ -37,6 +37,21 @@ endef
 define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
 	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
 endef
+else
+QORIQ_RCW_PATH_FILE_BIN = $(call qstrip,$(BR2_PACKAGE_HOST_QORIQ_RCW_BIN))
+
+ifneq ($(QORIQ_RCW_PATH_FILE_BIN),)
+QORIQ_RCW_PLATFORM = $(firstword $(subst /, ,$(QORIQ_RCW_PATH_FILE_BIN)))
+QORIQ_RCW_FILE_BIN = $(lastword $(subst /, ,$(QORIQ_RCW_PATH_FILE_BIN)))
+
+define HOST_QORIQ_RCW_BUILD_CMDS
+	$(MAKE) -C $(@D)/$(QORIQ_RCW_PLATFORM)
+endef
+
+define HOST_QORIQ_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/$(QORIQ_RCW_PATH_FILE_BIN) $(BINARIES_DIR)/$(QORIQ_RCW_FILE_BIN)
+endef
+endif
 endif
 
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
-- 
2.17.1
