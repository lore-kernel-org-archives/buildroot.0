From: Mike Frysinger <vapier@gentoo.org>
Date: Thu, 18 Nov 2010 06:25:12 -0500
Subject: [Buildroot] [PATCH v2] initial support for Blackfin processors
In-Reply-To: <1290076044-31558-1-git-send-email-vapier@gentoo.org>
References: <1290076044-31558-1-git-send-email-vapier@gentoo.org>
Message-ID: <1290079512-3004-1-git-send-email-vapier@gentoo.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Mike Frysinger <vapier@gentoo.org>
---
v2
	- add comment for vmImage name

note:
	- not all Blackfin boards use "u-boot.ldr" ... half use "u-boot.bin"
	- i dont care about the ttyBF0 stuff ... i can simply drop it if the
	  rewrite will be merged soonish

 Makefile                 |    1 +
 boot/u-boot/Config.in    |    4 ++++
 boot/u-boot/u-boot.mk    |    2 ++
 linux/Config.in          |    2 +-
 linux/linux.mk           |    5 +++++
 target/Config.in.arch    |   19 ++++++++++++++++++-
 target/generic/Config.in |   19 ++++++++++++++++++-
 7 files changed, 49 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 62a77f4..69e4031 100644
--- a/Makefile
+++ b/Makefile
@@ -251,6 +251,7 @@ endif
 KERNEL_ARCH:=$(shell echo "$(ARCH)" | sed -e "s/-.*//" \
 	-e s/i.86/i386/ -e s/sun4u/sparc64/ \
 	-e s/arm.*/arm/ -e s/sa110/arm/ \
+	-e s/bfin/blackfin/ \
 	-e s/parisc64/parisc/ \
 	-e s/powerpc64/powerpc/ \
 	-e s/ppc.*/powerpc/ -e s/mips.*/mips/ \
diff --git a/boot/u-boot/Config.in b/boot/u-boot/Config.in
index 86c656d..47657fc 100644
--- a/boot/u-boot/Config.in
+++ b/boot/u-boot/Config.in
@@ -71,6 +71,10 @@ config BR2_TARGET_UBOOT_FORMAT_KWB
 	depends on BR2_arm
 	bool "u-boot.kwb (Marvell)"
 
+config BR2_TARGET_UBOOT_FORMAT_LDR
+	depends on BR2_bfin
+	bool "u-boot.ldr"
+
 endchoice
 
 config BR2_TARGET_UBOOT_TOOL_MKIMAGE
diff --git a/boot/u-boot/u-boot.mk b/boot/u-boot/u-boot.mk
index 9719207..cb87bf2 100644
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
index 5182ea1..480adca 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -123,7 +123,7 @@ choice
 
 config BR2_LINUX_KERNEL_UIMAGE
 	bool "uImage"
-	depends on BR2_arm || BR2_armeb || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
+	depends on BR2_arm || BR2_armeb || BR2_bfin || BR2_powerpc || BR2_avr32 || BR2_sh || BR2_sh64
 
 config BR2_LINUX_KERNEL_BZIMAGE
 	bool "bzImage"
diff --git a/linux/linux.mk b/linux/linux.mk
index 4ab519b..4caba64 100644
--- a/linux/linux.mk
+++ b/linux/linux.mk
@@ -41,7 +41,12 @@ endif
 LINUX26_VERSION_PROBED = $(shell $(MAKE) $(LINUX26_MAKE_FLAGS) -C $(LINUX26_SOURCE_DIR) --no-print-directory -s kernelrelease)
 
 ifeq ($(BR2_LINUX_KERNEL_UIMAGE),y)
+ifeq ($(KERNEL_ARCH),blackfin)
+# a uImage, but with a diff file name
+LINUX26_IMAGE_NAME=vmImage
+else
 LINUX26_IMAGE_NAME=uImage
+endif
 LINUX26_DEPENDENCIES+=$(MKIMAGE)
 else ifeq ($(BR2_LINUX_KERNEL_BZIMAGE),y)
 LINUX26_IMAGE_NAME=bzImage
diff --git a/target/Config.in.arch b/target/Config.in.arch
index e08ce5b..5b3e325 100644
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
@@ -440,6 +456,7 @@ config BR2_ARCH
 	default "arm"		if BR2_arm
 	default "armeb"		if BR2_armeb
 	default "avr32"		if BR2_avr32
+	default "bfin"		if BR2_bfin
 	default "i386"		if BR2_x86_i386
 	default "i486"		if BR2_x86_i486
 	default "i586"		if BR2_x86_i586
@@ -477,7 +494,7 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	string
-	default "LITTLE" if BR2_arm || BR2_i386 || BR2_mipsel || \
+	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
 			    BR2_sh3 || BR2_sh4 || BR2_x86_64 || BR2_sh64
 	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
 			    BR2_powerpc || BR2_sh2a_nofpueb || BR2_sh2eb || \
diff --git a/target/generic/Config.in b/target/generic/Config.in
index 54ff1d6..6316047 100644
--- a/target/generic/Config.in
+++ b/target/generic/Config.in
@@ -19,7 +19,8 @@ if BR2_TARGET_GENERIC_GETTY
 
 choice
 	prompt "Serial port to run a getty on"
-	default BR2_TARGET_GENERIC_GETTY_TTYS0
+	default BR2_TARGET_GENERIC_GETTY_TTYS0 if !BR2_bfin
+	default BR2_TARGET_GENERIC_GETTY_TTYBF0 if BR2_bfin
 	help
 	  Select a port to run a getty (login prompt) on.
 
@@ -66,6 +67,18 @@ config BR2_TARGET_GENERIC_GETTY_TTYMXC1
 config BR2_TARGET_GENERIC_GETTY_TTYMXC2
 	bool "ttymxc2"
 	depends on BR2_arm
+config BR2_TARGET_GENERIC_GETTY_TTYBF0
+	bool "ttyBF0"
+	depends on BR2_bfin
+config BR2_TARGET_GENERIC_GETTY_TTYBF1
+	bool "ttyBF1"
+	depends on BR2_bfin
+config BR2_TARGET_GENERIC_GETTY_TTYBF2
+	bool "ttyBF2"
+	depends on BR2_bfin
+config BR2_TARGET_GENERIC_GETTY_TTYBF3
+	bool "ttyBF3"
+	depends on BR2_bfin
 config BR2_TARGET_GENERIC_GETTY_TTYUL0
 	bool "ttyUL0"
 	depends on BR2_powerpc
@@ -122,6 +135,10 @@ config BR2_TARGET_GENERIC_GETTY_PORT
 	default "ttymxc0"	if BR2_TARGET_GENERIC_GETTY_TTYMXC0
 	default "ttymxc1"	if BR2_TARGET_GENERIC_GETTY_TTYMXC1
 	default "ttymxc2"	if BR2_TARGET_GENERIC_GETTY_TTYMXC2
+	default "ttyBF0"	if BR2_TARGET_GENERIC_GETTY_TTYBF0
+	default "ttyBF1"	if BR2_TARGET_GENERIC_GETTY_TTYBF1
+	default "ttyBF2"	if BR2_TARGET_GENERIC_GETTY_TTYBF2
+	default "ttyBF3"	if BR2_TARGET_GENERIC_GETTY_TTYBF3
 	default "ttyUL0"	if BR2_TARGET_GENERIC_GETTY_TTYUL0
 	default "ttyUL1"	if BR2_TARGET_GENERIC_GETTY_TTYUL1
 	default "ttyUL2"	if BR2_TARGET_GENERIC_GETTY_TTYUL2
-- 
1.7.3.2
