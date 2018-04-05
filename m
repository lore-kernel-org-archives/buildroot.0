From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  5 Apr 2018 21:50:21 +0200
Subject: [Buildroot] [PATCH 07/23] toolchain, gcc, gdb, binutils,
 uclibc: remove Blackfin code
In-Reply-To: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
References: <20180405195037.32641-1-thomas.petazzoni@bootlin.com>
Message-ID: <20180405195037.32641-8-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This commit removes Blackfin related code from all toolchain code and
components.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk            |  6 -----
 package/gcc/Config.in.host              |  7 ------
 package/gcc/gcc-final/gcc-final.mk      |  4 ----
 package/gcc/gcc.mk                      | 41 ---------------------------------
 package/gdb/Config.in                   |  1 -
 package/gdb/gdb.mk                      |  8 -------
 package/uclibc/Config.in                |  3 +--
 toolchain/Config.in                     |  1 -
 toolchain/toolchain-buildroot/Config.in |  2 +-
 9 files changed, 2 insertions(+), 71 deletions(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 1bd01ecefc..fc3912654b 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -65,12 +65,6 @@ HOST_BINUTILS_CONF_ENV += MAKEINFO=true
 HOST_BINUTILS_MAKE_OPTS += MAKEINFO=true
 HOST_BINUTILS_INSTALL_OPTS += MAKEINFO=true install
 
-# gcc bug with Os/O1/O2/O3, PR77311
-# error: unable to find a register to spill in class 'CCREGS'
-ifeq ($(BR2_bfin),y)
-BINUTILS_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -O0"
-endif
-
 # Workaround a build issue with -Os for ARM Cortex-M cpus.
 # (Binutils 2.25.1 and 2.26.1)
 # https://sourceware.org/bugzilla/show_bug.cgi?id=20552
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 309ddf572a..425835d4b1 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -63,13 +63,6 @@ config BR2_GCC_VERSION_7_X
 
 endchoice
 
-# Indicates if GCC for architecture supports --with-{arch,cpu,..}  to
-# set default CFLAGS, otherwise values will be used by toolchain
-# wrapper.
-config BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
-	bool
-	default y if !BR2_bfin
-
 config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 	bool
 	default y
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index b7b27aec13..9897d18682 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -76,10 +76,6 @@ HOST_GCC_FINAL_CONF_OPTS += "--with-multilib-list=m4a,m4a-nofpu"
 HOST_GCC_FINAL_GCC_LIB_DIR = $(HOST_DIR)/$(GNU_TARGET_NAME)/lib/!m4*
 endif
 
-ifeq ($(BR2_bfin),y)
-HOST_GCC_FINAL_CONF_OPTS += --disable-symvers
-endif
-
 # libcilkrts does not support v8
 ifeq ($(BR2_sparc),y)
 HOST_GCC_FINAL_CONF_OPTS += --disable-libcilkrts
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index f42f36a967..0afb06a57e 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -200,7 +200,6 @@ HOST_GCC_COMMON_CONF_OPTS += --disable-decimal-float
 endif
 
 # Determine arch/tune/abi/cpu options
-ifeq ($(BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS),y)
 ifneq ($(call qstrip,$(BR2_GCC_TARGET_ARCH)),)
 HOST_GCC_COMMON_CONF_OPTS += --with-arch=$(BR2_GCC_TARGET_ARCH)
 endif
@@ -237,7 +236,6 @@ GCC_TARGET_MODE = $(call qstrip,$(BR2_GCC_TARGET_MODE))
 ifneq ($(GCC_TARGET_MODE),)
 HOST_GCC_COMMON_CONF_OPTS += --with-mode=$(GCC_TARGET_MODE)
 endif
-endif # BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
 
 # Enable proper double/long double for SPE ABI
 ifeq ($(BR2_powerpc_SPE),y)
@@ -265,45 +263,6 @@ HOST_GCC_COMMON_CONF_OPTS += \
 endif
 
 HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CROSS_PATH_SUFFIX='".br_real"'
-ifeq ($(BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS),)
-ifeq ($(call qstrip,$(BR2_GCC_TARGET_CPU_REVISION)),)
-HOST_GCC_COMMON_WRAPPER_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU))
-else
-HOST_GCC_COMMON_WRAPPER_TARGET_CPU := $(call qstrip,$(BR2_GCC_TARGET_CPU)-$(BR2_GCC_TARGET_CPU_REVISION))
-endif
-HOST_GCC_COMMON_WRAPPER_TARGET_ARCH := $(call qstrip,$(BR2_GCC_TARGET_ARCH))
-HOST_GCC_COMMON_WRAPPER_TARGET_ABI := $(call qstrip,$(BR2_GCC_TARGET_ABI))
-HOST_GCC_COMMON_WRAPPER_TARGET_NAN := $(call qstrip,$(BR2_GCC_TARGET_NAN))
-HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE := $(call qstrip,$(BR2_GCC_TARGET_FP32_MODE))
-HOST_GCC_COMMON_WRAPPER_TARGET_FPU := $(call qstrip,$(BR2_GCC_TARGET_FPU))
-HOST_GCC_COMMON_WRAPPER_TARGET_FLOAT_ABI := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
-HOST_GCC_COMMON_WRAPPER_TARGET_MODE := $(call qstrip,$(BR2_GCC_TARGET_MODE))
-
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_ARCH),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ARCH='"$(HOST_GCC_COMMON_WRAPPER_TARGET_ARCH)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_CPU),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_CPU)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_ABI),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_ABI)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_NAN),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_NAN='"$(HOST_GCC_COMMON_WRAPPER_TARGET_NAN)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FP32_MODE='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FP32_MODE)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FPU),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FPU)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_FLOAT_ABI='"$(HOST_GCC_COMMON_WRAPPER_TARGET_FLOATABI_)"'
-endif
-ifneq ($(HOST_GCC_COMMON_WRAPPER_TARGET_MODE),)
-HOST_GCC_COMMON_TOOLCHAIN_WRAPPER_ARGS += -DBR_MODE='"$(HOST_GCC_COMMON_WRAPPER_TARGET_MODE)"'
-endif
-endif # !BR2_GCC_ARCH_HAS_CONFIGURABLE_DEFAULTS
 
 # For gcc-initial, we need to tell gcc that the C library will be
 # providing the ssp support, as it can't guess it since the C library
diff --git a/package/gdb/Config.in b/package/gdb/Config.in
index af020f40c5..6eea73b071 100644
--- a/package/gdb/Config.in
+++ b/package/gdb/Config.in
@@ -2,7 +2,6 @@ config BR2_PACKAGE_GDB_ARCH_SUPPORTS
 	bool
 	default y
 	depends on !((BR2_arm || BR2_armeb) && BR2_BINFMT_FLAT)
-	depends on !BR2_bfin
 	depends on !BR2_microblaze
 	depends on !BR2_nios2
 	depends on !BR2_or1k
diff --git a/package/gdb/gdb.mk b/package/gdb/gdb.mk
index 5ca464ad46..ca71349cb3 100644
--- a/package/gdb/gdb.mk
+++ b/package/gdb/gdb.mk
@@ -215,16 +215,8 @@ else
 HOST_GDB_CONF_OPTS += --without-python
 endif
 
-# workaround a bug if in-tree build is used for bfin sim
-define HOST_GDB_BFIN_SIM_WORKAROUND
-	$(RM) $(@D)/sim/common/tconfig.h
-endef
-
 ifeq ($(BR2_PACKAGE_HOST_GDB_SIM),y)
 HOST_GDB_CONF_OPTS += --enable-sim
-ifeq ($(BR2_bfin),y)
-HOST_GDB_PRE_CONFIGURE_HOOKS += HOST_GDB_BFIN_SIM_WORKAROUND
-endif
 else
 HOST_GDB_CONF_OPTS += --disable-sim
 endif
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index 0e24b25441..0747cc8d7c 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -53,7 +53,7 @@ config BR2_PTHREADS_NATIVE
 
 config BR2_PTHREADS
 	bool "linuxthreads"
-	depends on BR2_bfin || BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
+	depends on BR2_m68k || BR2_microblaze || BR2_or1k || BR2_arm || BR2_armeb || BR2_xtensa
 	select BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PTHREADS_NONE
@@ -95,7 +95,6 @@ config BR2_UCLIBC_TARGET_ARCH
 	string
 	default "arc"	   if BR2_arcle || BR2_arceb
 	default "arm"	   if BR2_arm	|| BR2_armeb
-	default "bfin"	   if BR2_bfin
 	default "m68k"	   if BR2_m68k
 	default "microblaze"   if BR2_microblaze
 	default "mips"	   if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
diff --git a/toolchain/Config.in b/toolchain/Config.in
index b33eaffd52..5d6c85f995 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -426,7 +426,6 @@ config BR2_TOOLCHAIN_HAS_MNAN_OPTION
 config BR2_TOOLCHAIN_HAS_SYNC_1
 	bool
 	default y
-	depends on !BR2_bfin
 	depends on !BR2_m68k_cf
 	depends on !BR2_microblaze
 	depends on !BR2_sparc
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 0ab7e8db97..2f6624d217 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -29,7 +29,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 	bool "uClibc-ng"
 	depends on BR2_aarch64 || BR2_aarch64_be || BR2_arcle   || BR2_arceb  || \
 		   BR2_arm     || BR2_armeb    || \
-		   BR2_bfin    || BR2_i386   || BR2_m68k   || BR2_microblaze || \
+		   BR2_i386    || BR2_m68k   || BR2_microblaze || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_or1k    || BR2_powerpc || BR2_sh2a   || BR2_sh4	   || \
 		   BR2_sh4eb   || BR2_sparc   || BR2_xtensa || BR2_x86_64
-- 
2.14.3
