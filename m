From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri,  8 Mar 2019 23:15:34 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: bump to version 8.1.0
Message-ID: <20190308221534.16430-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- Remove patch (already in version)
- Add BSD-3-Clause (CRYPTOGAMS) and Public domain (ChaCha SSE2 and  AVX)
  to LICENSE, see:
  https://github.com/weidai11/cryptopp/commit/64a89bf352c7eb8ec905b4bf6d1177a56fed0121

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 ...001-config.h-avx2-depends-on-gcc-4.9.patch | 40 -------------------
 package/cryptopp/cryptopp.hash                |  6 +--
 package/cryptopp/cryptopp.mk                  |  4 +-
 3 files changed, 5 insertions(+), 45 deletions(-)
 delete mode 100644 package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch

diff --git a/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch b/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
deleted file mode 100644
index 7f93bceacf..0000000000
--- a/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
+++ /dev/null
@@ -1,40 +0,0 @@
-From c484938fb4a57430a2e47334f753b1d771aa0f1b Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Thu, 21 Feb 2019 20:26:24 +0100
-Subject: [PATCH] config.h: avx2 depends on gcc 4.9
-
-Build of cryptopp on x86 with gcc 4.8 fails on:
-chacha_avx.cpp: In function 'void CryptoPP::ChaCha_OperateKeystream_AVX2(const word32*, const byte*, CryptoPP::byte*, unsigned int)':
-chacha_avx.cpp:98:85: error: '_mm256_broadcastsi128_si256' was not declared in this scope
-
-This is due to the fact that _mm256_broadcastsi128_si256 has been added
-only in gcc 4.9:
-https://github.com/gcc-mirror/gcc/commit/78e8d5ffbf0ba5031b736d2c6fc6a44605047cbc
-
-So bump CRYPTOPP_GCC_VERSION from 4.7 to 4.9 for AVX2 support
-
-Fixes:
- - http://autobuild.buildroot.org/results/195e40b34344f773da51a3fbff9d8e76c517eed1
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-[Upstream status: https://github.com/weidai11/cryptopp/pull/809]
----
- config.h | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/config.h b/config.h
-index eccba009..4516d2b3 100644
---- a/config.h
-+++ b/config.h
-@@ -591,7 +591,7 @@ NAMESPACE_END
- // Requires Binutils 2.24
- #if !defined(CRYPTOPP_DISABLE_AVX2) && defined(CRYPTOPP_AVX_AVAILABLE) && \
- 	(defined(__AVX2__) || (CRYPTOPP_MSC_VERSION >= 1800) || (__SUNPRO_CC >= 0x5130) || \
--	(CRYPTOPP_GCC_VERSION >= 40700) || (__INTEL_COMPILER >= 1400) || \
-+	(CRYPTOPP_GCC_VERSION >= 40900) || (__INTEL_COMPILER >= 1400) || \
- 	(CRYPTOPP_LLVM_CLANG_VERSION >= 30100) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40600))
- #define CRYPTOPP_AVX2_AVAILABLE 1
- #endif
--- 
-2.14.1
-
diff --git a/package/cryptopp/cryptopp.hash b/package/cryptopp/cryptopp.hash
index 8d12a98dab..5d6d8520c2 100644
--- a/package/cryptopp/cryptopp.hash
+++ b/package/cryptopp/cryptopp.hash
@@ -1,5 +1,5 @@
-# Hash from: https://www.cryptopp.com/release800.html:
-sha256  bbfd89b348846b920d97a1d32b88c85caf0d7bb423d4fcfab7c44349aaceb82c  cryptopp800.zip
+# Hash from: https://www.cryptopp.com/release810.html:
+sha256  f609b453e42abbab7163191dfe060964121f04da212e2e4f2f0ebe94b7e806ae  cryptopp810.zip
 
 # Hash for license file:
-sha256  fe5f5f187e6e38ac2f833956fc5c4cab2df08797cff07f540e4ee74f12f7ee5b  License.txt
+sha256  f29d65ae3f0c8e327284f193524643ffb4d682fcca3e1740a5c6cbab0e720583  License.txt
diff --git a/package/cryptopp/cryptopp.mk b/package/cryptopp/cryptopp.mk
index 8e3277a941..dd41b0ec47 100644
--- a/package/cryptopp/cryptopp.mk
+++ b/package/cryptopp/cryptopp.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-CRYPTOPP_VERSION = 8.0.0
+CRYPTOPP_VERSION = 8.1.0
 CRYPTOPP_SOURCE = cryptopp$(subst .,,$(CRYPTOPP_VERSION)).zip
 CRYPTOPP_SITE = https://cryptopp.com
-CRYPTOPP_LICENSE = BSL-1.0
+CRYPTOPP_LICENSE = BSL-1.0, BSD-3-Clause (CRYPTOGAMS), Public domain (ChaCha SSE2 and AVX)
 CRYPTOPP_LICENSE_FILES = License.txt
 CRYPTOPP_INSTALL_STAGING = YES
 
-- 
2.20.1
