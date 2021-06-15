From: Drew Fustini <drew@beagleboard.org>
Date: Mon, 14 Jun 2021 17:17:47 -0700
Subject: [Buildroot] [PATCH 1/4] boot/uboot: introduce
 BR2_TARGET_UBOOT_FORMAT_DTB
In-Reply-To: <20210615001750.421889-1-drew@beagleboard.org>
References: <20210615001750.421889-1-drew@beagleboard.org>
Message-ID: <20210615001750.421889-2-drew@beagleboard.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

If u-boot CONFIG_OF_SEPARATE is defined [1], then the device tree will
be built and placed in a u-boot.dtb file alongside u-boot.bin.

When BR2_TARGET_UBOOT_FORMAT_DTB is enabled, buildroot will copy
u-boot.dtb to $(BINARIES_DIR).

This is useful for RISC-V platforms that want to build OpenSBI with an
external DTB by using FW_FDT_PATH [2].

[1] https://github.com/lentinj/u-boot/blob/master/doc/README.fdt-control
[2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md

Signed-off-by: Drew Fustini <drew@beagleboard.org>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 00c667412006..44a16d892a60 100644
--- a/boot/uboot/Config.in
+++ b/boot/uboot/Config.in
@@ -252,6 +252,9 @@ config BR2_TARGET_UBOOT_FORMAT_BIN
 	bool "u-boot.bin"
 	default y
 
+config BR2_TARGET_UBOOT_FORMAT_DTB
+	bool "u-boot.dtb"
+
 config BR2_TARGET_UBOOT_FORMAT_DTB_BIN
 	bool "u-boot-dtb.bin"
 
diff --git a/boot/uboot/uboot.mk b/boot/uboot/uboot.mk
index dbe82e65b17e..923fd0c1d46c 100644
--- a/boot/uboot/uboot.mk
+++ b/boot/uboot/uboot.mk
@@ -48,6 +48,10 @@ ifeq ($(BR2_TARGET_UBOOT_FORMAT_BIN),y)
 UBOOT_BINS += u-boot.bin
 endif
 
+ifeq ($(BR2_TARGET_UBOOT_FORMAT_DTB),y)
+UBOOT_BINS += u-boot.dtb
+endif
+
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_ELF),y)
 UBOOT_BINS += u-boot
 # To make elf usable for debuging on ARC use special target
-- 
2.27.0
