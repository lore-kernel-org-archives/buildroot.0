From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sun, 14 Oct 2012 01:14:43 +0200
Subject: [Buildroot] [PATCH 11/13] Add target to create a project directory
In-Reply-To: <20121013231344.17317.92930.stgit@localhost>
References: <20121013231344.17317.92930.stgit@localhost>
Message-ID: <20121013231443.17317.60675.stgit@localhost>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Makefile                              |   30 +++++++++++
 Makefile.project.tmpl                 |   40 +++++++++++++++
 package/busybox/busybox-1.20.x.config |   26 +++++----
 toolchain/uClibc/uClibc-0.9.33.config |   91 ++++++++++++++-------------------
 4 files changed, 121 insertions(+), 66 deletions(-)
 create mode 100644 Makefile.project.tmpl

diff --git a/Makefile b/Makefile
index 0e5b28e..a3b88f7 100644
--- a/Makefile
+++ b/Makefile
@@ -698,6 +698,33 @@ endif
 
 cross: $(BASE_TARGETS)
 
+ifneq ($(PROJECT_DIR),)
+ifeq ($(findstring -git,$(BR2_VERSION)),)
+BUILDROOT_VERSION = $(BR2_VERSION)
+else
+BUILDROOT_VERSION = snapshot
+endif
+
+# Write a buildroot config in the project dir, then use that defconfig to
+# re-generate the .config.  This replaces the config file paths with paths
+# pointing into PROJECT_DIR (unless they have been changed from their
+# default values).  The subsequent update-all-config writes all the config
+# files into the PROJECT_DIR.  That last step doesn't need to set PROJECT_DIR
+# or DEFCONFIG anymore, because they're already set in the new .config.
+projectdir:
+	mkdir -p $(PROJECT_DIR)
+	sed s/@BUILDROOT_VERSION@/$(BUILDROOT_VERSION)/g \
+		Makefile.project.tmpl > $(PROJECT_DIR)/Makefile
+	$(MAKE1) $(EXTRAMAKEARGS) \
+		DEFCONFIG=$(PROJECT_DIR)/buildroot.config \
+		savedefconfig
+	$(MAKE1) $(EXTRAMAKEARGS) \
+		PROJECT_DIR=$(PROJECT_DIR) \
+		DEFCONFIG=$(PROJECT_DIR)/buildroot.config \
+		defconfig
+	$(MAKE1) $(EXTRAMAKEARGS) update-all-config
+endif
+
 help:
 	@echo 'Cleaning:'
 	@echo '  clean                  - delete all files created by build'
@@ -756,6 +783,9 @@ endif
 	@echo '  source-check           - check selected packages for valid download URLs'
 	@echo '  external-deps          - list external packages used'
 	@echo '  legal-info             - generate info about license compliance'
+ifneq ($(PROJECT_DIR),)
+	@echo '  projectdir             - Prepare project directory with a Makefile.'
+endif
 	@echo
 	@echo '  make V=0|1             - 0 => quiet build (default), 1 => verbose build'
 	@echo '  make O=dir             - Locate all output files in "dir", including .config'
diff --git a/Makefile.project.tmpl b/Makefile.project.tmpl
new file mode 100644
index 0000000..b41180a
--- /dev/null
+++ b/Makefile.project.tmpl
@@ -0,0 +1,40 @@
+# This Makefile creates a build environment using the directory containing
+# this Makefile as the project directory.
+# If called from a different directory using 'make -f ...', the current
+# directory is used as the output directory.
+
+lastword = $(word $(words $(1)),$(1))
+makedir  = $(dir $(call lastword,$(MAKEFILE_LIST)))
+
+BR2_PROJECT_DIR = $(realpath $(makedir))
+BUILDROOT_DIR   = $(BR2_PROJECT_DIR)/buildroot
+BUILDROOT_VERSION = @BUILDROOT_VERSION@
+BUILDROOT_SITE    = http://buildroot.net/downloads
+BUILDROOT_SOURCE  = buildroot-$(BUILDROOT_VERSION).tar.bz2
+
+ifeq ($(O),)
+ifeq ($(makedir),./)
+# Building in project dir => create output dir
+O = $(CURDIR)/output
+else
+# Building from some other dir => use this dir as output dir
+O = $(CURDIR)
+endif
+endif
+
+.PHONY: all $(MAKECMDGOALS)
+
+all: $(BUILDROOT_DIR)
+	@$(MAKE) -C buildroot O=$(O) BR2_PROJECT_DIR=$(BR2_PROJECT_DIR) $(all)
+
+all     := $(filter-out all,$(MAKECMDGOALS))
+$(all): all
+        @:
+
+$(BUILDROOT_DIR):
+	mkdir -p $@
+	wget -O - $(BUILDROOT_SITE)/$(BUILDROOT_SOURCE) | \
+		tar -xjf - -C $@ --strip-components=1
+	for p in `ls $(makedir)/patches/buildroot/buildroot-* 2>/dev/null`; do \
+		patch -d $@ -p1 -i $$p; \
+	done
diff --git a/package/busybox/busybox-1.20.x.config b/package/busybox/busybox-1.20.x.config
index 5525434..84ae428 100644
--- a/package/busybox/busybox-1.20.x.config
+++ b/package/busybox/busybox-1.20.x.config
@@ -1,7 +1,7 @@
 #
 # Automatically generated make config: don't edit
-# Busybox version: 1.20.0
-# Sun Apr 22 10:09:56 2012
+# Busybox version: 1.20.2
+# Wed Sep 26 02:12:42 2012
 #
 CONFIG_HAVE_DOT_CONFIG=y
 
@@ -49,7 +49,7 @@ CONFIG_FEATURE_SUID=y
 # CONFIG_FEATURE_PREFER_APPLETS is not set
 CONFIG_BUSYBOX_EXEC_PATH="/proc/self/exe"
 CONFIG_FEATURE_SYSLOG=y
-# CONFIG_FEATURE_HAVE_RPC is not set
+CONFIG_FEATURE_HAVE_RPC=y
 
 #
 # Build Options
@@ -60,7 +60,7 @@ CONFIG_FEATURE_SYSLOG=y
 # CONFIG_BUILD_LIBBUSYBOX is not set
 # CONFIG_FEATURE_INDIVIDUAL is not set
 # CONFIG_FEATURE_SHARED_BUSYBOX is not set
-# CONFIG_LFS is not set
+CONFIG_LFS=y
 CONFIG_CROSS_COMPILER_PREFIX=""
 CONFIG_SYSROOT=""
 CONFIG_EXTRA_CFLAGS=""
@@ -583,7 +583,7 @@ CONFIG_MOUNT=y
 # CONFIG_FEATURE_MOUNT_VERBOSE is not set
 # CONFIG_FEATURE_MOUNT_HELPERS is not set
 # CONFIG_FEATURE_MOUNT_LABEL is not set
-# CONFIG_FEATURE_MOUNT_NFS is not set
+CONFIG_FEATURE_MOUNT_NFS=y
 CONFIG_FEATURE_MOUNT_CIFS=y
 CONFIG_FEATURE_MOUNT_FLAGS=y
 CONFIG_FEATURE_MOUNT_FSTAB=y
@@ -737,7 +737,7 @@ CONFIG_PING=y
 # CONFIG_PING6 is not set
 CONFIG_FEATURE_FANCY_PING=y
 # CONFIG_WHOIS is not set
-# CONFIG_FEATURE_IPV6 is not set
+CONFIG_FEATURE_IPV6=y
 # CONFIG_FEATURE_UNIX_LOCAL is not set
 # CONFIG_FEATURE_PREFER_IPV4_ADDRESS is not set
 # CONFIG_VERBOSE_RESOLUTION_ERRORS is not set
@@ -783,15 +783,15 @@ CONFIG_FEATURE_IFUPDOWN_IP=y
 # CONFIG_FEATURE_IFUPDOWN_IP_BUILTIN is not set
 # CONFIG_FEATURE_IFUPDOWN_IFCONFIG_BUILTIN is not set
 CONFIG_FEATURE_IFUPDOWN_IPV4=y
-# CONFIG_FEATURE_IFUPDOWN_IPV6 is not set
+CONFIG_FEATURE_IFUPDOWN_IPV6=y
 CONFIG_FEATURE_IFUPDOWN_MAPPING=y
 # CONFIG_FEATURE_IFUPDOWN_EXTERNAL_DHCP is not set
-CONFIG_INETD=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME=y
-CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN=y
+# CONFIG_INETD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_ECHO is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DISCARD is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_TIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_DAYTIME is not set
+# CONFIG_FEATURE_INETD_SUPPORT_BUILTIN_CHARGEN is not set
 # CONFIG_FEATURE_INETD_RPC is not set
 CONFIG_IP=y
 CONFIG_FEATURE_IP_ADDRESS=y
diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/toolchain/uClibc/uClibc-0.9.33.config
index eb39df6..e8cce34 100644
--- a/toolchain/uClibc/uClibc-0.9.33.config
+++ b/toolchain/uClibc/uClibc-0.9.33.config
@@ -1,18 +1,19 @@
 #
 # Automatically generated make config: don't edit
-# Version: 0.9.32-git
-# Fri Jul  9 22:31:59 2010
+# Version: 0.9.33.2
+# Sat Oct 13 16:50:09 2012
 #
 # TARGET_alpha is not set
 # TARGET_arm is not set
 # TARGET_avr32 is not set
 # TARGET_bfin is not set
+# TARGET_c6x is not set
 # TARGET_cris is not set
 # TARGET_e1 is not set
 # TARGET_frv is not set
 # TARGET_h8300 is not set
 # TARGET_hppa is not set
-# TARGET_i386 is not set
+TARGET_i386=y
 # TARGET_i960 is not set
 # TARGET_ia64 is not set
 # TARGET_m68k is not set
@@ -28,43 +29,39 @@
 # TARGET_vax is not set
 # TARGET_x86_64 is not set
 # TARGET_xtensa is not set
-# TARGET_c6x is not set
-
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
-
-# COMPILE_IN_THUMB_MODE is not set
-USE_BX=y
 
-TARGET_SUBARCH=""
 #
 # Target Architecture Features and Options
 #
-TARGET_ARCH="none"
+TARGET_ARCH="i386"
 FORCE_OPTIONS_FOR_ARCH=y
+# CONFIG_GENERIC_386 is not set
+# CONFIG_386 is not set
+# CONFIG_486 is not set
+# CONFIG_586 is not set
+# CONFIG_586MMX is not set
+CONFIG_686=y
+# CONFIG_PENTIUMII is not set
+# CONFIG_PENTIUMIII is not set
+# CONFIG_PENTIUM4 is not set
+# CONFIG_K6 is not set
+# CONFIG_K7 is not set
+# CONFIG_ELAN is not set
+# CONFIG_CRUSOE is not set
+# CONFIG_WINCHIPC6 is not set
+# CONFIG_WINCHIP2 is not set
+# CONFIG_CYRIXIII is not set
+# CONFIG_NEHEMIAH is not set
+TARGET_SUBARCH="i686"
+
 #
 # Using ELF file format
 #
-# ARCH_LITTLE_ENDIAN is not set
-# ARCH_BIG_ENDIAN is not set
-# ARCH_WANTS_LITTLE_ENDIAN is not set
-# ARCH_WANTS_BIG_ENDIAN is not set
+ARCH_LITTLE_ENDIAN=y
+
+#
+# Using Little Endian
+#
 ARCH_HAS_MMU=y
 ARCH_USE_MMU=y
 UCLIBC_HAS_FLOATS=y
@@ -73,16 +70,13 @@ DO_C99_MATH=y
 # DO_XSI_MATH is not set
 # UCLIBC_HAS_FENV is not set
 UCLIBC_HAS_LONG_DOUBLE_MATH=y
-KERNEL_HEADERS="/usr/src/linux/include"
+KERNEL_HEADERS="/home/arnout/src/buildroot/output-ext-toolchain-x86_64/toolchain/linux/include"
 HAVE_DOT_CONFIG=y
 
 #
 # General Library Settings
 #
-# HAVE_NO_PIC is not set
 DOPIC=y
-# ARCH_HAS_NO_SHARED is not set
-# ARCH_HAS_NO_LDSO is not set
 HAVE_SHARED=y
 # FORCE_SHAREABLE_TEXT_SEGMENTS is not set
 LDSO_LDD_SUPPORT=y
@@ -99,13 +93,14 @@ LDSO_LD_LIBRARY_PATH=y
 UCLIBC_CTOR_DTOR=y
 # LDSO_GNU_HASH_SUPPORT is not set
 # HAS_NO_THREADS is not set
-LINUXTHREADS_OLD=y
+# LINUXTHREADS_OLD is not set
 # LINUXTHREADS_NEW is not set
-# UCLIBC_HAS_THREADS_NATIVE is not set
+UCLIBC_HAS_THREADS_NATIVE=y
 UCLIBC_HAS_THREADS=y
+UCLIBC_HAS_TLS=y
 # PTHREADS_DEBUG_SUPPORT is not set
 UCLIBC_HAS_SYSLOG=y
-UCLIBC_HAS_LFS=y
+# UCLIBC_HAS_LFS is not set
 # MALLOC is not set
 # MALLOC_SIMPLE is not set
 MALLOC_STANDARD=y
@@ -165,8 +160,6 @@ UCLIBC_HAS_SOCKET=y
 UCLIBC_HAS_IPV4=y
 # UCLIBC_HAS_IPV6 is not set
 # UCLIBC_HAS_RPC is not set
-# UCLIBC_HAS_FULL_RPC is not set
-# UCLIBC_HAS_REENTRANT_RPC is not set
 UCLIBC_USE_NETLINK=y
 UCLIBC_SUPPORT_AI_ADDRCONFIG=y
 # UCLIBC_HAS_BSD_RES_CLOSE is not set
@@ -189,7 +182,6 @@ UCLIBC_HAS_CTYPE_CHECKED=y
 # UCLIBC_HAS_WCHAR is not set
 # UCLIBC_HAS_LOCALE is not set
 UCLIBC_HAS_HEXADECIMAL_FLOATS=y
-# UCLIBC_HAS_GLIBC_DIGIT_GROUPING is not set
 UCLIBC_HAS_GLIBC_CUSTOM_PRINTF=y
 # USE_OLD_VFPRINTF is not set
 UCLIBC_PRINTF_SCANF_POSITIONAL_ARGS=9
@@ -208,7 +200,6 @@ UCLIBC_HAS_STDIO_BUILTIN_BUFFER_NONE=y
 # UCLIBC_HAS_STDIO_GETC_MACRO is not set
 # UCLIBC_HAS_STDIO_PUTC_MACRO is not set
 UCLIBC_HAS_STDIO_AUTO_RW_TRANSITION=y
-# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set
 UCLIBC_HAS_FOPEN_EXCLUSIVE_MODE=y
 # UCLIBC_HAS_FOPEN_CLOSEEXEC_MODE is not set
 UCLIBC_HAS_GLIBC_CUSTOM_STREAMS=y
@@ -218,6 +209,7 @@ UCLIBC_HAS_ERRNO_MESSAGES=y
 UCLIBC_HAS_SIGNUM_MESSAGES=y
 # UCLIBC_HAS_SYS_SIGLIST is not set
 UCLIBC_HAS_GNU_GETOPT=y
+UCLIBC_HAS_STDIO_FUTEXES=y
 # UCLIBC_HAS_GNU_GETSUBOPT is not set
 
 #
@@ -248,24 +240,17 @@ HARDWIRED_ABSPATH=y
 #
 # UCLIBC_BUILD_PIE is not set
 # UCLIBC_HAS_ARC4RANDOM is not set
-# HAVE_NO_SSP is not set
-UCLIBC_HAS_SSP=y
-# UCLIBC_HAS_SSP_COMPAT is not set
-# SSP_QUICK_CANARY is not set
-PROPOLICE_BLOCK_ABRT=y
-# PROPOLICE_BLOCK_SEGV is not set
-# UCLIBC_BUILD_SSP is not set
+# UCLIBC_HAS_SSP is not set
 UCLIBC_BUILD_RELRO=y
 UCLIBC_BUILD_NOW=y
 UCLIBC_BUILD_NOEXECSTACK=y
 
 #
-# uClibc development/debugging options
+# Development/debugging options
 #
-CROSS_COMPILER_PREFIX=""
+CROSS_COMPILER_PREFIX="/home/arnout/src/buildroot/output-ext-toolchain-x86_64/host/usr/bin/i686-buildroot-linux-uclibc-"
 UCLIBC_EXTRA_CFLAGS=""
 # DODEBUG is not set
-# DODEBUG_PT is not set
 DOSTRIP=y
 # DOASSERTS is not set
 # SUPPORT_LD_DEBUG is not set
