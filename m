From: Guido Hatzsis <Guido.Hatzsis@yandex.com>
Date: Thu, 20 Aug 2015 11:32:31 +0000
Subject: [Buildroot] [PATCH v2] Add support for the x86-64 x32 ABI for glibc
	and musl.
Message-ID: <1440070351-29057-1-git-send-email-Guido.Hatzsis@yandex.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

x32 uses 32-bit pointers on the x84-64 linux target. The kernel needs
to have CONFIG_X86_X32 enabled. For more information see:
https://en.wikipedia.org/wiki/X32_ABI

Changes v1 -> v2:
    Adding links for libx32 -> lib
    Added copying for libs to staging directory.

Signed-off-by: Guido Hatzsis <Guido.Hatzsis@yandex.com>
---
 Makefile                                |  4 ++++
 arch/Config.in.x86                      | 29 +++++++++++++++++++++++++++++
 package/Makefile.in                     |  5 +++++
 package/glibc/glibc.mk                  |  2 +-
 package/uclibc/Config.in                |  1 +
 toolchain/toolchain-buildroot/Config.in |  1 +
 6 files changed, 41 insertions(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index b4cef3f..d50161f 100644
--- a/Makefile
+++ b/Makefile
@@ -448,7 +448,11 @@ $(BUILD_DIR) $(TARGET_DIR) $(HOST_DIR) $(BINARIES_DIR) $(LEGAL_INFO_DIR) $(REDIS
 # We make a symlink lib32->lib or lib64->lib as appropriate
 # MIPS64/n32 requires lib32 even though it's a 64-bit arch.
 ifeq ($(BR2_ARCH_IS_64)$(BR2_MIPS_NABI32),y)
+ifeq ($(BR2_X86_64_ABI_X32),y)
+LIB_SYMLINK= libx32
+else
 LIB_SYMLINK = lib64
+endif
 else
 LIB_SYMLINK = lib32
 endif
diff --git a/arch/Config.in.x86 b/arch/Config.in.x86
index 43f6abc..baaeae1 100644
--- a/arch/Config.in.x86
+++ b/arch/Config.in.x86
@@ -268,3 +268,32 @@ config BR2_GCC_TARGET_ARCH
 	default "c3"		if BR2_x86_c3
 	default "c3-2"		if BR2_x86_c32
 	default "geode"		if BR2_x86_geode
+
+choice
+       prompt "Target ABI"
+       depends on BR2_x86_64
+       default BR2_X86_64_ABI_GCC
+       help
+         Application Binary Interface to use. The Application Binary
+         Interface describes the calling conventions (how arguments
+         are passed to functions, how the return value is passed, how
+         system calls are made, etc.).
+
+config BR2_X86_64_ABI_GNU
+       bool "gnu"
+       depends on BR2_x86_64
+       help
+      This is the gnu ABI for x86-64 which has 64-bits wide pointers.
+
+config BR2_X86_64_ABI_X32
+       bool "x32"
+       depends on BR2_x86_64
+       help
+      The X32 ABI is x86-64 with 32 bit pointers. It runs in x86-64 mode
+      but as it has 32-bit pointers only 4 GB of RAM can be addressed.
+      https://en.wikipedia.org/wiki/X32_ABI
+
+endchoice
+
+config BR2_GCC_TARGET_ABI
+    default "x32"      if BR2_X86_64_ABI_X32
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
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index bf40a13..f4de98b 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -3,6 +3,7 @@ if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 # For legal-info
 config BR2_PACKAGE_UCLIBC
 	bool
+    depends on !BR2_X86_64_ABI_X32
 	default y
 
 comment "uClibc Options"
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 13e2b15..a2ce5cd 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -34,6 +34,7 @@ config BR2_TOOLCHAIN_BUILDROOT_UCLIBC
 		   BR2_mips    || BR2_mipsel || BR2_mips64 || BR2_mips64el || \
 		   BR2_powerpc || BR2_sh2a   || BR2_sh4	   || BR2_sh4eb    || \
 		   BR2_sparc   || BR2_xtensa || BR2_x86_64
+	depends on !BR2_X86_64_ABI_X32
 	help
 	  This option selects uClibc as the C library for the
 	  cross-compilation toolchain.
-- 
2.5.0
