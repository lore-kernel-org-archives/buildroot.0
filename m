From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Jul 2012 22:47:08 +0200
Subject: [Buildroot] [PATCH] Clarify MIPS ABIs support
Message-ID: <1343162828-13060-1-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Practically speaking, MIPS has three useful ABIs:

 * o32 is for 32-bits CPUs, or 64-bit CPUs running only a 32-bit subset
   of the instruction set.
 * n32 is for 64-bits CPUs only. It has 32-bits pointers and long
   integers.
 * n64 is for 64-bits CPUs only. It has 64-bits pointers and long
   integers.

See http://www.linux-mips.org/wiki/MIPS_ABI_History and
http://www.linux-mips.org/wiki/WhatsWrongWithO32N32N64 for more
details.

So, this commit reworks the Buildroot MIPS support by:

 * Renaming the n32 ABI option to BR2_MIPS_NABI32, for consistency
   with BR2_MIPS_OABI32.

 * Renaming the n64 ABI option to BR2_MIPS_NABI64, for consistency
   with BR2_MIPS_OABI32.

 * Make the n32 and n64 ABI selections select the BR2_ARCH_IS_64,
   since those ABIs are valid on 64-bits CPUs only.

 * Removing the o64 ABI, which is practicaly never used.

 * Removing the "none" ABI, which really doesn't make sense.

 * Introduce the mips64 and mips64el architecture names when a 64-bits
   MIPS ABI is choosen. This will fix build issue like
   http://autobuild.buildroot.org/results/9b8c5ea86c953a89e85e7b67e9221de41773f652/build-end.log
   where gmp was confused by the fact of having a 32 bits architecture
   (detected by the mips- architecture part of the tuple) but 64 bits
   integer size when compiling.

 * Adjust the uclibc.mk logic to support the new mips64/mips64el
   architecture names, and take into account the renaming of the ABI
   options.

This has been build tested by generating Buildroot toolchains and
compiling a few packages for MIPS o32, MIPS n32 and MIPS n64.

This work is originally based on prior work done by Gustavo Zacarias.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/Makefile.in        |    2 +-
 target/Config.in.arch      |   28 +++++++++++-----------------
 toolchain/uClibc/uclibc.mk |    9 ++++++---
 3 files changed, 18 insertions(+), 21 deletions(-)

diff --git a/package/Makefile.in b/package/Makefile.in
index 6fad224..21b8634 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -87,7 +87,7 @@ endif
 
 TARGET_CFLAGS=$(TARGET_ABI) $(TARGET_OPTIMIZATION) $(TARGET_DEBUGGING)
 
-ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_ABI64)),yy)
+ifeq ($(findstring yy,$(BR2_mips)$(BR2_MIPS_NABI64)),yy)
 TARGET_CFLAGS+=-fno-pic -mno-abicalls
 endif
 
diff --git a/target/Config.in.arch b/target/Config.in.arch
index e7aec56..0ef59ef 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -271,26 +271,20 @@ choice
 	prompt "Target ABI"
 	depends on BR2_mips || BR2_mipsel
 	default BR2_MIPS_OABI32 if BR_mips_32 || BR_mips_32r2
-	default BR2_MIPS_ABI32 if BR_mips_64 || BR_mips_64r2
+	default BR2_MIPS_NABI32 if BR_mips_64 || BR_mips_64r2
 	help
 	  Application Binary Interface to use
 
 config BR2_MIPS_OABI32
 	bool "o32"
-config BR2_MIPS_ABI32
+config BR2_MIPS_NABI32
 	bool "n32"
+	select BR2_ARCH_IS_64
 	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_ABI64
+config BR2_MIPS_NABI64
 	bool "n64"
+	select BR2_ARCH_IS_64
 	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_OABI64
-	bool "o64"
-	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_ABI_none
-	bool "unspecified"
-	depends on BR2_mips_16
-	help
-	  Unspecified ABI leaves ABI selection blank.
 endchoice
 
 choice
@@ -688,8 +682,10 @@ config BR2_ARCH
 	default "i686"		if BR2_x86_athlon_4
 	default "m68k"		if BR2_m68k
 	default "microblaze"	if BR2_microblaze
-	default "mips"		if BR2_mips
-	default "mipsel"	if BR2_mipsel
+	default "mips"		if BR2_mips && !BR2_ARCH_IS_64
+	default "mipsel"	if BR2_mipsel && !BR2_ARCH_IS_64
+	default "mips64"	if BR2_mips && BR2_ARCH_IS_64
+	default "mips64el"	if BR2_mipsel && BR2_ARCH_IS_64
 	default "powerpc"	if BR2_powerpc
 	default "sh2"		if BR2_sh2
 	default "sh2a"		if BR2_sh2a
@@ -904,10 +900,8 @@ config BR2_GCC_TARGET_ABI
 	default aapcs		if BR2_arm_dunno
 	default aapcs-linux	if BR2_ARM_EABI
 	default 32		if BR2_MIPS_OABI32
-	default n32		if BR2_MIPS_ABI32
-	default eabi		if BR2_MIPS_EABI
-	default o64		if BR2_MIPS_OABI64
-	default 64		if BR2_MIPS_ABI64
+	default n32		if BR2_MIPS_NABI32
+	default 64		if BR2_MIPS_NABI64
 	default mmixware	if BR2_mmix && BR2_MMIX_ABI_native
 	default gnu		if BR2_mmix && !BR2_MMIX_ABI_native
 	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 9d0b6db..aff0a60 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -38,6 +38,7 @@ UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/sh[234].*/sh/' \
 		-e 's/mips.*/mips/' \
 		-e 's/mipsel.*/mips/' \
+		-e 's/mips64el.*/mips/' \
 		-e 's/cris.*/cris/' \
 		-e 's/xtensa.*/xtensa/' \
 ")
@@ -45,6 +46,8 @@ UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 UCLIBC_TARGET_ENDIAN:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/armeb/BIG/' \
 		-e 's/arm/LITTLE/' \
+		-e 's/mips64el/LITTLE/' \
+		-e 's/mips64/BIG/' \
 		-e 's/mipsel/LITTLE/' \
 		-e 's/mips/BIG/' \
 		-e 's/sh.*eb/BIG/' \
@@ -155,13 +158,13 @@ ifeq ($(UCLIBC_TARGET_ARCH),mips)
 	 /bin/echo "# CONFIG_MIPS_ISA_MIPS32R2 is not set"; \
 	 /bin/echo "# CONFIG_MIPS_ISA_MIPS64 is not set"; \
 	) >> $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_MIPS_OABI),y)
+ifeq ($(BR2_MIPS_OABI32),y)
 	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_MIPS_ABI32),y)
+ifeq ($(BR2_MIPS_NABI32),y)
 	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
-ifeq ($(BR2_MIPS_ABI64),y)
+ifeq ($(BR2_MIPS_NABI64),y)
 	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_mips_1),y)
-- 
1.7.9.5
