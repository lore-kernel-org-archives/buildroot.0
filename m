From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 30 Jun 2013 21:29:05 +0200
Subject: [Buildroot] [PATCH 15/23] uclibc: convert to the package
	infrastructure
In-Reply-To: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1372620553-11416-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1372620553-11416-16-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/gcc/gcc-intermediate/gcc-intermediate.mk   |   2 +-
 ...__libc_epoll_pwait-compile-failure-on-x86.patch |   0
 ...x-e500-__fe_nomask_env-use-of-__set_errno.patch |   0
 .../0.9.32.1/uclibc-linuxthreads-errno-fix.patch   |   0
 .../uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch   |   0
 .../uclibc/0.9.32.1/uclibc-unshare.patch           |   0
 .../uclibc-OpenWRT-140-avr32_atomic_fix.patch      |   0
 .../uclibc-bits-time.h-sync-with-glibc-2.16.patch  |   0
 .../0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch  |   0
 .../uclibc/0.9.33.2/uclibc-dup3.patch              |   0
 package/uclibc/Config.in                           | 166 ++++++
 .../uClibc => package/uclibc}/uClibc-0.9.32.config |   0
 .../uClibc => package/uclibc}/uClibc-0.9.33.config |   0
 .../uclibc}/uClibc-snapshot.config                 |   0
 package/uclibc/uclibc.mk                           | 484 ++++++++++++++++
 toolchain/toolchain-buildroot.mk                   |   4 -
 toolchain/toolchain-buildroot/Config.in            |   2 +-
 toolchain/toolchain-crosstool-ng.mk                |   1 -
 toolchain/toolchain-crosstool-ng/crosstool-ng.mk   |   2 +-
 toolchain/toolchain-external.mk                    |   1 -
 toolchain/uClibc/Config.in                         |  97 ----
 toolchain/uClibc/uclibc.mk                         | 610 ---------------------
 22 files changed, 653 insertions(+), 716 deletions(-)
 rename toolchain/uClibc/uClibc-0.9.32.1-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch => package/uclibc/0.9.32.1/uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch => package/uclibc/0.9.32.1/uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-linuxthreads-errno-fix.patch => package/uclibc/0.9.32.1/uclibc-linuxthreads-errno-fix.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-sparc-errno-fix.patch => package/uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.32.1-unshare.patch => package/uclibc/0.9.32.1/uclibc-unshare.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch => package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-bits-time.h-sync-with-glibc-2.16.patch => package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch => package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch (100%)
 rename toolchain/uClibc/uClibc-0.9.33.2-dup3.patch => package/uclibc/0.9.33.2/uclibc-dup3.patch (100%)
 create mode 100644 package/uclibc/Config.in
 rename {toolchain/uClibc => package/uclibc}/uClibc-0.9.32.config (100%)
 rename {toolchain/uClibc => package/uclibc}/uClibc-0.9.33.config (100%)
 rename {toolchain/uClibc => package/uclibc}/uClibc-snapshot.config (100%)
 create mode 100644 package/uclibc/uclibc.mk
 delete mode 100644 toolchain/uClibc/Config.in
 delete mode 100644 toolchain/uClibc/uclibc.mk

diff --git a/package/gcc/gcc-intermediate/gcc-intermediate.mk b/package/gcc/gcc-intermediate/gcc-intermediate.mk
index 6b6b57e..3a71671 100644
--- a/package/gcc/gcc-intermediate/gcc-intermediate.mk
+++ b/package/gcc/gcc-intermediate/gcc-intermediate.mk
@@ -10,7 +10,7 @@ GCC_INTERMEDIATE_SOURCE  = $(GCC_SOURCE)
 
 HOST_GCC_INTERMEDIATE_DEPENDENCIES = \
 	$(HOST_GCC_COMMON_DEPENDENCIES) \
-	uclibc-configured
+	uclibc-configure
 
 HOST_GCC_INTERMEDIATE_EXTRACT_CMDS = $(HOST_GCC_EXTRACT_CMDS)
 
diff --git a/toolchain/uClibc/uClibc-0.9.32.1-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch b/package/uclibc/0.9.32.1/uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32.1-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
rename to package/uclibc/0.9.32.1/uclibc-Fix-__libc_epoll_pwait-compile-failure-on-x86.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32.1-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch b/package/uclibc/0.9.32.1/uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32.1-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
rename to package/uclibc/0.9.32.1/uclibc-Fix-e500-__fe_nomask_env-use-of-__set_errno.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32.1-linuxthreads-errno-fix.patch b/package/uclibc/0.9.32.1/uclibc-linuxthreads-errno-fix.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32.1-linuxthreads-errno-fix.patch
rename to package/uclibc/0.9.32.1/uclibc-linuxthreads-errno-fix.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32.1-sparc-errno-fix.patch b/package/uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32.1-sparc-errno-fix.patch
rename to package/uclibc/0.9.32.1/uclibc-sparc-errno-fix.patch
diff --git a/toolchain/uClibc/uClibc-0.9.32.1-unshare.patch b/package/uclibc/0.9.32.1/uclibc-unshare.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32.1-unshare.patch
rename to package/uclibc/0.9.32.1/uclibc-unshare.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch b/package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.2-OpenWRT-140-avr32_atomic_fix.patch
rename to package/uclibc/0.9.33.2/uclibc-OpenWRT-140-avr32_atomic_fix.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33.2-bits-time.h-sync-with-glibc-2.16.patch b/package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.2-bits-time.h-sync-with-glibc-2.16.patch
rename to package/uclibc/0.9.33.2/uclibc-bits-time.h-sync-with-glibc-2.16.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch b/package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.2-define-MSG_CMSG_CLOEXEC.patch
rename to package/uclibc/0.9.33.2/uclibc-define-MSG_CMSG_CLOEXEC.patch
diff --git a/toolchain/uClibc/uClibc-0.9.33.2-dup3.patch b/package/uclibc/0.9.33.2/uclibc-dup3.patch
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.2-dup3.patch
rename to package/uclibc/0.9.33.2/uclibc-dup3.patch
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
new file mode 100644
index 0000000..22c70a2
--- /dev/null
+++ b/package/uclibc/Config.in
@@ -0,0 +1,166 @@
+comment "uClibc Options"
+
+choice
+	prompt "uClibc C library Version"
+	default BR2_UCLIBC_VERSION_0_9_33
+	help
+	  Select the version of uClibc you wish to use.
+
+	config BR2_UCLIBC_VERSION_0_9_32
+		bool "uClibc 0.9.32.x"
+		depends on !(BR2_arc || BR2_avr32 || BR2_sh || BR2_xtensa)
+
+	config BR2_UCLIBC_VERSION_0_9_33
+		bool "uClibc 0.9.33.x"
+		depends on !(BR2_arc || BR2_xtensa)
+
+	config BR2_UCLIBC_VERSION_0_9_33_ARC
+		bool "uClibc 0.9.33.x-arc"
+		depends on BR2_arc
+
+	config BR2_UCLIBC_VERSION_SNAPSHOT
+		bool "daily snapshot"
+
+endchoice
+
+config BR2_USE_UCLIBC_SNAPSHOT
+	string "Date (yyyymmdd) of snapshot or 'snapshot' for latest"
+	default "snapshot"
+	depends on BR2_UCLIBC_VERSION_SNAPSHOT
+	help
+	    Use latest snapshot or one from a specific date?
+
+config BR2_UCLIBC_VERSION_STRING
+	string
+	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
+	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
+	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
+	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
+
+config BR2_UCLIBC_CONFIG
+	string "uClibc configuration file to use?"
+	default "package/uclibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
+	default "package/uclibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
+	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_0_9_33_ARC
+	default "package/uclibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
+	help
+	  Some people may wish to use their own modified uClibc configuration
+	  file and will specify their config file location with this option.
+	  See also docs/README in this package.
+	  If unsure, use the default.
+
+config BR2_UCLIBC_INSTALL_TEST_SUITE
+	bool "Compile and install uClibc tests"
+	select BR2_PACKAGE_MAKE
+	help
+	  Enabling this option will compile and install the uClibc test suite.
+	  This is useful if you want to check if the uClibc library is working
+	  for your architecture and/or help developing uClibc.
+
+	  The test suite will be installed into /root/uClibc directory. To run
+	  the test suite enter the /root/uClibc/test directory and type
+	  "make UCLIBC_ONLY=1 CC=/bin/true check".
+
+	  See the /root/uClibc/test/README for additional information.
+
+	  This is not needed at all for normal builds, so you can safely say no
+	  if you do not plan to dig into your C library.
+
+# Mapping from the Buildroot architecture configuration options to the
+# uClibc architecture names.
+config BR2_UCLIBC_TARGET_ARCH
+	string
+	default arc	   if BR2_arcle || BR2_arceb
+	default arm	   if BR2_arm	|| BR2_armeb
+	default avr32	   if BR2_avr32
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
+# This is only useful for uClibc <= 0.9.32. It can be removed once
+# Buildroot will support only uClibc >= 0.9.33 on ARM.
+config BR2_UCLIBC_ARM_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
+	default GENERIC_ARM	if BR2_fa526
+	default ARM7TDMI	if BR2_arm7tdmi
+	default ARM720T		if BR2_arm720t
+	default ARM920T		if BR2_arm920t
+	default ARM922T		if BR2_arm922t
+	default ARM926T		if BR2_arm926t
+	default ARM10T		if BR2_arm10t
+	default ARM1136JF_S	if BR2_arm1136jf_s
+	default ARM1176JZ_S	if BR2_arm1176jz_s
+	default ARM1176JZF_S	if BR2_arm1176jzf_s
+	default ARM_SA1100	if BR2_strongarm
+	default ARM_XSCALE	if BR2_xscale
+	default ARM_IWMMXT	if BR2_iwmmxt
+	default ARM_CORTEXA8	if BR2_cortex_a8
+	default ARM_CORTEXA9	if BR2_cortex_a9
+
+config BR2_UCLIBC_ARM_ABI
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
+	default OABI if BR2_ARM_OABI
+	default EABI if BR2_ARM_EABI
+
+config BR2_UCLIBC_ARM_BX
+	bool
+	depends on BR2_UCLIBC_TARGET_ARCH = "arm"
+	default y if !BR2_fa265 && !BR2_strongarm
+
+config BR2_UCLIBC_MIPS_ABI
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
+	default O32 if BR2_MIPS_OABI32
+	default N32 if BR2_MIPS_NABI32
+	default N64 if BR2_MIPS_NABI64
+
+config BR2_UCLIBC_MIPS_ISA
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "mips"
+	default 1 if BR2_mips_1
+	default 2 if BR2_mips_2
+	default 3 if BR2_mips_3
+	default 4 if BR2_mips_4
+	default mips32 if BR2_mips_32
+	default mips32r2 if BR2_mips_32r2
+	default mips64 if BR2_mips_64
+
+config BR2_UCLIBC_SH_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "sh"
+	default SHA2 if BR2_sh2
+	default SH3  if BR2_sh3 || BR2_sh3eb
+	default SH4  if BR2_sh4 || BR2_sh4eb
+
+config BR2_UCLIBC_SPARC_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "sparc"
+	default V7	if BR2_sparc_v7 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
+	default V8	if BR2_sparc_v8 || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
+
+config BR2_UCLIBC_POWERPC_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "powerpc"
+	default CLASSIC if !BR2_powerpc_8540 && !BR2_powerpc_8548 && !BR2_powerpc_e500mc
+	default E500    if BR2_powerpc_8540 || BR2_powerpc_8548 || BR2_powerpc_e500mc
+
+config BR2_UCLIBC_X86_TYPE
+	string
+	depends on BR2_UCLIBC_TARGET_ARCH = "i386"
+	default 386     if BR2_x86_i386
+	default 486	if BR2_x86_i486
+	default 586	if BR2_x86_i586
+	default 586MMX	if BR2_x86_pentium_mmx
+	default 686	if BR2_x86_i686 || BR2_x86_pentiumpro
+	default PENTIUMII  if BR2_x86_pentium2
+	default PENTIUMIII if BR2_x86_pentium3
+	default PENTIUM4   if BR2_x86_pentium4 || BR2_x86_pentium_m || \
+			      BR2_x86_nocona || BR2_x86_core2
diff --git a/toolchain/uClibc/uClibc-0.9.32.config b/package/uclibc/uClibc-0.9.32.config
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.32.config
rename to package/uclibc/uClibc-0.9.32.config
diff --git a/toolchain/uClibc/uClibc-0.9.33.config b/package/uclibc/uClibc-0.9.33.config
similarity index 100%
rename from toolchain/uClibc/uClibc-0.9.33.config
rename to package/uclibc/uClibc-0.9.33.config
diff --git a/toolchain/uClibc/uClibc-snapshot.config b/package/uclibc/uClibc-snapshot.config
similarity index 100%
rename from toolchain/uClibc/uClibc-snapshot.config
rename to package/uclibc/uClibc-snapshot.config
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
new file mode 100644
index 0000000..1c5340c
--- /dev/null
+++ b/package/uclibc/uclibc.mk
@@ -0,0 +1,484 @@
+################################################################################
+#
+# uclibc
+#
+################################################################################
+
+UCLIBC_VERSION = $(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
+UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.xz
+
+ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
+UCLIBC_SITE = http://www.uclibc.org/downloads/snapshots
+else ifeq ($(findstring arc,$(UCLIBC_VERSION)),arc)
+UCLIBC_SITE = $(BR2_ARC_SITE)
+UCLIBC_SOURCE = uClibc-$(UCLIBC_VERSION).tar.bz2
+else
+UCLIBC_SITE = http://www.uclibc.org/downloads
+endif
+
+UCLIBC_INSTALL_STAGING = YES
+
+# Before uClibc is configured, we must have the first stage
+# cross-compiler and the kernel headers
+UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
+
+# Before uClibc is built, we must have the second stage cross-compiler
+uclibc-build: host-gcc-intermediate
+
+# specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
+# setting.
+ifndef UCLIBC_CONFIG_FILE
+UCLIBC_CONFIG_FILE = $(call qstrip,$(BR2_UCLIBC_CONFIG))
+endif
+
+UCLIBC_TARGET_ARCH = $(call qstrip,$(BR2_UCLIBC_TARGET_ARCH))
+
+ifeq ($(GENERATE_LOCALE),)
+# We need at least one locale
+UCLIBC_LOCALES = en_US
+else
+# Strip out the encoding part of locale names, if any
+UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
+		   $(firstword $(subst .,$(space),$(locale))))
+endif
+
+#
+# Utility functions to manipulation the uClibc configuration file
+#
+
+define UCLIBC_OPT_SET
+	$(SED) '/$(1)/d' $(3)/.config
+	echo '$(1)=$(2)' >> $(3)/.config
+endef
+
+define UCLIBC_OPT_UNSET
+	$(SED) '/$(1)/d' $(2)/.config
+	echo '# $(1) is not set' >> $(2)/.config
+endef
+
+#
+# ARM definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),arm)
+UCLIBC_ARM_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_ARM_TYPE))
+
+define UCLIBC_ARM_TYPE_CONFIG
+	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
+		$(@D)/.config
+	$(call UCLIBC_OPT_SET,$(UCLIBC_ARM_TYPE),y,$(@D))
+endef
+
+UCLIBC_ARM_ABI = CONFIG_ARM_$(call qstrip,$(BR2_UCLIBC_ARM_ABI))
+
+define UCLIBC_ARM_ABI_CONFIG
+	$(SED) '/CONFIG_ARM_.ABI/d' $(@D)/.config
+	$(call UCLIBC_OPT_SET,$(UCLIBC_ARM_ABI),y,$(@D))
+endef
+
+ifeq ($(BR2_UCLIBC_ARM_BX),y)
+define UCLIBC_ARM_BX_CONFIG
+	$(call UCLIBC_OPT_SET,USE_BX,y,$(@D))
+endef
+else
+define UCLIBC_ARM_BX_CONFIG
+	$(call UCLIBC_OPT_UNSET,USE_BX,y,$(@D))
+endef
+endif
+
+endif # arm
+
+#
+# MIPS definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),mips)
+UCLIBC_MIPS_ABI = CONFIG_MIPS_$(call qstrip,$(BR2_UCLIBC_MIPS_ABI))_ABI
+define UCLIBC_MIPS_ABI_CONFIG
+	$(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(@D)/.config
+	$(call UCLIBC_OPT_SET,$(UCLIBC_MIPS_ABI),y,$(@D))
+endef
+
+UCLIBC_MIPS_ISA = CONFIG_MIPS_ISA_$(call qstrip,$(BR2_UCLIBC_MIPS_ISA))
+define UCLIBC_MIPS_ISA_CONFIG
+	$(SED) '/CONFIG_MIPS_ISA_.*/d' $(@D)/.config
+	$(call UCLIBC_OPT_SET,$(UCLIBC_MIPS_ISA),y,$(@D))
+endef
+endif # mips
+
+#
+# SH definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),sh)
+UCLIBC_SH_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_SH_TYPE))
+define UCLIBC_SH_TYPE_CONFIG
+	$(SED) '/CONFIG_SH[234A]*/d' $(@D)/.config
+	$(call UCLIBC_OPT_SET,$(UCLIBC_SH_TYPE),y,$(@?))
+endef
+endif # sh
+
+#
+# SPARC definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),sparc)
+UCLIBC_SPARC_TYPE = CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_SPARC_TYPE))
+define UCLIBC_SPARC_TYPE_CONFIG
+	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
+		 $(@?)/.config
+	$(call UCLIBC_OPT_SET,$(UCLIBC_SPARC_TYPE),y,$(@D))
+endef
+endif # sparc
+
+#
+# PowerPC definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
+UCLIBC_POWERPC_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_POWERPC_TYPE))
+define UCLIBC_POWERPC_TYPE_CONFIG
+	$(call UCLIBC_OPT_UNSET,CONFIG_GENERIC,$(@D))
+	$(call UCLIBC_OPT_UNSET,CONFIG_E500,$(@D))
+	$(call UCLIBC_OPT_SET,$(UCLIBC_POWERPC_TYPE),y,$(@?))
+endef
+endif # powerpc
+
+#
+# AVR32 definitions
+#
+
+ifeq ($(UCLIBC_TARGET_ARCH),avr32)
+define UCLIBC_AVR32_CONFIG
+	$(call UCLIBC_OPT_SET,LINKRELAX,y,$(@D))
+endef
+endif # avr32
+
+#
+# x86 definitions
+#
+ifeq ($(UCLIBC_TARGET_ARCH),i386)
+UCLIBC_X86_TYPE = CONFIG_$(call qstrip,$(BR2_UCLIBC_X86_TYPE))
+define UCLIBC_X86_TYPE_CONFIG
+	$(call UCLIBC_OPT_SET,$(UCLIBC_X86_TYPE),y,$(@D))
+endef
+endif
+
+#
+# ARC definitions
+#
+ifeq ($(UCLIBC_TARGET_ARCH),arc)
+REALLY_NOSTDLIB = -really-nostdlib
+endif
+
+#
+# Endianess
+#
+
+ifeq ($(call qstrip,$(BR2_ENDIAN)),BIG)
+define UCLIBC_ENDIAN_CONFIG
+	$(call UCLIBC_OPT_SET,ARCH_BIG_ENDIAN,y,$(@D))
+	$(call UCLIBC_OPT_SET,ARCH_WANTS_BIG_ENDIAN,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,ARCH_LITTLE_ENDIAN,$(@D))
+	$(call UCLIBC_OPT_UNSET,ARCH_WANTS_LITTLE_ENDIAN,$(@D))
+endef
+else
+define UCLIBC_ENDIAN_CONFIG
+	$(call UCLIBC_OPT_SET,ARCH_LITTLE_ENDIAN,y,$(@D))
+	$(call UCLIBC_OPT_SET,ARCH_WANTS_LITTLE_ENDIAN,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,ARCH_BIG_ENDIAN,$(@D))
+	$(call UCLIBC_OPT_UNSET,ARCH_WANTS_BIG_ENDIAN,$(@D))
+endef
+endif
+
+#
+# Largefile
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LARGEFILE),y)
+define UCLIBC_LARGEFILE_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_LFS,y,$(@D))
+endef
+else
+define UCLIBC_LARGEFILE_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_LFS,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_FOPEN_LARGEFILE_MODE,$(@D))
+endef
+endif
+
+#
+# IPv6
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
+UCLIBC_IPV6_CONFIG = $(call UCLIBC_OPT_SET,UCLIBC_HAS_IPV6,y,$(@D))
+else
+UCLIBC_IPV6_CONFIG = $(call UCLIBC_OPT_UNSET,UCLIBC_HAS_IPV6,$(@D))
+endif
+
+#
+# RPC
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_RPC),y)
+define UCLIBC_RPC_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_RPC,y,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_FULL_RPC,y,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_REENTRANT_RPC,y,$(@D))
+endef
+else
+define UCLIBC_RPC_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_RPC,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_FULL_RPC,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_REENTRANT_RPC,$(@D))
+endef
+endif
+
+#
+# soft-float
+#
+
+ifeq ($(BR2_SOFT_FLOAT),y)
+define UCLIBC_FLOAT_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_FPU,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_FLOATS,y,$(@D))
+	$(call UCLIBC_OPT_SET,DO_C99_MATH,y,$(@D))
+endef
+else
+define UCLIBC_FLOAT_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_FPU,y,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_FLOATS,y,$(@D))
+endef
+endif
+
+#
+# SSP
+#
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
+UCLIBC_SSP_CONFIG = $(call UCLIBC_OPT_SET,UCLIBC_HAS_SSP,y,$(@D))
+else
+UCLIBC_SSP_CONFIG = $(call UCLIBC_OPT_UNSET,UCLIBC_HAS_SSP,$(@D))
+endif
+
+#
+# Threads
+#
+ifeq ($(BR2_PTHREADS_NONE),y)
+define UCLIBC_THREAD_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_THREADS,$(@D))
+	$(call UCLIBC_OPT_UNSET,LINUXTHREADS,$(@D))
+	$(call UCLIBC_OPT_UNSET,LINUXTHREADS_OLD,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_THREADS_NATIVE,$(@D))
+endef
+else ifeq ($(BR2_PTHREADS),y)
+define UCLIBC_THREAD_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_THREADS,y,$(@D))
+	$(call UCLIBC_OPT_SET,LINUXTHREADS_NEW,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,LINUXTHREADS_OLD,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_THREADS_NATIVE,$(@D))
+endef
+else ifeq ($(BR2_PTHREADS_OLD),y)
+define UCLIBC_THREAD_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_THREADS,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,LINUXTHREADS_NEW,$(@D))
+	$(call UCLIBC_OPT_SET,LINUXTHREADS_OLD,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_THREADS_NATIVE,$(@D))
+endef
+else ifeq ($(BR2_PTHREADS_NATIVE),y)
+define UCLIBC_THREAD_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_THREADS,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,LINUXTHREADS_NEW,$(@D))
+	$(call UCLIBC_OPT_UNSET,LINUXTHREADS_OLD,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_THREADS_NATIVE,y,$(@D))
+endef
+endif
+
+#
+# Thread debug
+#
+
+ifeq ($(BR2_PTHREAD_DEBUG),y)
+UCLIBC_THREAD_DEBUG_CONFIG = $(call UCLIBC_OPT_SET,PTHREADS_DEBUG_SUPPORT,y,$(@D))
+else
+UCLIBC_THREAD_DEBUG_CONFIG = $(call UCLIBC_OPT_UNSET,PTHREADS_DEBUG_SUPPORT,$(@D))
+endif
+
+#
+# Locale
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LOCALE),y)
+define UCLIBC_LOCALE_CONFIG
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_LOCALE,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_BUILD_ALL_LOCALE,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_BUILD_MINIMAL_LOCALE,y,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_BUILD_MINIMAL_LOCALES,"$(UCLIBC_LOCALES)",$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_PREGENERATED_LOCALE_DATA,$(@D))
+	$(call UCLIBC_OPT_UNSET,DOWNLOAD_PREGENERATED_LOCALE_DATA,$(@D))
+	$(call UCLIBC_OPT_SET,UCLIBC_HAS_XLOCALE,y,$(@D))
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_GLIBC_DIGIT_GROUPING,$(@D))
+endef
+else
+define UCLIBC_LOCALE_CONFIG
+	$(call UCLIBC_OPT_UNSET,UCLIBC_HAS_LOCALE,$(@D))
+endef
+endif
+
+#
+# wchar
+#
+
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
+UCLIBC_WCHAR_CONFIG = $(call UCLIBC_OPT_SET,UCLIBC_HAS_WCHAR,y,$(@D))
+else
+UCLIBC_WCHAR_CONFIG = $(call UCLIBC_OPT_UNSET,UCLIBC_HAS_WCHAR,$(@D))
+endif
+
+#
+# debug
+#
+
+ifeq ($(BR2_ENABLE_DEBUG),y)
+UCLIBC_DEBUG_CONFIG = $(call UCLIBC_OPT_SET,DODEBUG,y,$(@D))
+endif
+
+#
+# strip
+#
+
+ifeq ($(BR2_STRIP_none),y)
+UCLIBC_STRIP_CONFIG = $(call UCLIBC_OPT_SET,DOSTRIP,y,$(@D))
+endif
+
+#
+# Commands
+#
+
+UCLIBC_MAKE_FLAGS = \
+	ARCH="$(UCLIBC_TARGET_ARCH)" \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
+	HOSTCC="$(HOSTCC)"
+
+define UCLIBC_CONFIGURE_CMDS
+	cp -f $(UCLIBC_CONFIG_FILE) $(@D)/.config
+	$(call UCLIBC_OPT_SET,CROSS_COMPILER_PREFIX,"$(TARGET_CROSS)",$(@D))
+	$(call UCLIBC_OPT_SET,TARGET_$(UCLIBC_TARGET_ARCH),y,$(@D))
+	$(call UCLIBC_OPT_SET,TARGET_ARCH,"$(UCLIBC_TARGET_ARCH)",$(@D))
+	$(call UCLIBC_OPT_SET,KERNEL_HEADERS,"$(STAGING_DIR)/usr/include",$(@D))
+	$(call UCLIBC_OPT_SET,RUNTIME_PREFIX,"/",$(@D))
+	$(call UCLIBC_OPT_SET,DEVEL_PREFIX,"/usr",$(@D))
+	$(call UCLIBC_OPT_SET,SHARED_LIB_LOADER_PREFIX,"/lib",$(@D))
+	$(UCLIBC_ARM_TYPE_CONFIG)
+	$(UCLIBC_ARM_ABI_CONFIG)
+	$(UCLIBC_ARM_BX_CONFIG)
+	$(UCLIBC_MIPS_ABI_CONFIG)
+	$(UCLIBC_MIPS_ISA_CONFIG)
+	$(UCLIBC_SH_TYPE_CONFIG)
+	$(UCLIBC_SPARC_TYPE_CONFIG)
+	$(UCLIBC_POWERPC_TYPE_CONFIG)
+	$(UCLIBC_AVR32_CONFIG)
+	$(UCLIBC_X86_TYPE_CONFIG)
+	$(UCLIBC_ENDIAN_CONFIG)
+	$(UCLIBC_LARGEFILE_CONFIG)
+	$(UCLIBC_IPV6_CONFIG)
+	$(UCLIBC_RPC_CONFIG)
+	$(UCLIBC_FLOAT_CONFIG)
+	$(UCLIBC_SSP_CONFIG)
+	$(UCLIBC_THREAD_CONFIG)
+	$(UCLIBC_THREAD_DEBUG_CONFIG)
+	$(UCLIBC_LOCALE_CONFIG)
+	$(UCLIBC_WCHAR_CONFIG)
+	$(UCLIBC_STRIP_CONFIG)
+	$(UCLIBC_DEBUG_CONFIG)
+	yes "" | $(MAKE1) -C $(@D) \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
+		oldconfig
+	$(MAKE1) -C $(UCLIBC_DIR) \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR) \
+		headers lib/crt1.o lib/crti.o lib/crtn.o \
+		install_headers
+	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) \
+		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
+	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) \
+		-nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
+	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(STAGING_DIR)/usr/lib/
+endef
+
+ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
+define UCLIBC_BUILD_TEST_SUITE
+	$(MAKE1) -C $(@D)/test \
+		$(UCLIBC_MAKE_FLAGS) \
+		ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
+		UCLIBC_ONLY=1 \
+		TEST_INSTALLED_UCLIBC=1 \
+		compile
+endef
+endif
+
+define UCLIBC_BUILD_CMDS
+	$(MAKE1) -C $(@D) \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX= \
+		DEVEL_PREFIX=/ \
+		RUNTIME_PREFIX=/ \
+		all
+	$(MAKE1) -C $(@D)/utils \
+		PREFIX=$(HOST_DIR) \
+		HOSTCC="$(HOSTCC)" hostutils
+	$(UCLIBC_BUILD_TEST_SUITE)
+endef
+
+ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
+define UCLIBC_INSTALL_TEST_SUITE
+	mkdir -p $(TARGET_DIR)/root/uClibc
+	cp -rdpf $(@D)/test $(TARGET_DIR)/root/uClibc
+	$(INSTALL) -D -m 0644 $(@D)/Rules.mak $(TARGET_DIR)/root/uClibc/Rules.mak
+	$(INSTALL) -D -m 0644 $(@D)/.config $(TARGET_DIR)/root/uClibc/.config
+endef
+endif
+
+define UCLIBC_INSTALL_TARGET_CMDS
+	$(MAKE1) -C $(@D) \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX=$(TARGET_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=/ \
+		install_runtime
+	$(MAKE1) -C $(@D) \
+		CC="$(TARGET_CC)" CPP="$(TARGET_CPP)" LD="$(TARGET_LD)" \
+		ARCH="$(UCLIBC_TARGET_ARCH)" \
+		PREFIX=$(TARGET_DIR) \
+		utils install_utils
+	$(UCLIBC_INSTALL_TEST_SUITE)
+endef
+
+define UCLIBC_INSTALL_STAGING_CMDS
+	$(MAKE1) -C $(@D) \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=/ \
+		install_runtime install_dev
+	install -D -m 0755 $(@D)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd
+	ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd
+	install -D -m 0755 $(@D)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig
+	ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig
+endef
+
+uclibc-menuconfig: dirs uclibc-configure
+	$(MAKE1) -C $(UCLIBC_DIR) \
+		$(UCLIBC_MAKE_FLAGS) \
+		PREFIX=$(STAGING_DIR) \
+		DEVEL_PREFIX=/usr/ \
+		RUNTIME_PREFIX=$(STAGING_DIR)/ \
+		menuconfig
+	rm -f $(UCLIBC_DIR)/.stamp_{built,target_installed,staging_installed}
+
+$(eval $(generic-package))
diff --git a/toolchain/toolchain-buildroot.mk b/toolchain/toolchain-buildroot.mk
index b2eb9de..e7241bf 100644
--- a/toolchain/toolchain-buildroot.mk
+++ b/toolchain/toolchain-buildroot.mk
@@ -1,7 +1,3 @@
-# Include files required for the internal toolchain backend
-
-include toolchain/uClibc/uclibc.mk
-
 # Triggerring the build of the host-gcc-final will automaticaly do the
 # build of binutils, uClibc, kernel headers and all the intermediate
 # gcc steps.
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 4ad0603..416695b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -2,7 +2,7 @@
 
 if BR2_TOOLCHAIN_BUILDROOT
 source "package/linux-headers/Config.in.host"
-source "toolchain/uClibc/Config.in"
+source "package/uclibc/Config.in"
 source "package/binutils/Config.in.host"
 source "package/gcc/Config.in.host"
 endif
diff --git a/toolchain/toolchain-crosstool-ng.mk b/toolchain/toolchain-crosstool-ng.mk
index 6ef73bb..9e666a0 100644
--- a/toolchain/toolchain-crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng.mk
@@ -3,4 +3,3 @@
 # Explicit ordering:
 include toolchain/helpers.mk
 include toolchain/toolchain-crosstool-ng/crosstool-ng.mk
-include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
index 59f18c7..79ad7e1 100644
--- a/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
+++ b/toolchain/toolchain-crosstool-ng/crosstool-ng.mk
@@ -10,7 +10,7 @@
 
 CTNG_DIR := $(BUILD_DIR)/build-toolchain
 
-CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/toolchain/uClibc/uClibc-0.9.33.config
+CTNG_UCLIBC_CONFIG_FILE := $(TOPDIR)/package/uclibc/uClibc-0.9.33.config
 CTNG_CONFIG_FILE:=$(call qstrip,$(BR2_TOOLCHAIN_CTNG_CONFIG))
 
 # Hack! ct-ng is in fact a Makefile script. As such, it accepts all
diff --git a/toolchain/toolchain-external.mk b/toolchain/toolchain-external.mk
index 1198a57..2f43db7 100644
--- a/toolchain/toolchain-external.mk
+++ b/toolchain/toolchain-external.mk
@@ -2,4 +2,3 @@
 
 include toolchain/helpers.mk
 include toolchain/toolchain-external/ext-tool.mk
-include toolchain/uClibc/uclibc.mk
diff --git a/toolchain/uClibc/Config.in b/toolchain/uClibc/Config.in
deleted file mode 100644
index ab1f600..0000000
--- a/toolchain/uClibc/Config.in
+++ /dev/null
@@ -1,97 +0,0 @@
-# Choose uClibc options
-#
-
-comment "uClibc Options"
-
-choice
-	prompt "uClibc C library Version"
-	default BR2_UCLIBC_VERSION_0_9_33
-	help
-	  Select the version of uClibc you wish to use.
-
-	config BR2_UCLIBC_VERSION_0_9_32
-		bool "uClibc 0.9.32.x"
-		depends on !(BR2_arc || BR2_avr32 || BR2_sh || BR2_xtensa)
-
-	config BR2_UCLIBC_VERSION_0_9_33
-		bool "uClibc 0.9.33.x"
-		depends on !(BR2_arc || BR2_xtensa)
-
-	config BR2_UCLIBC_VERSION_0_9_33_ARC
-		bool "uClibc 0.9.33.x-arc"
-		depends on BR2_arc
-
-	config BR2_UCLIBC_VERSION_SNAPSHOT
-		bool "daily snapshot"
-
-endchoice
-
-config BR2_USE_UCLIBC_SNAPSHOT
-	string "Date (yyyymmdd) of snapshot or 'snapshot' for latest"
-	default "snapshot"
-	depends on BR2_UCLIBC_VERSION_SNAPSHOT
-	help
-	    Use latest snapshot or one from a specific date?
-
-config BR2_UCLIBC_VERSION_STRING
-	string
-	default 0.9.32.1	if BR2_UCLIBC_VERSION_0_9_32
-	default 0.9.33.2	if BR2_UCLIBC_VERSION_0_9_33
-	default 0.9.33-arc	if BR2_UCLIBC_VERSION_0_9_33_ARC
-	default $BR2_USE_UCLIBC_SNAPSHOT	if BR2_UCLIBC_VERSION_SNAPSHOT
-
-config BR2_UCLIBC_CONFIG
-	string "uClibc configuration file to use?"
-	default "toolchain/uClibc/uClibc-0.9.32.config" if BR2_UCLIBC_VERSION_0_9_32
-	default "toolchain/uClibc/uClibc-0.9.33.config" if BR2_UCLIBC_VERSION_0_9_33
-	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_0_9_33_ARC
-	default "toolchain/uClibc/uClibc-snapshot.config" if BR2_UCLIBC_VERSION_SNAPSHOT
-	help
-	  Some people may wish to use their own modified uClibc configuration
-	  file and will specify their config file location with this option.
-	  See also docs/README in this package.
-	  If unsure, use the default.
-
-config BR2_UCLIBC_INSTALL_TEST_SUITE
-	bool "Compile and install uClibc tests"
-	select BR2_PACKAGE_MAKE
-	help
-	  Enabling this option will compile and install the uClibc test suite.
-	  This is useful if you want to check if the uClibc library is working
-	  for your architecture and/or help developing uClibc.
-
-	  The test suite will be installed into /root/uClibc directory. To run
-	  the test suite enter the /root/uClibc/test directory and type
-	  "make UCLIBC_ONLY=1 CC=/bin/true check".
-
-	  See the /root/uClibc/test/README for additional information.
-
-	  This is not needed at all for normal builds, so you can safely say no
-	  if you do not plan to dig into your C library.
-
-# This is only useful for uClibc <= 0.9.32. It can be removed once
-# Buildroot will support only uClibc >= 0.9.33 on ARM.
-config BR2_UCLIBC_ARM_TYPE
-	string
-	depends on BR2_arm || BR2_armeb
-	default GENERIC_ARM	if BR2_fa526
-	default ARM7TDMI	if BR2_arm7tdmi
-	default ARM720T		if BR2_arm720t
-	default ARM920T		if BR2_arm920t
-	default ARM922T		if BR2_arm922t
-	default ARM926T		if BR2_arm926t
-	default ARM10T		if BR2_arm10t
-	default ARM1136JF_S	if BR2_arm1136jf_s
-	default ARM1176JZ_S	if BR2_arm1176jz_s
-	default ARM1176JZF_S	if BR2_arm1176jzf_s
-	default ARM_SA1100	if BR2_strongarm
-	default ARM_XSCALE	if BR2_xscale
-	default ARM_IWMMXT	if BR2_iwmmxt
-	default ARM_CORTEXA8	if BR2_cortex_a8
-	default ARM_CORTEXA9	if BR2_cortex_a9
-
-config BR2_UCLIBC_SPARC_TYPE
-	string
-	depends on BR2_sparc
-	default V7	if BR2_sparc_v7 || BR2_sparc_cypress || BR2_sparc_sparclite || BR2_sparc_f930 || BR2_sparc_f934 || BR2_sparc_sparclite86x || BR2_sparc_sparclet || BR2_sparc_tsc701 || BR2_sparc_sparchfleon || BR2_sparc_sparcsfleon
-	default V8	if BR2_sparc_v8 || BR2_sparc_supersparc || BR2_sparc_hypersparc || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleonv8
diff --git a/toolchain/uClibc/uclibc.mk b/toolchain/uClibc/uclibc.mk
deleted file mode 100644
index 06f5b23..0000000
--- a/toolchain/uClibc/uclibc.mk
+++ /dev/null
@@ -1,610 +0,0 @@
-################################################################################
-#
-# uClibc (the C library)
-#
-################################################################################
-
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-
-# specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
-# setting.
-ifndef UCLIBC_CONFIG_FILE
-UCLIBC_CONFIG_FILE=$(call qstrip,$(BR2_UCLIBC_CONFIG))
-endif
-
-UCLIBC_VERSION:=$(call qstrip,$(BR2_UCLIBC_VERSION_STRING))
-
-ifeq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
-UCLIBC_SITE:=http://www.uclibc.org/downloads/snapshots
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc
-else ifeq ($(findstring arc,$(UCLIBC_VERSION)),arc)
-UCLIBC_SITE:=$(BR2_ARC_SITE)
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
-else
-UCLIBC_SITE:=http://www.uclibc.org/downloads
-UCLIBC_DIR:=$(TOOLCHAIN_DIR)/uClibc-$(UCLIBC_VERSION)
-endif
-
-UCLIBC_PATCH_DIR:=toolchain/uClibc/
-UCLIBC_SOURCE:=uClibc-$(UCLIBC_VERSION).tar.bz2
-
-UCLIBC_CAT:=$(BZCAT)
-
-UCLIBC_TARGET_ARCH:=$(shell $(SHELL) -c "echo $(ARCH) | sed \
-		-e 's/-.*//' \
-		-e 's/i.86/i386/' \
-		-e 's/sparc.*/sparc/' \
-		-e 's/arc.*/arc/g' \
-		-e 's/arm.*/arm/g' \
-		-e 's/m68k.*/m68k/' \
-		-e 's/ppc/powerpc/g' \
-		-e 's/v850.*/v850/g' \
-		-e 's/sh[234].*/sh/' \
-		-e 's/mips.*/mips/' \
-		-e 's/cris.*/cris/' \
-		-e 's/xtensa.*/xtensa/' \
-")
-
-UCLIBC_TARGET_ENDIAN:=$(call qstrip,$(BR2_ENDIAN))
-
-ifeq ($(UCLIBC_TARGET_ENDIAN),LITTLE)
-UCLIBC_NOT_TARGET_ENDIAN:=BIG
-else
-UCLIBC_NOT_TARGET_ENDIAN:=LITTLE
-endif
-
-UCLIBC_ARM_TYPE:=CONFIG_$(call qstrip,$(BR2_UCLIBC_ARM_TYPE))
-UCLIBC_SPARC_TYPE:=CONFIG_SPARC_$(call qstrip,$(BR2_UCLIBC_SPARC_TYPE))
-
-ifeq ($(GENERATE_LOCALE),)
-# We need at least one locale
-UCLIBC_LOCALES = en_US
-else
-# Strip out the encoding part of locale names, if any
-UCLIBC_LOCALES = $(foreach locale,$(GENERATE_LOCALE),\
-		   $(firstword $(subst .,$(space),$(locale))))
-endif
-
-$(DL_DIR)/$(UCLIBC_SOURCE):
-	$(Q)$(call MESSAGE,"Downloading uClibc")
-	$(call DOWNLOAD,$(UCLIBC_SITE:/=)/$(UCLIBC_SOURCE))
-
-uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
-$(UCLIBC_DIR)/.unpacked: $(DL_DIR)/$(UCLIBC_SOURCE)
-	$(Q)$(call MESSAGE,"Extracting uClibc")
-	mkdir -p $(TOOLCHAIN_DIR)
-	rm -rf $(UCLIBC_DIR)
-	$(UCLIBC_CAT) $(DL_DIR)/$(UCLIBC_SOURCE) | tar -C $(TOOLCHAIN_DIR) $(TAR_OPTIONS) -
-	touch $@
-
-uclibc-patched: $(UCLIBC_DIR)/.patched
-$(UCLIBC_DIR)/.patched: $(UCLIBC_DIR)/.unpacked
-	$(Q)$(call MESSAGE,"Patching uClibc")
-ifneq ($(BR2_UCLIBC_VERSION_SNAPSHOT),y)
-	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
-		uClibc-$(UCLIBC_VERSION)-\*.patch \
-		uClibc-$(UCLIBC_VERSION)-\*.patch.$(ARCH)
-else
-	support/scripts/apply-patches.sh $(UCLIBC_DIR) $(UCLIBC_PATCH_DIR) \
-		uClibc.\*.patch uClibc.\*.patch.$(ARCH)
-endif
-	touch $@
-
-
-# Some targets may wish to provide their own UCLIBC_CONFIG_FILE...
-$(UCLIBC_DIR)/.oldconfig: $(UCLIBC_DIR)/.patched $(UCLIBC_CONFIG_FILE)
-	$(Q)$(call MESSAGE,"Pre-configuring uClibc")
-	cp -f $(UCLIBC_CONFIG_FILE) $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's,^CROSS_COMPILER_PREFIX=.*,CROSS_COMPILER_PREFIX="$(TARGET_CROSS)",g' \
-		-e 's,# TARGET_$(UCLIBC_TARGET_ARCH) is not set,TARGET_$(UCLIBC_TARGET_ARCH)=y,g' \
-		-e 's,^TARGET_ARCH=".*",TARGET_ARCH=\"$(UCLIBC_TARGET_ARCH)\",g' \
-		-e 's,^KERNEL_HEADERS=.*,KERNEL_HEADERS=\"$(STAGING_DIR)/usr/include\",g' \
-		-e 's,^RUNTIME_PREFIX=.*,RUNTIME_PREFIX=\"/\",g' \
-		-e 's,^DEVEL_PREFIX=.*,DEVEL_PREFIX=\"/usr/\",g' \
-		-e 's,^SHARED_LIB_LOADER_PREFIX=.*,SHARED_LIB_LOADER_PREFIX=\"/lib\",g' \
-		$(UCLIBC_DIR)/.oldconfig
-ifeq ($(UCLIBC_TARGET_ARCH),arm)
-	(/bin/echo "# CONFIG_GENERIC_ARM is not set"; \
-	 /bin/echo "# CONFIG_ARM610 is not set"; \
-	 /bin/echo "# CONFIG_ARM710 is not set"; \
-	 /bin/echo "# CONFIG_ARM7TDMI is not set"; \
-	 /bin/echo "# CONFIG_ARM720T is not set"; \
-	 /bin/echo "# CONFIG_ARM920T is not set"; \
-	 /bin/echo "# CONFIG_ARM922T is not set"; \
-	 /bin/echo "# CONFIG_ARM926T is not set"; \
-	 /bin/echo "# CONFIG_ARM10T is not set"; \
-	 /bin/echo "# CONFIG_ARM1136JF_S is not set"; \
-	 /bin/echo "# CONFIG_ARM1176JZ_S is not set"; \
-	 /bin/echo "# CONFIG_ARM1176JZF_S is not set"; \
-	 /bin/echo "# CONFIG_ARM_SA110 is not set"; \
-	 /bin/echo "# CONFIG_ARM_SA1100 is not set"; \
-	 /bin/echo "# CONFIG_ARM_XSCALE is not set"; \
-	 /bin/echo "# CONFIG_ARM_IWMMXT is not set"; \
-	) >> $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's/^\(CONFIG_[^_]*[_]*ARM[^=]*\)=.*/# \1 is not set/g' \
-		 $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's/^.*$(UCLIBC_ARM_TYPE).*/$(UCLIBC_ARM_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/CONFIG_ARM_.ABI/d' $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_ARM_EABI),y)
-	/bin/echo "# CONFIG_ARM_OABI is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "CONFIG_ARM_EABI=y" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_ARM_OABI),y)
-	/bin/echo "CONFIG_ARM_OABI=y" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_ARM_EABI is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_fa526)$(BR2_strongarm),y)
-	$(SED) 's,USE_BX=y,# USE_BX is not set,' $(UCLIBC_DIR)/.oldconfig
-endif
-endif
-ifeq ($(UCLIBC_TARGET_ARCH),mips)
-	$(SED) '/CONFIG_MIPS_[NO].._ABI/d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/CONFIG_MIPS_ISA_.*/d' $(UCLIBC_DIR)/.oldconfig
-	(/bin/echo "# CONFIG_MIPS_O32_ABI is not set"; \
-	 /bin/echo "# CONFIG_MIPS_N32_ABI is not set"; \
-	 /bin/echo "# CONFIG_MIPS_N64_ABI is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_1 is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_2 is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_3 is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_4 is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_MIPS32 is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_MIPS32R2 is not set"; \
-	 /bin/echo "# CONFIG_MIPS_ISA_MIPS64 is not set"; \
-	) >> $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_MIPS_OABI32),y)
-	$(SED) 's/.*\(CONFIG_MIPS_O32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_MIPS_NABI32),y)
-	$(SED) 's/.*\(CONFIG_MIPS_N32_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_MIPS_NABI64),y)
-	$(SED) 's/.*\(CONFIG_MIPS_N64_ABI\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_1),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_1\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_2),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_2\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_3),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_3\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_4),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_4\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_32),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32\)[^R].*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_32r2),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS32R2\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_mips_64),y)
-	$(SED) 's/.*\(CONFIG_MIPS_ISA_MIPS64\).*/\1=y/' $(UCLIBC_DIR)/.oldconfig
-endif
-endif
-ifeq ($(UCLIBC_TARGET_ARCH),sh)
-	/bin/echo "# CONFIG_SH2A is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_SH2 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_SH3 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_SH4 is not set" >> $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_sh2a),y)
-	$(SED) 's,# CONFIG_SH2A is not set,CONFIG_SH2A=y,g' $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh2),y)
-	$(SED) 's,# CONFIG_SH2 is not set,CONFIG_SH2=y,g' $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FDPIC_ELF is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_FLAT_SEP_DATA is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# UCLIBC_FORMAT_SHARED_FLAT is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh3eb),y)
-	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh3),y)
-	$(SED) 's,# CONFIG_SH3 is not set,CONFIG_SH3=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh4eb),y)
-	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_sh4),y)
-	$(SED) 's,# CONFIG_SH4 is not set,CONFIG_SH4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-endif
-ifeq ($(UCLIBC_TARGET_ARCH),sparc)
-	$(SED) 's/^\(CONFIG_[^_]*[_]*SPARC[^=]*\)=.*/# \1 is not set/g' \
-		 $(UCLIBC_DIR)/.oldconfig
-	for i in V7 V8 V9 V9B; do echo "# CONFIG_SPARC_$$i is not set"; done \
-		>> $(UCLIBC_DIR)/.oldconfig
-	$(SED) 's/^.*$(UCLIBC_SPARC_TYPE)[^B].*/$(UCLIBC_SPARC_TYPE)=y/g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(UCLIBC_TARGET_ARCH),powerpc)
-ifeq ($(BR2_powerpc_8540)$(BR2_powerpc_8548)$(BR2_powerpc_e500mc),y)
-	/bin/echo "# CONFIG_CLASSIC is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "CONFIG_E500=y" >> $(UCLIBC_DIR)/.oldconfig
-else
-	/bin/echo "CONFIG_CLASSIC=y" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_E500 is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-endif
-ifeq ($(UCLIBC_TARGET_ARCH),avr32)
-	/bin/echo "LINKRELAX=y" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifneq ($(UCLIBC_TARGET_ENDIAN),)
-	# The above doesn't work for me, so redo
-	$(SED) 's/.*\(ARCH_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
-		-e 's/.*\(ARCH_WANTS_$(UCLIBC_NOT_TARGET_ENDIAN)_ENDIAN\).*/# \1 is not set/g' \
-		-e 's/.*\(ARCH_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
-		-e 's/.*\(ARCH_WANTS_$(UCLIBC_TARGET_ENDIAN)_ENDIAN\).*/\1=y/g' \
-		$(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LARGEFILE),y)
-	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=y,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,.*UCLIBC_HAS_LFS.*,UCLIBC_HAS_LFS=n,g' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/.*UCLIBC_HAS_FOPEN_LARGEFILE_MODE.*/d' $(UCLIBC_DIR)/.oldconfig
-	echo "# UCLIBC_HAS_FOPEN_LARGEFILE_MODE is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_IPV6),y)
-	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=y,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,^.*UCLIBC_HAS_IPV6.*,UCLIBC_HAS_IPV6=n,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_INET_RPC),y)
-	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=y,g' \
-		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=y,g' \
-		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=y,g' \
-		$(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,^.*UCLIBC_HAS_RPC.*,UCLIBC_HAS_RPC=n,g' \
-		-e 's,^.*UCLIBC_HAS_FULL_RPC.*,UCLIBC_HAS_FULL_RPC=n,g' \
-		-e 's,^.*UCLIBC_HAS_REENTRANT_RPC.*,UCLIBC_HAS_REENTRANT_RPC=n,g' \
-		$(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_SOFT_FLOAT),y)
-	$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n,g' \
-		-e 's,^[^_]*HAS_FPU.*,HAS_FPU=n,g' \
-		-e 's,.*UCLIBC_HAS_FLOATS.*,UCLIBC_HAS_FLOATS=y,g' \
-		-e 's,.*DO_C99_MATH.*,DO_C99_MATH=y,g' \
-		$(UCLIBC_DIR)/.oldconfig
-	#$(SED) 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=n\nHAS_FPU=n\nUCLIBC_HAS_FLOATS=y\nUCLIBC_HAS_SOFT_FLOAT=y,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) '/UCLIBC_HAS_FLOATS/d' \
-		-e 's,.*UCLIBC_HAS_FPU.*,UCLIBC_HAS_FPU=y\nHAS_FPU=y\nUCLIBC_HAS_FLOATS=y\n,g' \
-		$(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_USE_SSP),y)
-	$(SED) 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=y,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,^.*UCLIBC_HAS_SSP[^_].*,UCLIBC_HAS_SSP=n,g' $(UCLIBC_DIR)/.oldconfig
-endif
-	$(SED) '/UCLIBC_HAS_THREADS/d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/LINUXTHREADS/d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/LINUXTHREADS_OLD/d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/PTHREADS_DEBUG_SUPPORT/d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/UCLIBC_HAS_THREADS_NATIVE/d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/DODEBUG /d' $(UCLIBC_DIR)/.oldconfig
-	$(SED) '/DOSTRIP/d' $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_STRIP_none),y)
-	echo "# DOSTRIP is not set" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "DOSTRIP=y" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_ENABLE_DEBUG),y)
-	echo "DODEBUG=y" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "# DODEBUG is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_PTHREADS_NONE),y)
-	echo "# UCLIBC_HAS_THREADS is not set" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "UCLIBC_HAS_THREADS=y" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_PTHREADS),y)
-	echo "LINUXTHREADS=y" >> $(UCLIBC_DIR)/.oldconfig
-	echo "LINUXTHREADS_NEW=y" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "# LINUXTHREADS is not set" >> $(UCLIBC_DIR)/.oldconfig
-	echo "# LINUXTHREADS_NEW is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_PTHREADS_OLD),y)
-	echo "LINUXTHREADS_OLD=y" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "# LINUXTHREADS_OLD is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_PTHREADS_NATIVE),y)
-	echo "UCLIBC_HAS_THREADS_NATIVE=y" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "# UCLIBC_HAS_THREADS_NATIVE is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_PTHREAD_DEBUG),y)
-	echo "PTHREADS_DEBUG_SUPPORT=y" >> $(UCLIBC_DIR)/.oldconfig
-else
-	echo "# PTHREADS_DEBUG_SUPPORT is not set" >> $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_LOCALE),y)
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=y\n# UCLIBC_BUILD_ALL_LOCALE is not set\nUCLIBC_BUILD_MINIMAL_LOCALE=y\nUCLIBC_BUILD_MINIMAL_LOCALES="$(UCLIBC_LOCALES)"\nUCLIBC_PREGENERATED_LOCALE_DATA=n\nUCLIBC_DOWNLOAD_PREGENERATED_LOCALE_DATA=n\nUCLIBC_HAS_XLOCALE=y\nUCLIBC_HAS_GLIBC_DIGIT_GROUPING=n\n,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,^.*UCLIBC_HAS_LOCALE.*,UCLIBC_HAS_LOCALE=n,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT_WCHAR),y)
-	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=y,g' $(UCLIBC_DIR)/.oldconfig
-else
-	$(SED) 's,^.*UCLIBC_HAS_WCHAR.*,UCLIBC_HAS_WCHAR=n,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ("$(KERNEL_ARCH)","i386")
-	/bin/echo "# CONFIG_GENERIC_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_386 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_486 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_586 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_586MMX is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_686 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_PENTIUMII is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_PENTIUMIII is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_PENTIUM4 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_K6 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_K7 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_ELAN is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_CRUSOE is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_WINCHIPC6 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_WINCHIP2 is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_CYRIXIII is not set" >> $(UCLIBC_DIR)/.oldconfig
-	/bin/echo "# CONFIG_NEHEMIAH is not set" >> $(UCLIBC_DIR)/.oldconfig
-ifeq ($(BR2_x86_i386),y)
-	$(SED) 's,# CONFIG_386 is not set,CONFIG_386=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_i486),y)
-	$(SED) 's,# CONFIG_486 is not set,CONFIG_486=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_i586),y)
-	$(SED) 's,# CONFIG_586 is not set,CONFIG_586=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_pentium_mmx),y)
-	$(SED) 's,# CONFIG_586MMX is not set,CONFIG_586MMX=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_i686),y)
-	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_pentiumpro),y)
-	$(SED) 's,# CONFIG_686 is not set,CONFIG_686=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_pentium2),y)
-	$(SED) 's,# CONFIG_PENTIUMII is not set,CONFIG_PENTIUMII=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_pentium3),y)
-	$(SED) 's,# CONFIG_PENTIUMIII is not set,CONFIG_PENTIUMIII=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_pentium4),y)
-	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_pentium_m),y)
-	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_nocona),y)
-	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-ifeq ($(BR2_x86_core2),y)
-	$(SED) 's,# CONFIG_PENTIUM4 is not set,CONFIG_PENTIUM4=y,g' $(UCLIBC_DIR)/.oldconfig
-endif
-endif
-
-$(UCLIBC_DIR)/.config: $(UCLIBC_DIR)/.oldconfig
-	$(Q)$(call MESSAGE,"Configuring uClibc")
-	cp -f $(UCLIBC_DIR)/.oldconfig $(UCLIBC_DIR)/.config
-	mkdir -p $(STAGING_DIR)/usr/include
-	mkdir -p $(STAGING_DIR)/usr/lib
-	mkdir -p $(STAGING_DIR)/lib
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR) \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
-		HOSTCC="$(HOSTCC)" \
-		oldconfig
-	touch $@
-
-ifeq ($(BR2_CCACHE),y)
-# we'll need ccache for the host built before make oldconfig
-# if configured, otherwise uclibc-menuconfig will fail.
-# Use order-only dependency as host-ccache is a virtual target
-$(UCLIBC_DIR)/.config: | host-ccache
-endif
-
-# For ARC, libgcc is always included, even when -nostdlib is given. This
-# is related to some small pieces of code that are not always generated
-# by the compiler; a call to libgcc is used in those cases instead.
-#
-# During the initial stages of building the toolchain, this is a problem,
-# as libgcc does not exist yet. The ARC compiler supports -really-nostdlib
-# to override the default behavior.
-ifeq ($(BR2_arc),y)
-REALLY_NOSTDLIB=-really-nostdlib
-endif
-
-$(UCLIBC_DIR)/.configured: $(UCLIBC_DIR)/.config
-	$(Q)$(call MESSAGE,"Installing uClibc headers")
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR) \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
-		HOSTCC="$(HOSTCC)" headers \
-		lib/crt1.o lib/crti.o lib/crtn.o \
-		install_headers
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libc.so
-	$(TARGET_CROSS)gcc -nostdlib $(REALLY_NOSTDLIB) -nostartfiles -shared -x c /dev/null -o $(STAGING_DIR)/usr/lib/libm.so
-	cp -pLR $(UCLIBC_DIR)/lib/crt[1in].o $(STAGING_DIR)/usr/lib/
-	touch $@
-
-$(UCLIBC_DIR)/lib/libc.a: $(UCLIBC_DIR)/.configured $(HOST_GCC_INTERMEDIATE_TARGET_INSTALL_HOST)
-	$(Q)$(call MESSAGE,"Building uClibc")
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX= \
-		DEVEL_PREFIX=/ \
-		RUNTIME_PREFIX=/ \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
-		HOSTCC="$(HOSTCC)" \
-		all
-	touch -c $@
-
-uclibc-menuconfig: dirs $(UCLIBC_DIR)/.config
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=$(STAGING_DIR) \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
-		HOSTCC="$(HOSTCC)" \
-		menuconfig && \
-	touch -c $(UCLIBC_DIR)/.config
-
-
-$(STAGING_DIR)/usr/lib/libc.a: $(UCLIBC_DIR)/lib/libc.a
-	$(Q)$(call MESSAGE,"Installing uClibc to staging dir")
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(STAGING_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=/ \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
-		install_runtime install_dev
-	# Build the host utils. Need to add an install target...
-	$(MAKE1) -C $(UCLIBC_DIR)/utils \
-		PREFIX=$(HOST_DIR) \
-		HOSTCC="$(HOSTCC)" \
-		hostutils
-	if [ -f $(UCLIBC_DIR)/utils/ldd.host ]; then \
-		install -D $(UCLIBC_DIR)/utils/ldd.host $(HOST_DIR)/usr/bin/ldd; \
-		ln -sf ldd $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldd; \
-	fi
-	if [ -f $(UCLIBC_DIR)/utils/ldconfig.host ]; then \
-		install -D $(UCLIBC_DIR)/utils/ldconfig.host $(HOST_DIR)/usr/bin/ldconfig; \
-		ln -sf ldconfig $(HOST_DIR)/usr/bin/$(GNU_TARGET_NAME)-ldconfig; \
-	fi
-	touch -c $@
-
-ifneq ($(TARGET_DIR),)
-$(TARGET_DIR)/lib/libc.so.0: $(STAGING_DIR)/usr/lib/libc.a
-	$(Q)$(call MESSAGE,"Installing uClibc runtime to target dir")
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TARGET_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=/ \
-		CROSS_COMPILE="$(TARGET_CROSS)" \
-		UCLIBC_EXTRA_CFLAGS="$(TARGET_ABI)" \
-		install_runtime
-	touch -c $@
-
-$(TARGET_DIR)/usr/bin/ldd: $(cross_compiler)
-	$(Q)$(call MESSAGE,"Installing uClibc utils to target dir")
-	$(MAKE1) -C $(UCLIBC_DIR) CC=$(TARGET_CROSS)gcc \
-		CPP=$(TARGET_CROSS)cpp LD=$(TARGET_CROSS)ld \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TARGET_DIR) utils install_utils
-	touch -c $@
-
-ifneq ($(BR2_PREFER_STATIC_LIB),y)
-UCLIBC_TARGETS=$(TARGET_DIR)/lib/libc.so.0
-endif
-
-ifeq ($(BR2_UCLIBC_INSTALL_TEST_SUITE),y)
-UCLIBC_TARGETS+=uclibc-test
-endif
-endif
-
-uclibc: host-gcc-intermediate $(STAGING_DIR)/usr/lib/libc.a $(UCLIBC_TARGETS)
-
-uclibc-source: $(DL_DIR)/$(UCLIBC_SOURCE)
-
-uclibc-unpacked: $(UCLIBC_DIR)/.unpacked
-
-uclibc-config: $(UCLIBC_DIR)/.config
-
-uclibc-oldconfig: $(UCLIBC_DIR)/.oldconfig
-
-uclibc-update-config: uclibc-config
-	cp -f $(UCLIBC_DIR)/.config $(UCLIBC_CONFIG_FILE)
-
-uclibc-configured: host-gcc-initial linux-headers $(UCLIBC_DIR)/.configured
-
-uclibc-configured-source: uclibc-source
-
-uclibc-clean: uclibc-test-clean
-	-$(MAKE1) -C $(UCLIBC_DIR) ARCH="$(UCLIBC_TARGET_ARCH)" clean
-	rm -f $(UCLIBC_DIR)/.config
-
-uclibc-dirclean: uclibc-test-dirclean
-	rm -rf $(UCLIBC_DIR)
-
-uclibc-target-utils: $(TARGET_DIR)/usr/bin/ldd
-
-uclibc-target-utils-source: $(DL_DIR)/$(UCLIBC_SOURCE)
-
-$(UCLIBC_DIR)/test/unistd/errno:
-	$(Q)$(call MESSAGE,"Building uClibc test suite")
-	$(MAKE) -C $(UCLIBC_DIR)/test \
-	ARCH_CFLAGS=-I$(STAGING_DIR)/usr/include \
-	UCLIBC_ONLY=1 TEST_INSTALLED_UCLIBC=1 compile
-
-$(TARGET_DIR)/root/uClibc/test/unistd/errno: $(UCLIBC_DIR)/test/unistd/errno
-	$(Q)$(call MESSAGE,"Installing uClibc test suite to target dir")
-	mkdir -p $(TARGET_DIR)/root/uClibc
-	cp -rdpf $(UCLIBC_DIR)/test $(TARGET_DIR)/root/uClibc
-	$(INSTALL) $(UCLIBC_DIR)/Rules.mak $(TARGET_DIR)/root/uClibc
-	$(INSTALL) $(UCLIBC_DIR)/.config $(TARGET_DIR)/root/uClibc
-
-uclibc-test: $(STAGING_DIR)/usr/lib/libc.a $(TARGET_DIR)/root/uClibc/test/unistd/errno
-
-uclibc-test-source: uclibc-source
-
-uclibc-test-clean:
-	-$(MAKE) -C $(UCLIBC_DIR)/test clean
-	rm -rf $(TARGET_DIR)/root/uClibc
-
-uclibc-test-dirclean:
-	rm -rf $(TARGET_DIR)/root/uClibc
-
-################################################################################
-#
-# uClibc for the target just needs its header files
-# and whatnot installed.
-#
-################################################################################
-
-$(TARGET_DIR)/usr/lib/libc.a: $(STAGING_DIR)/usr/lib/libc.a
-	$(Q)$(call MESSAGE,"Installing uClibc development files to target dir")
-	$(MAKE1) -C $(UCLIBC_DIR) \
-		ARCH="$(UCLIBC_TARGET_ARCH)" \
-		PREFIX=$(TARGET_DIR) \
-		DEVEL_PREFIX=/usr/ \
-		RUNTIME_PREFIX=/ \
-		install_dev
-	# Install the kernel headers to the target dir if necessary
-	if [ ! -f $(TARGET_DIR)/usr/include/linux/version.h ]; then \
-		cp -pLR $(LINUX_HEADERS_DIR)/include/* \
-			$(TARGET_DIR)/usr/include/; \
-	fi
-	touch -c $@
-
-uclibc_target: cross_compiler uclibc $(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
-
-uclibc_target-clean: uclibc-test-clean
-	rm -rf $(TARGET_DIR)/usr/include \
-		$(TARGET_DIR)/usr/lib/libc.a $(TARGET_DIR)/usr/bin/ldd
-
-uclibc_target-dirclean: uclibc-test-dirclean
-	rm -rf $(TARGET_DIR)/usr/include
-
-endif
-- 
1.8.1.2
