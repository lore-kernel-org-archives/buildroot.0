From: Laurent Cans <laurent.cans@gmail.com>
Date: Tue,  2 Oct 2018 21:53:01 +0200
Subject: [Buildroot] [PATCH 1/1] aircrack-ng: bump to version 1.4
Message-ID: <20181002195301.19546-1-laurent.cans@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- align LICENSE hash to minor modifications in file

Signed-off-by: Laurent Cans <laurent.cans@gmail.com>
---
 package/aircrack-ng/0001-Fix-build-with-mmx.patch  | 71 ----------------------
 ...1-autotools-Fix-optional-SIMD-on-PPC-arch.patch | 69 ---------------------
 package/aircrack-ng/aircrack-ng.hash               |  6 +-
 package/aircrack-ng/aircrack-ng.mk                 |  2 +-
 4 files changed, 4 insertions(+), 144 deletions(-)
 delete mode 100644 package/aircrack-ng/0001-Fix-build-with-mmx.patch
 delete mode 100644 package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch

diff --git a/package/aircrack-ng/0001-Fix-build-with-mmx.patch b/package/aircrack-ng/0001-Fix-build-with-mmx.patch
deleted file mode 100644
index 620d806d88..0000000000
--- a/package/aircrack-ng/0001-Fix-build-with-mmx.patch
+++ /dev/null
@@ -1,71 +0,0 @@
-From 37078a46346f01141cc13026bb5ad426bb98f3a0 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Wed, 22 Aug 2018 20:01:07 +0200
-Subject: [PATCH] Fix build with mmx
-
-Commit 39387fc80f90f3a9ac9ef9f3aa32da5776a0721e removed mmx support
-however aircrack-ng fails to build on platforms with mmx because an
-error is raised if __MMX__ is defined.
-
-Fixes:
- - http://autobuild.buildroot.net/results/b7362b69435e9ef6fb2aedc50743e88dbd7a5c72
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: merged (https://github.com/aircrack-ng/aircrack-ng/pull/1943)]
----
- src/aircrack-crypto/arch.h              | 3 ---
- src/aircrack-crypto/memory.h            | 3 ---
- src/aircrack-crypto/pseudo_intrinsics.h | 9 ---------
- 3 files changed, 15 deletions(-)
-
-diff --git a/src/aircrack-crypto/arch.h b/src/aircrack-crypto/arch.h
-index 1a19ddd6..78b9e619 100644
---- a/src/aircrack-crypto/arch.h
-+++ b/src/aircrack-crypto/arch.h
-@@ -357,9 +357,6 @@
- #elif __SSE2__
- #define SIMD_COEF_32 4
- #define SIMD_COEF_64 2
--#elif __MMX__
--#define SIMD_COEF_32 2
--#define SIMD_COEF_64 1
- #endif
- 
- /*
-diff --git a/src/aircrack-crypto/memory.h b/src/aircrack-crypto/memory.h
-index 83b048f0..24b1c95b 100644
---- a/src/aircrack-crypto/memory.h
-+++ b/src/aircrack-crypto/memory.h
-@@ -70,9 +70,6 @@
- #elif __SSE2__
- #define SIMD_COEF_32 4
- #define SIMD_COEF_64 2
--#elif __MMX__
--#define SIMD_COEF_32 2
--#define SIMD_COEF_64 1
- #endif
- 
- /*
-diff --git a/src/aircrack-crypto/pseudo_intrinsics.h b/src/aircrack-crypto/pseudo_intrinsics.h
-index dd0ca379..f5527bdd 100644
---- a/src/aircrack-crypto/pseudo_intrinsics.h
-+++ b/src/aircrack-crypto/pseudo_intrinsics.h
-@@ -658,15 +658,6 @@ _inline __m128i _mm_set1_epi64(long long a)
- 	(vtype)(vtype64) { x0, x1 }
- #endif
- 
--/******************************** MMX *********************************/
--
--#elif __MMX__
--#include <mmintrin.h>
--
--typedef __m64i vtype;
--
--#error MMX intrinsics not implemented (contributions are welcome!)
--
- #endif /* __SIMD__ elif __SIMD__ elif __SIMD__ */
- 
- /************************* COMMON STUFF BELOW *************************/
--- 
-2.14.1
-
diff --git a/package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch b/package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch
deleted file mode 100644
index 11568525e8..0000000000
--- a/package/aircrack-ng/0001-autotools-Fix-optional-SIMD-on-PPC-arch.patch
+++ /dev/null
@@ -1,69 +0,0 @@
-From 7cf680386de051cb8308510680299aef810fe743 Mon Sep 17 00:00:00 2001
-From: Joseph Benden <joe@benden.us>
-Date: Fri, 17 Aug 2018 13:23:39 -0700
-Subject: [PATCH] autotools: Fix optional SIMD on PPC arch
-
-Resolves:
-https://github.com/aircrack-ng/aircrack-ng/issues/1941
-
-Upstream (applied to their master, not yet in a release): (squashed together)
-https://github.com/aircrack-ng/aircrack-ng/commit/97838c6b903d33c8403a4bdcae60b8619fad7538
-https://github.com/aircrack-ng/aircrack-ng/commit/efc0b2718f4afd9582419902d205b242e546b9ab
-
-Signed-off-by: Joseph Benden <joe@benden.us>
-Signed-off-by: Matt Weber <matthew.weber@rockwellcollins.com
----
- build/m4/aircrack_ng_simd.m4    | 4 ++++
- src/aircrack-crypto/Makefile.am | 7 ++++++-
- 2 files changed, 10 insertions(+), 1 deletion(-)
-
-diff --git a/build/m4/aircrack_ng_simd.m4 b/build/m4/aircrack_ng_simd.m4
-index 29c3816..2bcc41f 100644
---- a/build/m4/aircrack_ng_simd.m4
-+++ b/build/m4/aircrack_ng_simd.m4
-@@ -132,6 +132,7 @@ then
-     AX_CHECK_COMPILE_FLAG([-maltivec], [
-         AX_APPEND_FLAG(-maltivec, [ppc_altivec_[]_AC_LANG_ABBREV[]flags])
-         AC_SUBST(ppc_altivec_[]_AC_LANG_ABBREV[]flags)
-+        ALTIVEC_FOUND=1
-     ])
- 
-     AX_CHECK_COMPILE_FLAG([-mabi=altivec], [
-@@ -147,6 +148,7 @@ then
-     AX_CHECK_COMPILE_FLAG([-mpower8-vector], [
-         AX_APPEND_FLAG(-mpower8-vector, [ppc_altivec_[]_AC_LANG_ABBREV[]flags])
-         AC_SUBST(ppc_altivec_[]_AC_LANG_ABBREV[]flags)
-+        POWER8_FOUND=1
-     ])
- fi
- 
-@@ -258,6 +260,8 @@ AM_CONDITIONAL([ARM], [test "$IS_ARM" = 1])
- AM_CONDITIONAL([PPC], [test "$IS_PPC" = 1])
- AM_CONDITIONAL([NEON], [test "$NEON_FOUND" = 1])
- AM_CONDITIONAL([AVX512F], [test "$AVX512F_FOUND" = 1])
-+AM_CONDITIONAL([ALTIVEC], [test "$ALTIVEC_FOUND" = 1])
-+AM_CONDITIONAL([POWER8], [test "$POWER8_FOUND" = 1])
- ])
- 
- AC_DEFUN([AIRCRACK_NG_SIMD_C], [
-diff --git a/src/aircrack-crypto/Makefile.am b/src/aircrack-crypto/Makefile.am
-index 8cc685d..a1664a5 100644
---- a/src/aircrack-crypto/Makefile.am
-+++ b/src/aircrack-crypto/Makefile.am
-@@ -131,7 +131,12 @@ lib_LTLIBRARIES += libaircrack-crypto-arm-neon.la
- endif
- endif
- if PPC
--lib_LTLIBRARIES += libaircrack-crypto-ppc-altivec.la libaircrack-crypto-ppc-power8.la
-+if ALTIVEC
-+lib_LTLIBRARIES += libaircrack-crypto-ppc-altivec.la
-+endif
-+if POWER8
-+lib_LTLIBRARIES += libaircrack-crypto-ppc-power8.la
-+endif
- endif
- if X86
- if AVX512F
--- 
-1.9.1
-
diff --git a/package/aircrack-ng/aircrack-ng.hash b/package/aircrack-ng/aircrack-ng.hash
index 7c5fe9f0de..031e803eee 100644
--- a/package/aircrack-ng/aircrack-ng.hash
+++ b/package/aircrack-ng/aircrack-ng.hash
@@ -1,6 +1,6 @@
 # From http://www.aircrack-ng.org/downloads.html
-sha1 245464585dfd24622807a8f868d62d9d00f6a22c aircrack-ng-1.3.tar.gz
-md5 c7c5b076dee0c25ee580b0f56f455623 aircrack-ng-1.3.tar.gz
+sha1 22bae2c6f21e463df62b4c06c9c3c45c42a9b4ea aircrack-ng-1.4.tar.gz
+md5 24e22f6f6eca1e7dc0d203e5719d3e8d aircrack-ng-1.3.tar.gz
 
 # Hash for license file:
-sha256 e6d6a009505e345fe949e1310334fcb0747f28dae2856759de102ab66b722cb4 LICENSE
+sha256 fc51fd3a97223f2fd47b057202d4a6b0daaedf23b5a1f5ff8723c192fc1e021d LICENSE
diff --git a/package/aircrack-ng/aircrack-ng.mk b/package/aircrack-ng/aircrack-ng.mk
index f338121a48..350e251bfe 100644
--- a/package/aircrack-ng/aircrack-ng.mk
+++ b/package/aircrack-ng/aircrack-ng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-AIRCRACK_NG_VERSION = 1.3
+AIRCRACK_NG_VERSION = 1.4
 AIRCRACK_NG_SITE = http://download.aircrack-ng.org
 AIRCRACK_NG_LICENSE = GPL-2.0+
 AIRCRACK_NG_LICENSE_FILES = LICENSE
-- 
2.11.0
