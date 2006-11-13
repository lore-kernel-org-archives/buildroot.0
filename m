From: Benjamin Delagoutte <benjamin.delagoutte@gmail.com>
Date: Mon, 13 Nov 2006 15:58:11 +0100
Subject: [Buildroot] User get prompted during uClibc compilation
In-Reply-To: <30f88efd0611070127u66e7c79ag67f963a9f7ed0364@mail.gmail.com>
References: <30f88efd0611070127u66e7c79ag67f963a9f7ed0364@mail.gmail.com>
Message-ID: <30f88efd0611130658p2f7f8765uc71f8937244cfdbf@mail.gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

I think the patch got screwed by my mail client. Here it is :

Index: toolchain/uClibc/uClibc.config
=================================--- toolchain/uClibc/uClibc.config      (r?vision 16433)
+++ toolchain/uClibc/uClibc.config      (copie de travail)
@@ -34,9 +34,9 @@
 # ARCH_BIG_ENDIAN is not set
 # ARCH_WANTS_LITTLE_ENDIAN is not set
 # ARCH_WANTS_BIG_ENDIAN is not set
-# ARCH_HAS_NO_MMU is not set
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+# UCLIBC_HAS_FPU is not set
 DO_C99_MATH=y
 WARNINGS="-Wall"
 KERNEL_SOURCE="/usr/src/linux"
@@ -54,6 +54,17 @@
 # CONFIG_ARM_SA110 is not set
 # CONFIG_ARM_SA1100 is not set
 # CONFIG_ARM_XSCALE is not set
+# CONFIG_GENERIC_386 is not set
+# CONFIG_386 is not set
+# CONFIG_486 is not set
+# CONFIG_586 is not set
+# CONFIG_686 is not set
+# CONFIG_MIPS_ISA_1 is not set
+# CONFIG_MIPS_ISA_2 is not set
+# CONFIG_MIPS_ISA_3 is not set
+# CONFIG_MIPS_ISA_4 is not set
+# CONFIG_MIPS_ISA_MIPS32 is not set
+# CONFIG_MIPS_ISA_MIPS64 is not set

 #
 # General Library Settings
@@ -84,7 +95,7 @@
 UCLIBC_DYNAMIC_ATEXIT=y
 # COMPAT_ATEXIT is not set
 # UCLIBC_SUSV3_LEGACY is not set
-HAS_SHADOW=y
+UCLIBC_HAS_SHADOW=y
 # UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
 UCLIBC_HAS___PROGNAME=y
 # UNIX98PTY_ONLY is not set
@@ -102,6 +113,7 @@
 UCLIBC_HAS_RPC=y
 UCLIBC_HAS_FULL_RPC=y
 UCLIBC_HAS_REENTRANT_RPC=y
+# UCLIBC_USE_NETLINK is not set

 #
 # String and Stdio Support
@@ -142,12 +154,15 @@
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_GNU_GETSUBOPT=y

 #
 # Big and Tall
 #
 UCLIBC_HAS_REGEX=y
 UCLIBC_HAS_REGEX_OLD=y
+UCLIBC_HAS_FNMATCH=y
+UCLIBC_HAS_FNMATCH_OLD=y
 # UCLIBC_HAS_WORDEXP is not set
 UCLIBC_HAS_FTW=y
 UCLIBC_HAS_GLOB=y
@@ -163,9 +178,9 @@
 #
 # uClibc security related options
 #
-# UCLIBC_SECURITY is not set
-UCLIBC_BUILD_PIE=n
-UCLIBC_HAS_SSP=n
+# UCLIBC_BUILD_PIE is not set
+# UCLIBC_HAS_ARC4RANDOM is not set
+# UCLIBC_HAS_SSP is not set
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
 UCLIBC_BUILD_NOEXECSTACK=y
@@ -176,9 +191,12 @@
 CROSS_COMPILER_PREFIX=""
 # DODEBUG is not set
 # DODEBUG_PT is not set
+# DOSTRIP is not set
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
 # SUPPORT_LD_DEBUG_EARLY is not set
 WARNINGS="-Wall"
 # DOMULTI is not set
 # UCLIBC_MJN3_ONLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+# EXTRA_WARNINGS is not set
Index: toolchain/uClibc/uclibc.mk
=================================--- toolchain/uClibc/uclibc.mk  (r?vision 16433)
+++ toolchain/uClibc/uclibc.mk  (copie de travail)
@@ -74,6 +74,14 @@
                -e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
                -e
's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
                $(UCLIBC_DIR)/.config
+ifeq ($(UCLIBC_TARGET_ARCH),i386)
+       $(SED) 's,^.*CONFIG_GENERIC_386.*,CONFIG_GENERIC_386=y,g' \
+       $(UCLIBC_DIR)/.config
+endif
+ifeq ($(UCLIBC_TARGET_ARCH),mips)
+       $(SED) 's,^.*CONFIG_MIPS_ISA_1.*,CONFIG_MIPS_ISA_1=y,g' \
+       $(UCLIBC_DIR)/.config
+endif
 ifeq ($(UCLIBC_TARGET_ARCH),arm)
        $(SED) 's,^.*CONFIG_$(shell echo $(BR2_ARM_TYPE)).*,CONFIG_$(shell
echo $(BR2_ARM_TYPE))=y,g' \
        $(UCLIBC_DIR)/.config


2006/11/7, Benjamin Delagoutte <benjamin.delagoutte@gmail.com>:
>
> At least for 2 architectures (i386 and mips), user get prompted on the
> command line while compiling uClibc, because of vague supplied uClibc
> config. Some symbols don't exist anymore in uClibc newest versions or got
> remplaced. Moreover, we need to specify the exact variant of the
> architecture.
>
> I made the choice of using CONFIG_MIPS_ISA_1 for mips and
> CONFIG_GENERIC_386 for i386, but we could as well replace this with a more
> optimized setup.
>
> See attached patch.
>
> Benjamin Delagoutte
>
>
-------------- next part --------------
An HTML attachment was scrubbed...
URL: http://busybox.net/lists/buildroot/attachments/20061113/1ee4d0ed/attachment.htm 
