From: Axel Lin <axel.lin@ingics.com>
Date: Mon, 29 Jul 2013 13:40:35 +0800
Subject: [Buildroot] [noMMU] How to generate FLAT executable for busybox?
Message-ID: <1375076435.4630.2.camel@phoenix>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi,
I have BR2_BINFMT_FLAT=y in my setting.
However, the build system still generates ELF executable for busybox.

$ file output/target/bin/busybox
output/target/bin/busybox: setuid ELF 32-bit LSB executable, ARM, version 1 (SYSV), statically linked, stripped

I have below customization in my configs to build noMMU for arm7tdmi:
And then I did:
$ make CFLAGS_busybox="-elf2flt"

diff --git a/arch/Config.in b/arch/Config.in
index 0b5b218..a894e17 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -216,7 +216,6 @@ config BR2_GCC_TARGET_MODE
 # Set up target binary format
 choice
 	prompt "Target Binary Format"
-	depends on BR2_bfin || BR2_m68k
 	default BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_ELF
@@ -229,7 +228,6 @@ config BR2_BINFMT_ELF
 
 config BR2_BINFMT_FDPIC
 	bool "FDPIC"
-	depends on BR2_bfin || BR2_m68k
 	help
 	  ELF FDPIC binaries are based on ELF, but allow the individual load
 	  segments of a binary to be located in memory independently of each
@@ -238,7 +236,6 @@ config BR2_BINFMT_FDPIC
 
 config BR2_BINFMT_FLAT
 	bool "FLAT"
-	depends on BR2_bfin || BR2_m68k
 	select BR2_PREFER_STATIC_LIB
 	help
 	  FLAT binary is a relatively simple and lightweight executable format
diff --git a/package/Makefile.in b/package/Makefile.in
index aed28d5..5b89e18 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -24,7 +24,7 @@ MAKE:=$(HOSTMAKE) -j$(PARALLEL_JOBS)
 GNU_TARGET_NAME=$(ARCH)-buildroot-$(TARGET_OS)-$(LIBC)$(ABI)
 
 # Blackfin FLAT needs uclinux
-ifeq ($(BR2_bfin)$(BR2_BINFMT_FLAT),yy)
+ifeq ($(BR2_BINFMT_FLAT),y)
 TARGET_OS=uclinux
 else
 TARGET_OS=linux
diff --git a/package/busybox/busybox-1.21.x.config b/package/busybox/busybox-1.21.x.config
index e46b528..4e692fc 100644
--- a/package/busybox/busybox-1.21.x.config
+++ b/package/busybox/busybox-1.21.x.config
@@ -55,9 +55,9 @@ CONFIG_FEATURE_SYSLOG=y
 #
 # Build Options
 #
-# CONFIG_STATIC is not set
+CONFIG_STATIC=y
 # CONFIG_PIE is not set
-# CONFIG_NOMMU is not set
+CONFIG_NOMMU=y
 # CONFIG_BUILD_LIBBUSYBOX is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
diff --git a/package/uclibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
index eb39df6..d0a9c0c 100644
--- a/package/uclibc/uClibc-0.9.33.config
+++ b/package/uclibc/uClibc-0.9.33.config
@@ -65,10 +65,10 @@ FORCE_OPTIONS_FOR_ARCH=y
 # ARCH_BIG_ENDIAN is not set
 # ARCH_WANTS_LITTLE_ENDIAN is not set
 # ARCH_WANTS_BIG_ENDIAN is not set
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
+# ARCH_HAS_MMU is not set
+# ARCH_USE_MMU is not set
 UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
+# UCLIBC_HAS_FPU is not set
 DO_C99_MATH=y
 # DO_XSI_MATH is not set
 # UCLIBC_HAS_FENV is not set
