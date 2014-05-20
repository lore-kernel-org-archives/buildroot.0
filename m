From: Steve Thomas <scjthm@live.com>
Date: Tue, 20 May 2014 23:21:20 +0000
Subject: [Buildroot] [PATCH 1/1] Add support for ld.gold in toolchain.
Message-ID: <BLU436-SMTP2194D0C95F4AFEB38829312A83D0@phx.gbl>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The ld.gold linker has been around for about six years, and is quite
well supported. It also used to be the only linker for gcc that
supported the plugin option needed for LTO.

This patch enables a system to be build with the gold linker which is
very well supported on recent builds.

Signed-off-by: Steve Thomas <scjthm@live.com>
---
 package/binutils/Config.in.host         | 4 ++++
 package/binutils/binutils.mk            | 7 +++++++
 package/gcc/Config.in.host              | 6 ++++++
 package/gcc/gcc.mk                      | 7 +++++++
 toolchain/toolchain-buildroot/Config.in | 9 +++++++++
 5 files changed, 33 insertions(+)

diff --git a/package/binutils/Config.in.host b/package/binutils/Config.in.host
index 2f86f51..3bc9349 100644
--- a/package/binutils/Config.in.host
+++ b/package/binutils/Config.in.host
@@ -1,5 +1,8 @@
 comment "Binutils Options"
 
+config BR2_BINUTILS_SUPPORTS_GOLD
+	bool
+
 choice
 	prompt "Binutils Version"
 	depends on !BR2_arc
@@ -42,6 +45,7 @@ choice
 
 	config BR2_BINUTILS_VERSION_2_24
 		depends on !BR2_avr32
+		select BR2_BINUTILS_SUPPORTS_GOLD
 		bool "binutils 2.24"
 
 endchoice
diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index b5a2dc7..2caa045 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -67,6 +67,13 @@ HOST_BINUTILS_CONF_OPT = --disable-multilib --disable-werror \
 			--with-sysroot=$(STAGING_DIR) \
 			$(BINUTILS_EXTRA_CONFIG_OPTIONS)
 
+# disable ld explicitely and use ld.gold exclusively
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
+HOST_BINUTILS_CONF_OPT += \
+			--enable-gold \
+			--enable-ld=no
+endif
+
 # We just want libbfd and libiberty, not the full-blown binutils in staging
 define BINUTILS_INSTALL_STAGING_CMDS
 	$(MAKE) -C $(@D)/bfd DESTDIR=$(STAGING_DIR) install
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index ca991da..cf04fd6 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,6 +3,9 @@ comment "GCC Options"
 config BR2_GCC_NEEDS_MPC
 	bool
 
+config BR2_GCC_SUPPORTS_GOLD
+	bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
@@ -52,6 +55,7 @@ choice
 	config BR2_GCC_VERSION_4_8_X
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a12 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GOLD
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_4_8_ARC
@@ -62,6 +66,7 @@ choice
 	config BR2_GCC_VERSION_4_9_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GOLD
 		bool "gcc 4.9.x"
 
 	config BR2_GCC_VERSION_4_9_MICROBLAZE
@@ -72,6 +77,7 @@ choice
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_microblaze && !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
 		select BR2_GCC_NEEDS_MPC
+		select BR2_GCC_SUPPORTS_GOLD
 		bool "gcc snapshot"
 endchoice
 
diff --git a/package/gcc/gcc.mk b/package/gcc/gcc.mk
index 32219cc..1971187 100644
--- a/package/gcc/gcc.mk
+++ b/package/gcc/gcc.mk
@@ -160,6 +160,13 @@ ifneq ($(BR2_arc)$(BR2_GCC_VERSION_SNAP),)
 HOST_GCC_COMMON_DEPENDENCIES += host-flex host-bison
 endif
 
+# disable ld explicitely and use ld.gold exclusively
+ifeq ($(BR2_TOOLCHAIN_BUILDROOT_GOLD),y)
+HOST_GCC_COMMON_CONF_OPT += \
+	--enable-gold \
+	--enable-ld=no
+endif
+
 ifeq ($(BR2_SOFT_FLOAT),y)
 # only mips*-*-*, arm*-*-* and sparc*-*-* accept --with-float
 # powerpc seems to be needing it as well
diff --git a/toolchain/toolchain-buildroot/Config.in b/toolchain/toolchain-buildroot/Config.in
index 42166d2..527ad5b 100644
--- a/toolchain/toolchain-buildroot/Config.in
+++ b/toolchain/toolchain-buildroot/Config.in
@@ -79,6 +79,15 @@ comment "(e)glibc only available with shared lib support"
 
 endchoice
 
+config BR2_TOOLCHAIN_BUILDROOT_GOLD
+	bool "Use the GOLD linker"
+	depends on BR2_GCC_SUPPORTS_GOLD
+	depends on BR2_BINUTILS_SUPPORTS_GOLD
+	default n
+	help
+	  This option selects the gold linker exclusively for
+	  the cross-compilation toolchain.
+
 config BR2_TOOLCHAIN_BUILDROOT_LIBC
 	string
 	default "uclibc" if BR2_TOOLCHAIN_BUILDROOT_UCLIBC
-- 
1.9.3
