From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 16 Dec 2018 21:47:37 +0100
Subject: [Buildroot] [git commit] package/netsurf: turn libcurl into an
 optional dependency
Message-ID: <20181216204426.C16758B49B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=b808e65c1c4f83b5e6757e2d1cabd0df23e503fb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .../0004-fix-compilation-without-curl.patch        | 27 ++++++++++++++++++++++
 package/netsurf/Config.in                          |  3 +--
 package/netsurf/netsurf.mk                         | 12 +++++++++-
 3 files changed, 39 insertions(+), 3 deletions(-)

diff --git a/package/netsurf/0004-fix-compilation-without-curl.patch b/package/netsurf/0004-fix-compilation-without-curl.patch
new file mode 100644
index 0000000000..2300ae5f4e
--- /dev/null
+++ b/package/netsurf/0004-fix-compilation-without-curl.patch
@@ -0,0 +1,27 @@
+From 7d7c59dbfc92fcbcd0eac2c84e0fb98662c4bd71 Mon Sep 17 00:00:00 2001
+From: Francois Perrad <francois.perrad@gadz.org>
+Date: Sat, 8 Dec 2018 09:43:40 +0100
+Subject: [PATCH] fix compilation without curl
+
+Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
+---
+ netsurf/content/fetch.c | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/netsurf/content/fetch.c b/netsurf/content/fetch.c
+index 7665029..0f41c49 100644
+--- a/netsurf/content/fetch.c
++++ b/netsurf/content/fetch.c
+@@ -54,7 +54,9 @@
+ #include "content/fetchers.h"
+ #include "content/fetchers/resource.h"
+ #include "content/fetchers/about.h"
++#ifdef WITH_CURL
+ #include "content/fetchers/curl.h"
++#endif
+ #include "content/fetchers/data.h"
+ #include "content/fetchers/file.h"
+ #include "javascript/fetcher.h"
+-- 
+2.17.1
+
diff --git a/package/netsurf/Config.in b/package/netsurf/Config.in
index ca28a16688..8a301e6218 100644
--- a/package/netsurf/Config.in
+++ b/package/netsurf/Config.in
@@ -2,10 +2,9 @@ config BR2_PACKAGE_NETSURF
 	bool "netsurf"
 	select BR2_PACKAGE_EXPAT
 	select BR2_PACKAGE_JPEG
-	select BR2_PACKAGE_LIBCURL
 	select BR2_PACKAGE_LIBICONV if !BR2_ENABLE_LOCALE
 	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_OPENSSL
+	select BR2_PACKAGE_OPENSSL if BR2_PACKAGE_LIBCURL
 	help
 	  NetSurf is a compact graphical web browser which aims for
 	  HTML5, CSS and JavaScript support.
diff --git a/package/netsurf/netsurf.mk b/package/netsurf/netsurf.mk
index 8d29c5acc8..692d2b770c 100644
--- a/package/netsurf/netsurf.mk
+++ b/package/netsurf/netsurf.mk
@@ -9,7 +9,7 @@ NETSURF_SOURCE = netsurf-all-$(NETSURF_VERSION).tar.gz
 NETSURF_SITE = http://download.netsurf-browser.org/netsurf/releases/source-full
 NETSURF_LICENSE = GPL-2.0
 NETSURF_LICENSE_FILES = netsurf/COPYING
-NETSURF_DEPENDENCIES = expat jpeg libcurl libpng openssl \
+NETSURF_DEPENDENCIES = expat jpeg libpng \
 	host-bison host-flex host-gperf host-pkgconf
 
 ifeq ($(BR2_PACKAGE_NETSURF_GTK),y)
@@ -51,10 +51,20 @@ define NETSURF_ICONV_CONFIGURE_CMDS
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_LIBCURL),y)
+NETSURF_DEPENDENCIES += libcurl openssl
+else
+define NETSURF_CURL_CONFIGURE_CMDS
+	echo "override NETSURF_USE_CURL := NO"          >> $(@D)/netsurf/Makefile.config
+	echo "override NETSURF_USE_OPENSSL := NO"       >> $(@D)/netsurf/Makefile.config
+endef
+endif
+
 define NETSURF_CONFIGURE_CMDS
 	$(NETSURF_ICONV_CONFIGURE_CMDS)
 	$(NETSURF_SVG_CONFIGURE_CMDS)
 	$(NETSURF_FONTLIB_CONFIGURE_CMDS)
+	$(NETSURF_CURL_CONFIGURE_CMDS)
 endef
 
 NETSURF_MAKE_OPTS = \
