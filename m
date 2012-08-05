From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun,  5 Aug 2012 12:04:27 +0200
Subject: [Buildroot] [PATCH 2/4] Clarify MIPS ABIs support
In-Reply-To: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1344161069-19804-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1344161069-19804-3-git-send-email-thomas.petazzoni@free-electrons.com>
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

 * Add separate mips64/mips64el top-level architectures.

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
 target/Config.in.arch      |   60 ++++++++++++++++++++++++++------------------
 toolchain/uClibc/uclibc.mk |    7 +++---
 3 files changed, 39 insertions(+), 30 deletions(-)

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
index 342066e..860bf43 100644
--- a/target/Config.in.arch
+++ b/target/Config.in.arch
@@ -83,6 +83,22 @@ config BR2_mipsel
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
+config BR2_mips64
+	bool "MIPS64 (big endian)"
+	select BR2_ARCH_IS_64
+	help
+	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
+	  http://www.mips.com/
+	  http://en.wikipedia.org/wiki/MIPS_Technologies
+
+config BR2_mips64el
+	bool "MIPS64 (little endian)"
+	select BR2_ARCH_IS_64
+	help
+	  MIPS is a RISC microprocessor from MIPS Technologies. Big endian.
+	  http://www.mips.com/
+	  http://en.wikipedia.org/wiki/MIPS_Technologies
+
 config BR2_powerpc
 	bool "PowerPC"
 	help
@@ -237,9 +253,10 @@ endchoice
 
 choice
 	prompt "Target Architecture Variant"
-	depends on BR2_mips || BR2_mipsel
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	default BR2_mips_3 if BR2_mips
 	default BR2_mips_1 if BR2_mipsel
+	default BR2_mips_64 if BR2_mips64 || BR2_mips64el
 	help
 	  Specific CPU variant to use
 
@@ -248,49 +265,43 @@ choice
 
 config BR2_mips_1
 	bool "mips I (generic)"
+	depends on !BR2_ARCH_IS_64
 config BR2_mips_2
 	bool "mips II"
+	depends on !BR2_ARCH_IS_64
 config BR2_mips_3
 	bool "mips III"
 config BR2_mips_4
 	bool "mips IV"
 config BR2_mips_32
 	bool "mips 32"
+	depends on !BR2_ARCH_IS_64
 config BR2_mips_32r2
 	bool "mips 32r2"
+	depends on !BR2_ARCH_IS_64
 config BR2_mips_64
 	bool "mips 64"
 config BR2_mips_64r2
 	bool "mips 64r2"
-config BR2_mips_16
-	bool "mips 16"
 endchoice
 
 
 choice
 	prompt "Target ABI"
-	depends on BR2_mips || BR2_mipsel
-	default BR2_MIPS_OABI32 if BR_mips_32 || BR_mips_32r2
-	default BR2_MIPS_ABI32 if BR_mips_64 || BR_mips_64r2
+	depends on BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default BR2_MIPS_OABI32 if !BR2_ARCH_IS_64
+	default BR2_MIPS_NABI32 if BR2_ARCH_IS_64
 	help
 	  Application Binary Interface to use
 
 config BR2_MIPS_OABI32
 	bool "o32"
-config BR2_MIPS_ABI32
+config BR2_MIPS_NABI32
 	bool "n32"
-	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_ABI64
+	depends on BR2_ARCH_IS_64
+config BR2_MIPS_NABI64
 	bool "n64"
-	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_OABI64
-	bool "o64"
-	depends on BR2_mips_3 || BR2_mips_4 || BR2_mips_64 || BR2_mips_64r2 || BR2_mips_16
-config BR2_MIPS_ABI_none
-	bool "unspecified"
-	depends on BR2_mips_16
-	help
-	  Unspecified ABI leaves ABI selection blank.
+	depends on BR2_ARCH_IS_64
 endchoice
 
 choice
@@ -667,6 +678,8 @@ config BR2_ARCH
 	default "microblaze"	if BR2_microblaze
 	default "mips"		if BR2_mips
 	default "mipsel"	if BR2_mipsel
+	default "mips64"	if BR2_mips64
+	default "mips64el"	if BR2_mips64el
 	default "powerpc"	if BR2_powerpc
 	default "sh2"		if BR2_sh2
 	default "sh2a"		if BR2_sh2a
@@ -683,10 +696,10 @@ config BR2_ARCH
 
 config BR2_ENDIAN
 	string
-	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || \
+	default "LITTLE" if BR2_arm || BR2_bfin || BR2_i386 || BR2_mipsel || BR2_mips64el || \
 			    BR2_sh3 || BR2_sh4 || BR2_sh4a || BR2_x86_64 || BR2_sh64 || \
 			    BR2_microblazeel
-	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || \
+	default "BIG"    if BR2_armeb || BR2_avr32 || BR2_m68k || BR2_mips || BR2_mips64 || \
 			    BR2_powerpc || BR2_sh2 || BR2_sh2a || \
 			    BR2_sh3eb || BR2_sh4eb || BR2_sh4aeb || BR2_sparc || \
 			    BR2_microblazebe
@@ -754,7 +767,6 @@ config BR2_GCC_TARGET_TUNE
 	default mips32r2	if BR2_mips_32r2
 	default mips64		if BR2_mips_64
 	default mips64r2	if BR2_mips_64r2
-	default mips16		if BR2_mips_16
 	default 401		if BR2_powerpc_401
 	default 403		if BR2_powerpc_403
 	default 405		if BR2_powerpc_405
@@ -859,10 +871,8 @@ config BR2_GCC_TARGET_ABI
 	default apcs-gnu	if BR2_ARM_OABI
 	default aapcs-linux	if BR2_ARM_EABI
 	default 32		if BR2_MIPS_OABI32
-	default n32		if BR2_MIPS_ABI32
-	default eabi		if BR2_MIPS_EABI
-	default o64		if BR2_MIPS_OABI64
-	default 64		if BR2_MIPS_ABI64
+	default n32		if BR2_MIPS_NABI32
+	default 64		if BR2_MIPS_NABI64
 	default altivec		if BR2_powerpc && BR2_PPC_ABI_altivec
 	default no-altivec	if BR2_powerpc && BR2_PPC_ABI_no-altivec
 	default spe		if BR2_powerpc && BR2_PPC_ABI_spe
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index 583d199..534550a 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -37,7 +37,6 @@ UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
 		-e 's/v850.*/v850/g' \
 		-e 's/sh[234].*/sh/' \
 		-e 's/mips.*/mips/' \
-		-e 's/mipsel.*/mips/' \
 		-e 's/cris.*/cris/' \
 		-e 's/xtensa.*/xtensa/' \
 ")
@@ -142,13 +141,13 @@ ifeq ($(UCLIBC_TARGET_ARCH),mips)
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
