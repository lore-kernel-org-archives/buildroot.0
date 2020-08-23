From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 23 Aug 2020 13:15:13 +0200
Subject: [Buildroot] [PATCH 2/3]
 toolchain/toolchain-external/toolchain-external-codesourcery-amd64: remove
 package
In-Reply-To: <20200823111515.119215-1-thomas.petazzoni@bootlin.com>
References: <20200823111515.119215-1-thomas.petazzoni@bootlin.com>
Message-ID: <20200823111515.119215-2-thomas.petazzoni@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This toolchain uses an old gcc 6.2.0 compiler (not even the latest gcc
from the 6.x series), which fails to build the recent Boost
package. Since newer versions of this toolchain are no longer made
publicly available from Mentor Graphics, our only option is to drop
the toolchain.

Fixes:

  http://autobuild.buildroot.net/results/10edaed22c15b9d0f7de187085aeebc96e5ebe6c/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 Config.in.legacy                              | 11 ++++++++
 toolchain/toolchain-external/Config.in        |  6 ----
 .../Config.in                                 | 28 -------------------
 .../Config.in.options                         |  9 ------
 ...toolchain-external-codesourcery-amd64.hash |  3 --
 .../toolchain-external-codesourcery-amd64.mk  | 12 --------
 6 files changed, 11 insertions(+), 58 deletions(-)
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index cf7aaf75a5..7bff4913dc 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,17 @@ endif
 
 comment "Legacy options removed in 2020.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
+	bool "toolchain-external-codesourcery-amd64 removed"
+	select BR2_LEGACY
+	help
+	  The CodeSourcery toolchain for AMD64, in version 2016.11 was
+	  dropped, due to it using a too old gcc 6.2.0 compiler which
+	  caused issues compiling a number of recent packages
+	  (e.g. Boost). CodeSourcery has stopped making newer versions
+	  of this toolchain publicly available, so it was not possible
+	  to update it.
+
 config BR2_PACKAGE_EFL_GIF
 	bool "efl evas gif loader is mandatory"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 128bea257e..424ffec683 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -42,9 +42,6 @@ source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Confi
 # NIOSII
 source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in"
 
-# x86_64
-source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
-
 # Kept last, so it remains the non-default choice, unless there isn't
 # any available toolchain profile for the currently selected
 # architecture, but before toolchains from br2-external trees.
@@ -149,9 +146,6 @@ source "toolchain/toolchain-external/toolchain-external-codescape-mti-mips/Confi
 # NIOSII
 source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Config.in.options"
 
-# x86_64
-source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
-
 # Custom toolchains
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
 
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
deleted file mode 100644
index c8ec970a4f..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in
+++ /dev/null
@@ -1,28 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-	bool "Sourcery CodeBench AMD64 2016.11"
-	depends on BR2_x86_64
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_7
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_x86_jaguar || BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_TOOLCHAIN_HAS_OPENMP
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_7
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_6
-	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_19615 # based-on binutils-2.26
-	select BR2_TOOLCHAIN_HAS_BINUTILS_BUG_20006 # based-on binutils-2.26
-	help
-	  Sourcery CodeBench toolchain for the amd64 (x86_64)
-	  architectures, from Mentor Graphics. It uses gcc 6.2,
-	  binutils 2.26, glibc 2.24, gdb 7.11 and kernel headers
-	  4.7. It has support for the following variants:
-	    - AMD Puma/Jaguar (family 16h), glibc
-	    Default for x86_64, nothing special to do.
-	    - AMD Steamroller (family 15h), glibc
-	    Select a steamroller core.
-	  No other architecture variants are supported since glibc
-	  is optimized for one of these two baselines.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
deleted file mode 100644
index 2ab23026e9..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "x86_64-amd-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-amd64"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
deleted file mode 100644
index 291e6a59f6..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256 a6c23837dd45a33866c60a2fd8d7af40520cd84ff1059abda797952d7ee0fafd  amd-2016.11-19-x86_64-amd-linux-gnu-i686-pc-linux-gnu.tar.bz2
-sha256 d61ce0b5648ad63cca16fe233c82e7eaa6a3212a549d69a527e7a2d5350f7b4a  amd-2016.11-19-x86_64-amd-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
deleted file mode 100644
index 1697e5e679..0000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-amd64/toolchain-external-codesourcery-amd64.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-amd64
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION = 2016.11-19
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_SOURCE = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i686-pc-linux-gnu.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_ACTUAL_SOURCE_TARBALL = amd-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_AMD64_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
-- 
2.26.2
