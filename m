From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 25 Jun 2018 22:16:47 +0200
Subject: [Buildroot] [git commit] package/tvheadend: bump version
Message-ID: <20180625201357.811ED81402@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=23e18c4036315f4b621d9291a3a647e69ef9d563
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Removed patch 0002, applied upstream:
https://github.com/tvheadend/tvheadend/commit/068e5f921ddc22e648ebe006e515baf3e1ea12d1

Added patch to fix musl & uclibc build.

Renamed option dvbcsa to tvhcsa.

Upstream removed the dvbcsa configure option with this commit:
https://github.com/tvheadend/tvheadend/commit/4e7f837c7055f4cb173164ca31af139e0a7858a5#diff-e2d5a00791bce9a01f99bc6fd613a39d

and moved the optional dvbcsa support inside the tvhcsa option block:
https://github.com/tvheadend/tvheadend/blob/c76c7e0604977305498221f83c049d6d4fc715ed/configure#L645

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0002-configure-check-for-strlcat-strlcpy.patch | 97 ++++++++++++++++++++++
 .../0002-sbuf-fix-uclibc-compilation-error.patch   | 33 --------
 package/tvheadend/tvheadend.hash                   |  2 +-
 package/tvheadend/tvheadend.mk                     |  6 +-
 4 files changed, 101 insertions(+), 37 deletions(-)

diff --git a/package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch b/package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch
new file mode 100644
index 0000000000..71c01e2f48
--- /dev/null
+++ b/package/tvheadend/0002-configure-check-for-strlcat-strlcpy.patch
@@ -0,0 +1,97 @@
+From 1f879e4b930fef71f030e5b6e5fae359f27d1aec Mon Sep 17 00:00:00 2001
+From: Bernd Kuhls <bernd.kuhls@t-online.de>
+Date: Sat, 23 Jun 2018 20:47:26 +0200
+Subject: [PATCH] configure: check for strlcat & strlcpy
+
+Building tvheadend with uclibc and musl fails:
+
+src/tvh_string.h:50:22: error: static declaration of 'strlcpy' follows non-static declaration
+ static inline size_t strlcpy(char *dst, const char *src, size_t size)
+
+src/tvh_string.h:61:22: error: static declaration of 'strlcat' follows non-static declaration
+ static inline size_t strlcat(char *dst, const char *src, size_t count)
+
+because they provide strlcat & strlcpy:
+https://sourceware.org/glibc/wiki/strlcpy
+
+This patch adds configure checks and makes the implementation in
+tvh_string.h optional, the configure log looks like this:
+
+glibc
+  checking for cc strlcat ...                       fail
+  checking for cc strlcpy ...                       fail
+
+musl
+  checking for cc strlcat ...                       ok
+  checking for cc strlcpy ...                       ok
+
+uclibc
+  checking for cc strlcat ...                       ok
+  checking for cc strlcpy ...                       ok
+
+Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/1133
+
+Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
+---
+ configure        | 14 ++++++++++++++
+ src/tvh_string.h |  4 ++++
+ 2 files changed, 18 insertions(+)
+
+diff --git a/configure b/configure
+index 0857a1958..b183d02b3 100755
+--- a/configure
++++ b/configure
+@@ -159,6 +159,20 @@ else
+   COMPILER=gcc
+ fi
+ 
++check_cc_snippet strlcat '#include <string.h>
++int test(int argc, char **argv) {
++  char dst[10];
++  strlcat("test", dst, sizeof(dst));
++  return 0;
++}'
++
++check_cc_snippet strlcpy '#include <string.h>
++int test(int argc, char **argv) {
++  char dst[10];
++  strlcpy("test", dst, sizeof(dst));
++  return 0;
++}'
++
+ check_cc_snippet getloadavg '#include <stdlib.h>
+ void test() { getloadavg(NULL,0); }'
+ 
+diff --git a/src/tvh_string.h b/src/tvh_string.h
+index 87d8c3320..13ef2f308 100644
+--- a/src/tvh_string.h
++++ b/src/tvh_string.h
+@@ -47,6 +47,7 @@ static inline const char *tvh_strbegins(const char *s1, const char *s2)
+   return s1;
+ }
+ 
++#ifndef ENABLE_STRLCPY
+ static inline size_t strlcpy(char *dst, const char *src, size_t size)
+ {
+   size_t ret = strlen(src);
+@@ -57,7 +58,9 @@ static inline size_t strlcpy(char *dst, const char *src, size_t size)
+   }
+   return ret;
+ }
++#endif
+ 
++#ifndef ENABLE_STRLCAT
+ static inline size_t strlcat(char *dst, const char *src, size_t count)
+ {
+   size_t dlen = strlen(dst);
+@@ -72,6 +75,7 @@ static inline size_t strlcat(char *dst, const char *src, size_t count)
+   dst[len] = '\0';
+   return res;
+ }
++#endif
+ 
+ #define tvh_strlcatf(buf, size, ptr, fmt...) \
+   do { int __r = snprintf((buf) + ptr, (size) - ptr, fmt); \
+-- 
+2.17.1
+
diff --git a/package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch b/package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch
deleted file mode 100644
index deed9f98f7..0000000000
--- a/package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch
+++ /dev/null
@@ -1,33 +0,0 @@
-From b16ad4d258409fbd6acf843d62a7a84f621e3b70 Mon Sep 17 00:00:00 2001
-From: Bernd Kuhls <bernd.kuhls@t-online.de>
-Date: Mon, 18 Dec 2017 20:52:06 +0100
-Subject: [PATCH] sbuf: fix uclibc compilation error
-
-Fixes build error
-
-tvheadend-e06ffd87beff16103c47d6fa542df2374fca6fd3/src/sbuf.h:77:1:
- error: unknown type name 'ssize_t'; did you mean 'size_t'?
- ssize_t sbuf_read(sbuf_t *sb, int fd);
-
-Patch sent upstream: https://github.com/tvheadend/tvheadend/pull/1062
-
-Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
----
- src/sbuf.h | 1 +
- 1 file changed, 1 insertion(+)
-
-diff --git a/src/sbuf.h b/src/sbuf.h
-index 78aa546b3..d5aa53042 100644
---- a/src/sbuf.h
-+++ b/src/sbuf.h
-@@ -23,6 +23,7 @@
- #include <stddef.h>
- #include <stdio.h>
- #include <stdint.h>
-+#include <unistd.h>
- 
- /**
-  * Simple dynamically growing buffer
--- 
-2.11.0
-
diff --git a/package/tvheadend/tvheadend.hash b/package/tvheadend/tvheadend.hash
index 4e890a8272..06820d6193 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 32f96937a3ffa72b5bdbfde9a5f9f9535f88e94e44864d4c8c6a152985c16569  tvheadend-e06ffd87beff16103c47d6fa542df2374fca6fd3.tar.gz
+sha256 f12ad165d5abd464fe38c358b385eb030ae4daa01b940c348525d5bfc876e514  tvheadend-66d6161c563181e5a572337ab3509a835c5a57e2.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 45ea7bfc28..8e06165e3b 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = e06ffd87beff16103c47d6fa542df2374fca6fd3
+TVHEADEND_VERSION = 66d6161c563181e5a572337ab3509a835c5a57e2
 TVHEADEND_SITE = $(call github,tvheadend,tvheadend,$(TVHEADEND_VERSION))
 TVHEADEND_LICENSE = GPL-3.0+
 TVHEADEND_LICENSE_FILES = LICENSE.md
@@ -65,9 +65,9 @@ endif
 
 ifeq ($(BR2_PACKAGE_LIBDVBCSA),y)
 TVHEADEND_DEPENDENCIES += libdvbcsa
-TVHEADEND_CONF_OPTS += --enable-dvbcsa
+TVHEADEND_CONF_OPTS += --enable-tvhcsa
 else
-TVHEADEND_CONF_OPTS += --disable-dvbcsa
+TVHEADEND_CONF_OPTS += --disable-tvhcsa
 endif
 
 ifeq ($(BR2_PACKAGE_LIBHDHOMERUN),y)
