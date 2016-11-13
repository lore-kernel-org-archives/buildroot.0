From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 13 Nov 2016 12:54:20 +0100
Subject: [Buildroot] [git commit] tinymembench: add patch to fix build on
	Cortex-M
Message-ID: <20161113115425.DA075816B8@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=064004ae9df23c9671673a9ae1f7b2d1042c15ee
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This commit adds a patch to the tinymembench package that fixes the
build on Thumb-only architectures such as ARM Cortex-M. The patch has
been submitted upstream in
https://github.com/ssvb/tinymembench/pull/13.

Fixes:

  http://autobuild.buildroot.net/results/5f0148cef22b3b9aee691e1702722a0bbc68c8e8/

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 ...arm-fix-build-on-Thumb-only-architectures.patch | 47 ++++++++++++++++++++++
 1 file changed, 47 insertions(+)

diff --git a/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch b/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
new file mode 100644
index 0000000..88559ec
--- /dev/null
+++ b/package/tinymembench/0001-arm-fix-build-on-Thumb-only-architectures.patch
@@ -0,0 +1,47 @@
+From 034a3552e9700c6d424bd706db106f5bce1f5a5e Mon Sep 17 00:00:00 2001
+From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+Date: Fri, 11 Nov 2016 21:49:39 +0100
+Subject: [PATCH] arm: fix build on Thumb-only architectures
+
+Building tinymembench for ARM Cortex-M currently fails, because the
+arm-neon.S file contains ARM code that doesn't build on Thumb-only
+architectures. To account for this and fix the build for Cortex-M,
+this patch adjusts the compile time condition to also verify that the
+architecture supports the ARM instruction set, by testing the
+__ARM_ARCH_ISA_ARM compiler define.
+
+Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
+---
+ arm-neon.S | 2 +-
+ asm-opt.c  | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/arm-neon.S b/arm-neon.S
+index 4db78ce..19c30ad 100644
+--- a/arm-neon.S
++++ b/arm-neon.S
+@@ -21,7 +21,7 @@
+  * DEALINGS IN THE SOFTWARE.
+  */
+ 
+-#ifdef __arm__
++#if defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
+ 
+ .text
+ .fpu neon
+diff --git a/asm-opt.c b/asm-opt.c
+index 9da4596..eba1183 100644
+--- a/asm-opt.c
++++ b/asm-opt.c
+@@ -202,7 +202,7 @@ bench_info *get_asm_framebuffer_benchmarks(void)
+         return empty;
+ }
+ 
+-#elif defined(__arm__)
++#elif defined(__arm__) && defined(__ARM_ARCH_ISA_ARM)
+ 
+ #include "arm-neon.h"
+ 
+-- 
+2.7.4
+
