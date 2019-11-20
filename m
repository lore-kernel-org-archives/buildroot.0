From: Changming Huang <jerry.huang@nxp.com>
Date: Wed, 20 Nov 2019 12:07:18 +0800
Subject: [Buildroot] [PATCH 2/9] package/rcw: add target rcw binary support
In-Reply-To: <20191120040725.32207-1-jerry.huang@nxp.com>
References: <20191120040725.32207-1-jerry.huang@nxp.com>
Message-ID: <20191120040725.32207-3-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For NXP QorIQ (PowerPC and Layerscape) platform,
we need to specify the RCW file and build it to binary.

Introduce BR2_PACKAGE_HOST_RCW_BIN to specify the RCW binary file

Introduce BR2_PACKAGE_HOST_RCW_BOOT_MODE to define the boot mode.
Because the RCW binary can be stored in different media, for example:
SD card - RCW locate in SD card, boot the board from SD card
eMMC    - RCW locate in eMMC chip, boot the board from eMMC chip
flexSPI - RCW locate in flexSPI, boot the board from flexSPI Nor/Nand flash
QSPI    - RCW locate in QSPI flash, boot the board from QSPI flash

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
 package/rcw/Config.in.host |  6 ++++++
 package/rcw/rcw.mk         | 11 +++++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/rcw/Config.in.host b/package/rcw/Config.in.host
index a9253958d9..a53392dd3a 100644
--- a/package/rcw/Config.in.host
+++ b/package/rcw/Config.in.host
@@ -25,4 +25,10 @@ config BR2_PACKAGE_HOST_RCW_CUSTOM_PATH
 	  included for use in the SDK or with post scripts but no
 	  RCW binary will not be generated.
 
+config BR2_PACKAGE_HOST_RCW_BIN
+	string "Custom RCW"
+
+config BR2_PACKAGE_HOST_RCW_BOOT_MODE
+	string "Boot mode"
+
 endif
diff --git a/package/rcw/rcw.mk b/package/rcw/rcw.mk
index 3a8cf5c444..b12e577e39 100644
--- a/package/rcw/rcw.mk
+++ b/package/rcw/rcw.mk
@@ -37,6 +37,17 @@ endef
 define HOST_RCW_INSTALL_DELIVERY_FILE
 	$(INSTALL) -D -m 0644 $(@D)/PBL.bin $(BINARIES_DIR)/PBL.bin
 endef
+else
+RCW_BIN = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
+RCW_PLATFORM = $(firstword $(subst /, ,$(RCW_BIN)))
+
+define HOST_RCW_BUILD_CMDS
+	cd $(@D)/$(RCW_PLATFORM) && $(MAKE)
+endef
+
+define HOST_RCW_INSTALL_DELIVERY_FILE
+	$(INSTALL) -D -m 0644 $(@D)/$(RCW_BIN) $(BINARIES_DIR)/
+endef
 endif
 
 # Copy source files and script into $(HOST_DIR)/share/rcw/ so a developer
-- 
2.17.1
