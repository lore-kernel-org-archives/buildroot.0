From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 28 Jul 2018 10:24:45 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20180728082445.25019-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002 after upstream commit:
https://github.com/tvheadend/tvheadend/commit/e26ce3390a5ca88f3fcee8a7fa0e4bb1b078e538

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 ...-configure-check-for-strlcat-strlcpy.patch | 97 -------------------
 package/tvheadend/tvheadend.hash              |  2 +-
 package/tvheadend/tvheadend.mk                |  2 +-
 3 files changed, 2 insertions(+), 99 deletions(-)
 delete mode 100644 package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch

diff --git a/package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch b/package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch
deleted file mode 100644
index 71c01e2f48..0000000000
--- a/package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch
+++ /dev/null
@@ -1,97 +0,0 @@
-From 1f879e4b930fef71f030e5b6e5fae359f27d1aec Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Sat, 23 Jun 2018 20:47:26 +0200
-Subject: [PATCH] configure: check for strlcat & strlcpy
-
-Building tvheadend with uclibc and musl fails:
-
-src/tvh_string.h:50:22: error: static declaration of 'strlcpy' follows non-static declaration
- static inline size_t strlcpy(char *dst, const char *src, size_t size)
-
-src/tvh_string.h:61:22: error: static declaration of 'strlcat' follows non-static declaration
- static inline size_t strlcat(char *dst, const char *src, size_t count)
-
-because they provide strlcat & strlcpy:
-https://sourceware.org/glibc/wiki/strlcpy
-
-This patch adds configure checks and makes the implementation in
-tvh_string.h optional, the configure log looks like this:
-
-glibc
-  checking for cc strlcat ...                       fail
-  checking for cc strlcpy ...                       fail
-
-musl
-  checking for cc strlcat ...                       ok
-  checking for cc strlcpy ...                       ok
-
-uclibc
-  checking for cc strlcat ...                       ok
-  checking for cc strlcpy ...                       ok
-
-Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/1133
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- configure        | 14 ++++++++++++++
- src/tvh_string.h |  4 ++++
- 2 files changed, 18 insertions(+)
-
-diff --git a/configure b/configure
-index 0857a1958..b183d02b3 100755
---- a/configure
-+++ b/configure
-@@ -159,6 +159,20 @@ else
-   COMPILER=gcc
- fi
- 
-+check_cc_snippet strlcat '#include <string.h>
-+int test(int argc, char **argv) {
-+  char dst[10];
-+  strlcat("test", dst, sizeof(dst));
-+  return 0;
-+}'
-+
-+check_cc_snippet strlcpy '#include <string.h>
-+int test(int argc, char **argv) {
-+  char dst[10];
-+  strlcpy("test", dst, sizeof(dst));
-+  return 0;
-+}'
-+
- check_cc_snippet getloadavg '#include <stdlib.h>
- void test() { getloadavg(NULL,0); }'
- 
-diff --git a/src/tvh_string.h b/src/tvh_string.h
-index 87d8c3320..13ef2f308 100644
---- a/src/tvh_string.h
-+++ b/src/tvh_string.h
-@@ -47,6 +47,7 @@ static inline const char *tvh_strbegins(const char *s1, const char *s2)
-   return s1;
- }
- 
-+#ifndef ENABLE_STRLCPY
- static inline size_t strlcpy(char *dst, const char *src, size_t size)
- {
-   size_t ret = strlen(src);
-@@ -57,7 +58,9 @@ static inline size_t strlcpy(char *dst, const char *src, size_t size)
-   }
-   return ret;
- }
-+#endif
- 
-+#ifndef ENABLE_STRLCAT
- static inline size_t strlcat(char *dst, const char *src, size_t count)
- {
-   size_t dlen = strlen(dst);
-@@ -72,6 +75,7 @@ static inline size_t strlcat(char *dst, const char *src, size_t count)
-   dst[len] = '\0';
-   return res;
- }
-+#endif
- 
- #define tvh_strlcatf(buf, size, ptr, fmt...) \
-   do { int __r = snprintf((buf) + ptr, (size) - ptr, fmt); \
--- 
-2.17.1
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 06820d6193..ce275f132f 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 f12ad165d5abd464fe38c358b385eb030ae4daa01b940c348525d5bfc876e514  tvheadend-66d6161c563181e5a572337ab3509a835c5a57e2.tar.gz
+sha256 3389e857651665cc1fe96e624ffe12ad1ec28f31d396f0579fcaa47536fb6400  tvheadend-9b9ee6859be90fedb5d43ad1d770dfcdb8b1caf4.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 8e06165e3b..4c9cda4d9a 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = 66d6161c563181e5a572337ab3509a835c5a57e2
+TVHEADEND_VERSION = 9b9ee6859be90fedb5d43ad1d770dfcdb8b1caf4
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
-- 
2.18.0
