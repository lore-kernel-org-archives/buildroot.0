From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon,  2 May 2016 23:26:52 +0200
Subject: [Buildroot] [PATCH] uboot: ensure u-boot-dtb.img gets built if
	enabled
Message-ID: <1462224412-836-1-git-send-email-peter@korsgaard.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

u-boot-dtb.img only gets built by default (all target) if
CONFIG_OF_SEPARATE _AND_ CONFIG_SPL_FRAMEWORK are enabled.

Certain SoCs (E.G. Action Semi S500) use a proprietary first level
bootloader instead of u-boot SPL, but still use u-boot-dtb.img as the first
level bootloader parses the uImage header for size/loadaddr.

Ensure u-boot-dtb.img gets built if enabled by explicitly listing it as a
u-boot make target (next to all) to support such setups.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 boot/uboot/uboot.mk | 1 +
 1 file changed, 1 insertion(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index 48f40c3..e071303 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -50,6 +50,7 @@ else ifeq ($(BR2_TARGET_UBOOT_FORMAT_NAND_BIN),y)
 UBOOT_BIN = u-boot-nand.bin
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB_IMG),y)
 UBOOT_BIN = u-boot-dtb.img
+UBOOT_MAKE_TARGET = all $(UBOOT_BIN)
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMG),y)
 UBOOT_BIN = u-boot.img
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_IMX),y)
-- 
2.7.0
