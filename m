From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Tue, 28 Aug 2018 23:17:07 +0200
Subject: [Buildroot] [git commit] package/aircrack-ng: powerpc support
 optional ALTIVEC
Message-ID: <20180828213103.33EA38140F@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=434967638490a2c06c99723a39d82826bdb67c35
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds support for the powerpc arch to conditionally
check if an arch provies altivec accelerator support, similar
to other SIMD on ARM/x86.

Upstream issue: aircrack-ng/aircrack-ng#1941

Fixes
http://autobuild.buildroot.net/results/87e82a5e8d0b1c1ff10ec3e59d25bcd56b329075

Tested against both a e6500 with Altivec and a e500 target.

Signed-off-by: Matthew Weber <matthew.weber@rockwellcollins.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...1-autotools-Fix-optional-SIMD-on-PPC-arch.patch | 69 ++++++++++++++++++++++
 1 file changed, 69 insertions(+)

diff --git a/package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch b/package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch
new file mode 100644
index 0000000000..11568525e8
--- /dev/null
+++ b/package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch
@@ -0,0 +1,69 @@
+From 7cf680386de051cb8308510680299aef810fe743 Mon Sep 17 00:00:00 2001
+From: Joseph Benden <joe@benden.us>
+Date: Fri, 17 Aug 2018 13:23:39 -0700
+Subject: [PATCH] autotools: Fix optional SIMD on PPC arch
+
+Resolves:
+https://github.com/aircrack-ng/aircrack-ng/issues/1941
+
+Upstream (applied to their master, not yet in a release): (squashed together)
+https://github.com/aircrack-ng/aircrack-ng/commit/97838c6b903d33c8403a4bdcae60b8619fad7538
+https://github.com/aircrack-ng/aircrack-ng/commit/efc0b2718f4afd9582419902d205b242e546b9ab
+
+Signed-off-by: Joseph Benden <joe@benden.us>
+Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com
+---
+ build/m4/aircrack_ng_simd.m4    | 4 ++++
+ src/aircrack-crypto/Makefile.am | 7 ++++++-
+ 2 files changed, 10 insertions(+), 1 deletion(-)
+
+diff --git a/build/m4/aircrack_ng_simd.m4 b/build/m4/aircrack_ng_simd.m4
+index 29c3816..2bcc41f 100644
+--- a/build/m4/aircrack_ng_simd.m4
++++ b/build/m4/aircrack_ng_simd.m4
+@@ -132,6 +132,7 @@ then
+     AX_CHECK_COMPILE_FLAG([-maltivec], [
+         AX_APPEND_FLAG(-maltivec, [ppc_altivec_[]_AC_LANG_ABBREV[]flags])
+         AC_SUBST(ppc_altivec_[]_AC_LANG_ABBREV[]flags)
++        ALTIVEC_FOUND=1
+     ])
+ 
+     AX_CHECK_COMPILE_FLAG([-mabi=altivec], [
+@@ -147,6 +148,7 @@ then
+     AX_CHECK_COMPILE_FLAG([-mpower8-vector], [
+         AX_APPEND_FLAG(-mpower8-vector, [ppc_altivec_[]_AC_LANG_ABBREV[]flags])
+         AC_SUBST(ppc_altivec_[]_AC_LANG_ABBREV[]flags)
++        POWER8_FOUND=1
+     ])
+ fi
+ 
+@@ -258,6 +260,8 @@ AM_CONDITIONAL([ARM], [test "$IS_ARM" = 1])
+ AM_CONDITIONAL([PPC], [test "$IS_PPC" = 1])
+ AM_CONDITIONAL([NEON], [test "$NEON_FOUND" = 1])
+ AM_CONDITIONAL([AVX512F], [test "$AVX512F_FOUND" = 1])
++AM_CONDITIONAL([ALTIVEC], [test "$ALTIVEC_FOUND" = 1])
++AM_CONDITIONAL([POWER8], [test "$POWER8_FOUND" = 1])
+ ])
+ 
+ AC_DEFUN([AIRCRACK_NG_SIMD_C], [
+diff --git a/src/aircrack-crypto/Makefile.am b/src/aircrack-crypto/Makefile.am
+index 8cc685d..a1664a5 100644
+--- a/src/aircrack-crypto/Makefile.am
++++ b/src/aircrack-crypto/Makefile.am
+@@ -131,7 +131,12 @@ lib_LTLIBRARIES += libaircrack-crypto-arm-neon.la
+ endif
+ endif
+ if PPC
+-lib_LTLIBRARIES += libaircrack-crypto-ppc-altivec.la libaircrack-crypto-ppc-power8.la
++if ALTIVEC
++lib_LTLIBRARIES += libaircrack-crypto-ppc-altivec.la
++endif
++if POWER8
++lib_LTLIBRARIES += libaircrack-crypto-ppc-power8.la
++endif
+ endif
+ if X86
+ if AVX512F
+-- 
+1.9.1
+
