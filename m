From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 12 Jun 2016 21:40:19 +0200
Subject: [Buildroot] [git commit] uboot: Use "mdbtrick" target when building
	elf for ARC
Message-ID: <20160612194024.66AF581E08@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=41a077d2b1c94d208c34509e6361d159cab83367
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default position independent executables (PIE) are generated
when building U-Boot elf target. MetaWare debugger doesn't support
PIE (position-independent executable).

In order to allow MDB load and run U-Boot elf, we need to do a
special trick, called "mdbtrick".

This special build target is used to fake generated U-Boot elf by:
    1. Reset PIE flag in ELF header
    2. Strip all debug information from elf

Signed-off-by: Zakharov Vlad <vzakhar@synopsys.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 boot/uboot/uboot.mk | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index bc5d952..a2274ee 100644
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
