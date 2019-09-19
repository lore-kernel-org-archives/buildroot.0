From: Peter Korsgaard <peter@korsgaard.com>
Date: Thu, 19 Sep 2019 22:42:20 +0200
Subject: [Buildroot] [git commit] package/mbedtls: security bump to version
 2.16.3
Message-ID: <20190919203900.B40A08EC33@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=6bab018ee86a00912abd6b900271387ff8ef4652
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Remove second patch (already in version)
- Fix a missing error detection in ECJPAKE. This could have caused a
  predictable shared secret if a hardware accelerator failed and the
  other side of the key exchange had a similar bug.
- When writing a private EC key, use a constant size for the private
  value, as specified in RFC 5915. Previously, the value was written as
  an ASN.1 INTEGER, which caused the size of the key to leak about 1 bit
  of information on average and could cause the value to be 1 byte too
  large for the output buffer.
- The deterministic ECDSA calculation reused the scheme's HMAC-DRBG to
  implement blinding. Because of this for the same key and message the
  same blinding value was generated. This reduced the effectiveness of
  the countermeasure and leaked information about the private key
  through side channels. Reported by Jack Lloyd.

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...quire-at-least-ARMv6-to-enable-the-ARM-DS.patch | 38 ----------------------
 package/mbedtls/mbedtls.hash                       |  6 ++--
 package/mbedtls/mbedtls.mk                         |  2 +-
 3 files changed, 4 insertions(+), 42 deletions(-)

diff --git a/package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch b/package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch
deleted file mode 100644
index ee66be4b21..0000000000
--- a/package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch
+++ /dev/null
@@ -1,38 +0,0 @@
-From 63f5b85e700677270197d176475be609187e9cdb Mon Sep 17 00:00:00 2001
-From: Aurelien Jarno <aurelien@aurel32.net>
-Date: Sat, 3 Nov 2018 00:46:06 +0100
-Subject: [PATCH] bn_mul.h: require at least ARMv6 to enable the ARM DSP code
-
-Commit 16b1bd89326e "bn_mul.h: add ARM DSP optimized MULADDC code"
-added some ARM DSP instructions that was assumed to always be available
-when __ARM_FEATURE_DSP is defined to 1. Unfortunately it appears that
-the ARMv5TE architecture (GCC flag -march=armv5te) supports the DSP
-instructions, but only in Thumb mode and not in ARM mode, despite
-defining __ARM_FEATURE_DSP in both cases.
-
-This patch fixes the build issue by requiring at least ARMv6 in addition
-to the DSP feature.
-
-[Upstream status: https://github.com/ARMmbed/mbedtls/pull/2169]
-Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
----
- include/mbedtls/bn_mul.h | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/include/mbedtls/bn_mul.h b/include/mbedtls/bn_mul.h
-index 0af694c..565615f 100644
---- a/include/mbedtls/bn_mul.h
-+++ b/include/mbedtls/bn_mul.h
-@@ -636,7 +636,8 @@
-            "r6", "r7", "r8", "r9", "cc"         \
-          );
- 
--#elif defined (__ARM_FEATURE_DSP) && (__ARM_FEATURE_DSP == 1)
-+#elif (__ARM_ARCH >= 6) && \
-+    defined (__ARM_FEATURE_DSP) && (__ARM_FEATURE_DSP == 1)
- 
- #define MULADDC_INIT                            \
-     asm(
--- 
-2.7.4
-
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 1e65f8224a..db136c17d9 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.2-and-2.7.11-released
-sha1	ba809acfd4b41b86895b92e98d936695b5b62b73	mbedtls-2.16.2-apache.tgz
-sha256	a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4	mbedtls-2.16.2-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.3-and-2.7.12-released
+sha1	dce8550f8f9465f3aea44cb7d0f9d0ba8140034a	mbedtls-2.16.3-apache.tgz
+sha256	ec1bee6d82090ed6ea2690784ea4b294ab576a65d428da9fe8750f932d2da661	mbedtls-2.16.3-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index fdf1d33b2e..f58aad4bca 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.16.2
+MBEDTLS_VERSION = 2.16.3
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
