From: Romain Naour <romain.naour@gmail.com>
Date: Thu, 31 Dec 2015 17:55:45 +0100
Subject: [Buildroot] [PATCH v5] Add support for the x86-64 x32 ABI for glibc
	and musl.
Message-ID: <1451580945-14387-1-git-send-email-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Guido Hatzsis <Guido.Hatzsis@yandex.com>

x32 uses 32-bit pointers on the x84-64 linux target.
The kernel needs to have CONFIG_X86_X32 enabled.

- The toolchain wrapper must contain -mx32 flag to use x32 ABI
  when an external toolchain is used.
- The toolchain external code must handle the case where all
  libraries are under 'libx32' directory and 'lib' is empty.
  It works likely with Buildroot generated toolchains since
  'libx32' is a symlink to 'lib'.
- -m64 must not be added to TOOLCHAIN_EXTERNAL_CFLAGS when
  BR2_X86_64_ABI_X32 is set. Instead it must depend on
  BR2_X86_64_ABI_SYSV.
- Although, BR2_GCC_TARGET_ABI is used to configure gcc for
  an internal toolchain, it must not be used -mabi while
  importing an external toolchain.
- Disable for CS x86 2012.09 and 2015.11 toolchain

file output/target/bin/busybox
output/target/bin/busybox: setuid ELF 32-bit LSB executable,
x86-64, version 1 (SYSV), dynamically linked, interpreter
/libx32/ld-linux-x32.so.2, for GNU/Linux 3.4.0, stripped

For more information see:
https://en.wikipedia.org/wiki/X32_ABI and
https://sites.google.com/site/x32abi/

Signed-off-by: Guido Hatzsis <Guido.Hatzsis@yandex.com>
[Romain:
  - rebase on master
  - disable with kernel headers < 3.6
  - disable with gcc < 4.8
  - rework the toolchain external code for x32]
Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 Makefile                                           |  4 +++
 arch/Config.in.x86                                 | 32 ++++++++++++++++++++++
 package/Makefile.in                                |  5 ++++
 package/gcc/Config.in.host                         |  4 +++
 package/linux-headers/Config.in.host               |  3 ++
 toolchain/helpers.mk                               | 20 ++++++++++++--
 toolchain/toolchain-buildroot/Config.in            |  2 +-
 toolchain/toolchain-external/Config.in             |  2 ++
 toolchain/toolchain-external/toolchain-external.mk | 17 ++++++++++--
 toolchain/toolchain-wrapper.c                      |  3 ++
 10 files changed, 86 insertions(+), 6 deletions(-)

diff --git a/Makefile b/Makefile
index 80e94a2..e6b212e 100644
--- a/Makefile
+++ b/Makefile
@@ -460,7 +460,11 @@ $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIS
 # We make a symlink lib32->lib or lib64->lib as appropriate
 # MIPS64/n32 requires lib32 even though it's a 64-bit arch.
 ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+ifeq ($(BR2_X86_64_ABI_X32),y)
+LIB_SYMLINK = libx32
+else
 LIB_SYMLINK = lib64
+endif
 else
 LIB_SYMLINK = lib32
 endif
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 771c20f..087ec17 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -281,3 +281,35 @@ config BR2_GCC_TARGET_ARCH
 	default "c3"		if BR2_x86_c3
 	default "c3-2"		if BR2_x86_c32
 	default "geode"		if BR2_x86_geode
+
+choice
+	prompt "Target ABI"
+	depends on BR2_x86_64
+	default BR2_X86_64_ABI_SYSV
+	help
+	  Application Binary Interface to use. The Application Binary
+	  Interface describes the calling conventions (how arguments
+	  are passed to functions, how the return value is passed, how
+	  system calls are made, etc.).
+
+config BR2_X86_64_ABI_SYSV
+	bool "sysv"
+	help
+	  This is the gnu ABI for x86-64 which has 64-bits wide
+	  pointers. You probably want to use this unless you know what
+	  you are doing.
+
+config BR2_X86_64_ABI_X32
+	bool "x32 (experimental)"
+	help
+	  The X32 ABI is x86-64 with 32 bit pointers. It runs in x86-64
+	  mode but as it has 32-bit pointers only 4 GB of RAM can be
+	  addressed.
+
+	  https://en.wikipedia.org/wiki/X32_ABI
+endchoice
+
+# The ABI is only explicitly needed for x32
+config BR2_GCC_TARGET_ABI
+	default ""          if BR2_X86_64_ABI_SYSV
+	default "x32"       if BR2_X86_64_ABI_X32
diff --git a/package/Makefile.in b/package/Makefile.in
index c5652af..537e889 100644
--- a/package/Makefile.in
+++ b/package/Makefile.in
@@ -70,6 +70,11 @@ ABI := $(ABI)hf
 endif
 endif
 
+# Only set the ABI for x86-64 x32.
+ifeq ($(BR2_X86_64_ABI_X32),y)
+ABI = x32
+endif
+
 # For FSL PowerPC there's SPE
 ifeq ($(BR2_powerpc_SPE),y)
 ABI = spe
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 57cafa4..61f75e0 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -29,6 +29,8 @@ choice
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported X86 cores
 		depends on !BR2_x86_corei7 && !BR2_x86_jaguar && !BR2_x86_steamroller
+		# x32 ABI support added in gcc 4.7
+		depends on !BR2_X86_64_ABI_X32
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		# Unsupported for MIPS R6
@@ -52,6 +54,8 @@ choice
 		depends on !BR2_sparc_leon3
 		# Broken or unsupported x86 cores
 		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
+		# Broken or not recommended with x32 ABI
+		depends on !BR2_X86_64_ABI_X32
 		# Unsupported for MIPS R6
 		depends on !BR2_mips_32r6 && !BR2_mips_64r6
 		select BR2_GCC_NEEDS_MPC
diff --git a/package/linux-headers/Config.in.host b/package/linux-headers/Config.in.host
index 9fabb9e..989fe6c 100644
--- a/package/linux-headers/Config.in.host
+++ b/package/linux-headers/Config.in.host
@@ -14,11 +14,14 @@ choice
 	config BR2_KERNEL_HEADERS_3_2
 		bool "Linux 3.2.x kernel headers"
 		depends on !BR2_arc && !BR2_nios2
+		depends on !BR2_X86_64_ABI_X32 # not supported
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_2
 
 	config BR2_KERNEL_HEADERS_3_4
 		bool "Linux 3.4.x kernel headers"
 		depends on !BR2_arc && !BR2_nios2
+		# kernel headers >= 3.6 are recommended for x32 ABI
+		depends on !BR2_X86_64_ABI_X32
 		select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_4
 
 	config BR2_KERNEL_HEADERS_3_10
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 1452ec6..b70cca6 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -125,7 +125,7 @@ copy_toolchain_lib_root = \
 # $1: main sysroot directory of the toolchain
 # $2: arch specific sysroot directory of the toolchain
 # $3: arch specific subdirectory in the sysroot
-# $4: directory of libraries ('lib', 'lib32' or 'lib64')
+# $4: directory of libraries ('lib', 'lib32', 'libx32' or 'lib64')
 # $5: support lib directories (for toolchains storing libgcc_s,
 #     libstdc++ and other gcc support libraries outside of the
 #     sysroot)
@@ -138,7 +138,8 @@ copy_toolchain_sysroot = \
 	for i in etc $${ARCH_LIB_DIR} sbin usr usr/$${ARCH_LIB_DIR}; do \
 		if [ -d $${ARCH_SYSROOT_DIR}/$$i ] ; then \
 			rsync -au --chmod=u=rwX,go=rX --exclude 'usr/lib/locale' \
-				--exclude lib --exclude lib32 --exclude lib64 \
+				--exclude lib --exclude lib32 --exclude libx32 \
+				--exclude lib64 \
 				$${ARCH_SYSROOT_DIR}/$$i/ $(STAGING_DIR)/$$i/ ; \
 		fi ; \
 	done ; \
@@ -346,6 +347,21 @@ check_arm_abi = \
 	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
 
 #
+# Check that the Buildroot configuration of the ABI matches the
+# configuration of the external toolchain.
+#
+# $1: cross-gcc path
+#
+check_x86_64_x32_abi = \
+	__CROSS_CC=$(strip $1) ; \
+	if ! echo 'int main(void) {}' | $${__CROSS_CC} -mx32 -x c -o $(BUILD_DIR)/.br-toolchain-test.tmp - ; then \
+		rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*; \
+		echo "Incorrect ABI setting: BR2_X86_64_ABI_X32 selected, but toolchain is incompatible"; \
+		exit 1 ; \
+	fi ; \
+	rm -f $(BUILD_DIR)/.br-toolchain-test.tmp*
+
+#
 # Check that the external toolchain supports C++
 #
 # $1: cross-g++ path
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index cbeb030..9679581 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -33,7 +33,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
-		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+		   BR2_sparc   || BR2_xtensa || (BR2_x86_64 && BR2_X86_64_ABI_SYSV)
 	# Unsupported for MIPS R6
 	depends on !BR2_mips_32r6 && !BR2_mips_64r6
 	help
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index e3b5ad5..2ba48a8 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -367,6 +367,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
 	depends on !BR2_STATIC_LIBS
 	depends on BR2_x86_jaguar || BR2_x86_steamroller
+	depends on !BR2_X86_64_ABI_X32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
@@ -392,6 +393,7 @@ config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
 	depends on !BR2_STATIC_LIBS
 	depends on !BR2_x86_jaguar
 	depends on !BR2_x86_steamroller
+	depends on !BR2_X86_64_ABI_X32
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
 	select BR2_INSTALL_LIBSTDCPP
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 8fdc7c6..fff91d4 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -183,9 +183,13 @@ CC_TARGET_FPU_ := $(call qstrip,$(BR2_GCC_TARGET_FPU))
 CC_TARGET_FLOAT_ABI_ := $(call qstrip,$(BR2_GCC_TARGET_FLOAT_ABI))
 CC_TARGET_MODE_ := $(call qstrip,$(BR2_GCC_TARGET_MODE))
 
+ifeq ($(BR2_X86_64_ABI_X32),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mx32
+TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_X32
+endif
 # march/mtune/floating point mode needs to be passed to the external toolchain
 # to select the right multilib variant
-ifeq ($(BR2_x86_64),y)
+ifeq ($(BR2_X86_64_ABI_SYSV),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -m64
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_64
 endif
@@ -198,9 +202,11 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
 endif
 ifneq ($(CC_TARGET_ABI_),)
+ifeq ($(BR2_X86_64_ABI_SYSV),y)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
+endif
 ifneq ($(CC_TARGET_FPU_),)
 TOOLCHAIN_EXTERNAL_CFLAGS += -mfpu=$(CC_TARGET_FPU_)
 TOOLCHAIN_EXTERNAL_TOOLCHAIN_WRAPPER_ARGS += -DBR_FPU='"$(CC_TARGET_FPU_)"'
@@ -443,19 +449,20 @@ endef
 #  - usr/lib/
 #  - lib32/
 #  - lib64/
+#  - libx32/   (x86_64 x32 toolchain)
 #  - lib32-fp/ (Cavium toolchain)
 #  - lib64-fp/ (Cavium toolchain)
 #  - usr/lib/<tuple>/ (Linaro toolchain)
 #
 # And variations on these.
 define toolchain_find_sysroot
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|64)?([^/]*)?/([^/]*/)?libc\.a::')
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:(usr/)?lib(32|x32|64)?([^/]*)?/([^/]*/)?libc\.a::')
 endef
 
 # Returns the lib subdirectory for the given compiler + flags (i.e
 # typically lib32 or lib64 for some toolchains)
 define toolchain_find_libdir
-$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
+$$(printf $(call toolchain_find_libc_a,$(1)) | sed -r -e 's:.*/(usr/)?(lib(32|x32|64)?([^/]*)?)/([^/]*/)?libc.a:\2:')
 endef
 
 # Checks for an already installed toolchain: check the toolchain
@@ -480,6 +487,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
 			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)",\
 			$(TOOLCHAIN_EXTERNAL_READELF)) ; \
 	fi ; \
+	if test "$(BR2_X86_64_ABI_X32)" = "y" ; then \
+		$(call check_x86_64_x32_abi,\
+			"$(TOOLCHAIN_EXTERNAL_CC) $(TOOLCHAIN_EXTERNAL_CFLAGS)") ; \
+	fi ; \
 	if test "$(BR2_INSTALL_LIBSTDCPP)" = "y" ; then \
 		$(call check_cplusplus,$(TOOLCHAIN_EXTERNAL_CXX)) ; \
 	fi ; \
diff --git a/toolchain/toolchain-wrapper.c b/toolchain/toolchain-wrapper.c
index 887058f..5744c71 100644
--- a/toolchain/toolchain-wrapper.c
+++ b/toolchain/toolchain-wrapper.c
@@ -63,6 +63,9 @@ static char *predef_args[] = {
 #ifdef BR_64
 	"-m64",
 #endif
+#ifdef BR_X32
+	"-mx32",
+#endif
 #ifdef BR_OMIT_LOCK_PREFIX
 	"-Wa,-momit-lock-prefix=yes",
 #endif
-- 
2.4.3
