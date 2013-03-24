From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Mar 2013 09:26:30 +0100
Subject: [Buildroot] [PATCH 06/22] gcc: introduce BR2_GCC_NEEDS_MPC to
	reduce code duplication
In-Reply-To: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1364113606-20836-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1364113606-20836-7-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

For each version of gcc, we need to check whether it requires mpc as a
dependency. Since this is true for 4.5, 4.6, 4.7, snapshots and now
4.8, let's factorize this code a bit by using a Kconfig symbol that
tells us whether we are using a gcc version that requires mpc.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
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
-- 
1.7.9.5
