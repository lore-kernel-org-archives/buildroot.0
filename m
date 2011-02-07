From: Mike Frysinger <vapier@gentoo.org>
Date: Mon, 7 Feb 2011 14:34:28 +0100
Subject: [Buildroot] [git commit master 1/1] initial support for Blackfin
	processors
Message-ID: <20110207133512.21D438F409@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=871db074b133908cb59480da37626199a00704fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Peter: don't allow MMU on bfin]
Acked-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Mike Frysinger <vapier@gentoo.org>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 Makefile                      |    1 +
 boot/u-boot/Config.in         |    4 ++++
 boot/u-boot/u-boot.mk         |    2 ++
 linux/Config.in               |    2 +-
 linux/linux.mk                |    5 +++++
 target/Config.in.arch         |   19 ++++++++++++++++++-
 toolchain/toolchain-common.in |    2 +-
 7 files changed, 32 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 914d2ed..be4c078 100644
--- a/Makefile
+++ b/Makefile
@@ -263,6 +263,7 @@ endif
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
+	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 60aeb1a..78c03ff 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -75,6 +75,10 @@ config BR2_TARGET_UBOOT_FORMAT_KWB
 	depends on BR2_arm
 	bool "u-boot.kwb (Marvell)"
 
+config BR2_TARGET_UBOOT_FORMAT_LDR
+	depends on BR2_bfin
+	bool "u-boot.ldr"
+
 endchoice
 
 config BR2_TARGET_UBOOT_TOOL_MKIMAGE
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 2f890fa..bd26f52 100644
--- a/boot/u-boot/u-boot.mk
+++ b/boot/u-boot/u-boot.mk
@@ -31,6 +31,8 @@ U_BOOT_CAT:=$(BZCAT)
 ifeq ($(BR2_TARGET_UBOOT_FORMAT_KWB),y)
 U_BOOT_BIN:=u-boot.kwb
 U_BOOT_MAKE_OPT:=$(U_BOOT_BIN)
+else ifeq ($(BR2_TARGET_UBOOT_FORMAT_LDR),y)
+U_BOOT_BIN:=u-boot.ldr
 else
 U_BOOT_BIN:=u-boot.bin
 endif
diff --git a/linux/Config.in b/linux/Config.in
index 17aa29a..bdb1abe 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -115,7 +115,7 @@ choice
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
-	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
diff --git a/linux/linux.mk b/linux/linux.mk
index 2bc2efe..9076fb9 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -31,7 +31,12 @@ LINUX26_MAKE_FLAGS = \
 LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_DIR) --no-print-directory -s kernelrelease)
 
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+ifeq ($(KERNEL_ARCH),blackfin)
+# a uImage, but with a different file name
+LINUX26_IMAGE_NAME=vmImage
+else
 LINUX26_IMAGE_NAME=uImage
+endif
 LINUX26_DEPENDENCIES+=$(MKIMAGE)
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX26_IMAGE_NAME=bzImage
diff --git a/target/Config.in.arch b/target/Config.in.arch
index 0774d55..7c80945 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -14,6 +14,8 @@ config BR2_armeb
 config BR2_avr32
 	bool "avr32"
 	select BR2_SOFT_FLOAT
+config BR2_bfin
+	bool "bfin"
 config BR2_i386
 	bool "i386"
 config BR2_m68k
@@ -128,6 +130,20 @@ config BR2_ARM_OABI
 endchoice
 
 choice
+	prompt "Target ABI"
+	depends on BR2_bfin
+	default BR2_BFIN_FLAT
+config BR2_BFIN_FDPIC
+	bool "FDPIC"
+config BR2_BFIN_FLAT
+	bool "FLAT"
+config BR2_BFIN_FLAT_SEP_DATA
+	bool "FLAT (Separate data)"
+config BR2_BFIN_SHARED_FLAT
+	bool "Shared FLAT"
+endchoice
+
+choice
 	prompt "Target Architecture Variant"
 	depends on BR2_mips || BR2_mipsel
 	default BR2_mips_3 if BR2_mips
@@ -444,6 +460,7 @@ config BR2_ARCH
 	default "arm"		if BR2_arm
 	default "armeb"		if BR2_armeb
 	default "avr32"		if BR2_avr32
+	default "bfin"		if BR2_bfin
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
@@ -485,7 +502,7 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	string
-	default "LITTLE" if BR2_arm || BR2_i386 || BR2_mipsel || \
+	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
 			    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_sh64
 	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
 			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index eb3628a..a641785 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -68,7 +68,7 @@ config BR2_NEEDS_GETTEXT_IF_LOCALE
 
 config BR2_USE_MMU
 	bool "Enable MMU support" if BR2_arm || BR2_armeb || BR2_mips || BR2_mipsel || BR2_sh || BR2_xtensa
-	default y
+	default y if !BR2_bfin
 	help
 	  If your target has a MMU, you should say Y here.  If you
 	  are unsure, just say Y.
-- 
1.7.3.4
