From: Gustavo Zacarias <gustavo@zacarias.com.ar>
Date: Wed, 11 Nov 2015 10:28:19 -0300
Subject: [Buildroot] [PATCH] rrdtool: bump to version 1.5.5
Message-ID: <1447248499-5233-1-git-send-email-gustavo@zacarias.com.ar>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Drop the patches since this is a major bump and they're no longer
relevant.

Introduce the new RRDTOOL_RRDGRAPH option, in previous versions the
graphing functionality was bundled with the stats/database backend,
however for newer versions this can be disabled.
Since it's normally expected functionality the default is yes, however
all of the buildroot rrd-using applications can work without this.

Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
---
 package/rrdtool/0001-automake-compat.patch         | 18 -----------
 ...0002-configure-dont-hardcode-include-dirs.patch | 26 ----------------
 package/rrdtool/Config.in                          | 36 +++++++++++++++++-----
 package/rrdtool/rrdtool.hash                       |  2 +-
 package/rrdtool/rrdtool.mk                         | 36 ++++++++++++----------
 5 files changed, 49 insertions(+), 69 deletions(-)
 delete mode 100644 package/rrdtool/0001-automake-compat.patch
 delete mode 100644 package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch

diff --git a/package/rrdtool/0001-automake-compat.patch b/package/rrdtool/0001-automake-compat.patch
deleted file mode 100644
index 92b753d..0000000
--- a/package/rrdtool/0001-automake-compat.patch
+++ /dev/null
@@ -1,18 +0,0 @@
-Make it compatible with newer autoconf/automake.
-Patch from OpenWRT.
-
-Signed-off-by: Gustavo Zacarias <gustavo@zacarias.com.ar>
-
---- a/bindings/tcl/Makefile.am
-+++ b/bindings/tcl/Makefile.am
-@@ -26,8 +26,8 @@ tclpkgdir = @TCL_PACKAGE_DIR@
- tclpkg_DATA = pkgIndex.tcl
- tclpkg_SCRIPTS = ifOctets.tcl
- else
--pkglib_DATA = pkgIndex.tcl
--pkglib_SCRIPTS = ifOctets.tcl
-+pkgdata_DATA = pkgIndex.tcl
-+pkgdata_SCRIPTS = ifOctets.tcl
- endif
- 
- # Automake doen't like `tclrrd$(VERSION)$(TCL_SHLIB_SUFFIX)' as
diff --git a/package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch b/package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch
deleted file mode 100644
index 43b57a1..0000000
--- a/package/rrdtool/0002-configure-dont-hardcode-include-dirs.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-[PATCH] configure.ac: don't hardcode include files search paths
-
-Breaks cross compilation if host has libart/freetype.
-
-Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
----
- configure.ac |    4 ++--
- 1 file changed, 2 insertions(+), 2 deletions(-)
-
-Index: rrdtool-1.2.30/configure.ac
-===================================================================
---- rrdtool-1.2.30.orig/configure.ac
-+++ rrdtool-1.2.30/configure.ac
-@@ -524,10 +524,10 @@
- 
- CORE_LIBS="$LIBS"
- 
--EX_CHECK_ALL(art_lgpl_2, art_vpath_add_point,       libart_lgpl/libart.h,   libart-2.0,  2.3.17, ftp://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/, /usr/include/libart-2.0)
-+EX_CHECK_ALL(art_lgpl_2, art_vpath_add_point,       libart_lgpl/libart.h,   libart-2.0,  2.3.17, ftp://ftp.gnome.org/pub/GNOME/sources/libart_lgpl/2.3/, "")
- EX_CHECK_ALL(z,          zlibVersion,               zlib.h,                 zlib,        1.2.3,  http://www.gzip.org/zlib/, "")
- EX_CHECK_ALL(png,        png_access_version_number, png.h,                  libpng,      1.2.10,  http://prdownloads.sourceforge.net/libpng/, "")
--EX_CHECK_ALL(freetype,   FT_Init_FreeType,          ft2build.h,		    freetype2,   2.1.10,  http://prdownloads.sourceforge.net/freetype/, /usr/include/freetype2)
-+EX_CHECK_ALL(freetype,   FT_Init_FreeType,          ft2build.h,		    freetype2,   2.1.10,  http://prdownloads.sourceforge.net/freetype/, "")
- 
- if test "$EX_CHECK_ALL_ERR" = "YES"; then
-   AC_MSG_ERROR([Please fix the library issues listed above and try again.])
diff --git a/package/rrdtool/Config.in b/package/rrdtool/Config.in
index 33fa677..b07c446 100644
--- a/package/rrdtool/Config.in
+++ b/package/rrdtool/Config.in
@@ -1,15 +1,37 @@
 config BR2_PACKAGE_RRDTOOL
 	bool "rrdtool"
-	depends on BR2_USE_WCHAR
-	select BR2_PACKAGE_FREETYPE
-	select BR2_PACKAGE_LIBART
-	select BR2_PACKAGE_LIBPNG
-	select BR2_PACKAGE_ZLIB
+	depends on BR2_USE_WCHAR # libglib2
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
+	depends on BR2_USE_MMU # libglib2
+	select BR2_PACKAGE_LIBGLIB2
 	help
 	  RRDtool is the OpenSource industry standard, high performance
 	  data logging and graphing system for time series data.
 
 	  http://oss.oetiker.ch/rrdtool/
 
-comment "rrdtool needs a toolchain w/ wchar"
-	depends on !BR2_USE_WCHAR
+if BR2_PACKAGE_RRDTOOL
+
+config BR2_PACKAGE_RRDTOOL_RRDGRAPH
+	bool "rrd_graph"
+	default y
+	depends on BR2_ARCH_HAS_ATOMICS # cairo
+	depends on BR2_INSTALL_LIBSTDCPP # freetype support from pango
+	select BR2_PACKAGE_CAIRO
+	select BR2_PACKAGE_CAIRO_PDF
+	select BR2_PACKAGE_CAIRO_PNG
+	select BR2_PACKAGE_CAIRO_PS
+	select BR2_PACKAGE_CAIRO_SVG
+	select BR2_PACKAGE_PANGO
+	help
+	  This enables the graphing capabilities ('rrdgraph').
+	  Without this it will only act as a database backend.
+
+comment "rrd_graph support needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
+
+endif
+
+comment "rrdtool needs a toolchain w/ wchar, threads"
+	depends on BR2_USE_MMU
+	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/rrdtool/rrdtool.hash b/package/rrdtool/rrdtool.hash
index 20af75a..36ac50c 100644
--- a/package/rrdtool/rrdtool.hash
+++ b/package/rrdtool/rrdtool.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256	3190efea410a6dd035799717948b2df09910f608d72d23ee81adad4cd0184ae9	rrdtool-1.2.30.tar.gz
+sha256	3a286d449c05d657e3fc3adcaa5cb4f0cfac8f465324b14f364a45d4ff8ca6f6	rrdtool-1.5.5.tar.gz
diff --git a/package/rrdtool/rrdtool.mk b/package/rrdtool/rrdtool.mk
index e422694..bc2fa89 100644
--- a/package/rrdtool/rrdtool.mk
+++ b/package/rrdtool/rrdtool.mk
@@ -4,31 +4,33 @@
 #
 ################################################################################
 
-RRDTOOL_VERSION = 1.2.30
+RRDTOOL_VERSION = 1.5.5
 RRDTOOL_SITE = http://oss.oetiker.ch/rrdtool/pub
 RRDTOOL_LICENSE = GPLv2+ with FLOSS license exceptions as explained in COPYRIGHT
-RRDTOOL_LICENSE_FILES = COPYING COPYRIGHT
-
-RRDTOOL_DEPENDENCIES = host-pkgconf freetype libart libpng zlib
-RRDTOOL_AUTORECONF = YES
+RRDTOOL_LICENSE_FILES = COPYRIGHT LICENSE
+RRDTOOL_DEPENDENCIES = host-pkgconf libglib2
 RRDTOOL_INSTALL_STAGING = YES
-RRDTOOL_CONF_ENV = \
-	rd_cv_ieee_works=yes \
-	rd_cv_null_realloc=nope \
-	ac_cv_func_mmap_fixed_mapped=yes
 RRDTOOL_CONF_OPTS = \
+	--disable-examples \
+	--disable-libdbi \
+	--disable-librados \
+	--disable-libwrap \
+	--disable-lua \
 	--disable-perl \
 	--disable-python \
 	--disable-ruby \
-	--disable-tcl \
-	--program-transform-name='' \
-	$(if $(BR2_TOOLCHAIN_HAS_THREADS),,--disable-pthread)
-RRDTOOL_MAKE = $(MAKE1)
+	--disable-tcl
 
-define RRDTOOL_REMOVE_EXAMPLES
-	rm -rf $(TARGET_DIR)/usr/share/rrdtool/examples
-endef
+ifeq ($(BR2_PACKAGE_RRDTOOL_RRDGRAPH),y)
+RRDTOOL_DEPENDENCIES += cairo pango
+else
+RRDTOOL_CONF_OPTS += --disable-rrd_graph
+endif
 
-RRDTOOL_POST_INSTALL_TARGET_HOOKS += RRDTOOL_REMOVE_EXAMPLES
+ifeq ($(BR2_PACKAGE_LIBXML2),y)
+RRDTOOL_DEPENDENCIES += libxml2
+else
+RRDTOOL_CONF_OPTS += --disable-rrd_restore
+endif
 
 $(eval $(autotools-package))
-- 
2.4.10
