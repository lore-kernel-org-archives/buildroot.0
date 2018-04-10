From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 10 Apr 2018 21:32:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/tvheadend: bump version
Message-ID: <20180410193233.18804-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Removed patch 0002, applied upstream:
https://github.com/tvheadend/tvheadend/commit/068e5f921ddc22e648ebe006e515baf3e1ea12d1

Renamed option dvbcsa to tvhcsa.

Upstream removed the dvbcsa configure option with this commit:
https://github.com/tvheadend/tvheadend/commit/4e7f837c7055f4cb173164ca31af139e0a7858a5#diff-e2d5a00791bce9a01f99bc6fd613a39d

and moved the optional dvbcsa support inside the tvhcsa option block:
https://github.com/tvheadend/tvheadend/blob/c76c7e0604977305498221f83c049d6d4fc715ed/configure#L645

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../0002-sbuf-fix-uclibc-compilation-error.patch   | 33 ----------------------
 package/tvheadend/tvheadend.hash                   |  2 +-
 package/tvheadend/tvheadend.mk                     |  6 ++--
 3 files changed, 4 insertions(+), 37 deletions(-)
 delete mode 100644 package/tvheadend/0002-sbuf-fix-uclibc-compilation-error.patch

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
index 4e890a8272..349fdf1e61 100644
--- a/package/tvheadend/tvheadend.hash
+++ b/package/tvheadend/tvheadend.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256 32f96937a3ffa72b5bdbfde9a5f9f9535f88e94e44864d4c8c6a152985c16569  tvheadend-e06ffd87beff16103c47d6fa542df2374fca6fd3.tar.gz
+sha256 801a433557dabd7e4f97724ea427ad20b05547276b57dd5cbca74935ae1476f1  tvheadend-4fe0af0e8d9e47b1bbae5599bea09a772325a9f9.tar.gz
 sha256 54dc3cbc00bf126bcba43e2af7f3ad1dc00f335985da1409fa943c7b7256d942  LICENSE.md
diff --git a/package/tvheadend/tvheadend.mk b/package/tvheadend/tvheadend.mk
index 45ea7bfc28..d64186fbaf 100644
--- a/package/tvheadend/tvheadend.mk
+++ b/package/tvheadend/tvheadend.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TVHEADEND_VERSION = e06ffd87beff16103c47d6fa542df2374fca6fd3
+TVHEADEND_VERSION = 4fe0af0e8d9e47b1bbae5599bea09a772325a9f9
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
-- 
2.14.2
