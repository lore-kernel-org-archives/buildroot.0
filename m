From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Apr 2018 23:03:29 +0200
Subject: [Buildroot] [PATCH v2,1/1] cryptopp: bump to version 7.0.0
Message-ID: <20180409210329.8592-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove patch (applied upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
Changes v1 -> v2 (after review of Thomas Petazzoni):
 - Rebase/fix patch (remove deletion of uncommited patches)

 ...0001-Fix-GCC-version-for-RDSEED-intrinsic.patch | 49 ----------------------
 package/cryptopp/cryptopp.hash                     |  4 +-
 package/cryptopp/cryptopp.mk                       |  2 +-
 3 files changed, 3 insertions(+), 52 deletions(-)
 delete mode 100644 package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch

diff --git a/package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch b/package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch
deleted file mode 100644
index e0596017ad..0000000000
--- a/package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch
+++ /dev/null
@@ -1,49 +0,0 @@
-From 31465400675c75d8ea0556d708a7efbf915bc366 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 10 Mar 2018 12:14:23 +0100
-Subject: [PATCH] Fix GCC version for RDSEED intrinsic
-
-rdseed is only available on gcc 4.8.x, not on gcc 4.7.x
-
-Fixes:
- - http://autobuild.buildroot.org/results/9ab386124e4a09b50598c6f95ad40b25a83d227e
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- rdrand.cpp | 6 +++---
- 1 file changed, 3 insertions(+), 3 deletions(-)
-
-diff --git a/rdrand.cpp b/rdrand.cpp
-index 900fcd96..64b12208 100644
---- a/rdrand.cpp
-+++ b/rdrand.cpp
-@@ -74,7 +74,7 @@
- #  else
- #    define GCC_RDRAND_ASM_AVAILABLE 1
- #  endif
--#  if defined(__RDSEED__) && (CRYPTOPP_GCC_VERSION >= 40700) && !defined(__OPTIMIZE__)
-+#  if defined(__RDSEED__) && (CRYPTOPP_GCC_VERSION >= 40800) && !defined(__OPTIMIZE__)
- #    define ALL_RDSEED_INTRIN_AVAILABLE 1
- #  else
- #    define GCC_RDSEED_ASM_AVAILABLE 1
-@@ -291,7 +291,7 @@ inline void RDSEED32(void* output)
-         : "=a" (*reinterpret_cast<word32*>(output))
-         : : "cc"
-     );
--#elif defined(GCC_RDSEED_ASM_AVAILABLE) && (CRYPTOPP_GCC_VERSION >= 40700)
-+#elif defined(GCC_RDSEED_ASM_AVAILABLE) && (CRYPTOPP_GCC_VERSION >= 40800)
-     __asm__ __volatile__
-     (
-         INTEL_NOPREFIX
-@@ -333,7 +333,7 @@ inline void RDSEED64(void* output)
-         : "=a" (*reinterpret_cast<word64*>(output))
-         : : "cc"
-     );
--#elif defined(GCC_RDSEED_ASM_AVAILABLE) && (CRYPTOPP_GCC_VERSION >= 40700)
-+#elif defined(GCC_RDSEED_ASM_AVAILABLE) && (CRYPTOPP_GCC_VERSION >= 40800)
-     __asm__ __volatile__
-     (
-         INTEL_NOPREFIX
--- 
-2.11.0
-
diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index d124e11a81..389f05f654 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release610.html:
-sha256  21289d2511101a9350c87c8eb1f4982d4a266e8037b19dab79a32cc13ea108c7  cryptopp610.zip
+# Hash from: https://www.cryptopp.com/release700.html:
+sha256  a4bc939910edd3d29fb819a6fc0dfdc293f686fa62326f61c56d72d0a366ceb0  cryptopp700.zip
 
 # Hash for license file:
 sha256  fe5f5f187e6e38ac2f833956fc5c4cab2df08797cff07f540e4ee74f12f7ee5b  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index b4997aba9d..08b18f2fbc 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 6.1.0
+CRYPTOPP_VERSION = 7.0.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = http://cryptopp.com/
 CRYPTOPP_LICENSE = BSL-1.0
-- 
2.14.1
