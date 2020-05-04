From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon,  4 May 2020 14:36:53 +0200
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.52
Message-ID: <20200504123653.120914-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.52_release_notes

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...troduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch | 132 ------------------
 ...t-force-ARMv7-for-gcm-arm32-neon-r-j.patch |  30 ----
 package/libnss/libnss.hash                    |   4 +-
 package/libnss/libnss.mk                      |   2 +-
 4 files changed, 3 insertions(+), 165 deletions(-)
 delete mode 100644 package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
 delete mode 100644 package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch

diff --git a/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch b/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
deleted file mode 100644
index db19a53c32..0000000000
--- a/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_ARM32_NEON-r-jcj.patch
+++ /dev/null
@@ -1,132 +0,0 @@
-From 38e497b3d9e0bff3da7a1a5d4c0760661ded4b6f Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 1 Apr 2020 09:39:45 -0700
-Subject: [PATCH] Bug 1620799 - Introduce NSS_DISABLE_ARM32_NEON r=jcj
-
-Only some Arm32 supports neon, so let's introduce NSS_DISABLE_ARM32_NEON
-to allow disabling Neon acceleration when building for Arm32.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
-
---HG--
-extra : rebase_source : c6e3d22ef43ac5012af69214499616f868f4c5b2
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/coreconf/config.gypi  |  1 +
- nss/coreconf/config.mk    |  5 +++++
- nss/lib/freebl/Makefile   |  4 ++++
- nss/lib/freebl/freebl.gyp | 14 ++++++++++++--
- nss/lib/freebl/gcm.c      |  3 ++-
- 5 files changed, 24 insertions(+), 3 deletions(-)
-
-diff --git a/nss/coreconf/config.gypi b/nss/coreconf/config.gypi
-index 2a730398b..f67dd7f13 100644
---- a/nss/coreconf/config.gypi
-+++ b/nss/coreconf/config.gypi
-@@ -103,6 +103,7 @@
-     'disable_libpkix%': 1,
-     'disable_werror%': 0,
-     'disable_altivec%': 0,
-+    'disable_arm32_neon%': 0,
-     'mozilla_client%': 0,
-     'comm_client%': 0,
-     'moz_fold_libs%': 0,
-diff --git a/nss/coreconf/config.mk b/nss/coreconf/config.mk
-index 4eda497a2..b751ead5d 100644
---- a/nss/coreconf/config.mk
-+++ b/nss/coreconf/config.mk
-@@ -200,6 +200,11 @@ DEFINES += -DPKIX_OBJECT_LEAK_TEST
- endif
- endif
- 
-+# Avoid building with Neon acceleration on Arm32
-+ifdef NSS_DISABLE_ARM32_NEON
-+DEFINES += -DNSS_DISABLE_ARM32_NEON
-+endif
-+
- # Avoid building with PowerPC's Altivec acceleration
- ifdef NSS_DISABLE_ALTIVEC
- DEFINES += -DNSS_DISABLE_ALTIVEC
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index 32da68301..a03c0d108 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -124,7 +124,9 @@ ifeq ($(CPU_ARCH),aarch64)
-     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
- endif
- ifeq ($(CPU_ARCH),arm)
-+ifndef NSS_DISABLE_ARM32_NEON
-     EXTRA_SRCS += gcm-arm32-neon.c
-+endif
-     ifdef CC_IS_CLANG
-         DEFINES += -DUSE_HW_AES
-         EXTRA_SRCS += aes-armv8.c
-@@ -778,8 +780,10 @@ ifeq ($(CPU_ARCH),arm)
- # Confusingly, __SOFTFP__ is the name of the define for the softfloat ABI, not for the softfp ABI.
- USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
- $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
-+ifndef NSS_DISABLE_ARM32_NEON
- $(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
- endif
-+endif
- ifeq ($(CPU_ARCH),aarch64)
- $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
- $(OBJDIR)/$(PROG_PREFIX)gcm-aarch64$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
-diff --git a/nss/lib/freebl/freebl.gyp b/nss/lib/freebl/freebl.gyp
-index 8f3ddd978..5975b76cd 100644
---- a/nss/lib/freebl/freebl.gyp
-+++ b/nss/lib/freebl/freebl.gyp
-@@ -337,11 +337,16 @@
-             'armv8_c_lib'
-           ],
-         }],
--        [ 'target_arch=="arm"', {
-+        [ 'disable_arm32_neon==0 and target_arch=="arm"', {
-           'dependencies': [
-             'gcm-aes-arm32-neon_c_lib',
-           ],
-         }],
-+        [ 'disable_arm32_neon==1 and target_arch=="arm"', {
-+          'defines!': [
-+            'NSS_DISABLE_ARM32_NEON',
-+          ],
-+        }],
-         [ 'target_arch=="arm64" or target_arch=="aarch64"', {
-           'dependencies': [
-             'gcm-aes-aarch64_c_lib',
-@@ -399,11 +404,16 @@
-             'armv8_c_lib',
-           ],
-         }],
--        [ 'target_arch=="arm"', {
-+        [ 'disable_arm32_neon==0 and target_arch=="arm"', {
-           'dependencies': [
-             'gcm-aes-arm32-neon_c_lib',
-           ],
-         }],
-+        [ 'disable_arm32_neon==1 and target_arch=="arm"', {
-+          'defines!': [
-+            'NSS_DISABLE_ARM32_NEON',
-+          ],
-+        }],
-         [ 'target_arch=="arm64" or target_arch=="aarch64"', {
-           'dependencies': [
-             'gcm-aes-aarch64_c_lib',
-diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
-index e5742b9b8..5065197ef 100644
---- a/nss/lib/freebl/gcm.c
-+++ b/nss/lib/freebl/gcm.c
-@@ -22,7 +22,8 @@
- #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
-     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
- #define USE_ARM_GCM
--#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN)
-+#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
-+      !defined(NSS_DISABLE_ARM32_NEON)
- /* We don't test on big endian platform, so disable this on big endian. */
- #define USE_ARM_GCM
- #endif
--- 
-2.20.1
-
diff --git a/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch b/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
deleted file mode 100644
index bfecbb2202..0000000000
--- a/package/libnss/0002-Bug-1624864-Don-t-force-ARMv7-for-gcm-arm32-neon-r-j.patch
+++ /dev/null
@@ -1,30 +0,0 @@
-From ab8d2425728f37b1f21dbff712daf4a767c82149 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 1 Apr 2020 09:41:08 -0700
-Subject: [PATCH] Bug 1624864 - Don't force ARMv7 for gcm-arm32-neon r=jcj
-
---HG--
-extra : rebase_source : e046bbe45276b8cdf686c4f61006aff08865f1c0
-
-[Upstream: https://hg.mozilla.org/projects/nss/rev/8582092359720d052288cad2dc13f37aad783dc3]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/lib/freebl/Makefile | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
-index a03c0d108..898a0b9e0 100644
---- a/nss/lib/freebl/Makefile
-+++ b/nss/lib/freebl/Makefile
-@@ -781,7 +781,7 @@ ifeq ($(CPU_ARCH),arm)
- USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
- $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
- ifndef NSS_DISABLE_ARM32_NEON
--$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
-+$(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
- endif
- endif
- ifeq ($(CPU_ARCH),aarch64)
--- 
-2.20.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index dfeae24278..425f5da515 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_51_1_RTM/src/SHA256SUMS
-sha256	085c5eaceef040eddea639e2e068e70f0e368f840327a678ef74ae3d6c15ca78  nss-3.51.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_52_RTM/src/SHA256SUMS
+sha256	0a0aeb0cdda65ddcb64f746223df58b150f6803f4bfa1a4e876bbe6f9c4c1561  nss-3.52.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 81ebb7ad03..020cf212d4 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.51.1
+LIBNSS_VERSION = 3.52
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.20.1
