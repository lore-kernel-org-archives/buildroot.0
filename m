From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 5 Apr 2010 10:47:54 +0200
Subject: [Buildroot] [git commit master] toolchain: add uClibc 0.9.31,
	mark 0.9.30.x as recent
Message-ID: <20100405092239.7042888D31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net


commit: http://git.buildroot.net/buildroot/commit/?id=266fa65afb20bf93b813d96421dce537a4dd2742
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Enable susv3/susv4 legacy support for now, as a lot of packages (E.G.
busybox) breaks with the stricter interpretation in 0.9.31.
Also slightly tweak uclibc.mk as the "new" linuxthreads symbol changed.

Test built on x86/x86-64/ppc/arm/mips.

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 CHANGES                               |    5 +-
 toolchain/uClibc/Config.in            |    8 +-
 toolchain/uClibc/uClibc-0.9.31.config |  258 +++++++++++++++++++++++++++++++++
 toolchain/uClibc/uclibc.mk            |    4 +-
 4 files changed, 271 insertions(+), 4 deletions(-)
 create mode 100644 toolchain/uClibc/uClibc-0.9.31.config

diff --git a/CHANGES b/CHANGES
index 8a14e24..a105773 100644
--- a/CHANGES
+++ b/CHANGES
@@ -2,8 +2,9 @@
 
 	Cleaned up / restructured package menu.
 
-	Toolchain: uClibc 0.9.30.3, older 0.9.30.x removed. 2.6.33
-	kernel headers, binutils 2.20.1, removed broken nios2 support.
+	Toolchain: uClibc 0.9.30.3 / 0.9.31, older 0.9.30.x removed.
+	2.6.33 kernel headers, binutils 2.20.1, removed broken nios2
+	support.
 
 	X.org updated to 7.5.
 
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
index 351ccc3..e254f28 100644
--- a/toolchain/uClibc/Config.in
+++ b/toolchain/uClibc/Config.in
@@ -5,7 +5,7 @@ comment "uClibc Options"
 
 choice
 	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_30_2
+	default BR2_UCLIBC_VERSION_0_9_31
 	help
 	  Select the version of uClibc you wish to use.
 
@@ -20,8 +20,12 @@ choice
 		bool "uClibc 0.9.29"
 
 	config BR2_UCLIBC_VERSION_0_9_30
+		depends on BR2_DEPRECATED || BR2_RECENT
 		bool "uClibc 0.9.30.x"
 
+	config BR2_UCLIBC_VERSION_0_9_31
+		bool "uClibc 0.9.31.x"
+
 	config BR2_UCLIBC_VERSION_SNAPSHOT
 		bool "daily snapshot"
 
@@ -39,6 +43,7 @@ config BR2_UCLIBC_VERSION_STRING
 	default 0.9.28.3	if BR2_UCLIBC_VERSION_0_9_28_3
 	default 0.9.29		if BR2_UCLIBC_VERSION_0_9_29
 	default 0.9.30.3	if BR2_UCLIBC_VERSION_0_9_30
+	default 0.9.31		if BR2_UCLIBC_VERSION_0_9_31
 	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
 
 config BR2_UCLIBC_CONFIG
@@ -46,6 +51,7 @@ config BR2_UCLIBC_CONFIG
 	default "toolchain/uClibc/uClibc-0.9.28.config" if BR2_UCLIBC_VERSION_0_9_28_3
 	default "toolchain/uClibc/uClibc-0.9.29.config" if BR2_UCLIBC_VERSION_0_9_29
 	default "toolchain/uClibc/uClibc-0.9.30.config" if BR2_UCLIBC_VERSION_0_9_30
+	default "toolchain/uClibc/uClibc-0.9.31.config" if BR2_UCLIBC_VERSION_0_9_31
 	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
 	help
 	  Some people may wish to use their own modified uClibc configuration
diff --git a/toolchain/uClibc/uClibc-0.9.31.config b/toolchain/uClibc/uClibc-0.9.31.config
new file mode 100644
index 0000000..8af08d9
--- /dev/null
+++ b/toolchain/uClibc/uClibc-0.9.31.config
@@ -0,0 +1,258 @@
+#
+# Automatically generated make config: don't edit
+# Version: 0.9.31
+# Sun Apr  4 10:43:39 2010
+#
+# TARGET_alpha is not set
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
+
+#
+# Target Architecture Features and Options
+#
+TARGET_ARCH="none"
+FORCE_OPTIONS_FOR_ARCH=y
+# ARCH_LITTLE_ENDIAN is not set
+# ARCH_BIG_ENDIAN is not set
+# ARCH_WANTS_LITTLE_ENDIAN is not set
+# ARCH_WANTS_BIG_ENDIAN is not set
+TARGET_SUBARCH=""
+
+#
+# Using Little Endian
+#
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
+FORCE_SHAREABLE_TEXT_SEGMENTS=y
+LDSO_LDD_SUPPORT=y
+# LDSO_CACHE_SUPPORT is not set
+# LDSO_PRELOAD_FILE_SUPPORT is not set
+# UCLIBC_STATIC_LDCONFIG is not set
+LDSO_RUNPATH=y
+LDSO_SEARCH_INTERP_PATH=y
+UCLIBC_CTOR_DTOR=y
+# LDSO_GNU_HASH_SUPPORT is not set
+# HAS_NO_THREADS is not set
+LINUXTHREADS_OLD=y
+# LINUXTHREADS_NEW is not set
+UCLIBC_HAS_THREADS=y
+# PTHREADS_DEBUG_SUPPORT is not set
+UCLIBC_HAS_SYSLOG=y
+UCLIBC_HAS_LFS=y
+# MALLOC is not set
+# MALLOC_SIMPLE is not set
+MALLOC_STANDARD=y
+MALLOC_GLIBC_COMPAT=y
+UCLIBC_DYNAMIC_ATEXIT=y
+# COMPAT_ATEXIT is not set
+UCLIBC_SUSV3_LEGACY=y
+# UCLIBC_SUSV3_LEGACY_MACROS is not set
+UCLIBC_SUSV4_LEGACY=y
+# UCLIBC_HAS_STUBS is not set
+UCLIBC_HAS_SHADOW=y
+# UCLIBC_HAS_PROGRAM_INVOCATION_NAME is not set
+UCLIBC_HAS_PTY=y
+ASSUME_DEVPTS=y
+UNIX98PTY_ONLY=y
+# UCLIBC_HAS_GETPT is not set
+# UCLIBC_HAS_LIBUTIL is not set
+UCLIBC_HAS_TM_EXTENSIONS=y
+UCLIBC_HAS_TZ_CACHING=y
+UCLIBC_HAS_TZ_FILE=y
+UCLIBC_HAS_TZ_FILE_READ_MANY=y
+UCLIBC_TZ_FILE_PATH="/etc/TZ"
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
+UCLIBC_LINUX_MODULE_24=y
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
+UCLIBC_HAS_CRYPT=y
+UCLIBC_HAS_NETWORK_SUPPORT=y
+UCLIBC_HAS_SOCKET=y
+UCLIBC_HAS_IPV4=y
+# UCLIBC_HAS_IPV6 is not set
+# UCLIBC_HAS_RPC is not set
+# UCLIBC_HAS_FULL_RPC is not set
+# UCLIBC_HAS_REENTRANT_RPC is not set
+UCLIBC_USE_NETLINK=y
+# UCLIBC_SUPPORT_AI_ADDRCONFIG is not set
+# UCLIBC_HAS_BSD_RES_CLOSE is not set
+UCLIBC_HAS_COMPAT_RES_STATE=y
+# UCLIBC_HAS_EXTRA_COMPAT_RES_STATE is not set
+# UCLIBC_HAS_LIBRESOLV_STUB is not set
+# UCLIBC_HAS_LIBNSL_STUB is not set
+
+#
+# String and Stdio Support
+#
+# UCLIBC_HAS_STRING_GENERIC_OPT is not set
+UCLIBC_HAS_STRING_ARCH_OPT=y
+UCLIBC_HAS_CTYPE_TABLES=y
+UCLIBC_HAS_CTYPE_SIGNED=y
+# UCLIBC_HAS_CTYPE_UNSAFE is not set
+# UCLIBC_HAS_CTYPE_CHECKED is not set
+UCLIBC_HAS_CTYPE_ENFORCED=y
+# UCLIBC_HAS_WCHAR is not set
+# UCLIBC_HAS_LOCALE is not set
+UCLIBC_HAS_HEXADECIMAL_FLOATS=y
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
+# UCLIBC_HAS_NFTW is not set
+UCLIBC_HAS_FTW=y
+UCLIBC_HAS_GLOB=y
+UCLIBC_HAS_GNU_GLOB=y
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
+WARNINGS="-Wall"
+# EXTRA_WARNINGS is not set
+# DOMULTI is not set
+# UCLIBC_MJN3_ONLY is not set
+
+# USE_BX is not set
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
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
index db346f0..52a8ae9 100644
--- a/toolchain/uClibc/uclibc.mk
+++ b/toolchain/uClibc/uclibc.mk
@@ -302,8 +302,10 @@ else
 endif
 ifeq ($(BR2_PTHREADS),y)
 	echo "LINUXTHREADS=y" >> $(UCLIBC_DIR)/.oldconfig
+	echo "LINUXTHREADS_NEW=y" >> $(UCLIBC_DIR)/.oldconfig
 else
 	echo "# LINUXTHREADS is not set" >> $(UCLIBC_DIR)/.oldconfig
+	echo "# LINUXTHREADS_NEW is not set" >> $(UCLIBC_DIR)/.oldconfig
 endif
 ifeq ($(BR2_PTHREADS_OLD),y)
 	echo "LINUXTHREADS_OLD=y" >> $(UCLIBC_DIR)/.oldconfig
@@ -410,7 +412,7 @@ $(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
 	touch $@
 
 $(UCLIBC_DIR)/.configured: $(LINUX_HEADERS_DIR)/.configured $(UCLIBC_DIR)/.config
-	set -x && $(MAKE1) -C $(UCLIBC_DIR) \
+	$(MAKE1) -C $(UCLIBC_DIR) \
 		ARCH="$(UCLIBC_TARGET_ARCH)" \
 		PREFIX=$(TOOLCHAIN_DIR)/uClibc_dev/ \
 		DEVEL_PREFIX=/usr/ \
-- 
1.6.3.3
