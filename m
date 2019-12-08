From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 8 Dec 2019 14:28:30 +0100
Subject: [Buildroot] [git commit] package/libnss: bump to version 3.48
Message-ID: <20191208132020.4F1477F9E7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=467f901514a5e3eb0e3518b06d1ed147a62a8c8d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

NSS 3.48 requires NSPR 4.24 already bumped. It already fixed
CVE-2019-11745 but in version 3.47.1 it's already fixed. Anyway from
3.47 to 3.48 it fixes:
CVE-2019-11745: EncryptUpdate should use maxout, not block size

Remove an upstreamed patch but introduce a new one to fix building with
signal.h include.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...676-Fix-build-if-arm-doesn-t-support-NEON.patch | 50 ----------------------
 ...-Fix-build-failure-due-to-missing-posix-s.patch | 26 +++++++++++
 package/libnss/libnss.hash                         |  4 +-
 package/libnss/libnss.mk                           |  2 +-
 4 files changed, 29 insertions(+), 53 deletions(-)

diff --git a/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch b/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
deleted file mode 100644
index 467a1dc474..0000000000
--- a/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
+++ /dev/null
@@ -1,50 +0,0 @@
-From c915be634cbfb90eb7880ec9efbdba9b98c6d4c1 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@benettiengineering.com>
-Date: Wed, 23 Oct 2019 11:47:03 +0200
-Subject: [PATCH] Bug 1590676 - Fix build if arm doesn't support NEON
-
-At the moment NSS assumes that ARM supports NEON extension but this is
-not true and leads to build failure on ARM without NEON extension.
-Add check to assure USE_HW_AES is not defined if ARM without NEON
-extension is used.
-
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/lib/freebl/aes-armv8.c | 5 +++--
- nss/lib/freebl/rijndael.c  | 3 ++-
- 2 files changed, 5 insertions(+), 3 deletions(-)
-
-diff --git a/nss/lib/freebl/aes-armv8.c b/nss/lib/freebl/aes-armv8.c
-index 40d5e2d34..057d1aed3 100644
---- a/nss/lib/freebl/aes-armv8.c
-+++ b/nss/lib/freebl/aes-armv8.c
-@@ -5,9 +5,10 @@
- #include "secerr.h"
- #include "rijndael.h"
- 
--#if (defined(__clang__) ||                            \
-+#if ((defined(__clang__) ||                            \
-      (defined(__GNUC__) && defined(__GNUC_MINOR__) && \
--      (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8))))
-+      (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8)))) && \
-+      (defined(__ARM_NEON) || defined(__ARM_NEON__)))
- 
- #ifndef __ARM_FEATURE_CRYPTO
- #error "Compiler option is invalid"
-diff --git a/nss/lib/freebl/rijndael.c b/nss/lib/freebl/rijndael.c
-index 26bd58ee0..6d77d942d 100644
---- a/nss/lib/freebl/rijndael.c
-+++ b/nss/lib/freebl/rijndael.c
-@@ -20,7 +20,8 @@
- #include "gcm.h"
- #include "mpi.h"
- 
--#if !defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)
-+#if (!defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)) || \
-+    (defined(__arm__) && !defined(__ARM_NEON) && !defined(__ARM_NEON__))
- // not test yet on big endian platform of arm
- #undef USE_HW_AES
- #endif
--- 
-2.20.1
-
diff --git a/package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch b/package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
new file mode 100644
index 0000000000..95e7b2bb56
--- /dev/null
+++ b/package/libnss/0003-Bug-1602288-Fix-build-failure-due-to-missing-posix-s.patch
@@ -0,0 +1,26 @@
+From 2e1b003600156e4adcb88998eabf18addee45be1 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Sun, 8 Dec 2019 11:57:45 +0100
+Subject: [PATCH] Bug 1602288 - Fix build failure due to missing posix signal.h
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/coreconf/Linux.mk | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nss/coreconf/Linux.mk b/nss/coreconf/Linux.mk
+index d07f8a3c5..854d3ca96 100644
+--- a/nss/coreconf/Linux.mk
++++ b/nss/coreconf/Linux.mk
+@@ -21,7 +21,7 @@ ifeq ($(USE_PTHREADS),1)
+ endif
+ 
+ DEFAULT_COMPILER = gcc
+-DEFINES += -D_DEFAULT_SOURCE -D_BSD_SOURCE
++DEFINES += -D_DEFAULT_SOURCE -D_BSD_SOURCE -D_POSIX_SOURCE
+ 
+ ifeq ($(OS_TARGET),Android)
+ ifndef ANDROID_NDK
+-- 
+2.20.1
+
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 518d95d842..b53fc6d5f0 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
-# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_46_1_RTM/src/SHA256SUMS
-sha256	1ae3d1cb1de345b258788f2ef6b10a460068034c3fd64f42427a183d8342a6fb  nss-3.47.1.tar.gz
+# From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_48_RTM/src/SHA256SUMS
+sha256	3f9c822a86a4e3e1bfe63e2ed0f922d8b7c2e0b7cafe36774b1c627970d0f8ac  nss-3.48.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 747612c795..ae49dbe1b2 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.47.1
+LIBNSS_VERSION = 3.48
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
