From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 9 Feb 2015 19:16:37 +0100
Subject: [Buildroot] [PATCH] add basic support for uClibc-ng
Message-ID: <20150209181636.GA17451@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The uClibc-ng project released 1.0.0 lately.
Support in buildroot would be nice to get more testers.
New problems could be fixed in a faster way and
new releases can be done regulary.

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/Config.in.host              |    2 +-
 package/gcc/gcc.mk                      |    4 +-
 package/uclibc/Config.in                |   32 +++-
 package/uclibc/uClibc-ng-1.0.0.config   |  280 +++++++++++++++++++++++++++++++
 package/uclibc/uclibc.mk                |   24 ++-
 toolchain/toolchain-buildroot/Config.in |   17 ++
 toolchain/toolchain-common.in           |    1 +
 7 files changed, 353 insertions(+), 7 deletions(-)
 create mode 100644 package/uclibc/uClibc-ng-1.0.0.config

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 24004c4..30faece 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -121,7 +121,7 @@ comment "C++ support broken in uClibc with locale enabled with gcc 4.2"
 	depends on BR2_GCC_VERSION_4_2_2_AVR32_2_1_5 && BR2_TOOLCHAIN_BUILDROOT_LOCALE
 
 config BR2_GCC_ENABLE_TLS
-	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC || BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
 	default y
 	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 3af8290..011365d 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -120,9 +120,9 @@ ifneq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libquadmath
 endif
 
-# libsanitizer requires wordexp, not in default uClibc config. Also
+# libsanitizer requires wordexp, not in default uClibc/uCLibc-ng config. Also
 # doesn't build properly with musl.
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC)$(BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG)$(BR2_TOOLCHAIN_BUILDROOT_MUSL),y)
 HOST_GCC_COMMON_CONF_OPTS += --disable-libsanitizer
 endif
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 020c47c..31b6a4f 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -1,3 +1,32 @@
+if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
+
+config BR2_PACKAGE_UCLIBC_NG
+	bool
+	default y
+
+comment "uClibc-ng Options"
+
+choice
+	prompt "uClibc-ng C library Version"
+	default BR2_UCLIBC_NG_VERSION_1_0_0
+	help
+	  Select the version of uClibc-ng you wish to use.
+
+	config BR2_UCLIBC_NG_VERSION_1_0_0
+		bool "uClibc-ng 1.0.0"
+
+endchoice
+
+config BR2_UCLIBC_NG_VERSION_STRING
+	string
+	default 1.0.0		if BR2_UCLIBC_NG_VERSION_1_0_0
+
+config BR2_UCLIBC_NG_CONFIG
+	string "uClibc-ng configuration file to use?"
+	default "package/uclibc/uClibc-ng-1.0.0.config" if BR2_UCLIBC_NG_VERSION_1_0_0
+
+endif
+
 if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 # For legal-info
@@ -59,6 +88,8 @@ config BR2_UCLIBC_CONFIG
 	  See also docs/README in this package.
 	  If unsure, use the default.
 
+endif
+
 config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
 	bool "Enable large file (files > 2 GB) support"
 	select BR2_LARGEFILE
@@ -251,4 +282,3 @@ config BR2_UCLIBC_X86_TYPE
 	default PENTIUM4   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
 			      BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
 
-endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC
diff --git a/package/uclibc/uClibc-ng-1.0.0.config b/package/uclibc/uClibc-ng-1.0.0.config
new file mode 100644
index 0000000..f5456dd
--- /dev/null
+++ b/package/uclibc/uClibc-ng-1.0.0.config
@@ -0,0 +1,280 @@
+#
+# Automatically generated make config: don't edit
+# Version: 1.0.0
+#
+# TARGET_alpha is not set
+# TARGET_arc is not set
+# TARGET_arm is not set
+# TARGET_avr32 is not set
+# TARGET_bfin is not set
+# TARGET_cris is not set
+# TARGET_e1 is not set
+# TARGET_frv is not set
+# TARGET_h8300 is not set
+# TARGET_hppa is not set
+# TARGET_i386 is not set
+# TARGET_i960 is not set
+# TARGET_ia64 is not set
+# TARGET_m68k is not set
+# TARGET_metag is not set
+# TARGET_microblaze is not set
+# TARGET_mips is not set
+# TARGET_nios is not set
+# TARGET_nios2 is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sh64 is not set
+# TARGET_sparc is not set
+# TARGET_v850 is not set
+# TARGET_vax is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
+# TARGET_c6x is not set
+
+# CONFIG_GENERIC_ARM is not set
+# CONFIG_ARM610 is not set
+# CONFIG_ARM710 is not set
+# CONFIG_ARM7TDMI is not set
+# CONFIG_ARM720T is not set
+# CONFIG_ARM920T is not set
+# CONFIG_ARM922T is not set
+# CONFIG_ARM926T is not set
+# CONFIG_ARM10T is not set
+# CONFIG_ARM1136JF_S is not set
+# CONFIG_ARM1176JZ_S is not set
+# CONFIG_ARM1176JZF_S is not set
+# CONFIG_ARM_CORTEX_M3 is not set
+# CONFIG_ARM_CORTEX_M1 is not set
+# CONFIG_ARM_SA110 is not set
+# CONFIG_ARM_SA1100 is not set
+# CONFIG_ARM_XSCALE is not set
+# CONFIG_ARM_IWMMXT is not set
+
+# COMPILE_IN_THUMB_MODE is not set
+USE_BX=y
+
+TARGET_SUBARCH=""
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="none"
+FORCE_OPTIONS_FOR_ARCH=y
+#
+# Using ELF file format
+#
+# ARCH_LITTLE_ENDIAN is not set
+# ARCH_BIG_ENDIAN is not set
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_HAS_MMU=y
+ARCH_USE_MMU=y
+UCLIBC_HAS_FLOATS=y
+UCLIBC_HAS_FPU=y
+DO_C99_MATH=y
+# DO_XSI_MATH is not set
+# UCLIBC_HAS_FENV is not set
+UCLIBC_HAS_LONG_DOUBLE_MATH=y
+KERNEL_HEADERS="/usr/src/linux/include"
+HAVE_DOT_CONFIG=y
+
+#
+# General Library Settings
+#
+# HAVE_NO_PIC is not set
+DOPIC=y
+# ARCH_HAS_NO_SHARED is not set
+# ARCH_HAS_NO_LDSO is not set
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+# LDSO_CACHE_SUPPORT is not set
+LDSO_PRELOAD_ENV_SUPPORT=y
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+# LDSO_STANDALONE_SUPPORT is not set
+# LDSO_PRELINK_SUPPORT is not set
+# UCLIBC_STATIC_LDCONFIG is not set
+LDSO_RUNPATH=y
+LDSO_SAFE_RUNPATH=y
+LDSO_SEARCH_INTERP_PATH=y
+LDSO_LD_LIBRARY_PATH=y
+# LDSO_NO_CLEANUP is not set
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+LINUXTHREADS_OLD=y
+# LINUXTHREADS_NEW is not set
+# UCLIBC_HAS_THREADS_NATIVE is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_HAS_OBSTACK=y
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+UCLIBC_SUSV2_LEGACY=y
+UCLIBC_SUSV3_LEGACY=y
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_SUSV4_LEGACY=y
+# UCLIBC_STRICT_HEADERS is not set
+# UCLIBC_HAS_STUBS is not set
+UCLIBC_HAS_SHADOW=y
+UCLIBC_HAS_PROGRAM_INVOCATION_NAME=y
+UCLIBC_HAS___PROGNAME=y
+UCLIBC_HAS_PTY=y
+ASSUME_DEVPTS=y
+UNIX98PTY_ONLY=y
+UCLIBC_HAS_GETPT=y
+UCLIBC_HAS_LIBUTIL=y
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
+UCLIBC_FALLBACK_TO_ETC_LOCALTIME=y
+
+#
+# Advanced Library Settings
+#
+UCLIBC_PWD_BUFFER_SIZE=256
+UCLIBC_GRP_BUFFER_SIZE=256
+
+#
+# Support various families of functions
+#
+UCLIBC_LINUX_MODULE_26=y
+# UCLIBC_LINUX_MODULE_24 is not set
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_BSD_ERR=y
+UCLIBC_HAS_OBSOLETE_BSD_SIGNAL=y
+# UCLIBC_HAS_OBSOLETE_SYSV_SIGNAL is not set
+# UCLIBC_NTP_LEGACY is not set
+# UCLIBC_SV4_DEPRECATED is not set
+UCLIBC_HAS_REALTIME=y
+UCLIBC_HAS_ADVANCED_REALTIME=y
+UCLIBC_HAS_EPOLL=y
+UCLIBC_HAS_XATTR=y
+UCLIBC_HAS_PROFILING=y
+UCLIBC_HAS_CRYPT_IMPL=y
+# UCLIBC_HAS_SHA256_CRYPT_IMPL is not set
+# UCLIBC_HAS_SHA512_CRYPT_IMPL is not set
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_HAS_FULL_RPC is not set
+# UCLIBC_HAS_REENTRANT_RPC is not set
+UCLIBC_USE_NETLINK=y
+UCLIBC_SUPPORT_AI_ADDRCONFIG=y
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_HAS_COMPAT_RES_STATE=y
+# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+UCLIBC_HAS_RESOLVER_SUPPORT=y
+UCLIBC_HAS_LIBRESOLV_STUB=y
+UCLIBC_HAS_LIBNSL_STUB=y
+
+#
+# String and Stdio Support
+#
+UCLIBC_HAS_STRING_GENERIC_OPT=y
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+UCLIBC_HAS_CTYPE_CHECKED=y
+# UCLIBC_HAS_CTYPE_ENFORCED is not set
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
+# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
+UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
+# USE_OLD_VFPRINTF is not set
+UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
+UCLIBC_HAS_SCANF_GLIBC_A_FLAG=y
+# UCLIBC_HAS_STDIO_BUFSIZ_NONE is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_256 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_512 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_1024 is not set
+# UCLIBC_HAS_STDIO_BUFSIZ_2048 is not set
+UCLIBC_HAS_STDIO_BUFSIZ_4096=y
+# UCLIBC_HAS_STDIO_BUFSIZ_8192 is not set
+UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_4 is not set
+# UCLIBC_HAS_STDIO_BUILTIN_BUFFER_8 is not set
+# UCLIBC_HAS_STDIO_SHUTDOWN_ON_ABORT is not set
+# UCLIBC_HAS_STDIO_GETC_MACRO is not set
+# UCLIBC_HAS_STDIO_PUTC_MACRO is not set
+UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
+# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
+UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
+# UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
+UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
+UCLIBC_HAS_PRINTF_M_SPEC=y
+UCLIBC_HAS_ERRNO_MESSAGES=y
+# UCLIBC_HAS_SYS_ERRLIST is not set
+UCLIBC_HAS_SIGNUM_MESSAGES=y
+# UCLIBC_HAS_SYS_SIGLIST is not set
+UCLIBC_HAS_GNU_GETOPT=y
+# UCLIBC_HAS_GNU_GETSUBOPT is not set
+
+#
+# Big and Tall
+#
+UCLIBC_HAS_REGEX=y
+# UCLIBC_HAS_REGEX_OLD is not set
+UCLIBC_HAS_FNMATCH=y
+# UCLIBC_HAS_FNMATCH_OLD is not set
+# UCLIBC_HAS_WORDEXP is not set
+UCLIBC_HAS_NFTW=y
+UCLIBC_HAS_FTW=y
+# UCLIBC_HAS_FTS is not set
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
+UCLIBC_HAS_UTMPX=y
+
+#
+# Library Installation Options
+#
+RUNTIME_PREFIX="/"
+DEVEL_PREFIX="/usr/"
+MULTILIB_DIR="lib"
+HARDWIRED_ABSPATH=y
+
+#
+# Security options
+#
+# UCLIBC_BUILD_PIE is not set
+# UCLIBC_HAS_ARC4RANDOM is not set
+# HAVE_NO_SSP is not set
+UCLIBC_HAS_SSP=y
+# UCLIBC_HAS_SSP_COMPAT is not set
+# SSP_QUICK_CANARY is not set
+PROPOLICE_BLOCK_ABRT=y
+# PROPOLICE_BLOCK_SEGV is not set
+# UCLIBC_BUILD_SSP is not set
+UCLIBC_BUILD_RELRO=y
+UCLIBC_BUILD_NOW=y
+UCLIBC_BUILD_NOEXECSTACK=y
+
+#
+# uClibc development/debugging options
+#
+CROSS_COMPILER_PREFIX=""
+UCLIBC_EXTRA_CFLAGS=""
+# DODEBUG is not set
+# DODEBUG_PT is not set
+# DOSTRIP is not set
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+# UCLIBC_HAS_BACKTRACE is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 8654926..2bc894a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -6,9 +6,6 @@
 
 UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
 UCLIBC_SOURCE ?= uClibc-$(UCLIBC_VERSION).tar.bz2
-UCLIBC_LICENSE = LGPLv2.1+
-UCLIBC_LICENSE_FILES = COPYING.LIB
-
 ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
 UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
 else ifeq ($(BR2_arc),y)
@@ -22,6 +19,15 @@ UCLIBC_SITE = http://www.uclibc.org/downloads
 UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
 endif
 
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG),y)
+UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_NG_VERSION_STRING))
+UCLIBC_SITE = http://downloads.uclibc-ng.org/releases/$(UCLIBC_VERSION)/
+UCLIBC_SOURCE = uClibc-ng-$(UCLIBC_VERSION).tar.xz
+endif
+
+UCLIBC_LICENSE = LGPLv2.1+
+UCLIBC_LICENSE_FILES = COPYING.LIB
+
 UCLIBC_INSTALL_STAGING = YES
 
 # uclibc is part of the toolchain so disable the toolchain dependency
@@ -33,9 +39,15 @@ UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG),y)
+ifndef UCLIBC_NG_CONFIG_FILE
+UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_NG_CONFIG))
+endif
+else
 ifndef UCLIBC_CONFIG_FILE
 UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
 endif
+endif
 
 UCLIBC_KCONFIG_FILE = $(UCLIBC_CONFIG_FILE)
 
@@ -508,6 +520,12 @@ define UCLIBC_INSTALL_TARGET_CMDS
 	$(UCLIBC_INSTALL_UTILS_TARGET)
 	$(UCLIBC_BUILD_TEST_SUITE)
 	$(UCLIBC_INSTALL_TEST_SUITE)
+	if [ -e $(TARGET_DIR)/lib/ld64-uClibc.so.1 ];then \
+		(cd $(TARGET_DIR)/lib;ln -sf ld64-uClibc.so.1 ld64-uClibc.so.0) \
+	fi
+	if [ -e $(TARGET_DIR)/lib/ld-uClibc.so.1 ];then \
+		(cd $(TARGET_DIR)/lib;ln -sf ld-uClibc.so.1 ld-uClibc.so.0) \
+	fi
 endef
 
 # STATIC has no ld* tools, only getconf
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 2955b2e..8aa777e 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -39,6 +39,20 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 
 	  http://uclibc.org
 
+config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
+	bool "uClibc-ng"
+	select BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
+		   BR2_avr32   || BR2_bfin   || BR2_i386   || BR2_m68k     || \
+		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
+		   BR2_x86_64
+	help
+	  This option selects uClibc-ng as the C library for the
+	  cross-compilation toolchain.
+
+	  http://uclibc-ng.org
+
 config BR2_TOOLCHAIN_BUILDROOT_EGLIBC
 	bool "eglibc"
 	depends on BR2_arm    || BR2_armeb    || BR2_aarch64 || \
@@ -94,7 +108,10 @@ endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	string
+	# Both uClibc and uClibc-ng are handled by the package called
+	# 'uclibc'
 	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
 	# Both glibc and eglibc are handled by the package called
 	# 'glibc'
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_EGLIBC
diff --git a/toolchain/toolchain-common.in b/toolchain/toolchain-common.in
index 2ee2019..df9e77e 100644
--- a/toolchain/toolchain-common.in
+++ b/toolchain/toolchain-common.in
@@ -70,6 +70,7 @@ config BR2_GENERATE_LOCALE
 	default ""
 	depends on \
 		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC && BR2_ENABLE_LOCALE) || \
+		(BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG && BR2_ENABLE_LOCALE) || \
 		BR2_TOOLCHAIN_USES_GLIBC
 	help
 	  Generate support for a list of locales. Locales can be
-- 
1.7.10.4
