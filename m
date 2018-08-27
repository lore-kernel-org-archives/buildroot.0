From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 27 Aug 2018 23:57:00 +0200
Subject: [Buildroot] [git commit] aircrack-ng: fix build with mmx
Message-ID: <20180827220219.BA6F58E81E@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=46481878fe8943f67555d531aaaac84db618d9d6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 39387fc80f90f3a9ac9ef9f3aa32da5776a0721e removed mmx support
however aircrack-ng fails to build on platforms with mmx because an
error is raised if __MMX__ is defined.

Fixes:
 - http://autobuild.buildroot.net/results/b7362b69435e9ef6fb2aedc50743e88dbd7a5c72

[Upstream status: merged
(https://github.com/aircrack-ng/aircrack-ng/pull/1943)]

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/aircrack-ng/0001-Fix-build-with-mmx.patch | 71 +++++++++++++++++++++++
 1 file changed, 71 insertions(+)

diff --git a/package/aircrack-ng/0001-Fix-build-with-mmx.patch b/package/aircrack-ng/0001-Fix-build-with-mmx.patch
new file mode 100644
index 0000000000..620d806d88
--- /dev/null
+++ b/package/aircrack-ng/0001-Fix-build-with-mmx.patch
@@ -0,0 +1,71 @@
+From 37078a46346f01141cc13026bb5ad426bb98f3a0 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Wed, 22 Aug 2018 20:01:07 +0200
+Subject: [PATCH] Fix build with mmx
+
+Commit 39387fc80f90f3a9ac9ef9f3aa32da5776a0721e removed mmx support
+however aircrack-ng fails to build on platforms with mmx because an
+error is raised if __MMX__ is defined.
+
+Fixes:
+ - http://autobuild.buildroot.net/results/b7362b69435e9ef6fb2aedc50743e88dbd7a5c72
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: merged (https://github.com/aircrack-ng/aircrack-ng/pull/1943)]
+---
+ src/aircrack-crypto/arch.h              | 3 ---
+ src/aircrack-crypto/memory.h            | 3 ---
+ src/aircrack-crypto/pseudo_intrinsics.h | 9 ---------
+ 3 files changed, 15 deletions(-)
+
+diff --git a/src/aircrack-crypto/arch.h b/src/aircrack-crypto/arch.h
+index 1a19ddd6..78b9e619 100644
+--- a/src/aircrack-crypto/arch.h
++++ b/src/aircrack-crypto/arch.h
+@@ -357,9 +357,6 @@
+ #elif __SSE2__
+ #define SIMD_COEF_32 4
+ #define SIMD_COEF_64 2
+-#elif __MMX__
+-#define SIMD_COEF_32 2
+-#define SIMD_COEF_64 1
+ #endif
+ 
+ /*
+diff --git a/src/aircrack-crypto/memory.h b/src/aircrack-crypto/memory.h
+index 83b048f0..24b1c95b 100644
+--- a/src/aircrack-crypto/memory.h
++++ b/src/aircrack-crypto/memory.h
+@@ -70,9 +70,6 @@
+ #elif __SSE2__
+ #define SIMD_COEF_32 4
+ #define SIMD_COEF_64 2
+-#elif __MMX__
+-#define SIMD_COEF_32 2
+-#define SIMD_COEF_64 1
+ #endif
+ 
+ /*
+diff --git a/src/aircrack-crypto/pseudo_intrinsics.h b/src/aircrack-crypto/pseudo_intrinsics.h
+index dd0ca379..f5527bdd 100644
+--- a/src/aircrack-crypto/pseudo_intrinsics.h
++++ b/src/aircrack-crypto/pseudo_intrinsics.h
+@@ -658,15 +658,6 @@ _inline __m128i _mm_set1_epi64(long long a)
+ 	(vtype)(vtype64) { x0, x1 }
+ #endif
+ 
+-/******************************** MMX *********************************/
+-
+-#elif __MMX__
+-#include <mmintrin.h>
+-
+-typedef __m64i vtype;
+-
+-#error MMX intrinsics not implemented (contributions are welcome!)
+-
+ #endif /* __SIMD__ elif __SIMD__ elif __SIMD__ */
+ 
+ /************************* COMMON STUFF BELOW *************************/
+-- 
+2.14.1
+
