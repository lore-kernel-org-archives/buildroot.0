From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Fri, 22 Feb 2019 00:33:59 +0100
Subject: [Buildroot] [PATCH 1/1] package/cryptopp: fix build with gcc < 4.9
Message-ID: <20190221233359.7243-1-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Disable AVX2 if gcc < 4.9

Fixes:
 - http://autobuild.buildroot.org/results/195e40b34344f773da51a3fbff9d8e76c517eed1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 .../0001-config.h-avx2-depends-on-gcc-4.9.patch    | 40 ++++++++++++++++++++++
 1 file changed, 40 insertions(+)
 create mode 100644 package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch

diff --git a/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch b/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
new file mode 100644
index 0000000000..7f93bceacf
--- /dev/null
+++ b/package/cryptopp/0001-config.h-avx2-depends-on-gcc-4.9.patch
@@ -0,0 +1,40 @@
+From c484938fb4a57430a2e47334f753b1d771aa0f1b Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Thu, 21 Feb 2019 20:26:24 +0100
+Subject: [PATCH] config.h: avx2 depends on gcc 4.9
+
+Build of cryptopp on x86 with gcc 4.8 fails on:
+chacha_avx.cpp: In function 'void CryptoPP::ChaCha_OperateKeystream_AVX2(const word32*, const byte*, CryptoPP::byte*, unsigned int)':
+chacha_avx.cpp:98:85: error: '_mm256_broadcastsi128_si256' was not declared in this scope
+
+This is due to the fact that _mm256_broadcastsi128_si256 has been added
+only in gcc 4.9:
+https://github.com/gcc-mirror/gcc/commit/78e8d5ffbf0ba5031b736d2c6fc6a44605047cbc
+
+So bump CRYPTOPP_GCC_VERSION from 4.7 to 4.9 for AVX2 support
+
+Fixes:
+ - http://autobuild.buildroot.org/results/195e40b34344f773da51a3fbff9d8e76c517eed1
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: https://github.com/weidai11/cryptopp/pull/809]
+---
+ config.h | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/config.h b/config.h
+index eccba009..4516d2b3 100644
+--- a/config.h
++++ b/config.h
+@@ -591,7 +591,7 @@ NAMESPACE_END
+ // Requires Binutils 2.24
+ #if !defined(CRYPTOPP_DISABLE_AVX2) && defined(CRYPTOPP_AVX_AVAILABLE) && \
+ 	(defined(__AVX2__) || (CRYPTOPP_MSC_VERSION >= 1800) || (__SUNPRO_CC >= 0x5130) || \
+-	(CRYPTOPP_GCC_VERSION >= 40700) || (__INTEL_COMPILER >= 1400) || \
++	(CRYPTOPP_GCC_VERSION >= 40900) || (__INTEL_COMPILER >= 1400) || \
+ 	(CRYPTOPP_LLVM_CLANG_VERSION >= 30100) || (CRYPTOPP_APPLE_CLANG_VERSION >= 40600))
+ #define CRYPTOPP_AVX2_AVAILABLE 1
+ #endif
+-- 
+2.14.1
+
-- 
2.14.1
