From: Waldemar Brodkorb <wbx@openadk.org>
Date: Mon, 11 Aug 2014 13:31:24 +0200
Subject: [Buildroot] [PATCH 1/2] toolchain/uclibc-ng: add support for
	uClibc-ng
Message-ID: <20140811113124.GA19506@waldemar-brodkorb.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

uClibc-ng is a spin-off of uClibc. uClibc-ng will do
a 1.0 release really soon. uClibc lacks releases and
the maintainer does not communicate any timeplans for
releases. For more information about uClibc-ng see:
http://www.uclibc-ng.org

Differences to uClibc master:
http://uclibc-ng.org/wiki/Changes

Notes about needed config changes:
http://uclibc-ng.org/wiki/Upgrade

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
---
 package/gcc/Config.in.host               |    6 +-
 package/uclibc-ng/Config.in              |  198 ++++++++++++
 package/uclibc-ng/uClibc-ng-1.0.0.config |  232 ++++++++++++++
 package/uclibc-ng/uclibc-ng.mk           |  503 ++++++++++++++++++++++++++++++
 toolchain/toolchain-buildroot/Config.in  |   19 +-
 5 files changed, 953 insertions(+), 5 deletions(-)
 create mode 100644 package/uclibc-ng/Config.in
 create mode 100644 package/uclibc-ng/uClibc-ng-1.0.0.config
 create mode 100644 package/uclibc-ng/uclibc-ng.mk

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index b29bacb..2585bef 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -143,16 +143,16 @@ config BR2_INSTALL_FORTRAN
 	  target.
 
 config BR2_GCC_ENABLE_TLS
-	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
+	bool "Enable compiler tls support" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC || BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
 	default y
-	depends on BR2_PTHREADS_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
+	depends on BR2_PTHREADS_NATIVE || BR2_PTHREADS_NG_NATIVE || BR2_TOOLCHAIN_BUILDROOT_EGLIBC || BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	help
 	  Enable the compiler to generate code for accessing
 	  thread local storage variables
 
 config BR2_GCC_ENABLE_OPENMP
 	bool "Enable compiler OpenMP support"
-	depends on !BR2_PTHREADS_NONE && !BR2_avr32 && !BR2_arc && !BR2_microblaze
+	depends on !BR2_PTHREADS_NONE && !BR2_PTHREADS_NG_NONE && !BR2_avr32 && !BR2_arc && !BR2_microblaze
 	help
 	  Enable OpenMP support for the compiler
 
diff --git a/package/uclibc-ng/Config.in b/package/uclibc-ng/Config.in
new file mode 100644
index 0000000..1e58687
--- /dev/null
+++ b/package/uclibc-ng/Config.in
@@ -0,0 +1,198 @@
+if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
+
+comment "uClibc-ng Options"
+
+choice
+	prompt "uClibc-ng C library Version"
+	default BR2_UCLIBC_NG_VERSION_1_0_0
+	help
+	  Select the version of uClibc you wish to use.
+
+	config BR2_UCLIBC_NG_VERSION_1_0_0
+		bool "uClibc-ng 1.0.0"
+
+endchoice
+
+config BR2_UCLIBC_NG_VERSION_STRING
+	string
+	default 1.0.0rc1	if BR2_UCLIBC_NG_VERSION_1_0_0
+
+config BR2_UCLIBC_NG_CONFIG
+	string "uClibc-ng configuration file to use?"
+	default "package/uclibc-ng/uClibc-ng-1.0.0.config" if BR2_UCLIBC_NG_VERSION_1_0_0
+	help
+	  Some people may wish to use their own modified uClibc-ng configuration
+	  file and will specify their config file location with this option.
+	  See also docs/README in this package.
+	  If unsure, use the default.
+
+config BR2_TOOLCHAIN_BUILDROOT_LARGEFILE
+	bool "Enable large file (files > 2 GB) support"
+	select BR2_LARGEFILE
+	help
+	  Enable this option if you want your toolchain to support
+	  files bigger than 2 GB.
+
+config BR2_TOOLCHAIN_BUILDROOT_INET_IPV6
+	bool "Enable IPv6 support"
+	select BR2_INET_IPV6
+	help
+	  Enable this option if you want your toolchain to support
+	  IPv6.
+
+config BR2_TOOLCHAIN_BUILDROOT_WCHAR
+	bool "Enable WCHAR support"
+	select BR2_USE_WCHAR
+	help
+	  Enable this option if you want your toolchain to support
+	  wide characters (i.e characters longer than 8 bits, needed
+	  for locale support).
+
+config BR2_TOOLCHAIN_BUILDROOT_LOCALE
+	bool "Enable toolchain locale/i18n support"
+	select BR2_TOOLCHAIN_BUILDROOT_WCHAR
+	select BR2_ENABLE_LOCALE
+	help
+	  Enable this option if you want your toolchain to support
+	  localization and internationalization.
+
+choice
+	prompt "Thread library implementation"
+	default BR2_PTHREADS_NG if BR2_bfin || BR2_m68k
+	default BR2_PTHREADS_NG_NATIVE
+	help
+	  Use this option to select the thread library implementation
+	  that should be used in your toolchain. You can disable it.
+
+	config BR2_PTHREADS_NG_NONE
+		bool "none"
+
+	config BR2_PTHREADS_NG
+		bool "linuxthreads"
+		select BR2_TOOLCHAIN_HAS_THREADS
+		depends on BR2_bfin
+
+	config BR2_PTHREADS_NG_NATIVE
+		bool "Native POSIX Threading (NPTL)"
+		select BR2_TOOLCHAIN_HAS_THREADS
+		select BR2_TOOLCHAIN_HAS_THREADS_NPTL
+		depends on !BR2_bfin && !BR2_m68k
+
+endchoice
+
+config BR2_PTHREAD_DEBUG
+	bool "Thread library debugging"
+	depends on BR2_PTHREADS || BR2_PTHREADS_NATIVE
+	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
+	help
+	  Build the thread library with debugging enabled.
+
+config BR2_TOOLCHAIN_BUILDROOT_USE_SSP
+	bool "Enable stack protection support"
+	select BR2_TOOLCHAIN_HAS_SSP
+	help
+	  Enable stack smashing protection support using GCCs
+	  -fstack-protector-all option in uClibc-ng.
+
+	  See http://www.linuxfromscratch.org/hints/downloads/files/ssp.txt
+	  for details.
+
+config BR2_UCLIBC_NG_INSTALL_UTILS
+	bool "Compile and install uClibc-ng utilities"
+	depends on !BR2_bfin
+	default y
+	help
+	  Enabling this option will compile and install the getconf,
+	  ldconfig and ldd uClibc-ng utilities for the target.
+
+	  You can save ~32 KiB in target space by disabling them since
+	  they're normally not needed.
+
+config BR2_UCLIBC_NG_INSTALL_TEST_SUITE
+	bool "Compile and install uClibc-ng tests"
+	select BR2_PACKAGE_MAKE
+	help
+	  Enabling this option will compile and install the uClibc-ng test suite.
+	  This is useful if you want to check if the uClibc-ng library is working
+	  for your architecture and/or help developing uClibc-ng.
+
+	  The test suite will be installed into /root/uClibc-ng directory. To run
+	  the test suite enter the /root/uClibc-ng/test directory and type
+	  "make UCLIBC_ONLY=1 CC=/bin/true check".
+
+	  See the /root/uClibc-ng/test/README for additional information.
+
+	  This is not needed at all for normal builds, so you can safely say no
+	  if you do not plan to dig into your C library.
+
+# Mapping from the Buildroot architecture configuration options to the
+# uClibc-ng architecture names.
+config BR2_UCLIBC_NG_TARGET_ARCH
+	string
+	default arc	   if BR2_arcle || BR2_arceb
+	default arm	   if BR2_arm	|| BR2_armeb
+	default bfin	   if BR2_bfin
+	default m68k	   if BR2_m68k
+	default mips	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
+	default powerpc	   if BR2_powerpc
+	default sh	   if BR2_sh
+	default sparc	   if BR2_sparc
+	default xtensa	   if BR2_xtensa
+	default i386	   if BR2_i386
+	default x86_64	   if BR2_x86_64
+
+config BR2_UCLIBC_NG_ARM_BX
+	bool
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "arm"
+	default y if (BR2_ARM_CPU_HAS_THUMB || BR2_ARM_CPU_HAS_THUMB2)
+
+config BR2_UCLIBC_NG_MIPS_ABI
+	string
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "mips"
+	default O32 if BR2_MIPS_OABI32
+	default N32 if BR2_MIPS_NABI32
+	default N64 if BR2_MIPS_NABI64
+
+config BR2_UCLIBC_NG_MIPS_ISA
+	string
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "mips"
+	default 1 if BR2_mips_1
+	default 2 if BR2_mips_2
+	default 3 if BR2_mips_3
+	default 4 if BR2_mips_4
+	default MIPS32 if BR2_mips_32
+	default MIPS32R2 if BR2_mips_32r2
+	default MIPS64 if BR2_mips_64
+
+config BR2_UCLIBC_NG_SH_TYPE
+	string
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "sh"
+	default SH2A if BR2_sh2a
+	default SH4  if BR2_sh4 || BR2_sh4eb
+
+config BR2_UCLIBC_NG_SPARC_TYPE
+	string
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "sparc"
+	default V7	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default V8	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+
+config BR2_UCLIBC_NG_POWERPC_TYPE
+	string
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "powerpc"
+	default CLASSIC if !BR2_powerpc_8540 && !BR2_powerpc_8548
+	default E500    if BR2_powerpc_8540 || BR2_powerpc_8548
+
+config BR2_UCLIBC_NG_X86_TYPE
+	string
+	depends on BR2_UCLIBC_NG_TARGET_ARCH = "i386"
+	default 386     if BR2_x86_i386
+	default 486	if BR2_x86_i486
+	default 586	if BR2_x86_i586
+	default 586MMX	if BR2_x86_pentium_mmx
+	default 686	if BR2_x86_i686 || BR2_x86_pentiumpro
+	default PENTIUMII  if BR2_x86_pentium2
+	default PENTIUMIII if BR2_x86_pentium3
+	default PENTIUM4   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
+			      BR2_x86_nocona || BR2_x86_core2 || BR2_x86_corei7
+
+endif # BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
diff --git a/package/uclibc-ng/uClibc-ng-1.0.0.config b/package/uclibc-ng/uClibc-ng-1.0.0.config
new file mode 100644
index 0000000..a53337a
--- /dev/null
+++ b/package/uclibc-ng/uClibc-ng-1.0.0.config
@@ -0,0 +1,232 @@
+#
+# Automatically generated make config: don't edit
+#
+# TARGET_arm is not set
+# TARGET_bfin is not set
+# TARGET_i386 is not set
+# TARGET_m68k is not set
+# TARGET_mips is not set
+# TARGET_powerpc is not set
+# TARGET_sh is not set
+# TARGET_sparc is not set
+# TARGET_x86_64 is not set
+# TARGET_xtensa is not set
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
+HAVE_SHARED=y
+# FORCE_SHAREABLE_TEXT_SEGMENTS is not set
+LDSO_LDD_SUPPORT=y
+# LDSO_CACHE_SUPPORT is not set
+LDSO_PRELOAD_ENV_SUPPORT=y
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+# LDSO_STANDALONE_SUPPORT is not set
+# LDSO_PRELINK_SUPPORT is not set
+# UCLIBC_STATIC_LDCONFIG is not set
+LDSO_RUNPATH=y
+LDSO_SEARCH_INTERP_PATH=y
+LDSO_LD_LIBRARY_PATH=y
+# LDSO_NO_CLEANUP is not set
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+UCLIBC_HAS_LINUXTHREADS=y
+# UCLIBC_HAS_THREADS_NATIVE is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
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
+UCLIBC_LINUX_MODULE=y
+UCLIBC_LINUX_SPECIFIC=y
+UCLIBC_HAS_GNU_ERROR=y
+UCLIBC_BSD_SPECIFIC=y
+UCLIBC_HAS_BSD_ERR=y
+# UCLIBC_HAS_OBSOLETE_BSD_SIGNAL is not set
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
+# UCLIBC_HAS_STRING_GENERIC_OPT is not set
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
+UCLIBC_HAS_FNMATCH=y
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
+DOSTRIP=y
+# DOASSERTS is not set
+# SUPPORT_LD_DEBUG is not set
+# SUPPORT_LD_DEBUG_EARLY is not set
+# UCLIBC_MALLOC_DEBUGGING is not set
+# UCLIBC_HAS_BACKTRACE is not set
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
diff --git a/package/uclibc-ng/uclibc-ng.mk b/package/uclibc-ng/uclibc-ng.mk
new file mode 100644
index 0000000..b80630b
--- /dev/null
+++ b/package/uclibc-ng/uclibc-ng.mk
@@ -0,0 +1,503 @@
+################################################################################
+#
+# uclibc-ng
+#
+################################################################################
+
+UCLIBC_NG_VERSION = $(call qstrip,$(BR2_UCLIBC_NG_VERSION_STRING))
+UCLIBC_NG_SOURCE ?= uClibc-$(UCLIBC_NG_VERSION).tar.xz
+UCLIBC_NG_LICENSE = LGPLv2.1+
+UCLIBC_NG_LICENSE_FILES = COPYING
+UCLIBC_NG_SITE = http://downloads.uclibc-ng.org/
+UCLIBC_NG_SOURCE = uClibc-ng-$(UCLIBC_NG_VERSION).tar.xz
+
+UCLIBC_NG_INSTALL_STAGING = YES
+
+# uclibc-ng is part of the toolchain so disable the toolchain dependency
+UCLIBC_NG_ADD_TOOLCHAIN_DEPENDENCY = NO
+
+# Before uClibc-ng is configured, we must have the first stage
+# cross-compiler and the kernel headers
+UCLIBC_NG_DEPENDENCIES = host-gcc-initial linux-headers
+
+# specifying UCLIBC_NG_CONFIG_FILE on the command-line overrides the .config
+# setting.
+ifndef UCLIBC_NG_CONFIG_FILE
+UCLIBC_NG_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_NG_CONFIG))
+endif
+
+UCLIBC_NG_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_NG_TARGET_ARCH))
+
+ifeq ($(GENERATE_LOCALE),)
+# We need at least one locale
+UCLIBC_NG_LOCALES = en_US
+else
+# Strip out the encoding part of locale names, if any
+UCLIBC_NG_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
+		   $(firstword $(subst .,$(space),$(locale))))
+endif
+
+#
+# Utility functions to manipulation the uClibc-ng configuration file
+#
+
+define UCLIBC_NG_OPT_SET
+	$(SED) '/$(1)/d' $(3)/.config
+	echo '$(1)=$(2)' >> $(3)/.config
+endef
+
+define UCLIBC_NG_OPT_UNSET
+	$(SED) '/$(1)/d' $(2)/.config
+	echo '# $(1) is not set' >> $(2)/.config
+endef
+
+#
+# ARM definitions
+#
+
+ifeq ($(UCLIBC_NG_TARGET_ARCH),arm)
+define UCLIBC_NG_ARM_ABI_CONFIG
+        $(SED) '/CONFIG_ARM_.ABI/d' $(@D)/.config
+        $(call UCLIBC_NG_OPT_SET,CONFIG_ARM_EABI,y,$(@D))
+endef
+
+# Thumb build is broken with threads, build in ARM mode
+ifeq ($(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yy)
+UCLIBC_NG_EXTRA_CFLAGS += -marm
+endif
+
+ifeq ($(BR2_UCLIBC_NG_ARM_BX),y)
+define UCLIBC_NG_ARM_BX_CONFIG
+	$(call UCLIBC_NG_OPT_SET,USE_BX,y,$(@D))
+endef
+else
+define UCLIBC_NG_ARM_BX_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,USE_BX,$(@D))
+endef
+endif
+
+endif # arm
+
+#
+# MIPS definitions
+#
+
+ifeq ($(UCLIBC_NG_TARGET_ARCH),mips)
+UCLIBC_NG_MIPS_ABI = CONFIG_MIPS_$(call qstrip,$(BR2_UCLIBC_NG_MIPS_ABI))_ABI
+define UCLIBC_NG_MIPS_ABI_CONFIG
+	$(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(@D)/.config
+	$(call UCLIBC_NG_OPT_SET,$(UCLIBC_NG_MIPS_ABI),y,$(@D))
+endef
+
+UCLIBC_NG_MIPS_ISA = CONFIG_MIPS_ISA_$(call qstrip,$(BR2_UCLIBC_NG_MIPS_ISA))
+define UCLIBC_NG_MIPS_ISA_CONFIG
+	$(SED) '/CONFIG_MIPS_ISA_.*/d' $(@D)/.config
+	$(call UCLIBC_NG_OPT_SET,$(UCLIBC_NG_MIPS_ISA),y,$(@D))
+endef
+endif # mips
+
+#
+# SH definitions
+#
+
+ifeq ($(UCLIBC_NG_TARGET_ARCH),sh)
+UCLIBC_NG_SH_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_NG_SH_TYPE))
+define UCLIBC_NG_SH_TYPE_CONFIG
+	$(SED) '/CONFIG_SH[234A]*/d' $(@D)/.config
+	$(call UCLIBC_NG_OPT_SET,$(UCLIBC_NG_SH_TYPE),y,$(@D))
+endef
+endif # sh
+
+#
+# SPARC definitions
+#
+
+ifeq ($(UCLIBC_NG_TARGET_ARCH),sparc)
+UCLIBC_NG_SPARC_TYPE = CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_NG_SPARC_TYPE))
+define UCLIBC_NG_SPARC_TYPE_CONFIG
+	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
+		 $(@D)/.config
+	$(call UCLIBC_NG_OPT_SET,$(UCLIBC_NG_SPARC_TYPE),y,$(@D))
+endef
+endif # sparc
+
+#
+# PowerPC definitions
+#
+
+ifeq ($(UCLIBC_NG_TARGET_ARCH),powerpc)
+UCLIBC_NG_POWERPC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_NG_POWERPC_TYPE))
+define UCLIBC_NG_POWERPC_TYPE_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,CONFIG_GENERIC,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,CONFIG_E500,$(@D))
+	$(call UCLIBC_NG_OPT_SET,$(UCLIBC_NG_POWERPC_TYPE),y,$(@D))
+endef
+endif # powerpc
+
+#
+# Blackfin definitions
+#
+
+ifeq ($(UCLIBC_NG_TARGET_ARCH),bfin)
+ifeq ($(BR2_BINFMT_FDPIC),y)
+define UCLIBC_NG_BFIN_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FLAT,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FLAT_SEP_DATA,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_SHARED_FLAT,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_NG_FORMAT_FDPIC_ELF,y,$(@D))
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_ONE),y)
+define UCLIBC_NG_BFIN_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_NG_FORMAT_FLAT,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FLAT_SEP_DATA,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_SHARED_FLAT,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FDPIC_ELF,$(@D))
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_SEP_DATA),y)
+define UCLIBC_NG_BFIN_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FLAT,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_NG_FORMAT_FLAT_SEP_DATA,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_SHARED_FLAT,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FDPIC_ELF,$(@D))
+endef
+endif
+ifeq ($(BR2_BINFMT_FLAT_SHARED),y)
+define UCLIBC_NG_BFIN_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FLAT,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FLAT_SEP_DATA,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_NG_FORMAT_SHARED_FLAT,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_NG_FORMAT_FDPIC_ELF,$(@D))
+endef
+endif
+endif # bfin
+
+#
+# x86 definitions
+#
+ifeq ($(UCLIBC_NG_TARGET_ARCH),i386)
+UCLIBC_NG_X86_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_NG_X86_TYPE))
+define UCLIBC_NG_X86_TYPE_CONFIG
+	$(call UCLIBC_NG_OPT_SET,$(UCLIBC_NG_X86_TYPE),y,$(@D))
+endef
+endif
+
+#
+# Endianness
+#
+
+ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
+define UCLIBC_NG_ENDIAN_CONFIG
+	$(call UCLIBC_NG_OPT_SET,ARCH_BIG_ENDIAN,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,ARCH_WANTS_BIG_ENDIAN,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,ARCH_LITTLE_ENDIAN,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,ARCH_WANTS_LITTLE_ENDIAN,$(@D))
+endef
+else
+define UCLIBC_NG_ENDIAN_CONFIG
+	$(call UCLIBC_NG_OPT_SET,ARCH_LITTLE_ENDIAN,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,ARCH_WANTS_LITTLE_ENDIAN,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,ARCH_BIG_ENDIAN,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,ARCH_WANTS_BIG_ENDIAN,$(@D))
+endef
+endif
+
+#
+# Largefile
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LARGEFILE),y)
+define UCLIBC_NG_LARGEFILE_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_LFS,y,$(@D))
+endef
+else
+define UCLIBC_NG_LARGEFILE_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_LFS,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_FOPEN_LARGEFILE_MODE,$(@D))
+endef
+endif
+
+#
+# MMU
+#
+
+ifeq ($(BR2_USE_MMU),y)
+define UCLIBC_NG_MMU_CONFIG
+	$(call UCLIBC_NG_OPT_SET,ARCH_USE_MMU,y,$(@D))
+endef
+else
+define UCLIBC_NG_MMU_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,ARCH_USE_MMU,$(@D))
+endef
+endif
+
+#
+# IPv6
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
+UCLIBC_NG_IPV6_CONFIG = $(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_IPV6,y,$(@D))
+else
+UCLIBC_NG_IPV6_CONFIG = $(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_IPV6,$(@D))
+endif
+
+#
+# soft-float
+#
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+define UCLIBC_NG_FLOAT_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_FPU,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_FLOATS,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,DO_C99_MATH,y,$(@D))
+endef
+else
+define UCLIBC_NG_FLOAT_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_FPU,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_FLOATS,y,$(@D))
+endef
+endif
+
+#
+# SSP
+#
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
+define UCLIBC_NG_SSP_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_SSP,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_BUILD_SSP,y,$(@D))
+endef
+else
+define UCLIBC_NG_SSP_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_SSP,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_BUILD_SSP,$(@D))
+endef
+endif
+
+#
+# Threads
+#
+ifeq ($(BR2_PTHREADS_NONE),y)
+define UCLIBC_NG_THREAD_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_THREADS,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_LINUXTHREADS,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_THREADS_NATIVE,$(@D))
+endef
+else ifeq ($(BR2_PTHREADS),y)
+define UCLIBC_NG_THREAD_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_THREADS,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_LINUXTHREADS_NEW,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_THREADS_NATIVE,$(@D))
+endef
+else ifeq ($(BR2_PTHREADS_NATIVE),y)
+define UCLIBC_NG_THREAD_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_THREADS,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_LINUXTHREADS,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_THREADS_NATIVE,y,$(@D))
+endef
+endif
+
+#
+# Thread debug
+#
+
+ifeq ($(BR2_PTHREAD_DEBUG),y)
+UCLIBC_NG_THREAD_DEBUG_CONFIG = $(call UCLIBC_NG_OPT_SET,PTHREADS_DEBUG_SUPPORT,y,$(@D))
+else
+UCLIBC_NG_THREAD_DEBUG_CONFIG = $(call UCLIBC_NG_OPT_UNSET,PTHREADS_DEBUG_SUPPORT,$(@D))
+endif
+
+#
+# Locale
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LOCALE),y)
+define UCLIBC_NG_LOCALE_CONFIG
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_LOCALE,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_BUILD_ALL_LOCALE,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_BUILD_MINIMAL_LOCALE,y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_BUILD_MINIMAL_LOCALES,"$(UCLIBC_LOCALES)",$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_PREGENERATED_LOCALE_DATA,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,DOWNLOAD_PREGENERATED_LOCALE_DATA,$(@D))
+	$(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_XLOCALE,y,$(@D))
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_GLIBC_DIGIT_GROUPING,$(@D))
+endef
+else
+define UCLIBC_NG_LOCALE_CONFIG
+	$(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_LOCALE,$(@D))
+endef
+endif
+
+#
+# wchar
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
+UCLIBC_NG_WCHAR_CONFIG = $(call UCLIBC_NG_OPT_SET,UCLIBC_HAS_WCHAR,y,$(@D))
+else
+UCLIBC_NG_WCHAR_CONFIG = $(call UCLIBC_NG_OPT_UNSET,UCLIBC_HAS_WCHAR,$(@D))
+endif
+
+#
+# strip
+#
+
+ifeq ($(BR2_STRIP_none),y)
+UCLIBC_NG_STRIP_CONFIG = $(call UCLIBC_NG_OPT_UNSET,DOSTRIP,$(@D))
+else
+UCLIBC_NG_STRIP_CONFIG = $(call UCLIBC_NG_OPT_SET,DOSTRIP,y,$(@D))
+endif
+
+#
+# Commands
+#
+
+UCLIBC_NG_MAKE_FLAGS = \
+	ARCH="$(UCLIBC_NG_TARGET_ARCH)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	UCLIBC_NG_EXTRA_CFLAGS="$(UCLIBC_NG_EXTRA_CFLAGS) $(TARGET_ABI)" \
+	HOSTCC="$(HOSTCC)"
+
+define UCLIBC_NG_SETUP_DOT_CONFIG
+	$(INSTALL) -m 0644 $(UCLIBC_NG_CONFIG_FILE) $(@D)/.config
+	$(call UCLIBC_NG_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
+	$(call UCLIBC_NG_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
+	$(call UCLIBC_NG_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
+	$(call UCLIBC_NG_OPT_SET,KERNEL_HEADERS,"$(LINUX_HEADERS_DIR)/usr/include",$(@D))
+	$(call UCLIBC_NG_OPT_SET,RUNTIME_PREFIX,"/",$(@D))
+	$(call UCLIBC_NG_OPT_SET,DEVEL_PREFIX,"/usr",$(@D))
+	$(call UCLIBC_NG_OPT_SET,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D))
+	$(UCLIBC_NG_MMU_CONFIG)
+	$(UCLIBC_NG_ARM_ABI_CONFIG)
+	$(UCLIBC_NG_ARM_BX_CONFIG)
+	$(UCLIBC_NG_MIPS_ABI_CONFIG)
+	$(UCLIBC_NG_MIPS_ISA_CONFIG)
+	$(UCLIBC_NG_SH_TYPE_CONFIG)
+	$(UCLIBC_NG_SPARC_TYPE_CONFIG)
+	$(UCLIBC_NG_POWERPC_TYPE_CONFIG)
+	$(UCLIBC_NG_BFIN_CONFIG)
+	$(UCLIBC_NG_X86_TYPE_CONFIG)
+	$(UCLIBC_NG_ENDIAN_CONFIG)
+	$(UCLIBC_NG_LARGEFILE_CONFIG)
+	$(UCLIBC_NG_IPV6_CONFIG)
+	$(UCLIBC_NG_FLOAT_CONFIG)
+	$(UCLIBC_NG_SSP_CONFIG)
+	$(UCLIBC_NG_THREAD_CONFIG)
+	$(UCLIBC_NG_THREAD_DEBUG_CONFIG)
+	$(UCLIBC_NG_LOCALE_CONFIG)
+	$(UCLIBC_NG_WCHAR_CONFIG)
+	$(UCLIBC_NG_STRIP_CONFIG)
+	yes "" | $(MAKE1) -C $(@D) \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
+		oldconfig
+endef
+
+define UCLIBC_NG_CONFIGURE_CMDS
+	$(UCLIBC_NG_SETUP_DOT_CONFIG)
+	$(MAKE1) -C $(UCLIBC_NG_DIR) \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
+		headers startfiles \
+		install_headers install_startfiles
+	$(TARGET_CROSS)gcc -nostdlib \
+		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
+	$(TARGET_CROSS)gcc -nostdlib \
+		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
+endef
+
+ifeq ($(BR2_UCLIBC_NG_INSTALL_TEST_SUITE),y)
+define UCLIBC_NG_BUILD_TEST_SUITE
+	$(MAKE1) -C $(@D)/test \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
+		UCLIBC_ONLY=1 \
+		TEST_INSTALLED_UCLIBC=1 \
+		compile
+endef
+endif
+
+define UCLIBC_NG_BUILD_CMDS
+	$(MAKE) -C $(@D) \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		PREFIX= \
+		DEVEL_PREFIX=/ \
+		RUNTIME_PREFIX=/ \
+		all
+	$(MAKE) -C $(@D)/utils \
+		PREFIX=$(HOST_DIR) \
+		HOSTCC="$(HOSTCC)" hostutils
+	$(UCLIBC_NG_BUILD_TEST_SUITE)
+endef
+
+ifeq ($(BR2_UCLIBC_NG_INSTALL_TEST_SUITE),y)
+define UCLIBC_NG_INSTALL_TEST_SUITE
+	mkdir -p $(TARGET_DIR)/root/uClibc-ng
+	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc-ng
+	$(INSTALL) -D -m 0644 $(@D)/Rules.mak $(TARGET_DIR)/root/uClibc-ng/Rules.mak
+	$(INSTALL) -D -m 0644 $(@D)/.config $(TARGET_DIR)/root/uClibc-ng/.config
+endef
+endif
+
+ifeq ($(BR2_UCLIBC_NG_INSTALL_UTILS),y)
+define UCLIBC_NG_INSTALL_UTILS_TARGET
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_NG_TARGET_ARCH)" \
+		PREFIX=$(TARGET_DIR) \
+		utils install_utils
+endef
+endif
+
+define UCLIBC_NG_INSTALL_TARGET_CMDS
+	$(MAKE1) -C $(@D) \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		PREFIX=$(TARGET_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=/ \
+		install_runtime
+	$(UCLIBC_NG_INSTALL_UTILS_TARGET)
+	$(UCLIBC_NG_INSTALL_TEST_SUITE)
+	cd $(TARGET_DIR)/lib && ln -sf ld-uClibc.so.1 ld-uClibc.so.0
+endef
+
+# For FLAT binfmts (static) there are no host utils
+ifeq ($(BR2_BINFMT_FLAT),)
+define UCLIBC_NG_INSTALL_UTILS_STAGING
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
+	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
+	$(INSTALL) -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
+	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+endef
+endif
+
+define UCLIBC_NG_INSTALL_STAGING_CMDS
+	$(MAKE1) -C $(@D) \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=/ \
+		install_runtime install_dev
+	$(UCLIBC_NG_INSTALL_UTILS_STAGING)
+endef
+
+uclibc-ng-menuconfig: uclibc-ng-patch
+	$(MAKE1) -C $(UCLIBC_NG_DIR) \
+		$(UCLIBC_NG_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR)/ \
+		menuconfig
+	rm -f $(UCLIBC_NG_DIR)/.stamp_{configured,built,target_installed,staging_installed}
+
+$(eval $(generic-package))
+
+uclibc-ng-update-config: $(UCLIBC_NG_DIR)/.stamp_configured
+	cp -f $(UCLIBC_NG_DIR)/.config $(UCLIBC_NG_CONFIG_FILE)
+
+# Before uClibc-ng is built, we must have the second stage cross-compiler
+$(UCLIBC_NG_TARGET_BUILD): | host-gcc-intermediate
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index eef9f9c..c84fdaa 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -22,8 +22,21 @@ source "package/linux-headers/Config.in.host"
 
 choice
 	prompt "C library"
-	default BR2_TOOLCHAIN_UCLIBC
-	default BR2_TOOLCHAIN_BUILDROOT_EGLIBC if BR2_mips64 || BR2_mips64el
+	default BR2_TOOLCHAIN_UCLIBC_NG
+
+config BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
+	bool "uClibc-ng"
+	select BR2_TOOLCHAIN_USES_UCLIBC
+	depends on BR2_arcle   || BR2_arceb  || BR2_arm    || BR2_armeb    || \
+		   BR2_bfin    || BR2_i386   || BR2_m68k     || \
+		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
+		   BR2_powerpc || BR2_sh     || BR2_sparc  || BR2_xtensa   || \
+		   BR2_x86_64
+	help
+	  This option selects uClibc-ng as the C library for the
+	  cross-compilation toolchain.
+
+	  http://www.uclibc-ng.org
 
 config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc"
@@ -93,6 +106,7 @@ endchoice
 
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	string
+	default "uclibc-ng" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC_NG
 	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	# Both glibc and eglibc are handled by the package called
 	# 'glibc'
@@ -100,6 +114,7 @@ config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	default "glibc"  if BR2_TOOLCHAIN_BUILDROOT_GLIBC
 	default "musl"	 if BR2_TOOLCHAIN_BUILDROOT_MUSL
 
+source "package/uclibc-ng/Config.in"
 source "package/uclibc/Config.in"
 source "package/glibc/Config.in"
 source "package/binutils/Config.in.host"
-- 
1.7.10.4
