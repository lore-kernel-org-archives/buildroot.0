From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Date: Sat, 15 Oct 2016 16:50:58 +0200
Subject: [Buildroot] [PATCH 04/13] gcc: remove deprecated 4.7.x
In-Reply-To: <20161015145107.18264-1-arnout@mind.be>
References: <20161015145107.18264-1-arnout@mind.be>
Message-ID: <20161015145107.18264-5-arnout@mind.be>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We will remove BR2_DEPRECATED, so remove this deprecated option.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 Config.in.legacy                   |  7 +++++++
 package/gcc/Config.in.host         | 23 -----------------------
 package/gcc/gcc-final/gcc-final.mk | 12 ------------
 package/uclibc/uclibc.mk           |  7 +++----
 4 files changed, 10 insertions(+), 39 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index 45814ca..7d68c67 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,13 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2016.11"
 
+config BR2_GCC_VERSION_4_7_X
+	bool "gcc 4.7.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 4.7.x has been removed. The current
+	  default version (4.9.x or later) has been selected instead.
+
 config BR2_BINUTILS_VERSION_2_24_X
 	bool "binutils version 2.24 support removed"
 	select BR2_LEGACY
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 5b847fa..69f3ffd 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -13,28 +13,6 @@ choice
 	help
 	  Select the version of gcc you wish to use.
 
-	config BR2_GCC_VERSION_4_7_X
-		bool "gcc 4.7.x"
-		depends on BR2_DEPRECATED_SINCE_2016_05
-		# Broken or unsupported architectures
-		depends on !BR2_microblaze && !BR2_aarch64 && !BR2_arc \
-			&& !BR2_powerpc64le && !BR2_nios2 && !BR2_bfin
-		# Broken or unsupported ARM cores
-		depends on !BR2_cortex_a12 && !BR2_pj4 && !BR2_cortex_a17
-		# Broken or unsupported PPC cores
-		depends on !BR2_powerpc_e5500 && !BR2_powerpc_e6500 && \
-			!BR2_powerpc_power8
-		# SPARC -mcpu=leon3 appeared in gcc 4.8.x
-		depends on !BR2_sparc_leon3
-		# Broken or unsupported x86 cores
-		depends on !BR2_x86_jaguar && !BR2_x86_steamroller
-		# Unsupported for MIPS R6
-		depends on !BR2_mips_32r6 && !BR2_mips_64r6
-		# musl ppc64 unsupported
-		depends on !(BR2_TOOLCHAIN_USES_MUSL && (BR2_powerpc64 || BR2_powerpc64el))
-		select BR2_GCC_NEEDS_MPC
-		select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-
 	config BR2_GCC_VERSION_4_8_X
 		bool "gcc 4.8.x"
 		# Broken or unsupported architectures
@@ -116,7 +94,6 @@ config BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE
 
 config BR2_GCC_VERSION
 	string
-	default "4.7.4"     if BR2_GCC_VERSION_4_7_X
 	default "4.8.5"     if BR2_GCC_VERSION_4_8_X
 	default "4.9.4"     if BR2_GCC_VERSION_4_9_X
 	default "5.4.0"     if BR2_GCC_VERSION_5_X
diff --git a/package/gcc/gcc-final/gcc-final.mk b/package/gcc/gcc-final/gcc-final.mk
index 36f185e..9104273 100644
--- a/package/gcc/gcc-final/gcc-final.mk
+++ b/package/gcc/gcc-final/gcc-final.mk
@@ -118,18 +118,6 @@ HOST_GCC_FINAL_POST_BUILD_HOOKS += TOOLCHAIN_BUILD_WRAPPER
 # -cc symlink to the wrapper is not created.
 HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_INSTALL_WRAPPER_AND_SIMPLE_SYMLINKS
 
-# In gcc 4.7.x, the ARM EABIhf library loader path for glibc was not
-# correct, so we create a symbolic link to make things work
-# properly. glibc installs the library loader as ld-linux-armhf.so.3,
-# but gcc creates binaries that reference ld-linux.so.3.
-ifeq ($(BR2_arm)$(BR2_ARM_EABIHF)$(BR2_GCC_VERSION_4_7_X)$(BR2_TOOLCHAIN_USES_GLIBC),yyyy)
-define HOST_GCC_FINAL_LD_LINUX_LINK
-	ln -sf ld-linux-armhf.so.3 $(TARGET_DIR)/lib/ld-linux.so.3
-	ln -sf ld-linux-armhf.so.3 $(STAGING_DIR)/lib/ld-linux.so.3
-endef
-HOST_GCC_FINAL_POST_INSTALL_HOOKS += HOST_GCC_FINAL_LD_LINUX_LINK
-endif
-
 # coldfire is not working without removing these object files from libgcc.a
 ifeq ($(BR2_m68k_cf),y)
 define HOST_GCC_FINAL_M68K_LIBGCC_FIXUP
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 16fc0dd..da83d8a 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -113,10 +113,9 @@ define UCLIBC_ARM_ABI_CONFIG
 	$(call KCONFIG_ENABLE_OPT,CONFIG_ARM_EABI,$(@D)/.config)
 endef
 
-# Thumb1 build is broken with threads with old gcc versions (4.7 and
-# 4.8). Since all cores supporting Thumb1 also support ARM, we use ARM
-# code in this case.
-ifeq ($(BR2_GCC_VERSION_4_7_X)$(BR2_GCC_VERSION_4_8_X):$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),y:yy)
+# Thumb1 build is broken with threads with old gcc versions (< 4.8). Since
+# all cores supporting Thumb1 also support ARM, we use ARM code in this case.
+ifeq ($(BR2_GCC_VERSION_4_8_X)$(BR2_ARM_INSTRUCTIONS_THUMB)$(BR2_TOOLCHAIN_HAS_THREADS),yyy)
 UCLIBC_EXTRA_CFLAGS += -marm
 endif
 
-- 
2.9.3
