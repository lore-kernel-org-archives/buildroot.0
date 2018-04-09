From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Mon,  9 Apr 2018 22:41:56 +0200
Subject: [Buildroot] [PATCH 1/1] cryptopp: bump to version 7.0.0
Message-ID: <20180409204156.5626-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Remove all patches (applied upstream)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...0001-Fix-GCC-version-for-RDSEED-intrinsic.patch |  49 -----
 ..._HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch |  35 ----
 ...ser-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch | 230 ---------------------
 package/cryptopp/cryptopp.hash                     |   4 +-
 package/cryptopp/cryptopp.mk                       |   2 +-
 5 files changed, 3 insertions(+), 317 deletions(-)
 delete mode 100644 package/cryptopp/0001-Fix-GCC-version-for-RDSEED-intrinsic.patch
 delete mode 100644 package/cryptopp/0002-Define-AT_HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch
 delete mode 100644 package/cryptopp/0003-Allow-user-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch

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
diff --git a/package/cryptopp/0002-Define-AT_HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch b/package/cryptopp/0002-Define-AT_HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch
deleted file mode 100644
index 79f0461573..0000000000
--- a/package/cryptopp/0002-Define-AT_HWCAP-AT_HWCAP2-if-getauxval-unavailable.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From 79e2c7071574f20dc554ca2c72fc48e286ffa7fd Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sun, 4 Mar 2018 12:05:05 +0100
-Subject: [PATCH] Define AT_HWCAP/AT_HWCAP2 if getauxval unavailable
-
-If CRYPTOPP_GETAUXV_AVAILABLE is undefined, getauxval function is
-defined to return 0 however AT_HWCAP and AT_HWCAP2 are not defined so
-compilation on toolchain without getauxval and these variables such as
-uclibc-ng will fail.
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- cpu.cpp | 6 ++++++
- 1 file changed, 6 insertions(+)
-
-diff --git a/cpu.cpp b/cpu.cpp
-index ba33be41..9f190508 100644
---- a/cpu.cpp
-+++ b/cpu.cpp
-@@ -30,6 +30,12 @@
- #if CRYPTOPP_GETAUXV_AVAILABLE
- # include <sys/auxv.h>
- #else
-+#ifndef AT_HWCAP
-+#define AT_HWCAP 16
-+#endif
-+#ifndef AT_HWCAP2
-+#define AT_HWCAP2 26
-+#endif
- unsigned long int getauxval(unsigned long int) { return 0; }
- #endif
- 
--- 
-2.14.1
-
diff --git a/package/cryptopp/0003-Allow-user-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch b/package/cryptopp/0003-Allow-user-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch
deleted file mode 100644
index ca8723342e..0000000000
--- a/package/cryptopp/0003-Allow-user-to-set-DCRYPTOPP_ARM_NEON_AVAILABLE-0.patch
+++ /dev/null
@@ -1,230 +0,0 @@
-From cb727adf950dc4d7b0a088799ae6f4f6425918a5 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Tue, 6 Mar 2018 00:35:20 +0100
-Subject: [PATCH] Allow user to set -DCRYPTOPP_ARM_NEON_AVAILABLE=0
-
-To be able to disable neon through -DCRYPTOPP_ARM_NEON_AVAILABLE=0,
-replace "if defined(CRYPTOPP_ARM_NEON_AVAILABLE)" by
-"if (CRYPTOPP_ARM_NEON_AVAILABLE)"
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
----
- adv-simd.h     |  2 +-
- simon-simd.cpp |  6 +++---
- simon.cpp      | 14 +++++++-------
- speck-simd.cpp |  8 ++++----
- speck.cpp      | 12 ++++++------
- 5 files changed, 21 insertions(+), 21 deletions(-)
-
-diff --git a/adv-simd.h b/adv-simd.h
-index 6047f5be..7a560764 100644
---- a/adv-simd.h
-+++ b/adv-simd.h
-@@ -67,7 +67,7 @@ ANONYMOUS_NAMESPACE_END
- 
- // *************************** ARM NEON ************************** //
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- 
- NAMESPACE_BEGIN(CryptoPP)
- 
-diff --git a/simon-simd.cpp b/simon-simd.cpp
-index ab908eca..b674193d 100644
---- a/simon-simd.cpp
-+++ b/simon-simd.cpp
-@@ -16,7 +16,7 @@
- // Do so in both simon.cpp and simon-simd.cpp.
- // #undef CRYPTOPP_SSSE3_AVAILABLE
- // #undef CRYPTOPP_SSE41_AVAILABLE
--// #undef CRYPTOPP_ARM_NEON_AVAILABLE
-+// #define CRYPTOPP_ARM_NEON_AVAILABLE 0
- 
- #if (CRYPTOPP_SSSE3_AVAILABLE)
- # include <pmmintrin.h>
-@@ -62,7 +62,7 @@ using CryptoPP::vec_swap;  // SunCC
- 
- // *************************** ARM NEON ************************** //
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- 
- template <class T>
- inline T UnpackHigh32(const T& a, const T& b)
-@@ -304,7 +304,7 @@ inline void SIMON64_Dec_6_Blocks(uint32x4_t &block0, uint32x4_t &block1,
- 
- #endif  // CRYPTOPP_ARM_NEON_AVAILABLE
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- 
- template <class T>
- inline T UnpackHigh64(const T& a, const T& b)
-diff --git a/simon.cpp b/simon.cpp
-index 438e9197..2d4eb53f 100644
---- a/simon.cpp
-+++ b/simon.cpp
-@@ -11,7 +11,7 @@
- // Do so in both simon.cpp and simon-simd.cpp.
- // #undef CRYPTOPP_SSSE3_AVAILABLE
- // #undef CRYPTOPP_SSE41_AVAILABLE
--// #undef CRYPTOPP_ARM_NEON_AVAILABLE
-+// #define CRYPTOPP_ARM_NEON_AVAILABLE 0
- 
- ANONYMOUS_NAMESPACE_BEGIN
- 
-@@ -193,7 +193,7 @@ ANONYMOUS_NAMESPACE_END
- 
- NAMESPACE_BEGIN(CryptoPP)
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- extern size_t SIMON64_Enc_AdvancedProcessBlocks_NEON(const word32* subKeys, size_t rounds,
-     const byte *inBlocks, const byte *xorBlocks, byte *outBlocks, size_t length, word32 flags);
- 
-@@ -201,7 +201,7 @@ extern size_t SIMON64_Dec_AdvancedProcessBlocks_NEON(const word32* subKeys, size
-     const byte *inBlocks, const byte *xorBlocks, byte *outBlocks, size_t length, word32 flags);
- #endif
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- extern size_t SIMON128_Enc_AdvancedProcessBlocks_NEON(const word64* subKeys, size_t rounds,
-     const byte *inBlocks, const byte *xorBlocks, byte *outBlocks, size_t length, word32 flags);
- 
-@@ -401,7 +401,7 @@ size_t SIMON64::Enc::AdvancedProcessBlocks(const byte *inBlocks, const byte *xor
-         return SIMON64_Enc_AdvancedProcessBlocks_SSE41(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SIMON64_Enc_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-@@ -417,7 +417,7 @@ size_t SIMON64::Dec::AdvancedProcessBlocks(const byte *inBlocks, const byte *xor
-         return SIMON64_Dec_AdvancedProcessBlocks_SSE41(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SIMON64_Dec_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-@@ -435,7 +435,7 @@ size_t SIMON128::Enc::AdvancedProcessBlocks(const byte *inBlocks, const byte *xo
-         return SIMON128_Enc_AdvancedProcessBlocks_SSSE3(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SIMON128_Enc_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-@@ -451,7 +451,7 @@ size_t SIMON128::Dec::AdvancedProcessBlocks(const byte *inBlocks, const byte *xo
-         return SIMON128_Dec_AdvancedProcessBlocks_SSSE3(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SIMON128_Dec_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-diff --git a/speck-simd.cpp b/speck-simd.cpp
-index 58d680dd..9cb15e42 100644
---- a/speck-simd.cpp
-+++ b/speck-simd.cpp
-@@ -16,7 +16,7 @@
- // Do so in both speck.cpp and speck-simd.cpp.
- // #undef CRYPTOPP_SSSE3_AVAILABLE
- // #undef CRYPTOPP_SSE41_AVAILABLE
--// #undef CRYPTOPP_ARM_NEON_AVAILABLE
-+// #define CRYPTOPP_ARM_NEON_AVAILABLE 0
- 
- #if (CRYPTOPP_SSSE3_AVAILABLE)
- # include <pmmintrin.h>
-@@ -59,7 +59,7 @@ using CryptoPP::word64;
- 
- // *************************** ARM NEON ************************** //
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- 
- template <class T>
- inline T UnpackHigh32(const T& a, const T& b)
-@@ -275,7 +275,7 @@ inline void SPECK64_Dec_6_Blocks(uint32x4_t &block0, uint32x4_t &block1,
- 
- #endif  // CRYPTOPP_ARM_NEON_AVAILABLE
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- 
- template <class T>
- inline T UnpackHigh64(const T& a, const T& b)
-@@ -912,7 +912,7 @@ NAMESPACE_BEGIN(CryptoPP)
- 
- // *************************** ARM NEON **************************** //
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- size_t SPECK64_Enc_AdvancedProcessBlocks_NEON(const word32* subKeys, size_t rounds,
-     const byte *inBlocks, const byte *xorBlocks, byte *outBlocks, size_t length, word32 flags)
- {
-diff --git a/speck.cpp b/speck.cpp
-index 9aaff67f..81647813 100644
---- a/speck.cpp
-+++ b/speck.cpp
-@@ -11,7 +11,7 @@
- // Do so in both speck.cpp and speck-simd.cpp.
- // #undef CRYPTOPP_SSSE3_AVAILABLE
- // #undef CRYPTOPP_SSE41_AVAILABLE
--// #undef CRYPTOPP_ARM_NEON_AVAILABLE
-+// #define CRYPTOPP_ARM_NEON_AVAILABLE 0
- 
- ANONYMOUS_NAMESPACE_BEGIN
- 
-@@ -170,7 +170,7 @@ ANONYMOUS_NAMESPACE_END
- 
- NAMESPACE_BEGIN(CryptoPP)
- 
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
- extern size_t SPECK64_Enc_AdvancedProcessBlocks_NEON(const word32* subKeys, size_t rounds,
-     const byte *inBlocks, const byte *xorBlocks, byte *outBlocks, size_t length, word32 flags);
- 
-@@ -376,7 +376,7 @@ size_t SPECK64::Enc::AdvancedProcessBlocks(const byte *inBlocks, const byte *xor
-         return SPECK64_Enc_AdvancedProcessBlocks_SSE41(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SPECK64_Enc_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-@@ -392,7 +392,7 @@ size_t SPECK64::Dec::AdvancedProcessBlocks(const byte *inBlocks, const byte *xor
-         return SPECK64_Dec_AdvancedProcessBlocks_SSE41(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SPECK64_Dec_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-@@ -410,7 +410,7 @@ size_t SPECK128::Enc::AdvancedProcessBlocks(const byte *inBlocks, const byte *xo
-         return SPECK128_Enc_AdvancedProcessBlocks_SSSE3(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SPECK128_Enc_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
-@@ -426,7 +426,7 @@ size_t SPECK128::Dec::AdvancedProcessBlocks(const byte *inBlocks, const byte *xo
-         return SPECK128_Dec_AdvancedProcessBlocks_SSSE3(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
- #endif
--#if defined(CRYPTOPP_ARM_NEON_AVAILABLE)
-+#if (CRYPTOPP_ARM_NEON_AVAILABLE)
-     if (HasNEON())
-         return SPECK128_Dec_AdvancedProcessBlocks_NEON(m_rkeys, (size_t)m_rounds,
-             inBlocks, xorBlocks, outBlocks, length, flags);
--- 
-2.14.1
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
index e2709c5c92..adb91307f3 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 6.1.0
+CRYPTOPP_VERSION = 7.0.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = http://cryptopp.com
 CRYPTOPP_LICENSE = BSL-1.0
-- 
2.14.1
