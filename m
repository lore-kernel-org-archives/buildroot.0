From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 5 Apr 2014 14:44:34 +0200
Subject: [Buildroot] [git commit] gmp: fix target build for ARM thumb
Message-ID: <20140405124545.3A3969C5AE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=0baf3af3d387ec7d598f14896e4ab34ae9966a39
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Pull upstream hg changeset c56ea318eb64 and 676e2d0f0e4d to fix ARM
build breakage when compiling in thumb mode. Fixes:
http://autobuild.buildroot.net/results/f44/f447ce933ad8dd975b17aeda03cc46b0cace0b03/

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../gmp-01-arm-asm-conditional-on-no-thumb-1.patch |   21 ++++++++++++++++++++
 .../gmp-02-arm-asm-conditional-on-no-thumb-2.patch |   21 ++++++++++++++++++++
 2 files changed, 42 insertions(+), 0 deletions(-)

diff --git a/package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch b/package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch
new file mode 100644
index 0000000..eb678b0
--- /dev/null
+++ b/package/gmp/gmp-01-arm-asm-conditional-on-no-thumb-1.patch
@@ -0,0 +1,21 @@
+
+# HG changeset patch
+# User Torbjorn Granlund <tege@gmplib.org>
+# Date 1396035313 -3600
+# Node ID c56ea318eb6435bdd28dbfef657b2fe372134f1f
+# Parent  c6fe20ab62acc266ff5ad3629bef447bc43dcd1b
+Conditionalise ARM asm on !__thumb__.
+
+diff -r c6fe20ab62ac -r c56ea318eb64 mpn/generic/mod_1_1.c
+--- a/mpn/generic/mod_1_1.c	Wed Mar 26 12:58:33 2014 +0100
++++ b/mpn/generic/mod_1_1.c	Fri Mar 28 20:35:13 2014 +0100
+@@ -129,7 +129,7 @@
+ 	     "%2" ((UDItype)(a0)), "r" ((UDItype)(b0)) __CLOBBER_CC)
+ #endif
+ 
+-#if defined (__arm__) && W_TYPE_SIZE == 32
++#if defined (__arm__) && !defined (__thumb__) && W_TYPE_SIZE == 32
+ #define add_mssaaaa(m, sh, sl, ah, al, bh, bl)				\
+   __asm__ (  "adds	%2, %5, %6\n\t"					\
+ 	     "adcs	%1, %3, %4\n\t"					\
+
diff --git a/package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch b/package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch
new file mode 100644
index 0000000..666cf58
--- /dev/null
+++ b/package/gmp/gmp-02-arm-asm-conditional-on-no-thumb-2.patch
@@ -0,0 +1,21 @@
+
+# HG changeset patch
+# User Torbjorn Granlund <tege@gmplib.org>
+# Date 1396602422 -7200
+# Node ID 676e2d0f0e4dd301a7066079d2c9326c25c34a40
+# Parent  0194a75b56b21a9196626430af86c5bd9110c42d
+Conditionalise ARM asm on !__thumb__.
+
+diff -r 0194a75b56b2 -r 676e2d0f0e4d mpn/generic/div_qr_1n_pi1.c
+--- a/mpn/generic/div_qr_1n_pi1.c	Thu Apr 03 23:58:51 2014 +0200
++++ b/mpn/generic/div_qr_1n_pi1.c	Fri Apr 04 11:07:02 2014 +0200
+@@ -130,7 +130,7 @@
+ 	     "%2" ((UDItype)(a0)), "r" ((UDItype)(b0)) __CLOBBER_CC)
+ #endif
+ 
+-#if defined (__arm__) && W_TYPE_SIZE == 32
++#if defined (__arm__) && !defined (__thumb__) && W_TYPE_SIZE == 32
+ #define add_mssaaaa(m, sh, sl, ah, al, bh, bl)				\
+   __asm__ (  "adds	%2, %5, %6\n\t"					\
+ 	     "adcs	%1, %3, %4\n\t"					\
+
