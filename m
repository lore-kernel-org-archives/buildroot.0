From: Joris Offouga <offougajoris@gmail.com>
Date: Thu, 27 Jun 2019 23:54:36 +0200
Subject: [Buildroot] [PATCH] package/mbedtls: bump version to 2.16.2
Message-ID: <20190627215437.32571-1-offougajoris@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

See changelog: https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.2-and-2.7.11-released

Fixes:
 - http://autobuild.buildroot.net/results/7c0/7c09c80a376cf0c4c23a3cf48314806de9251544/

Also add a patch to fix the build issue by requiring at least
ARMv6 in addition to the DSP feature.

Signed-off-by: Joris Offouga <offougajoris@gmail.com>
Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
---
 ...-at-least-ARMv6-to-enable-the-ARM-DS.patch | 38 +++++++++++++++++++
 package/mbedtls/mbedtls.hash                  |  6 +--
 package/mbedtls/mbedtls.mk                    |  2 +-
 3 files changed, 42 insertions(+), 4 deletions(-)
 create mode 100644 package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch

diff --git a/package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch b/package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch
new file mode 100644
index 0000000000..ee66be4b21
--- /dev/null
+++ b/package/mbedtls/0002-bn_mul.h-require-at-least-ARMv6-to-enable-the-ARM-DS.patch
@@ -0,0 +1,38 @@
+From 63f5b85e700677270197d176475be609187e9cdb Mon Sep 17 00:00:00 2001
+From: Aurelien Jarno <aurelien@aurel32.net>
+Date: Sat, 3 Nov 2018 00:46:06 +0100
+Subject: [PATCH] bn_mul.h: require at least ARMv6 to enable the ARM DSP code
+
+Commit 16b1bd89326e "bn_mul.h: add ARM DSP optimized MULADDC code"
+added some ARM DSP instructions that was assumed to always be available
+when __ARM_FEATURE_DSP is defined to 1. Unfortunately it appears that
+the ARMv5TE architecture (GCC flag -march=armv5te) supports the DSP
+instructions, but only in Thumb mode and not in ARM mode, despite
+defining __ARM_FEATURE_DSP in both cases.
+
+This patch fixes the build issue by requiring at least ARMv6 in addition
+to the DSP feature.
+
+[Upstream status: https://github.com/ARMmbed/mbedtls/pull/2169]
+Signed-off-by: Pierre-Jean Texier <pjtexier@koncepto.io>
+---
+ include/mbedtls/bn_mul.h | 3 ++-
+ 1 file changed, 2 insertions(+), 1 deletion(-)
+
+diff --git a/include/mbedtls/bn_mul.h b/include/mbedtls/bn_mul.h
+index 0af694c..565615f 100644
+--- a/include/mbedtls/bn_mul.h
++++ b/include/mbedtls/bn_mul.h
+@@ -636,7 +636,8 @@
+            "r6", "r7", "r8", "r9", "cc"         \
+          );
+ 
+-#elif defined (__ARM_FEATURE_DSP) && (__ARM_FEATURE_DSP == 1)
++#elif (__ARM_ARCH >= 6) && \
++    defined (__ARM_FEATURE_DSP) && (__ARM_FEATURE_DSP == 1)
+ 
+ #define MULADDC_INIT                            \
+     asm(
+-- 
+2.7.4
+
diff --git a/package/mbedtls/mbedtls.hash b/package/mbedtls/mbedtls.hash
index 57a5aeffcb..1e65f8224a 100644
--- a/package/mbedtls/mbedtls.hash
+++ b/package/mbedtls/mbedtls.hash
@@ -1,5 +1,5 @@
-# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.0-2.7.9-and-2.1.18-released
-sha1	70dc65f3f6f6b2392b821163be7f1f634f0012c8	mbedtls-2.7.9-apache.tgz
-sha256	18e57260b46579245744adb79c2924194dad36aac38c2d0be9e749b9181c706f	mbedtls-2.7.9-apache.tgz
+# From https://tls.mbed.org/tech-updates/releases/mbedtls-2.16.2-and-2.7.11-released
+sha1	ba809acfd4b41b86895b92e98d936695b5b62b73	mbedtls-2.16.2-apache.tgz
+sha256	a6834fcd7b7e64b83dfaaa6ee695198cb5019a929b2806cb0162e049f98206a4	mbedtls-2.16.2-apache.tgz
 # Locally calculated
 sha256	cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30	apache-2.0.txt
diff --git a/package/mbedtls/mbedtls.mk b/package/mbedtls/mbedtls.mk
index 4a5a731d42..fdf1d33b2e 100644
--- a/package/mbedtls/mbedtls.mk
+++ b/package/mbedtls/mbedtls.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 MBEDTLS_SITE = https://tls.mbed.org/code/releases
-MBEDTLS_VERSION = 2.7.9
+MBEDTLS_VERSION = 2.16.2
 MBEDTLS_SOURCE = mbedtls-$(MBEDTLS_VERSION)-apache.tgz
 MBEDTLS_CONF_OPTS = \
 	-DENABLE_PROGRAMS=$(if $(BR2_PACKAGE_MBEDTLS_PROGRAMS),ON,OFF) \
-- 
2.17.1
