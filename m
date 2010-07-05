From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Jul 2010 16:54:45 +0200
Subject: [Buildroot] [git commit master 1/1] u-boot: add 2010.06 release
Message-ID: <20100705145734.06B7082579@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=b9997ca731a42eaa4c04dd6c2bf8632b72dac038
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

A few minor modifications of u-boot.mk is needed to support 2010.06:

- U-Boot now uses ARCH=powerpc like the kernel (instead of ARCH=ppc)
- Library files have moved, so adjust the target mkimage/fw_printenv rules
  (still compatible with older versions)

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES               |    3 ++-
 boot/u-boot/Config.in |    6 +++++-
 boot/u-boot/u-boot.mk |   11 +++++++----
 3 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/CHANGES b/CHANGES
index 2d8253c..3222e7a 100644
--- a/CHANGES
+++ b/CHANGES
@@ -6,7 +6,8 @@
 	and non-sysroot support removed.
 
 	Bootloaders: Various cleanups, moved to boot/, added Barebox,
-	removed yaboot. Support building u-boot from custom tarball.
+	removed yaboot. Support building u-boot from custom tarball,
+	u-boot 2010.06.
 
 	New GTK-based configurator, usable using 'make gconfig'.
 
diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index aa680cf..d445145 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -12,10 +12,13 @@ config BR2_TARGET_UBOOT_BOARDNAME
 
 choice
 	prompt "U-Boot Version"
-	default BR2_TARGET_UBOOT_2010_03
+	default BR2_TARGET_UBOOT_2010_06
 	help
 	  Select the specific U-Boot version you want to use
 
+config BR2_TARGET_UBOOT_2010_06
+	bool "2010.06"
+
 config BR2_TARGET_UBOOT_2010_03
 	bool "2010.03"
 
@@ -39,6 +42,7 @@ endif
 
 config BR2_TARGET_UBOOT_VERSION
 	string
+	default "2010.06"	if BR2_TARGET_UBOOT_2010_06
 	default "2010.03"	if BR2_TARGET_UBOOT_2010_03
 	default "2009.11"	if BR2_TARGET_UBOOT_2009_11
 	default "2009.08"	if BR2_TARGET_UBOOT_2009_08
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index ad67343..37ed215 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -32,9 +32,12 @@ U_BOOT_BIN:=u-boot.bin
 MKIMAGE:=$(HOST_DIR)/usr/bin/mkimage
 
 U_BOOT_TARGETS:=$(BINARIES_DIR)/$(U_BOOT_BIN) $(MKIMAGE)
+U_BOOT_ARCH=$(KERNEL_ARCH)
 
-# u-boot still uses arch=ppc for powerpc
+# u-boot in the past used arch=ppc for powerpc
+ifneq ($(findstring x200,$(UBOOT_VERSION))$(findstring x2010.03,$(UBOOT_VERSION)),)
 U_BOOT_ARCH=$(KERNEL_ARCH:powerpc=ppc)
+endif
 
 U_BOOT_INC_CONF_FILE:=$(U_BOOT_DIR)/include/config.h
 
@@ -147,9 +150,9 @@ $(TARGET_DIR)/usr/bin/mkimage: $(U_BOOT_DIR)/.configured
 		$(U_BOOT_DIR)/common/image.c \
 		$(wildcard $(addprefix $(U_BOOT_DIR)/tools/,default_image.c \
 			fit_image.c imximage.c kwbimage.c mkimage.c)) \
-		$(addprefix $(U_BOOT_DIR)/lib_generic/,crc32.c md5.c sha1.c) \
+		$(addprefix $(U_BOOT_DIR)/lib*/,crc32.c md5.c sha1.c) \
 		$(U_BOOT_DIR)/tools/os_support.c \
-		$(U_BOOT_DIR)/libfdt/fdt*.c
+		$(wildcard $(U_BOOT_DIR)/libfdt/fdt*.c $(U_BOOT_DIR)/lib/libfdt/fdt*.c)
 
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 
@@ -158,7 +161,7 @@ $(TARGET_DIR)/usr/sbin/fw_printenv: $(U_BOOT_DIR)/.configured
 	mkdir -p $(@D)
 	$(TARGET_CC) -I$(U_BOOT_DIR)/include -I$(LINUX_HEADERS_DIR)/include \
 		-DUSE_HOSTCC -o $@ \
-		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib_generic/crc32.c
+		$(U_BOOT_DIR)/tools/env/*.c $(U_BOOT_DIR)/lib*/crc32.c
 	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $@
 	ln -sf fw_printenv $(TARGET_DIR)/usr/sbin/fw_setenv
 
-- 
1.7.1
