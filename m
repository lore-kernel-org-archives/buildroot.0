From: Guido Hatzsis <Guido.Hatzsis@yandex.com>
Date: Fri, 21 Aug 2015 09:54:17 +0000
Subject: [Buildroot] [PATCH v3] Add support for the x86-64 x32 ABI for glibc
	and musl.
Message-ID: <1440150857-5189-1-git-send-email-Guido.Hatzsis@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

x32 uses 32-bit pointers on the x84-64 linux target. The kernel needs
to have CONFIG_X86_X32 enabled. For more information see:
https://en.wikipedia.org/wiki/X32_ABI

Signed-off-by: Guido Hatzsis <Guido.Hatzsis@yandex.com>
---
Changes v2 -> v3:
    - Renamed GNU to SYSV
    - added external toolchain
    - removed superfluous changes to uclibc
    - fixed indentation
Changes v2 -> v3:
    - Adding links for libx32 -> lib
    -  Added copying for libs to staging directory.

 Makefile                                           |  4 +++
 arch/Config.in.x86                                 | 30 ++++++++++++++++++++++
 package/Makefile.in                                |  5 ++++
 package/glibc/glibc.mk                             |  2 +-
 toolchain/helpers.mk                               | 15 +++++++++++
 toolchain/toolchain-buildroot/Config.in            |  2 +-
 toolchain/toolchain-external/toolchain-external.mk |  8 ++++++
 7 files changed, 64 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index b4cef3f..7be6366 100644
--- a/Makefile
+++ b/Makefile
@@ -448,7 +448,11 @@ $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIS
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
index 43f6abc..1c53cf0 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -268,3 +268,33 @@ config BR2_GCC_TARGET_ARCH
 	default "c3"		if BR2_x86_c3
 	default "c3-2"		if BR2_x86_c32
 	default "geode"		if BR2_x86_geode
+
+choice
+	prompt "Target ABI"
+	depends on BR2_x86_64
+	default BR2_X86_64_ABI_SYSV
+	help
+	 Application Binary Interface to use. The Application Binary
+	  Interface describes the calling conventions (how arguments
+	  are passed to functions, how the return value is passed, how
+	  system calls are made, etc.).
+
+config BR2_X86_64_ABI_SYSV
+	bool "gnu"
+	help
+	  This is the gnu ABI for x86-64 which has 64-bits wide pointers. 
+	  You probably want to use this unless you know what you are 
+	  doing.
+
+config BR2_X86_64_ABI_X32
+	bool "x32 (experimental)"
+	help
+	  The X32 ABI is x86-64 with 32 bit pointers. It runs in x86-64 mode
+	  but as it has 32-bit pointers only 4 GB of RAM can be addressed.
+	  https://en.wikipedia.org/wiki/X32_ABI
+endchoice
+
+# The ABI is only explicitly needed for x32
+config BR2_GCC_TARGET_ABI
+	default ""          if BR2_X86_64_ABI_SYSV
+	default "x32"       if BR2_X86_64_ABI_X32
diff --git a/package/Makefile.in b/package/Makefile.in
index 545694f..db2c0f0 100644
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
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index cbfbf32..59a81d9 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -117,7 +117,7 @@ endif
 
 define GLIBC_INSTALL_TARGET_CMDS
 	for libs in $(GLIBC_LIBS_LIB); do \
-		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,lib,$$libs,/lib) ; \
+		$(call copy_toolchain_lib_root,$(STAGING_DIR)/,,$(if $(BR2_X86_64_ABI_X32),libx32,lib),$$libs,/lib) ; \
 	done
 endef
 
diff --git a/toolchain/helpers.mk b/toolchain/helpers.mk
index 85a9407..797241f 100644
--- a/toolchain/helpers.mk
+++ b/toolchain/helpers.mk
@@ -348,6 +348,21 @@ check_arm_abi = \
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
index 13e2b15..19feabd 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -33,7 +33,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_bfin    || BR2_i386   || BR2_m68k   || \
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
-		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+		   BR2_sparc   || BR2_xtensa || (BR2_x86_64 && BR2_X86_64_ABI_SYSV)
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
diff --git a/toolchain/toolchain-external/toolchain-external.mk b/toolchain/toolchain-external/toolchain-external.mk
index 3cb59c6..df48a76 100644
--- a/toolchain/toolchain-external/toolchain-external.mk
+++ b/toolchain/toolchain-external/toolchain-external.mk
@@ -191,7 +191,11 @@ TOOLCHAIN_EXTERNAL_CFLAGS += -mcpu=$(CC_TARGET_CPU_)
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_CPU='"$(CC_TARGET_CPU_)"'
 endif
 ifneq ($(CC_TARGET_ABI_),)
+ifeq ($(BR2_X86_64_ABI_X32),y)
+TOOLCHAIN_EXTERNAL_CFLAGS += -mx32
+else
 TOOLCHAIN_EXTERNAL_CFLAGS += -mabi=$(CC_TARGET_ABI_)
+endif
 TOOLCHAIN_EXTERNAL_WRAPPER_ARGS += -DBR_ABI='"$(CC_TARGET_ABI_)"'
 endif
 ifneq ($(CC_TARGET_FPU_),)
@@ -480,6 +484,10 @@ define TOOLCHAIN_EXTERNAL_CONFIGURE_CMDS
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
-- 
2.5.0
