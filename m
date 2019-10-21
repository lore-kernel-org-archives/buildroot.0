From: Giulio Benetti <giulio.benetti@benettiengineering.com>
Date: Mon, 21 Oct 2019 16:30:45 +0200
Subject: [Buildroot] [PATCH 2/2] package/libnss: security bump to version
 3.47
In-Reply-To: <20191021143045.92888-1-giulio.benetti@benettiengineering.com>
References: <20191021143045.92888-1-giulio.benetti@benettiengineering.com>
Message-ID: <20191021143045.92888-2-giulio.benetti@benettiengineering.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes the following security issues:
CVE-2019-11756: Remove refcounting from sftk_FreeSession

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 ...build-failure-on-aarch64_be-while-bu.patch | 36 -------------------
 package/libnss/libnss.hash                    |  2 +-
 package/libnss/libnss.mk                      |  2 +-
 3 files changed, 2 insertions(+), 38 deletions(-)
 delete mode 100644 package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch

diff --git a/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch b/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
deleted file mode 100644
index ed415c13d4..0000000000
--- a/package/libnss/0003-Bug-1580126-Fix-build-failure-on-aarch64_be-while-bu.patch
+++ /dev/null
@@ -1,36 +0,0 @@
-From 6b3819159949ed7fc099e588e2e0669407135121 Mon Sep 17 00:00:00 2001
-From: Giulio Benetti <giulio.benetti@micronovasrl.com>
-Date: Tue, 10 Sep 2019 11:29:02 +0200
-Subject: [PATCH] Bug 1580126 - Fix build failure on aarch64_be while building
- freebl/gcm
-
-Build failure is caused by different #ifdef conditions in gcm.c and
-gcm-aarch64.c that leads to double declaration of the same gcm_*
-functions.
-
-Fix #ifdef condition in gcm-aarch64.c making it the same as the one in
-gcm.c.
-
-[Upstream: https://bugzilla.mozilla.org/show_bug.cgi?id=1580126]
-Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
----
- nss/lib/freebl/gcm-aarch64.c | 3 ++-
- 1 file changed, 2 insertions(+), 1 deletion(-)
-
-diff --git a/nss/lib/freebl/gcm-aarch64.c b/nss/lib/freebl/gcm-aarch64.c
-index 65ea9fb5f..3f3c046d7 100644
---- a/nss/lib/freebl/gcm-aarch64.c
-+++ b/nss/lib/freebl/gcm-aarch64.c
-@@ -9,7 +9,8 @@
- #include "secerr.h"
- 
- /* old gcc doesn't support some poly64x2_t intrinsic */
--#if defined(__clang__) || (defined(__GNUC__) && __GNUC__ > 6)
-+#if defined(__aarch64__) && defined(IS_LITTLE_ENDIAN) && \
-+    (defined(__clang__) || defined(__GNUC__) && __GNUC__ > 6)
- 
- #include <arm_neon.h>
- 
--- 
-2.17.1
-
diff --git a/package/libnss/libnss.hash b/package/libnss/libnss.hash
index 53c20149a0..92d6fd3908 100644
--- a/package/libnss/libnss.hash
+++ b/package/libnss/libnss.hash
@@ -1,4 +1,4 @@
 # From https://ftp.mozilla.org/pub/security/nss/releases/NSS_3_46_1_RTM/src/SHA256SUMS
-sha256	3bf7e0ed7db98803f134c527c436cc68415ff17257d34bd75de14e9a09d13651  nss-3.46.1.tar.gz
+sha256	6cd0c4438b616bdacc0b5f25ff1506b0d07ee97ea6c95d514c5487200a155fa7  nss-3.47.tar.gz
 # Locally calculated
 sha256	a20c1a32d1f8102432360b42e932869f7c11c7cdbacf9cac554c422132af47f4  nss/COPYING
diff --git a/package/libnss/libnss.mk b/package/libnss/libnss.mk
index 5bbd013538..472936db89 100644
--- a/package/libnss/libnss.mk
+++ b/package/libnss/libnss.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSS_VERSION = 3.46.1
+LIBNSS_VERSION = 3.47
 LIBNSS_SOURCE = nss-$(LIBNSS_VERSION).tar.gz
 LIBNSS_SITE = https://ftp.mozilla.org/pub/mozilla.org/security/nss/releases/NSS_$(subst .,_,$(LIBNSS_VERSION))_RTM/src
 LIBNSS_DISTDIR = dist
-- 
2.20.1
