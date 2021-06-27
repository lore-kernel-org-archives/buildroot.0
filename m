From: Romain Naour <romain.naour@gmail.com>
Date: Sun, 27 Jun 2021 16:00:49 +0200
Subject: [Buildroot] [PATCH] package/gcc: remove gcc 8.x
Message-ID: <20210627140049.159432-1-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

gcc 11.1 is around, gcc 10.2 is the default version, so drop
8.4 in order to reduce the gcc choice.

For PowerPC SPE, introduce BR2_GCC_VERSION_POWERPC_SPE
to avoid removing defconfigs arcturus_ucp1020_defconfig,
freescale_p1025twr_defconfig and qemu_ppc_mpc8544ds_defconfig
that are still used by some users [1].
BR2_GCC_VERSION_POWERPC_SPE use the same gcc version (8.4), no
change expected.

[1] 96e80ad214ced86c802d561946fa7da88c1595eb

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Oleksandr Zhadan <oleks@arcturusnetworks.com>
Cc: Michael Durrant <mdurrant@ArcturusNetworks.com>
Cc: Matthew Weber <matthew.weber@collins.com>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy           |  9 +++++++++
 package/gcc/Config.in.host | 13 +++++++------
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/Config.in.legacy b/Config.in.legacy
index a0c1a6898f..d6f6caf396 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -144,6 +144,15 @@ endif
 
 ###############################################################################
 
+comment "Legacy options removed in 2021.08"
+
+config BR2_GCC_VERSION_8_X
+	bool "gcc 8.x support removed"
+	select BR2_LEGACY
+	help
+	  Support for gcc version 8.x has been removed. The current
+	  default version (10.x or later) has been selected instead.
+
 comment "Legacy options removed in 2021.05"
 
 config BR2_PACKAGE_UDISKS_LVM2
diff --git a/package/gcc/Config.in.host b/package/gcc/Config.in.host
index 2b3c296463..ae2051d2aa 100644
--- a/package/gcc/Config.in.host
+++ b/package/gcc/Config.in.host
@@ -4,6 +4,7 @@ choice
 	prompt "GCC compiler Version"
 	default BR2_GCC_VERSION_ARC if BR2_arc
 	default BR2_GCC_VERSION_CSKY if BR2_csky
+	default BR2_GCC_VERSION_POWERPC_SPE if BR2_powerpc_SPE
 	default BR2_GCC_VERSION_10_X
 	help
 	  Select the version of gcc you wish to use.
@@ -20,11 +21,11 @@ config BR2_GCC_VERSION_CSKY
 	depends on BR2_csky
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
 
-config BR2_GCC_VERSION_8_X
-	bool "gcc 8.x"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_9
-	# Broken or unsupported architectures
-	depends on !BR2_or1k
+config BR2_GCC_VERSION_POWERPC_SPE
+	bool "gcc powerpc spe"
+	# powerpc spe support has been deprecated since gcc 8.x.
+	# https://gcc.gnu.org/ml/gcc/2018-04/msg00102.html
+	depends on BR2_powerpc_SPE
 	select BR2_TOOLCHAIN_GCC_AT_LEAST_8
 
 config BR2_GCC_VERSION_9_X
@@ -88,7 +89,7 @@ config BR2_GCC_SUPPORTS_DLANG
 
 config BR2_GCC_VERSION
 	string
-	default "8.4.0"     if BR2_GCC_VERSION_8_X
+	default "8.4.0"     if BR2_GCC_VERSION_POWERPC_SPE
 	default "9.4.0"     if BR2_GCC_VERSION_9_X
 	default "10.3.0"    if BR2_GCC_VERSION_10_X
 	default "11.1.0"    if BR2_GCC_VERSION_11_X
-- 
2.31.1
