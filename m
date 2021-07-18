From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 18 Jul 2021 21:22:21 +0200
Subject: [Buildroot] [git commit] boot/uboot: introduce
 BR2_TARGET_UBOOT_FORMAT_DTB
Message-ID: <20210718191422.B3E7A8822F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

commit: https://git.buildroot.net/buildroot/commit/?id=ce534677cbe8f3dbcb86895c378a2b59b2107a32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

If U-Boot CONFIG_OF_SEPARATE is defined [1], then the device tree will
be built and placed in a u-boot.dtb file alongside u-boot.bin.

When BR2_TARGET_UBOOT_FORMAT_DTB is enabled, buildroot will copy
u-boot.dtb to $(BINARIES_DIR).

This is useful for RISC-V platforms that want to build OpenSBI with an
external DTB by using FW_FDT_PATH [2].

[1] https://github.com/u-boot/u-boot/blob/master/doc/README.fdt-control
[2] https://github.com/riscv/opensbi/blob/master/docs/firmware/fw.md

Reviewed-by: Alistair Francis <alistair.francis@wdc.com>
Reviewed-by: Bin Meng <bmeng.cn@gmail.com>
Signed-off-by: Drew Fustini <drew@beagleboard.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 boot/uboot/Config.in | 3 +++
 boot/uboot/uboot.mk  | 4 ++++
 2 files changed, 7 insertions(+)

diff --git a/boot/uboot/Config.in b/boot/uboot/Config.in
index 58e0a85803..0854fb13cc 100644
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
index a8a8bedc01..9c2261963d 100644
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
