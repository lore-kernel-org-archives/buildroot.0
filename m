From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Aug 2018 10:12:08 +0200
Subject: [Buildroot] [git commit branch/2018.05.x] mbedtls: fix x86 PIC
 build with GCC < 5
Message-ID: <20180828081210.54CC68138B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=992c2399e0d340a15e837c8302fa00e765dc1fd1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2018.05.x

Fixes:
http://autobuild.buildroot.net/results/d6d/d6dc9a640aa1f6650a3e7b9397f2fe2ae3433f4d/
http://autobuild.buildroot.net/results/ab5/ab5a58ea7845f9f378454ee1aa7e872448618ba9/

ebx was recently added to the x86 inline asm MULADDC_STOP clobber list to
fix #1550, but this causes the build to fail with GCC < 5 when building in
PIC mode with errors like:

include/mbedtls/bn_mul.h:46:13: error: PIC register clobbered by ???ebx??? in ???asm???

This is because older GCC versions treated the x86 ebx register (which is
used for the GOT) as a fixed reserved register when building as PIC.

This is fixed by an improved register allocator in GCC 5+.  From the release
notes:

Register allocation improvements: Reuse of the PIC hard register, instead of
using a fixed register, was implemented on x86/x86-64 targets.  This
improves generated PIC code performance as more hard registers can be used.

https://www.gnu.org/software/gcc/gcc-5/changes.html

As a workaround, add a patch to detect this situation and disable the inline
assembly, similar to the MULADDC_CANNOT_USE_R7 logic.

Patch submitted upstream: https://github.com/ARMmbed/mbedtls/pull/1986

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 11241ac656af569894ead9561ebf53abb5d5f18d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...x-x86-PIC-inline-ASM-compilation-with-GCC.patch | 74 ++++++++++++++++++++++
 1 file changed, 74 insertions(+)

diff --git a/package/mbedtls/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch b/package/mbedtls/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
new file mode 100644
index 0000000000..60bf53f6e4
--- /dev/null
+++ b/package/mbedtls/0001-bn_mul.h-fix-x86-PIC-inline-ASM-compilation-with-GCC.patch
@@ -0,0 +1,74 @@
+From a0ae2ba37ca479c6edddec8634b25686be965e0d Mon Sep 17 00:00:00 2001
+From: Peter Korsgaard <peter@korsgaard.com>
+Date: Mon, 27 Aug 2018 22:50:57 +0200
+Subject: [PATCH] bn_mul.h: fix x86 PIC inline ASM compilation with GCC < 5
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
+
+Fixes #1910
+
+With ebx added to the MULADDC_STOP clobber list to fix #1550, the inline
+assembly fails to build with GCC < 5 in PIC mode with the following error:
+
+include/mbedtls/bn_mul.h:46:13: error: PIC register clobbered by ???ebx??? in ???asm???
+
+This is because older GCC versions treated the x86 ebx register (which is
+used for the GOT) as a fixed reserved register when building as PIC.
+
+This is fixed by an improved register allocator in GCC 5+.  From the release
+notes:
+
+Register allocation improvements: Reuse of the PIC hard register, instead of
+using a fixed register, was implemented on x86/x86-64 targets.  This
+improves generated PIC code performance as more hard registers can be used.
+
+https://www.gnu.org/software/gcc/gcc-5/changes.html
+
+As a workaround, detect this situation and disable the inline assembly,
+similar to the MULADDC_CANNOT_USE_R7 logic.
+
+Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
+Upstream: https://github.com/ARMmbed/mbedtls/pull/1986
+---
+ include/mbedtls/bn_mul.h | 18 +++++++++++++++++-
+ 1 file changed, 17 insertions(+), 1 deletion(-)
+
+diff --git a/include/mbedtls/bn_mul.h b/include/mbedtls/bn_mul.h
+index b587317d9..74a2d29be 100644
+--- a/include/mbedtls/bn_mul.h
++++ b/include/mbedtls/bn_mul.h
+@@ -50,13 +50,29 @@
+ #if defined(__GNUC__) && \
+     ( !defined(__ARMCC_VERSION) || __ARMCC_VERSION >= 6000000 )
+ 
++/*
++ * GCC < 5.0 treated the x86 ebx (which is used for the GOT) as a
++ * fixed reserved register when building as PIC, leading to errors
++ * like: bn_mul.h:46:13: error: PIC register clobbered by ???ebx??? in ???asm???
++ *
++ * This is fixed by an improved register allocator in GCC 5+. From the
++ * release notes:
++ * Register allocation improvements: Reuse of the PIC hard register,
++ * instead of using a fixed register, was implemented on x86/x86-64
++ * targets. This improves generated PIC code performance as more hard
++ * registers can be used.
++ */
++#if defined(__GNUC__) && __GNUC__ < 5 && defined(__PIC__)
++#define MULADDC_CANNOT_USE_EBX
++#endif
++
+ /*
+  * Disable use of the i386 assembly code below if option -O0, to disable all
+  * compiler optimisations, is passed, detected with __OPTIMIZE__
+  * This is done as the number of registers used in the assembly code doesn't
+  * work with the -O0 option.
+  */
+-#if defined(__i386__) && defined(__OPTIMIZE__)
++#if defined(__i386__) && defined(__OPTIMIZE__) && !defined(MULADDC_CANNOT_USE_EBX)
+ 
+ #define MULADDC_INIT                        \
+     asm(                                    \
+-- 
+2.11.0
+
