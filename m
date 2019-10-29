From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Tue, 29 Oct 2019 13:09:16 +0100
Subject: [Buildroot] [PATCH v3] package/libnss: fix build failure with ARM
 without NEON extension
Message-ID: <20191029120916.33876-1-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

At the moment libnss assumes that every ARM has NEON extension but it's
not that way. So add a patch to make it aware of it and use native
functions in place of NEON optimized ones.

Fixes:
http://autobuild.buildroot.net/results/1342d305d1aeebef7af54a83afc094fda12421e2/

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
V1->V2:
* added Fixes to commit log
* fixed #ifdef statement in patch
V2->V3:
* fixed #ifdef statement again according to upstream:
https://bugzilla.mozilla.org/show_bug.cgi?id=1590676
---
 ...ix-build-if-arm-doesn-t-support-NEON.patch | 50 +++++++++++++++++++
 1 file changed, 50 insertions(+)
 create mode 100644 package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch

diff --git a/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch b/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
new file mode 100644
index 0000000000..467a1dc474
--- /dev/null
+++ b/package/libnss/0003-Bug-1590676-Fix-build-if-arm-doesn-t-support-NEON.patch
@@ -0,0 +1,50 @@
+From c915be634cbfb90eb7880ec9efbdba9b98c6d4c1 Mon Sep 17 00:00:00 2001
+From: Giulio Benetti <giulio.benetti@benettiengineering.com>
+Date: Wed, 23 Oct 2019 11:47:03 +0200
+Subject: [PATCH] Bug 1590676 - Fix build if arm doesn't support NEON
+
+At the moment NSS assumes that ARM supports NEON extension but this is
+not true and leads to build failure on ARM without NEON extension.
+Add check to assure USE_HW_AES is not defined if ARM without NEON
+extension is used.
+
+Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
+---
+ nss/lib/freebl/aes-armv8.c | 5 +++--
+ nss/lib/freebl/rijndael.c  | 3 ++-
+ 2 files changed, 5 insertions(+), 3 deletions(-)
+
+diff --git a/nss/lib/freebl/aes-armv8.c b/nss/lib/freebl/aes-armv8.c
+index 40d5e2d34..057d1aed3 100644
+--- a/nss/lib/freebl/aes-armv8.c
++++ b/nss/lib/freebl/aes-armv8.c
+@@ -5,9 +5,10 @@
+ #include "secerr.h"
+ #include "rijndael.h"
+ 
+-#if (defined(__clang__) ||                            \
++#if ((defined(__clang__) ||                            \
+      (defined(__GNUC__) && defined(__GNUC_MINOR__) && \
+-      (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8))))
++      (__GNUC__ > 4 || (__GNUC__ == 4 && __GNUC_MINOR__ > 8)))) && \
++      (defined(__ARM_NEON) || defined(__ARM_NEON__)))
+ 
+ #ifndef __ARM_FEATURE_CRYPTO
+ #error "Compiler option is invalid"
+diff --git a/nss/lib/freebl/rijndael.c b/nss/lib/freebl/rijndael.c
+index 26bd58ee0..6d77d942d 100644
+--- a/nss/lib/freebl/rijndael.c
++++ b/nss/lib/freebl/rijndael.c
+@@ -20,7 +20,8 @@
+ #include "gcm.h"
+ #include "mpi.h"
+ 
+-#if !defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)
++#if (!defined(IS_LITTLE_ENDIAN) && !defined(NSS_X86_OR_X64)) || \
++    (defined(__arm__) && !defined(__ARM_NEON) && !defined(__ARM_NEON__))
+ // not test yet on big endian platform of arm
+ #undef USE_HW_AES
+ #endif
+-- 
+2.20.1
+
-- 
2.20.1
