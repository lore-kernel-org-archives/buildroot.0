From: Peter Korsgaard <peter@korsgaard.com>
Date: Fri, 4 Oct 2013 08:58:08 +0200
Subject: [Buildroot] [git commit] Revert "toolchain-internal: skip
	gcc-intermediate when possible"
Message-ID: <20131004125504.A0FB19B940@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=ebc8193363b5200cf6139515779dff2c552ada70
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

While the idea of skipping the intermediate gcc step seems to work
fine in most situations, it causes problems with the SSP
support. Until we can figure out a proper solution for this problem,
we need to revert back to the previous solution of a three stages
build.

This reverts commit 2babed4a50fcd050abc4686e05e24d0e374d10a8.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcc/Config.in.host             |   11 -----------
 package/gcc/gcc-initial/gcc-initial.mk |    8 --------
 package/glibc/glibc.mk                 |    5 ++---
 package/uclibc/Config.in               |    1 -
 package/uclibc/uclibc.mk               |    5 ++---
 toolchain/Config.in                    |    9 ---------
 6 files changed, 4 insertions(+), 35 deletions(-)

diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 32c668a..1fd3a94 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -3,12 +3,6 @@ comment "GCC Options"
 config BR2_GCC_NEEDS_MPC
 	bool
 
-# Until gcc 4.7, a three stage build process was needed when using
-# NPTL. This hidden option tells whether gcc is a version that
-# requires this three stage build process.
-config BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
-	bool
-
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_4_X if BR2_sparc_sparchfleon || BR2_sparc_sparchfleonv8 || BR2_sparc_sparcsfleon || BR2_sparc_sparcsfleonv8
@@ -22,13 +16,11 @@ choice
 	config BR2_GCC_VERSION_4_2_2_AVR32_2_1_5
 		depends on BR2_avr32
 		bool "gcc 4.2.2-avr32-2.1.5"
-		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_3_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a8 && !BR2_cortex_a9 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_e300c2 && !BR2_powerpc_e300c3 && !BR2_powerpc_e500mc && !BR2_powerpc_464 && !BR2_powerpc_464fp && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.3.x"
-		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_4_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a5 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_x86_atom && !BR2_powerpc_476 && !BR2_powerpc_476fp && !BR2_fa526 && !BR2_pj4
@@ -37,7 +29,6 @@ choice
 		depends on !BR2_ARM_EABIHF
 		# VFPv4 support appeared in gcc 4.5
 		depends on !BR2_ARM_FPU_VFPV4 && !BR2_ARM_FPU_VFPV4D16
-		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_5_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_cortex_a7 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_fa526 && !BR2_pj4
@@ -45,13 +36,11 @@ choice
 		# ARM EABIhf support appeared in gcc 4.6
 		depends on !BR2_ARM_EABIHF
 		bool "gcc 4.5.x"
-		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_6_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_cortex_a7 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
 		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
-		select BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
 
 	config BR2_GCC_VERSION_4_7_X
 		depends on !BR2_arc && !BR2_avr32 && !BR2_bfin && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8 && !BR2_pj4
diff --git a/package/gcc/gcc-initial/gcc-initial.mk b/package/gcc/gcc-initial/gcc-initial.mk
index 83767ea..0eb492f 100644
--- a/package/gcc/gcc-initial/gcc-initial.mk
+++ b/package/gcc/gcc-initial/gcc-initial.mk
@@ -29,7 +29,6 @@ HOST_GCC_INITIAL_CONF_OPT = \
 	--enable-languages=c \
 	--disable-shared \
 	--without-headers \
-	--disable-threads \
 	--with-newlib \
 	--disable-largefile \
 	--disable-nls \
@@ -41,11 +40,4 @@ HOST_GCC_INITIAL_CONF_ENV = \
 HOST_GCC_INITIAL_MAKE_OPT = all-gcc
 HOST_GCC_INITIAL_INSTALL_OPT = install-gcc
 
-ifeq ($(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),)
-ifeq ($(BR2_GCC_SUPPORTS_FINEGRAINEDMTUNE),y)
-HOST_GCC_INITIAL_MAKE_OPT += all-target-libgcc
-HOST_GCC_INITIAL_INSTALL_OPT += install-target-libgcc
-endif
-endif
-
 $(eval $(host-autotools-package))
diff --git a/package/glibc/glibc.mk b/package/glibc/glibc.mk
index 68c4636..998bd0f 100644
--- a/package/glibc/glibc.mk
+++ b/package/glibc/glibc.mk
@@ -28,9 +28,8 @@ ifeq ($(BR2_TOOLCHAIN_BUILDROOT_EGLIBC),y)
 GLIBC_DEPENDENCIES += host-gawk
 endif
 
-# Before (e)glibc is built, we must have the second stage
-# cross-compiler, for some gcc versions
-glibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
+# Before (e)glibc is built, we must have the second stage cross-compiler
+eglibc-build: host-gcc-intermediate
 
 GLIBC_SUBDIR = build
 
diff --git a/package/uclibc/Config.in b/package/uclibc/Config.in
index eeb3b83..acf736a 100644
--- a/package/uclibc/Config.in
+++ b/package/uclibc/Config.in
@@ -115,7 +115,6 @@ choice
 	config BR2_PTHREADS_NATIVE
 		bool "Native POSIX Threading (NPTL)"
 		select BR2_TOOLCHAIN_HAS_THREADS
-		select BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
 		depends on !BR2_arc
 		depends on !BR2_avr32
 		depends on !BR2_bfin
diff --git a/package/uclibc/uclibc.mk b/package/uclibc/uclibc.mk
index 3993d9b..20d3bb6 100644
--- a/package/uclibc/uclibc.mk
+++ b/package/uclibc/uclibc.mk
@@ -22,9 +22,8 @@ UCLIBC_INSTALL_STAGING = YES
 # cross-compiler and the kernel headers
 UCLIBC_DEPENDENCIES = host-gcc-initial linux-headers
 
-# Before uClibc is built, we must have the second stage
-# cross-compiler, for some gcc versions, and when NPTL is used.
-uclibc-build: $(if $(BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD),host-gcc-intermediate)
+# Before uClibc is built, we must have the second stage cross-compiler
+uclibc-build: host-gcc-intermediate
 
 # specifying UCLIBC_CONFIG_FILE on the command-line overrides the .config
 # setting.
diff --git a/toolchain/Config.in b/toolchain/Config.in
index 17be32a..6fd446e 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -1,13 +1,5 @@
 menu "Toolchain"
 
-config BR2_TOOLCHAIN_NEEDS_THREE_STAGE_BUILD
-	bool
-	default y if BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD && \
-		BR2_GCC_VERSION_NEEDS_THREE_STAGE_BUILD
-
-config BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
-	bool
-
 # Should be selected for glibc or eglibc
 config BR2_TOOLCHAIN_USES_GLIBC
 	bool
@@ -19,7 +11,6 @@ config BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_TOOLCHAIN_HAS_THREADS_DEBUG
 	select BR2_TOOLCHAIN_HAS_SHADOW_PASSWORDS
 	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_LIBC_NEEDS_THREE_STAGE_BUILD
 
 config BR2_TOOLCHAIN_USES_UCLIBC
 	bool
