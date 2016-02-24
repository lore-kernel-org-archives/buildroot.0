From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 24 Feb 2016 17:33:07 -0300
Subject: [Buildroot] [PATCH 1/2] libnspr: bump to version 4.12
Message-ID: <1456345988-30346-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop 0003-enable-internal-getproto-functions-for-musl.patch since it's
no longer required (tested via a flickcurl build with libnss against
mips-musl).

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 ...able-internal-getproto-functions-for-musl.patch | 35 ----------------------
 package/libnspr/libnspr.hash                       |  4 +--
 package/libnspr/libnspr.mk                         |  2 +-
 3 files changed, 3 insertions(+), 38 deletions(-)
 delete mode 100644 package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch

diff --git a/package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch b/package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch
deleted file mode 100644
index 860ca2a..0000000
--- a/package/libnspr/0003-enable-internal-getproto-functions-for-musl.patch
+++ /dev/null
@@ -1,35 +0,0 @@
-From c950bcf9cc7bdc68ed9751a1b7d04f4b4c2a9fb0 Mon Sep 17 00:00:00 2001
-From: Sergio Prado <sergio.prado@e-labworks.com>
-Date: Tue, 5 Jan 2016 21:15:34 -0200
-Subject: [PATCH] enable internal getproto functions for musl
-
-Musl toolchains does not have getprotobyname_r and getprotobynumber_r
-functions and need its internal implementation.
-
-Patch backported from Alpine Linux commit
-a162da839db0d3f8be94a5c1ad2e2e54e691c38a.
-
-Signed-off-by: Sergio Prado <sergio.prado@e-labworks.com>
----
- nspr/pr/src/misc/prnetdb.c | 5 +----
- 1 file changed, 1 insertion(+), 4 deletions(-)
-
-diff --git a/nspr/pr/src/misc/prnetdb.c b/nspr/pr/src/misc/prnetdb.c
-index b86248f863f0..dc83a5615f45 100644
---- a/nspr/pr/src/misc/prnetdb.c
-+++ b/nspr/pr/src/misc/prnetdb.c
-@@ -61,10 +61,7 @@ PRLock *_pr_dnsLock = NULL;
- #define _PR_HAVE_GETPROTO_R_POINTER
- #endif
- 
--#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT)) \
--	|| (defined(LINUX) && defined(_REENTRANT) \
--        && !(defined(__GLIBC__) && __GLIBC__ >= 2) \
--        && !defined(ANDROID))
-+#if defined(SOLARIS) || (defined(BSDI) && defined(_REENTRANT))
- #define _PR_HAVE_GETPROTO_R
- #define _PR_HAVE_GETPROTO_R_POINTER
- #endif
--- 
-1.9.1
-
diff --git a/package/libnspr/libnspr.hash b/package/libnspr/libnspr.hash
index 87f6d4f..f513213 100644
--- a/package/libnspr/libnspr.hash
+++ b/package/libnspr/libnspr.hash
@@ -1,2 +1,2 @@
-# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.11/src/SHA256SUMS
-sha256	cb320a9eee7028275ac0fce7adc39dee36f14f02fd8432fce1b7e1aa5e3685c2	nspr-4.11.tar.gz
+# From https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v4.12/src/SHA256SUMS
+sha256	e0b10a1e569153668ff8bdea6c7e491b389fab69c2f18285a1ebf7c2ea4269de	nspr-4.12.tar.gz
diff --git a/package/libnspr/libnspr.mk b/package/libnspr/libnspr.mk
index 9f49eef..0311f8f 100644
--- a/package/libnspr/libnspr.mk
+++ b/package/libnspr/libnspr.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBNSPR_VERSION = 4.11
+LIBNSPR_VERSION = 4.12
 LIBNSPR_SOURCE = nspr-$(LIBNSPR_VERSION).tar.gz
 LIBNSPR_SITE = https://ftp.mozilla.org/pub/mozilla.org/nspr/releases/v$(LIBNSPR_VERSION)/src
 LIBNSPR_SUBDIR = nspr
-- 
2.4.10
