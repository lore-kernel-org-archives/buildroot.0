From: Zakharov Vlad <Vladislav.Zakharov@synopsys.com>
Date: Fri, 27 May 2016 20:51:41 +0300
Subject: [Buildroot] [PATCH] uboot: Use "mdbtrick" target when building elf
	for ARC
Message-ID: <1464371501-24130-1-git-send-email-vzakhar@synopsys.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

By default position independent executables (PIE) are generated
when building U-Boot elf target. MetaWare debugger doesn't support
PIE (position-independent executable).

In order to allow MDB load and run U-Boot elf, we need to do a
special trick, called "mdbtrick".

This special build target is used to fake generated U-Boot elf by:
    1. Reset PIE flag in ELF header
    2. Strip all debug information from elf

Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index e739638..d8cdf5c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -38,6 +38,10 @@ endif
 
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
 UBOOT_BIN = u-boot
+# To make elf usable for debuging on ARC use special target
+ifeq ($(BR2_arc),y)
+UBOOT_MAKE_TARGET = mdbtrick
+endif
 else ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 UBOOT_BIN = u-boot.kwb
 UBOOT_MAKE_TARGET = $(UBOOT_BIN)
-- 
2.5.5
