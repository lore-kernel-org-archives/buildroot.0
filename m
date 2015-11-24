From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 24 Nov 2015 17:39:41 +0100
Subject: [Buildroot] [git commit] gmp: bump to version 6.1.0
Message-ID: <20151201232121.98DB381932@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=3b5d3291e544653efeaeb78984d757dc2ab1757e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Patches are upstream so drop them.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-arm-asm-conditional-on-no-thumb-1.patch   | 21 ---------------------
 .../0002-arm-asm-conditional-on-no-thumb-2.patch   | 21 ---------------------
 ...c-provide-default-bmod-to-mod-threshold-1.patch | 22 ----------------------
 package/gmp/gmp.hash                               |  2 +-
 package/gmp/gmp.mk                                 |  2 +-
 5 files changed, 2 insertions(+), 66 deletions(-)

diff --git a/package/gmp/0001-arm-asm-conditional-on-no-thumb-1.patch b/package/gmp/0001-arm-asm-conditional-on-no-thumb-1.patch
deleted file mode 100644
index eb678b0..0000000
--- a/package/gmp/0001-arm-asm-conditional-on-no-thumb-1.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-# HG changeset patch
-# User Torbjorn Granlund <tege@gmplib.org>
-# Date 1396035313 -3600
-# Node ID c56ea318eb6435bdd28dbfef657b2fe372134f1f
-# Parent  c6fe20ab62acc266ff5ad3629bef447bc43dcd1b
-Conditionalise ARM asm on !__thumb__.
-
-diff -r c6fe20ab62ac -r c56ea318eb64 mpn/generic/mod_1_1.c
---- a/mpn/generic/mod_1_1.c	Wed Mar 26 12:58:33 2014 +0100
-+++ b/mpn/generic/mod_1_1.c	Fri Mar 28 20:35:13 2014 +0100
-@@ -129,7 +129,7 @@
- 	     "%2" ((UDItype)(a0)), "r" ((UDItype)(b0)) __CLOBBER_CC)
- #endif
- 
--#if defined (__arm__) && W_TYPE_SIZE == 32
-+#if defined (__arm__) && !defined (__thumb__) && W_TYPE_SIZE == 32
- #define add_mssaaaa(m, sh, sl, ah, al, bh, bl)				\
-   __asm__ (  "adds	%2, %5, %6\n\t"					\
- 	     "adcs	%1, %3, %4\n\t"					\
-
diff --git a/package/gmp/0002-arm-asm-conditional-on-no-thumb-2.patch b/package/gmp/0002-arm-asm-conditional-on-no-thumb-2.patch
deleted file mode 100644
index 666cf58..0000000
--- a/package/gmp/0002-arm-asm-conditional-on-no-thumb-2.patch
+++ /dev/null
@@ -1,21 +0,0 @@
-
-# HG changeset patch
-# User Torbjorn Granlund <tege@gmplib.org>
-# Date 1396602422 -7200
-# Node ID 676e2d0f0e4dd301a7066079d2c9326c25c34a40
-# Parent  0194a75b56b21a9196626430af86c5bd9110c42d
-Conditionalise ARM asm on !__thumb__.
-
-diff -r 0194a75b56b2 -r 676e2d0f0e4d mpn/generic/div_qr_1n_pi1.c
---- a/mpn/generic/div_qr_1n_pi1.c	Thu Apr 03 23:58:51 2014 +0200
-+++ b/mpn/generic/div_qr_1n_pi1.c	Fri Apr 04 11:07:02 2014 +0200
-@@ -130,7 +130,7 @@
- 	     "%2" ((UDItype)(a0)), "r" ((UDItype)(b0)) __CLOBBER_CC)
- #endif
- 
--#if defined (__arm__) && W_TYPE_SIZE == 32
-+#if defined (__arm__) && !defined (__thumb__) && W_TYPE_SIZE == 32
- #define add_mssaaaa(m, sh, sl, ah, al, bh, bl)				\
-   __asm__ (  "adds	%2, %5, %6\n\t"					\
- 	     "adcs	%1, %3, %4\n\t"					\
-
diff --git a/package/gmp/0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch b/package/gmp/0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch
deleted file mode 100644
index 76aa72f..0000000
--- a/package/gmp/0003-powerpc-provide-default-bmod-to-mod-threshold-1.patch
+++ /dev/null
@@ -1,22 +0,0 @@
-
-# HG changeset patch
-# User Torbjorn Granlund <tege@gmplib.org>
-# Date 1395835068 -3600
-# Node ID 4a6d258b467f661da0894cc60ecd060f2e3c67c7
-# Parent  301ce2788826a2d4d2725bd5cf01e998638db37a
-Provide default for BMOD_1_TO_MOD_1_THRESHOLD.
-
-diff -r 301ce2788826 -r 4a6d258b467f mpn/powerpc64/mode64/gcd_1.asm
---- a/mpn/powerpc64/mode64/gcd_1.asm	Tue Mar 25 15:34:52 2014 +0100
-+++ b/mpn/powerpc64/mode64/gcd_1.asm	Wed Mar 26 12:57:48 2014 +0100
-@@ -43,6 +43,9 @@
- define(`n',     `r4')
- define(`v0',    `r5')
- 
-+ifdef(`BMOD_1_TO_MOD_1_THRESHOLD',,
-+  `define(`BMOD_1_TO_MOD_1_THRESHOLD',30)')
-+
- EXTERN_FUNC(mpn_mod_1)
- EXTERN_FUNC(mpn_modexact_1c_odd)
- 
-
diff --git a/package/gmp/gmp.hash b/package/gmp/gmp.hash
index 9fe6344..e803623 100644
--- a/package/gmp/gmp.hash
+++ b/package/gmp/gmp.hash
@@ -1,2 +1,2 @@
 # Locally calculated after checking pgp signature
-sha256	9156d32edac6955bc53b0218f5f3763facb890b73a835d5e1b901dcf8eb8b764	gmp-6.0.0a.tar.xz
+sha256	68dadacce515b0f8a54f510edf07c1b636492bcdb8e8d54c56eb216225d16989	gmp-6.1.0.tar.xz
diff --git a/package/gmp/gmp.mk b/package/gmp/gmp.mk
index f71a210..c143794 100644
--- a/package/gmp/gmp.mk
+++ b/package/gmp/gmp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-GMP_VERSION = 6.0.0a
+GMP_VERSION = 6.1.0
 GMP_SITE = $(BR2_GNU_MIRROR)/gmp
 GMP_SOURCE = gmp-$(GMP_VERSION).tar.xz
 GMP_INSTALL_STAGING = YES
