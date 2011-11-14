From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Mon, 14 Nov 2011 10:16:49 +0100
Subject: [Buildroot] [git commit] rrdtool: fix build when host has
	libart/freetype development files
Message-ID: <20111114092054.CE41B8F4D7@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=534c6a682e5d7785669ec22fd0d34878edb151fd
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 ...2.30-configure-dont-hardcode-include-dirs.patch |   26 ++++++++++++++++++++
 package/rrdtool/rrdtool.mk                         |    1 +
 2 files changed, 27 insertions(+), 0 deletions(-)

diff --git a/package/rrdtool/rrdtool-1.2.30-configure-dont-hardcode-include-dirs.patch b/package/rrdtool/rrdtool-1.2.30-configure-dont-hardcode-include-dirs.patch
new file mode 100644
index 0000000..43b57a1
--- /dev/null
+++ b/package/rrdtool/rrdtool-1.2.30-configure-dont-hardcode-include-dirs.patch
@@ -0,0 +1,26 @@
+[PATCH] configure.ac: don't hardcode include files search paths
+
+Breaks cross compilation if host has libart/freetype.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ configure.ac |    4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+Index: rrdtool-1.2.30/configure.ac
+===================================================================
+--- rrdtool-1.2.30.orig/configure.ac
++++ rrdtool-1.2.30/configure.ac
+@@ -524,10 +524,10 @@
+ 
+ CORE_LIBS="$LIBS"
+ 
+-EX_CHECK_ALL(art_lgpl_2, art_vpath_add_point,       libart_lgpl/libart.h,   libart-2.0,  2.3.17, ftp://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/, /usr/include/libart-2.0)
++EX_CHECK_ALL(art_lgpl_2, art_vpath_add_point,       libart_lgpl/libart.h,   libart-2.0,  2.3.17, ftp://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/, "")
+ EX_CHECK_ALL(z,          zlibVersion,               zlib.h,                 zlib,        1.2.3,  http://www.gzip.org/zlib/, "")
+ EX_CHECK_ALL(png,        png_access_version_number, png.h,                  libpng,      1.2.10,  http://prdownloads.sourceforge.net/libpng/, "")
+-EX_CHECK_ALL(freetype,   FT_Init_FreeType,          ft2build.h,		    freetype2,   2.1.10,  http://prdownloads.sourceforge.net/freetype/, /usr/include/freetype2)
++EX_CHECK_ALL(freetype,   FT_Init_FreeType,          ft2build.h,		    freetype2,   2.1.10,  http://prdownloads.sourceforge.net/freetype/, "")
+ 
+ if test "$EX_CHECK_ALL_ERR" = "YES"; then
+   AC_MSG_ERROR([Please fix the library issues listed above and try again.])
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index 55aed9e..55bdd51 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -7,6 +7,7 @@
 RRDTOOL_VERSION = 1.2.30
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_DEPENDENCIES = host-pkg-config freetype libart libpng zlib
+RRDTOOL_AUTORECONF = YES
 RRDTOOL_INSTALL_STAGING = YES
 RRDTOOL_CONF_ENV = rd_cv_ieee_works=yes rd_cv_null_realloc=nope \
 			ac_cv_func_mmap_fixed_mapped=yes
