From: Peter Korsgaard <peter@korsgaard.com>
Date: Sun, 15 Feb 2015 21:26:42 +0100
Subject: [Buildroot] [git commit] package/dvdauthor: fix static build
Message-ID: <20150215204438.741657FDB3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1cac78fbb044279f1854b1c7c59e94f03fb061f1
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Dvdauthor forget to link witk -lbz2 when linking with freetype2.

Fixes:
http://autobuild.buildroot.net/results/1d8/1d83390a3dd9f6bb595e9fc7b321500b4dc533a8/

Signed-off-by: Romain Naour <romain.naour@openwide.fr>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-configure.ac-fix-static-build.patch       |   55 ++++++++++++++++++++
 package/dvdauthor/dvdauthor.mk                     |    5 ++
 2 files changed, 60 insertions(+), 0 deletions(-)

diff --git a/package/dvdauthor/0001-configure.ac-fix-static-build.patch b/package/dvdauthor/0001-configure.ac-fix-static-build.patch
new file mode 100644
index 0000000..0e016b8
--- /dev/null
+++ b/package/dvdauthor/0001-configure.ac-fix-static-build.patch
@@ -0,0 +1,55 @@
+From da77704c575f0583fa871ff02bd52906a7979576 Mon Sep 17 00:00:00 2001
+From: Romain Naour <romain.naour@openwide.fr>
+Date: Sun, 15 Feb 2015 11:05:43 +0100
+Subject: [PATCH] configure.ac: fix static build
+
+Add LT_INIT macro to handle --enable-shared option.
+
+If enable-shared=no then add --static flag to resolve FREETYPE_LIBS.
+
+Otherwise, dvdauthor forget to link witk -lbz2 when linking with freetype2.
+
+Fixes:
+http://autobuild.buildroot.net/results/1d8/1d83390a3dd9f6bb595e9fc7b321500b4dc533a8/
+
+Signed-off-by: Romain Naour <romain.naour@openwide.fr>
+---
+ configure.ac | 8 +++++++-
+ 1 file changed, 7 insertions(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index c43df92..d78d56a 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -4,6 +4,7 @@ AM_CONFIG_HEADER(src/config.h)
+ AC_CONFIG_AUX_DIR(autotools)
+ 
+ AM_INIT_AUTOMAKE
++LT_INIT
+ 
+ AC_PROG_INSTALL
+ 
+@@ -39,6 +40,11 @@ PKG_CHECK_MODULES(LIBPNG, [libpng])
+ AC_SUBST(LIBPNG_CFLAGS)
+ AC_SUBST(LIBPNG_LIBS)
+ 
++config_static=''
++if test "$enable_shared" = 'no'; then
++    config_static='--static'
++fi
++
+ usemagick=0
+ 
+ AC_CHECK_PROGS(MAGICKCONFIG, [Magick-config])
+@@ -95,7 +101,7 @@ AC_SUBST(FRIBIDI_LIBS)
+ AC_CHECK_PROGS(FREETYPECONFIG, [freetype-config])
+ if test -n "$FREETYPECONFIG"; then
+     FREETYPE_CPPFLAGS="`$FREETYPECONFIG --cflags`"
+-    FREETYPE_LIBS="`$FREETYPECONFIG --libs`"
++    FREETYPE_LIBS="`$FREETYPECONFIG --libs $config_static`"
+     AC_DEFINE(HAVE_FREETYPE, 1, [Whether FreeType is available])
+ 
+     ac_save_CPPFLAGS="$CPPFLAGS"
+-- 
+1.9.3
+
diff --git a/package/dvdauthor/dvdauthor.mk b/package/dvdauthor/dvdauthor.mk
index 7985599..68cce4f 100644
--- a/package/dvdauthor/dvdauthor.mk
+++ b/package/dvdauthor/dvdauthor.mk
@@ -14,6 +14,11 @@ DVDAUTHOR_CONF_ENV = \
 	ac_cv_path_XML2_CONFIG=$(STAGING_DIR)/usr/bin/xml2-config \
 	ac_cv_prog_GMAGICKCONFIG=
 
+# configure.ac patched by 0001-configure.ac-fix-static-build.patch
+DVDAUTHOR_AUTORECONF = YES
+# add host-gettext for AM_ICONV macro
+DVDAUTHOR_DEPENDENCIES += host-gettext
+
 ifeq ($(BR2_PACKAGE_IMAGEMAGICK),y)
 DVDAUTHOR_DEPENDENCIES += imagemagick
 DVDAUTHOR_CONF_ENV += \
