From: Will Wagner <will_wagner@carallon.com>
Date: Fri,  2 Dec 2011 15:53:26 +0000
Subject: [Buildroot] [PATCH] Improved uClibc support with crosstool-ng
	generated toolchain
Message-ID: <1322841206-2247-1-git-send-email-will_wagner@carallon.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Currently there is a hard coded uClibc config file when building
with crosstools-ng. This patch:
- Allows user to pick uClibc version when using ct-ng
- Allows user to select nptl when using 0.9.32
- Supplys better default uClibc config files (Using same config files as for internal buildroot config)
- Allows user to specify a custom uClibc config file

Signed-off-by: Will Wagner <will_wagner@carallon.com>
---
 toolchain/toolchain-crosstool-ng/Config.in       |   28 +++-
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk |   14 ++-
 toolchain/toolchain-crosstool-ng/uClibc.config   |  246 ----------------------
 3 files changed, 40 insertions(+), 248 deletions(-)
 delete mode 100644 toolchain/toolchain-crosstool-ng/uClibc.config

diff --git a/toolchain/toolchain-crosstool-ng/Config.in b/toolchain/toolchain-crosstool-ng/Config.in
index 2d1e801..7e21ce9 100644
--- a/toolchain/toolchain-crosstool-ng/Config.in
+++ b/toolchain/toolchain-crosstool-ng/Config.in
@@ -50,6 +50,30 @@ if BR2_TOOLCHAIN_CTNG_uClibc
 
 comment "Toolchain Options"
 
+choice
+	prompt "uClibc C library Version"
+	default BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+	help
+	  Select the version of uClibc you wish to use.
+
+	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+		bool "uClibc 0.9.30.x"
+
+	config BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
+		bool "uClibc 0.9.32.x"
+
+endchoice
+
+config BR2_TOOLCHAIN_CTNG_uClibc_CONFIG
+	string "uClibc configuration file to use?"
+	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30
+	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
+	help
+	  Some people may wish to use their own modified uClibc configuration
+	  file and will specify their config file location with this option.
+	  See also docs/README in this package.
+	  If unsure, use the default.
+
 config BR2_TOOLCHAIN_CTNG_uClibc_LARGEFILE
 	bool "Enable large file (files > 2 GB) support"
 	select BR2_LARGEFILE
@@ -130,7 +154,9 @@ choice
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
 		depends on BR2_TOOLCHAIN_CTNG_eglibc || \
-			   BR2_TOOLCHAIN_CTNG_glibc
+		           BR2_TOOLCHAIN_CTNG_glibc || \
+		           BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32
+
 endchoice
 
 endif # BR2_TOOLCHAIN_CTNG
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 3a205dd..4311097 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -10,7 +10,7 @@
 
 CTNG_DIR := $(BUILD_DIR)/build-toolchain
 
-CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/toolchain-crosstool-ng/uClibc.config
+CTNG_UCLIBC_CONFIG_FILE := $(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_CONFIG))
 CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
@@ -267,6 +267,18 @@ CTNG_FIX_DOT_CONFIG_PATHS_SED += s:^(CT_SYSROOT_DIR_PREFIX)=.*:\1="":;
 # uClibc specific options
 ifeq ($(BR2_TOOLCHAIN_CTNG_uClibc),y)
 
+# Set version
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_32).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_3).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_2).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_1).*:\# \2 is not set:;
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30).*:\# \2 is not set:;
+ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_32)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_32).*:\2=y:;
+else ifneq ($(call qstrip,$(BR2_TOOLCHAIN_CTNG_uClibc_VERSION_0_9_30)),)
+CTNG_FIX_DOT_CONFIG_SED += s:^(|\# )(CT_LIBC_UCLIBC_V_0_9_30_3).*:\2=y:;
+endif
+
 # Handle the locales option
 ifneq ($(call qstrip,$(BR2_ENABLE_LOCALE)),)
 CTNG_FIX_DOT_CONFIG_SED += s:^\# (CT_LIBC_UCLIBC_LOCALES) is not set:\1=y\n\# CT_LIBC_UCLIBC_LOCALES_PREGEN_DATA is not set:;
diff --git a/toolchain/toolchain-crosstool-ng/uClibc.config b/toolchain/toolchain-crosstool-ng/uClibc.config
deleted file mode 100644
index 76a3427..0000000
--- a/toolchain/toolchain-crosstool-ng/uClibc.config
+++ /dev/null
@@ -1,246 +0,0 @@
-#
-# Automatically generated make config: don't edit
-# Version: 0.9.30
-# Fri Nov 21 09:26:34 2008
-#
-# TARGET_alpha is not set
-# TARGET_arm is not set
-# TARGET_avr32 is not set
-# TARGET_bfin is not set
-# TARGET_cris is not set
-# TARGET_e1 is not set
-# TARGET_frv is not set
-# TARGET_h8300 is not set
-# TARGET_hppa is not set
-# TARGET_i386 is not set
-# TARGET_i960 is not set
-# TARGET_ia64 is not set
-# TARGET_m68k is not set
-# TARGET_microblaze is not set
-# TARGET_mips is not set
-# TARGET_nios is not set
-# TARGET_nios2 is not set
-# TARGET_powerpc is not set
-# TARGET_sh is not set
-# TARGET_sh64 is not set
-# TARGET_sparc is not set
-# TARGET_v850 is not set
-# TARGET_vax is not set
-TARGET_x86_64=y
-# TARGET_xtensa is not set
-
-#
-# Target Architecture Features and Options
-#
-TARGET_ARCH="x86_64"
-FORCE_OPTIONS_FOR_ARCH=y
-# CONFIG_ARM_OABI is not set
-# CONFIG_ARM_EABI is not set
-# CONFIG_GENERIC_ARM is not set
-# CONFIG_ARM610 is not set
-# CONFIG_ARM710 is not set
-# CONFIG_ARM7TDMI is not set
-# CONFIG_ARM720T is not set
-# CONFIG_ARM920T is not set
-# CONFIG_ARM922T is not set
-# CONFIG_ARM926T is not set
-# CONFIG_ARM10T is not set
-# CONFIG_ARM1136JF_S is not set
-# CONFIG_ARM1176JZ_S is not set
-# CONFIG_ARM1176JZF_S is not set
-# CONFIG_ARM_CORTEX_M3 is not set
-# CONFIG_ARM_CORTEX_M1 is not set
-# CONFIG_ARM_SA110 is not set
-# CONFIG_ARM_SA1100 is not set
-# CONFIG_ARM_XSCALE is not set
-# CONFIG_ARM_IWMMXT is not set
-TARGET_SUBARCH=""
-
-#
-# Using ELF file format
-#
-ARCH_LITTLE_ENDIAN=y
-# ARCH_WANTS_BIG_ENDIAN is not set
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-
-#
-# Using Little Endian
-#
-ARCH_HAS_MMU=y
-ARCH_USE_MMU=y
-UCLIBC_HAS_FLOATS=y
-UCLIBC_HAS_FPU=y
-DO_C99_MATH=y
-UCLIBC_HAS_FENV=y
-UCLIBC_HAS_LONG_DOUBLE_MATH=y
-KERNEL_HEADERS="/usr/include"
-HAVE_DOT_CONFIG=y
-
-#
-# General Library Settings
-#
-# HAVE_NO_PIC is not set
-DOPIC=y
-# ARCH_HAS_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
-HAVE_SHARED=y
-# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
-LDSO_LDD_SUPPORT=y
-LDSO_CACHE_SUPPORT=y
-# LDSO_PRELOAD_FILE_SUPPORT is not set
-LDSO_BASE_FILENAME="ld.so"
-UCLIBC_STATIC_LDCONFIG=y
-# LDSO_RUNPATH is not set
-UCLIBC_CTOR_DTOR=y
-# LDSO_GNU_HASH_SUPPORT is not set
-# HAS_NO_THREADS is not set
-UCLIBC_HAS_THREADS=y
-# PTHREADS_DEBUG_SUPPORT is not set
-LINUXTHREADS_OLD=y
-UCLIBC_HAS_SYSLOG=y
-UCLIBC_HAS_LFS=y
-# MALLOC is not set
-# MALLOC_SIMPLE is not set
-MALLOC_STANDARD=y
-# MALLOC_GLIBC_COMPAT is not set
-UCLIBC_DYNAMIC_ATEXIT=y
-# COMPAT_ATEXIT is not set
-# UCLIBC_SUSV3_LEGACY is not set
-# UCLIBC_SUSV3_LEGACY_MACROS is not set
-# UCLIBC_HAS_STUBS is not set
-UCLIBC_HAS_SHADOW=y
-UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
-UCLIBC_HAS___PROGNAME=y
-UCLIBC_HAS_PTY=y
-ASSUME_DEVPTS=y
-UNIX98PTY_ONLY=y
-# UCLIBC_HAS_GETPT is not set
-UCLIBC_HAS_TM_EXTENSIONS=y
-UCLIBC_HAS_TZ_CACHING=y
-UCLIBC_HAS_TZ_FILE=y
-UCLIBC_HAS_TZ_FILE_READ_MANY=y
-UCLIBC_TZ_FILE_PATH="/etc/TZ"
-
-#
-# Advanced Library Settings
-#
-UCLIBC_PWD_BUFFER_SIZE=256
-UCLIBC_GRP_BUFFER_SIZE=256
-
-#
-# Support various families of functions
-#
-UCLIBC_LINUX_MODULE_24=y
-UCLIBC_LINUX_SPECIFIC=y
-UCLIBC_HAS_GNU_ERROR=y
-# UCLIBC_BSD_SPECIFIC is not set
-UCLIBC_HAS_BSD_ERR=y
-# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
-# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
-# UCLIBC_NTP_LEGACY is not set
-# UCLIBC_SV4_DEPRECATED is not set
-UCLIBC_HAS_REALTIME=y
-UCLIBC_HAS_ADVANCED_REALTIME=y
-UCLIBC_HAS_EPOLL=y
-UCLIBC_HAS_XATTR=y
-UCLIBC_HAS_PROFILING=y
-UCLIBC_HAS_CRYPT_IMPL=y
-UCLIBC_HAS_CRYPT=y
-UCLIBC_HAS_NETWORK_SUPPORT=y
-UCLIBC_HAS_SOCKET=y
-UCLIBC_HAS_IPV4=y
-# UCLIBC_HAS_IPV6 is not set
-UCLIBC_HAS_RPC=y
-UCLIBC_HAS_FULL_RPC=y
-UCLIBC_HAS_REENTRANT_RPC=y
-UCLIBC_USE_NETLINK=y
-UCLIBC_SUPPORT_AI_ADDRCONFIG=y
-# UCLIBC_HAS_BSD_RES_CLOSE is not set
-
-#
-# String and Stdio Support
-#
-UCLIBC_HAS_STRING_GENERIC_OPT=y
-UCLIBC_HAS_STRING_ARCH_OPT=y
-UCLIBC_HAS_CTYPE_TABLES=y
-UCLIBC_HAS_CTYPE_SIGNED=y
-# UCLIBC_HAS_CTYPE_UNSAFE is not set
-# UCLIBC_HAS_CTYPE_CHECKED is not set
-UCLIBC_HAS_CTYPE_ENFORCED=y
-# UCLIBC_HAS_WCHAR is not set
-# UCLIBC_HAS_LOCALE is not set
-# UCLIBC_HAS_HEXADECIMAL_FLOATS is not set
-UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
-# USE_OLD_VFPRINTF is not set
-UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
-# UCLIBC_HAS_SCANF_GLIBC_A_FLAG is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
-# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
-UCLIBC_HAS_STDIO_BUFSIZ_4096=y
-# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
-UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
-# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
-# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
-UCLIBC_HAS_STDIO_GETC_MACRO=y
-UCLIBC_HAS_STDIO_PUTC_MACRO=y
-UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
-# UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE is not set
-# UCLIBC_HAS_GLIBC_CUSTOM_STREAMS is not set
-UCLIBC_HAS_PRINTF_M_SPEC=y
-UCLIBC_HAS_ERRNO_MESSAGES=y
-# UCLIBC_HAS_SYS_ERRLIST is not set
-UCLIBC_HAS_SIGNUM_MESSAGES=y
-# UCLIBC_HAS_SYS_SIGLIST is not set
-UCLIBC_HAS_GNU_GETOPT=y
-UCLIBC_HAS_GNU_GETSUBOPT=y
-
-#
-# Big and Tall
-#
-UCLIBC_HAS_REGEX=y
-UCLIBC_HAS_REGEX_OLD=y
-UCLIBC_HAS_FNMATCH=y
-UCLIBC_HAS_FNMATCH_OLD=y
-# UCLIBC_HAS_WORDEXP is not set
-# UCLIBC_HAS_FTW is not set
-UCLIBC_HAS_GLOB=y
-UCLIBC_HAS_GNU_GLOB=y
-
-#
-# Library Installation Options
-#
-SHARED_LIB_LOADER_PREFIX="$(RUNTIME_PREFIX)lib"
-RUNTIME_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/"
-DEVEL_PREFIX="/usr/$(TARGET_ARCH)-linux-uclibc/usr/"
-
-#
-# Security options
-#
-# UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-# UCLIBC_HAS_SSP is not set
-UCLIBC_BUILD_RELRO=y
-# UCLIBC_BUILD_NOW is not set
-UCLIBC_BUILD_NOEXECSTACK=y
-
-#
-# uClibc development/debugging options
-#
-CROSS_COMPILER_PREFIX=""
-UCLIBC_EXTRA_CFLAGS=""
-# DODEBUG is not set
-# DODEBUG_PT is not set
-# DOSTRIP is not set
-# DOASSERTS is not set
-# SUPPORT_LD_DEBUG is not set
-# SUPPORT_LD_DEBUG_EARLY is not set
-# UCLIBC_MALLOC_DEBUGGING is not set
-WARNINGS="-Wall"
-# EXTRA_WARNINGS is not set
-# DOMULTI is not set
-# UCLIBC_MJN3_ONLY is not set
-- 
1.7.2.5
