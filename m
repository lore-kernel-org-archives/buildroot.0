From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:18 +0800
Subject: [Buildroot] [PATCH v2 04/10] package/freescale-qoriq/fsl-qoriq-rcw:
 add target rcw binary support
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-5-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jerry Huang <jerry.huang@nxp.com>

For NXP QorIQ (PowerPC and Layerscape) platform,
we need to specify the RCW file and build it to binary.

Introduce BR2_PACKAGE_HOST_RCW_ATF to use ATF for RCW.

Introduce BR2_PACKAGE_HOST_RCW_BIN to specify the RCW binary file.

Introduce BR2_PACKAGE_HOST_RCW_BOOT_MODE to define the boot mode.
Because the RCW binary can be stored in different media, for example:
SD card - RCW locate in SD card, boot the board from SD card
eMMC    - RCW locate in eMMC chip, boot the board from eMMC chip
flexSPI - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
QSPI    - RCW locate in QSPI flash, boot the board from QSPI flash

Signed-off-by: Jerry Huang <jerry.huang@nxp.com>
---
changes since v1:
1. add option BR2_PACKAGE_HOST_RCW_ATF for ATF
---
 .../freescale-qoriq/fsl-qoriq-rcw/Config.in.host  | 15 +++++++++++++++
 .../fsl-qoriq-rcw/fsl-qoriq-rcw.mk                | 11 +++++++++++
 2 files changed, 26 insertions(+)

diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
index a9253958d9..f55f2a6f3a 100644
--- a/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/Config.in.host
@@ -25,4 +25,19 @@ config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
 	  included for use in the SDK or with post scripts but no
 	  RCW binary will not be generated.
 
+config BR2_PACKAGE_HOST_RCW_ATF
+	bool "atf for rcw"
+	help
+	  When ATF is used for RCW, enable this option.
+
+config BR2_PACKAGE_HOST_RCW_BIN
+	string "Custom RCW"
+	help
+	  This option is used to specify the RCW binary file for board.
+
+config BR2_PACKAGE_HOST_RCW_BOOT_MODE
+	string "Boot mode"
+	help
+	  Specify the boot mode, for example, sd, emmc, flexspi_nor.
+
 endif
diff --git a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
index a2c3f4f8a6..15c4024eb8 100644
--- a/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
+++ b/package/freescale-qoriq/fsl-qoriq-rcw/fsl-qoriq-rcw.mk
@@ -37,6 +37,17 @@ endef
 define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
 	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
 endef
+else
+RCW_BIN = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
+RCW_PLATFORM = $(firstword $(subst /, ,$(RCW_BIN)))
+
+define HOST_FSL_QORIQ_RCW_BUILD_CMDS
+	cd $(@D)/$(RCW_PLATFORM) && $(MAKE)
+endef
+
+define HOST_FSL_QORIQ_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/$(RCW_BIN) $(BINARIES_DIR)/
+endef
 endif
 
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
-- 
2.17.1
