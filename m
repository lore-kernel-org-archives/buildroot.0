From: Baruch Siach <baruch@tkos.co.il>
Date: Fri, 16 Jun 2017 06:32:47 +0300
Subject: [Buildroot] [PATCH 02/14] toolchain: remove CodeSourcery x86
	toolchain
In-Reply-To: <cover.1497583686.git.baruch@tkos.co.il>
References: <cover.1497583686.git.baruch@tkos.co.il>
Message-ID: <f9dda54d8c748b269aac1f9071986503ef5cb1b8.1497583686.git.baruch@tkos.co.il>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since glibc 2.17, executable link command need not include the -lrt option for
clock_* system calls. As a result, over time less and less software packages
bother to check whether to toolchain needs -lrt. We are now at a point where
maintainers refuse to add this complexity into their build system. This
requires Buildroot to carry patches fixing this issue indefinitely.

glibc 2.17 is now 4.5 years old. There is no reason to use an older version
with current software.

This commit removes the predefined profile for CodeSourcery x86 toolchain that
is based on glibc 2.16. One may still use the custom external toolchain
support in Buildroot to get this toolchain back, and deal with any build
issues that this toolchain causes.

Signed-off-by: Baruch Siach <baruch@tkos.co.il>
---
 Config.in.legacy                                   |  9 +++++++
 toolchain/toolchain-external/Config.in             |  6 ++---
 .../toolchain-external-codesourcery-x86/Config.in  | 29 ----------------------
 .../Config.in.options                              |  9 -------
 .../toolchain-external-codesourcery-x86.hash       |  3 ---
 .../toolchain-external-codesourcery-x86.mk         | 12 ---------
 6 files changed, 11 insertions(+), 57 deletions(-)
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
 delete mode 100644 toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index a5f7288c4f84..b851af2017b5 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -145,6 +145,15 @@ endif
 ###############################################################################
 comment "Legacy options removed in 2017.08"
 
+config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
+	bool "x86 Sourcery toolchain has been removed"
+	select BR2_LEGACY
+	help
+	  The Sourcery CodeBench toolchain for the x86 architecture has
+	  been removed, since it uses glibc older than 2.17 that requires
+	  -lrt to link executables using clock_* system calls. This makes
+	  this toolchain difficult to maintain over time.
+
 config BR2_GCC_VERSION_4_8_X
 	bool "gcc 4.8.x support removed"
 	select BR2_LEGACY
diff --git a/toolchain/toolchain-external/Config.in b/toolchain/toolchain-external/Config.in
index 35db58249852..75229bbddf47 100644
--- a/toolchain/toolchain-external/Config.in
+++ b/toolchain/toolchain-external/Config.in
@@ -36,9 +36,8 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Conf
 # SH4a
 source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in"
 
-# x86/x86_64 (use amd64 toolchain by default for AMD64)
+# x86_64
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in"
-source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in"
 
 # Kept last, so it remains the non-default choice, unless there isn't
 # any available toolchain profile for the currently selected
@@ -130,9 +129,8 @@ source "toolchain/toolchain-external/toolchain-external-codesourcery-niosII/Conf
 # SH4a
 source "toolchain/toolchain-external/toolchain-external-codesourcery-sh/Config.in.options"
 
-# x86/x86_64
+# x86_64
 source "toolchain/toolchain-external/toolchain-external-codesourcery-amd64/Config.in.options"
-source "toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options"
 
 # Custom toolchains
 source "toolchain/toolchain-external/toolchain-external-custom/Config.in.options"
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
deleted file mode 100644
index bcbdd269386d..000000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in
+++ /dev/null
@@ -1,29 +0,0 @@
-config BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
-	bool "Sourcery CodeBench x86/x86_64 2012.09"
-	depends on BR2_i386 || BR2_x86_64
-	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "x86"
-	depends on !BR2_STATIC_LIBS
-	depends on !BR2_x86_jaguar
-	depends on !BR2_x86_steamroller
-	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
-	select BR2_TOOLCHAIN_HAS_SSP
-	select BR2_TOOLCHAIN_HAS_NATIVE_RPC
-	select BR2_INSTALL_LIBSTDCPP
-	select BR2_HOSTARCH_NEEDS_IA32_LIBS
-	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_5
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_4_7
-	help
-	  Sourcery CodeBench toolchain for the x86/x86_64
-	  architectures, from Mentor Graphics. It uses gcc 4.7.2,
-	  binutils 2.23.51, glibc 2.16, gdb 7.4.50 and kernel headers
-	  3.5.4. It has support for the following variants:
-	    - Intel Pentium 4, glibc, 32 bits
-	      Default for x86, nothing special to do.
-	    - Intel Atom, glibc, 32 bits
-	      Select an Atom core
-	    - Intel Xeon, glibc, 64 bits
-	      Default for x86_64, nothing special to do.
-	    - Intel Core 2, glibc, 64 bits
-	      Select a Core 2 core
-	  Other architecture variants (beyond Pentium-4/Xeon) are
-	  supported as well, but glibc is not optimised for it.
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
deleted file mode 100644
index 65b62f323675..000000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/Config.in.options
+++ /dev/null
@@ -1,9 +0,0 @@
-if BR2_TOOLCHAIN_EXTERNAL_CODESOURCERY_X86
-
-config BR2_TOOLCHAIN_EXTERNAL_PREFIX
-	default "i686-pc-linux-gnu"
-
-config BR2_PACKAGE_PROVIDES_TOOLCHAIN_EXTERNAL
-	default "toolchain-external-codesourcery-x86"
-
-endif
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
deleted file mode 100644
index a003f7ab3c7a..000000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally calculated
-sha256 ea804cf02014369da52abc4f64e91e96bde2dd2230aca96109459013d4545458  ia32-2012.09-62-i686-pc-linux-gnu-i386-linux.tar.bz2
-sha256 1a9519e415a1e6892c760bf21f7e98f3a633a9d1c5bb8781a96d338e4dd62717  ia32-2012.09-62-i686-pc-linux-gnu.src.tar.bz2
diff --git a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk b/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
deleted file mode 100644
index 5ee6991c0ce8..000000000000
--- a/toolchain/toolchain-external/toolchain-external-codesourcery-x86/toolchain-external-codesourcery-x86.mk
+++ /dev/null
@@ -1,12 +0,0 @@
-################################################################################
-#
-# toolchain-external-codesourcery-x86
-#
-################################################################################
-
-TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_SITE = https://sourcery.mentor.com/public/gnu_toolchain/$(TOOLCHAIN_EXTERNAL_PREFIX)
-TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION = 2012.09-62
-TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_SOURCE = ia32-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX)-i386-linux.tar.bz2
-TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_ACTUAL_SOURCE_TARBALL = ia32-$(TOOLCHAIN_EXTERNAL_CODESOURCERY_X86_VERSION)-$(TOOLCHAIN_EXTERNAL_PREFIX).src.tar.bz2
-
-$(eval $(toolchain-external-package))
-- 
2.11.0
