From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  8 May 2017 21:45:47 +0200
Subject: [Buildroot] [PATCH v2 1/4] mpir: fix build on ARM with old binutils
	versions
In-Reply-To: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
References: <1494272750-20723-1-git-send-email-thomas.petazzoni@free-electrons.com>
Message-ID: <1494272750-20723-2-git-send-email-thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Old binutils versions are affected by a bug when the assembly code has
whitespace between [ ] signs, causing a build failure of the mpir
package with ARM toolchains using such old binutils versions.

This commit fixes that by adding a patch that removes those whitespaces.

Fixes:

 - http://autobuild.buildroot.net/results/ec67ffdef74b9a61d0491e71f8cb2f8f0b6daa50/
   armv7-ctng-linux-gnueabihf Crosstool-NG toolchain

 - http://autobuild.buildroot.net/results/2e4a27af60065db51aca9e69701bc191d24b2209/
   armv5-ctng-linux-gnueabi Crosstool-NG toolchain

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...rm-udiv.asm-workaround-binutils-bug-14887.patch | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch

diff --git a/package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch b/package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch
new file mode 100644
index 0000000..6a6f467
--- /dev/null
+++ b/package/mpir/0001-mpn-arm-udiv.asm-workaround-binutils-bug-14887.patch
@@ -0,0 +1,40 @@
+From d858ce52d1971cb4e8500b0ebc0472fdae4686ec Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Sun, 7 May 2017 23:12:04 +0200
+Subject: [PATCH] mpn/arm/udiv.asm: workaround binutils bug #14887
+
+Old binutils versions are affected by bug #14887,
+https://sourceware.org/bugzilla/show_bug.cgi?id=14887, which causes a
+build failure when a register specification is surrounded by
+whitespaces. Removing those whitespaces works around the issue.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ mpn/arm/udiv.asm | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/mpn/arm/udiv.asm b/mpn/arm/udiv.asm
+index 25197a6..ed11eb3 100644
+--- a/mpn/arm/udiv.asm
++++ b/mpn/arm/udiv.asm
+@@ -50,7 +50,7 @@ L(oop):	divstep(n1,n0,d)
+ 	teq	r12, #0
+ 	bne	L(oop)
+ 
+-	str	n1, [ rem_ptr ]		C store remainder
++	str	n1, [rem_ptr]		C store remainder
+ 	adc	r0, n0, n0		C quotient: add last carry from divstep
+ 	mov	pc, lr
+ 
+@@ -89,7 +89,7 @@ L(oop2):
+ 	addcs	n0, n0, #1		C adjust quotient
+ 
+ L(_even_divisor):
+-	str	n1, [ rem_ptr ]		C store remainder
++	str	n1, [rem_ptr]		C store remainder
+ 	mov	r0, n0			C quotient
+ 	ldmfd	sp!, { r8, pc }
+ EPILOGUE(mpn_udiv_qrnnd)
+-- 
+2.7.4
+
-- 
2.7.4
