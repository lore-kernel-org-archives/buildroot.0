From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Sun, 24 Mar 2013 13:40:07 +0100
Subject: [Buildroot] [git commit] gcc: introduce BR2_GCC_NEEDS_MPC to reduce
	code duplication
Message-ID: <20130324130049.A30D39B258@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d37d99b588f1a11f63140e4ba1baec194d4a0da7
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

For each version of gcc, we need to check whether it requires mpc as a
dependency. Since this is true for 4.5, 4.6, 4.7, snapshots and now
4.8, let's factorize this code a bit by using a Kconfig symbol that
tells us whether we are using a gcc version that requires mpc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 toolchain/gcc/Config.in         |    8 +++++++
 toolchain/gcc/gcc-uclibc-4.x.mk |   44 +--------------------------------------
 2 files changed, 9 insertions(+), 43 deletions(-)

diff --git a/toolchain/gcc/Config.in b/toolchain/gcc/Config.in
index 1499c05..87d9cc1 100644
--- a/toolchain/gcc/Config.in
+++ b/toolchain/gcc/Config.in
@@ -2,6 +2,9 @@
 
 comment "GCC Options"
 
+config BR2_GCC_NEEDS_MPC
+	bool
+
 choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_4_6_X if !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
@@ -24,22 +27,27 @@ choice
 
 	config BR2_GCC_VERSION_4_5_X
 		depends on !BR2_avr32 && !BR2_cortex_a15 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.5.x"
 
 	config BR2_GCC_VERSION_4_6_X
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.6.x"
 
 	config BR2_GCC_VERSION_4_7_X
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.7.x"
 
 	config BR2_GCC_VERSION_4_8_X
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
 		bool "gcc 4.8.x"
 
 	config BR2_GCC_VERSION_SNAP
 		depends on !BR2_avr32 && !BR2_sparc_sparchfleon && !BR2_sparc_sparchfleonv8 && !BR2_sparc_sparcsfleon && !BR2_sparc_sparcsfleonv8
+		select BR2_GCC_NEEDS_MPC
 		bool "gcc snapshot"
 endchoice
 
diff --git a/toolchain/gcc/gcc-uclibc-4.x.mk b/toolchain/gcc/gcc-uclibc-4.x.mk
index 4f1bb49..db9715a 100644
--- a/toolchain/gcc/gcc-uclibc-4.x.mk
+++ b/toolchain/gcc/gcc-uclibc-4.x.mk
@@ -161,49 +161,7 @@ endif
 GCC_HOST_PREREQ = host-gmp host-mpfr
 GCC_TARGET_PREREQ += mpfr gmp
 
-# GCC 4.5.x prerequisites
-ifeq ($(findstring x4.5.,x$(GCC_VERSION)),x4.5.)
-GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
-GCC_TARGET_PREREQ += mpc
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE += host-mpc-source
-endif
-GCC_HOST_PREREQ += host-mpc
-endif
-
-# GCC 4.6.x prerequisites
-ifeq ($(findstring x4.6.,x$(GCC_VERSION)),x4.6.)
-GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
-GCC_TARGET_PREREQ += mpc
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE += host-mpc-source
-endif
-GCC_HOST_PREREQ += host-mpc
-endif
-
-# GCC 4.7.x prerequisites
-ifeq ($(findstring x4.7.,x$(GCC_VERSION)),x4.7.)
-GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
-GCC_TARGET_PREREQ += mpc
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE += host-mpc-source
-endif
-GCC_HOST_PREREQ += host-mpc
-endif
-
-# GCC 4.8.x prerequisites
-ifeq ($(findstring x4.8.,x$(GCC_VERSION)),x4.8.)
-GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
-GCC_TARGET_PREREQ += mpc
-ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
-HOST_SOURCE += host-mpc-source
-endif
-GCC_HOST_PREREQ += host-mpc
-endif
-
-# GCC snapshot prerequisites
-# Since we don't know and it can be quite new just ask for everything known
-ifneq ($(GCC_SNAP_DATE),)
+ifeq ($(BR2_GCC_NEEDS_MPC),y)
 GCC_WITH_HOST_MPC = --with-mpc=$(HOST_DIR)/usr
 GCC_TARGET_PREREQ += mpc
 ifeq ($(BR2_TOOLCHAIN_BUILDROOT),y)
