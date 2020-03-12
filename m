From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Thu, 12 Mar 2020 19:06:29 +0100
Subject: [Buildroot] [PATCH] package/libnss: bump version to 3.51
Message-ID: <20200312180629.7972-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Release notes:
https://developer.mozilla.org/en-US/docs/Mozilla/Projects/NSS/NSS_3.51_release_notes

Remove upstreamed patch but add another patch to allow disable Neon
acceleration while building gcm on Arm32. This patch adds
NSS_DISABLE_GCM_ARM32_NEON variable that is set to 1 if
BR2_ARM_CPU_HAS_NEON is not set to y.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
New patch is pending upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1620799
---
 ...heck-if-PPC-__has_include-sys-auxv.h.patch |  51 -------
 ...Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch | 127 ++++++++++++++++++
 package/libnss/libnss.hash                    |   4 +-
 package/libnss/libnss.mk                      |   7 +-
 4 files changed, 135 insertions(+), 54 deletions(-)
 delete mode 100644 package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
 create mode 100644 package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch

diff --git a/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch b/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
deleted file mode 100644
index 1325387760..0000000000
--- a/package/libnss/0001-Bug-1614183-Check-if-PPC-__has_include-sys-auxv.h.patch
+++ /dev/null
@@ -1,51 +0,0 @@
-From d9c7cbb3660d8a2da9ce42e4d1b58642a256a91a Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Sun, 9 Feb 2020 10:15:16 +0100
-Subject: [PATCH] Bug 1614183 - Check if PPC __has_include(<sys/auxv.h>)
-
-Some build environment doesn't provide <sys/auxv.h> and this causes
-build failure, so let's check if that header exists by using
-__has_include() helper.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/lib/freebl/blinit.c | 10 ++++++++++
- 1 file changed, 10 insertions(+)
-
-diff --git a/nss/lib/freebl/blinit.c b/nss/lib/freebl/blinit.c
-index 7e8adfc64..d4921aaee 100644
---- a/nss/lib/freebl/blinit.c
-+++ b/nss/lib/freebl/blinit.c
-@@ -431,8 +431,14 @@ ppc_crypto_support()
- 
- #if defined(__powerpc__)
- 
-+#ifndef __has_include
-+#define __has_include(x) 0
-+#endif
-+
- #if defined(__linux__) || (defined(__FreeBSD__) && __FreeBSD__ >= 12)
-+#if __has_include(<sys/auxv.h>)
- #include <sys/auxv.h>
-+#endif
- #elif (defined(__FreeBSD__) && __FreeBSD__ < 12)
- #include <sys/sysctl.h>
- #endif
-@@ -449,10 +455,14 @@ CheckPPCSupport()
- 
-     unsigned long hwcaps = 0;
- #if defined(__linux__)
-+#if __has_include(<sys/auxv.h>)
-     hwcaps = getauxval(AT_HWCAP2);
-+#endif
- #elif defined(__FreeBSD__)
- #if __FreeBSD__ >= 12
-+#if __has_include(<sys/auxv.h>)
-     elf_aux_info(AT_HWCAP2, &hwcaps, sizeof(hwcaps));
-+#endif
- #else
-     size_t len = sizeof(hwcaps);
-     sysctlbyname("hw.cpu_features2", &hwcaps, &len, NULL, 0);
--- 
-2.20.1
-
diff --git a/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch b/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch
new file mode 100644
index 0000000000..409a85ac54
--- /dev/null
+++ b/package/libnss/0001-Bug-1620799-Introduce-NSS_DISABLE_GCM_ARM32_NEON.patch
@@ -0,0 +1,127 @@
+From 5d0fdb245bbb1dd4d7cc94eae91981ff79c4852d Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sat, 7 Mar 2020 23:47:09 +0100
+Subject: [PATCH] Bug 1620799 - Introduce NSS_DISABLE_GCM_ARM32_NEON
+
+Only some Arm32 supports neon, so let's introduce
+NSS_DISABLE_GCM_ARM32_NEON to allow disabling gcm-arm32-neon.c building.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/coreconf/config.gypi  |  1 +
+ nss/coreconf/config.mk    |  5 +++++
+ nss/lib/freebl/Makefile   |  4 ++++
+ nss/lib/freebl/freebl.gyp | 14 ++++++++++++--
+ nss/lib/freebl/gcm.c      |  3 ++-
+ 5 files changed, 24 insertions(+), 3 deletions(-)
+
+diff --git a/nss/coreconf/config.gypi b/nss/coreconf/config.gypi
+index 2a730398b..2a7fe8ac0 100644
+--- a/nss/coreconf/config.gypi
++++ b/nss/coreconf/config.gypi
+@@ -103,6 +103,7 @@
+     'disable_libpkix%': 1,
+     'disable_werror%': 0,
+     'disable_altivec%': 0,
++    'disable_gcm_arm32_neon%': 0,
+     'mozilla_client%': 0,
+     'comm_client%': 0,
+     'moz_fold_libs%': 0,
+diff --git a/nss/coreconf/config.mk b/nss/coreconf/config.mk
+index 704e3fa83..9042e78bf 100644
+--- a/nss/coreconf/config.mk
++++ b/nss/coreconf/config.mk
+@@ -196,6 +196,11 @@ DEFINES += -DPKIX_OBJECT_LEAK_TEST
+ endif
+ endif
+ 
++# Avoid building gcm-arm32-neon.c
++ifdef NSS_DISABLE_GCM_ARM32_NEON
++DEFINES += -DNSS_DISABLE_GCM_ARM32_NEON
++endif
++
+ # Avoid building with PowerPC's Altivec acceleration
+ ifdef NSS_DISABLE_ALTIVEC
+ DEFINES += -DNSS_DISABLE_ALTIVEC
+diff --git a/nss/lib/freebl/Makefile b/nss/lib/freebl/Makefile
+index ce9d36f3a..2802fdf42 100644
+--- a/nss/lib/freebl/Makefile
++++ b/nss/lib/freebl/Makefile
+@@ -124,7 +124,9 @@ ifeq ($(CPU_ARCH),aarch64)
+     EXTRA_SRCS += aes-armv8.c gcm-aarch64.c
+ endif
+ ifeq ($(CPU_ARCH),arm)
++ifndef NSS_DISABLE_GCM_ARM32_NEON
+     EXTRA_SRCS += gcm-arm32-neon.c
++endif
+     ifdef CC_IS_CLANG
+         DEFINES += -DUSE_HW_AES
+         EXTRA_SRCS += aes-armv8.c
+@@ -770,8 +772,10 @@ ifeq ($(CPU_ARCH),arm)
+ # Confusingly, __SOFTFP__ is the name of the define for the softfloat ABI, not for the softfp ABI.
+ USES_SOFTFLOAT_ABI := $(shell $(CC) -o - -E -dM - $(CFLAGS) < /dev/null | grep __SOFTFP__ > /dev/null && echo 1)
+ $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a -mfpu=crypto-neon-fp-armv8$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
++ifndef NSS_DISABLE_GCM_ARM32_NEON
+ $(OBJDIR)/$(PROG_PREFIX)gcm-arm32-neon$(OBJ_SUFFIX): CFLAGS += -march=armv7 -mfpu=neon$(if $(USES_SOFTFLOAT_ABI), -mfloat-abi=softfp)
+ endif
++endif
+ ifeq ($(CPU_ARCH),aarch64)
+ $(OBJDIR)/$(PROG_PREFIX)aes-armv8$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
+ $(OBJDIR)/$(PROG_PREFIX)gcm-aarch64$(OBJ_SUFFIX): CFLAGS += -march=armv8-a+crypto
+diff --git a/nss/lib/freebl/freebl.gyp b/nss/lib/freebl/freebl.gyp
+index d46bd1949..7bf4e9f7e 100644
+--- a/nss/lib/freebl/freebl.gyp
++++ b/nss/lib/freebl/freebl.gyp
+@@ -265,11 +265,16 @@
+             'armv8_c_lib'
+           ],
+         }],
+-        [ 'target_arch=="arm"', {
++        [ 'disable_gcm_arm32_neon==0 and target_arch=="arm"', {
+           'dependencies': [
+             'gcm-aes-arm32-neon_c_lib',
+           ],
+         }],
++        [ 'disable_gcm_arm32_neon==1 and target_arch=="arm"', {
++          'defines!': [
++            'NSS_DISABLE_GCM_ARM32_NEON',
++          ],
++        }],
+         [ 'target_arch=="arm64" or target_arch=="aarch64"', {
+           'dependencies': [
+             'gcm-aes-aarch64_c_lib',
+@@ -326,11 +331,16 @@
+             'armv8_c_lib',
+           ],
+         }],
+-        [ 'target_arch=="arm"', {
++        [ 'disable_gcm_arm32_neon==0 and target_arch=="arm"', {
+           'dependencies': [
+             'gcm-aes-arm32-neon_c_lib',
+           ],
+         }],
++        [ 'disable_gcm_arm32_neon==1 and target_arch=="arm"', {
++          'defines!': [
++            'NSS_DISABLE_GCM_ARM32_NEON',
++          ],
++        }],
+         [ 'target_arch=="arm64" or target_arch=="aarch64"', {
+           'dependencies': [
+             'gcm-aes-aarch64_c_lib',
+diff --git a/nss/lib/freebl/gcm.c b/nss/lib/freebl/gcm.c
+index 2a42f74c0..9b1c6c02f 100644
+--- a/nss/lib/freebl/gcm.c
++++ b/nss/lib/freebl/gcm.c
+@@ -21,7 +21,8 @@
+ #if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
+     (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
+ #define USE_ARM_GCM
+-#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN)
++#elif defined(__arm__) && defined(IS_LITTLE_ENDIAN) && \
++      !defined(NSS_DISABLE_GCM_ARM32_NEON)
+ /* We don't test on big endian platform, so disable this on big endian. */
+ #define USE_ARM_GCM
+ #endif
+-- 
+2.20.1
+
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index f4a6d74ee7..7f496311f4 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_50_RTM/src/SHA256SUMS
-sha256	185df319775243f5f5daa9d49b7f9cc5f2b389435be3247c3376579bee063ba7  nss-3.50.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_51_RTM/src/SHA256SUMS
+sha256	75348b3b3229362486c57a880db917da1f96ef4eb639dc9cc2ff17d72268459c  nss-3.51.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index e439150ecd..8faf243545 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.50
+LIBNSS_VERSION = 3.51
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
@@ -55,6 +55,11 @@ ifeq ($(BR2_POWERPC_CPU_HAS_ALTIVEC),)
 LIBNSS_BUILD_VARS += NSS_DISABLE_ALTIVEC=1
 endif
 
+ifeq ($(BR2_ARM_CPU_HAS_NEON),)
+# Disable gcm-arm32-neon if neon is not supported
+LIBNSS_BUILD_VARS += NSS_DISABLE_GCM_ARM32_NEON=1
+endif
+
 ifeq ($(BR2_ARCH_IS_64),y)
 # MIPS64 n32 is treated as a 32-bit architecture by libnss.
 # See: https://bugzilla.mozilla.org/show_bug.cgi?id=1010730
-- 
2.20.1
