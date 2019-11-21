From: Changming Huang <jerry.huang@nxp.com>
Date: Thu, 21 Nov 2019 18:23:20 +0800
Subject: [Buildroot] [PATCH v2 06/10] boot/arm-trusted-firmware: Add RCW
 support
In-Reply-To: <20191121102324.35225-1-jerry.huang@nxp.com>
References: <20191121102324.35225-1-jerry.huang@nxp.com>
Message-ID: <20191121102324.35225-7-jerry.huang@nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

NXP Layerscape platforms use RCW (Reset Configure Word) to
setup clocking and IO allocations and then launches the next stage of boot.
RCW needs ATF as well as uboot.
Option BR2_PACKAGE_HOST_RCW_ATF is used to determine if ATF is used for RCW.

Signed-off-by: Changming Huang <jerry.huang@nxp.com>
---
changes since v1:
1. Use option BR2_PACKAGE_HOST_RCW_ATF as the condition for RCW used by ATF.
---
 boot/arm-trusted-firmware/arm-trusted-firmware.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/boot/arm-trusted-firmware/arm-trusted-firmware.mk b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
index 2133d39e6d..2bca8109f1 100644
--- a/boot/arm-trusted-firmware/arm-trusted-firmware.mk
+++ b/boot/arm-trusted-firmware/arm-trusted-firmware.mk
@@ -92,6 +92,15 @@ endif
 
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS = all
 
+ifeq ($(BR2_PACKAGE_HOST_RCW_ATF),y)
+RCW_BOOT_MODE = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BOOT_MODE))
+RCW_PATH = $(call qstrip,$(BR2_PACKAGE_HOST_RCW_BIN))
+RCW_FILE = $(lastword $(subst /, ,$(RCW_PATH)))
+ARM_TRUSTED_FIRMWARE_MAKE_OPTS += BOOT_MODE=$(RCW_BOOT_MODE) RCW=$(BINARIES_DIR)/$(RCW_FILE)
+ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += pbl
+ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-fsl-qoriq-rcw
+endif
+
 ifeq ($(BR2_TARGET_ARM_TRUSTED_FIRMWARE_FIP),y)
 ARM_TRUSTED_FIRMWARE_MAKE_TARGETS += fip
 ARM_TRUSTED_FIRMWARE_DEPENDENCIES += host-openssl
-- 
2.17.1
