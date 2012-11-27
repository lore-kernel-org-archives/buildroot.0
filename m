From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Tue, 27 Nov 2012 11:21:06 -0800
Subject: [Buildroot] [git commit branch/next] package: add gd package
Message-ID: <20121128011244.B677B8F461@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=d0a13821d7f6ceb34061014b9899eb81c3988ccf
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in              |    1 +
 package/gd/Config.in           |   62 ++++++++++++++++++++++++++++
 package/gd/gd-fontconfig.patch |   28 +++++++++++++
 package/gd/gd-maxcolors.patch  |   20 +++++++++
 package/gd/gd-no-zlib.patch    |   51 +++++++++++++++++++++++
 package/gd/gd.mk               |   87 ++++++++++++++++++++++++++++++++++++++++
 6 files changed, 249 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index 5d9783a..d566a39 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -376,6 +376,7 @@ source "package/cairo/Config.in"
 source "package/fltk/Config.in"
 source "package/fontconfig/Config.in"
 source "package/freetype/Config.in"
+source "package/gd/Config.in"
 source "package/giblib/Config.in"
 source "package/gtk2-engines/Config.in"
 source "package/gtk2-themes/Config.in"
diff --git a/package/gd/Config.in b/package/gd/Config.in
new file mode 100644
index 0000000..efac21d
--- /dev/null
+++ b/package/gd/Config.in
@@ -0,0 +1,62 @@
+config BR2_PACKAGE_GD
+	bool "gd"
+	help
+	  GD is a graphics library. It allows your code to quickly
+	  draw images complete with lines, arcs, text, multiple
+	  colours, cut and paste from other images, flood fills, and
+	  write out the result as a PNG file. This is particularly
+	  useful in World Wide Web applications, where PNG is one of
+	  the formats accepted for inline images by most browsers.
+
+	  http://www.boutell.com/gd/
+
+if BR2_PACKAGE_GD
+
+menu "gd tools"
+
+config BR2_PACKAGE_GD_ANNOTATE
+       bool "annotate"
+
+config BR2_PACKAGE_GD_BDFTOGD
+       bool "bdftogd"
+       depends on BR2_PACKAGE_PERL
+
+config BR2_PACKAGE_GD_GD2COPYPAL
+       bool "gd2copypal"
+
+config BR2_PACKAGE_GD_GD2TOGIF
+       bool "gd2togif"
+
+config BR2_PACKAGE_GD_GD2TOPNG
+       bool "gd2topng"
+       select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GD_GDCMPGIF
+       bool "gdcmpgif"
+
+config BR2_PACKAGE_GD_GDPARTTOPNG
+       bool "gdparttopng"
+       select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GD_GDTOPNG
+       bool "gdtopng"
+       select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GD_GIFTOGD2
+       bool "giftogd2"
+
+config BR2_PACKAGE_GD_PNGTOGD
+       bool "pngtogd"
+       select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GD_PNGTOGD2
+       bool "pngtogd2"
+       select BR2_PACKAGE_LIBPNG
+
+config BR2_PACKAGE_GD_WEBPNG
+       bool "webpng"
+       select BR2_PACKAGE_LIBPNG
+
+endmenu
+
+endif
diff --git a/package/gd/gd-fontconfig.patch b/package/gd/gd-fontconfig.patch
new file mode 100644
index 0000000..651fbec
--- /dev/null
+++ b/package/gd/gd-fontconfig.patch
@@ -0,0 +1,28 @@
+Patch from Gentoo:
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/gd/files/gd-2.0.35-fontconfig.patch?view=log
+
+fix from upstream
+
+http://bugs.gentoo.org/363367
+
+# HG changeset patch
+# User tabe
+# Date 1239812355 0
+# Node ID 3ea283efcdafcb2acc1dd0ace1d3d48da6d8cec8
+# Parent  4f29a877875f63cee5a64e7bea406a61882a565e
+fixed FS#199
+
+199, Fixed useFontConfig() to work as documented (Ethan Merritt)
+ 
+diff -r 4f29a877875f -r 3ea283efcdaf gdft.c
+--- a/gdft.c	Sat Apr 04 12:00:37 2009 +0000
++++ b/gdft.c	Wed Apr 15 16:19:15 2009 +0000
+@@ -1659,7 +1659,7 @@
+ BGD_DECLARE(int) gdFTUseFontConfig(int flag)
+ {
+ #ifdef HAVE_LIBFONTCONFIG
+-	fontConfigFlag = 1;
++	fontConfigFlag = flag;
+ 	return 1;
+ #else
+ 	return 0;
diff --git a/package/gd/gd-maxcolors.patch b/package/gd/gd-maxcolors.patch
new file mode 100644
index 0000000..161cf19
--- /dev/null
+++ b/package/gd/gd-maxcolors.patch
@@ -0,0 +1,20 @@
+Patch from Gentoo:
+http://sources.gentoo.org/cgi-bin/viewvc.cgi/gentoo-x86/media-libs/gd/files/gd-2.0.35-maxcolors.patch?view=log
+
+http://bugs.gentoo.org/292130
+
+fix in usptream repo already
+
+--- gd-2.0.35/gd_gd.c
++++ gd-2.0.35/gd_gd.c
+@@ -44,6 +44,10 @@
+ 	    {
+ 	      goto fail1;
+ 	    }
++	  if (im->colorsTotal > gdMaxColors)
++	    {
++		   goto fail1;
++		 }
+ 	}
+       /* Int to accommodate truecolor single-color transparency */
+       if (!gdGetInt (&im->transparent, in))
diff --git a/package/gd/gd-no-zlib.patch b/package/gd/gd-no-zlib.patch
new file mode 100644
index 0000000..cb265b2
--- /dev/null
+++ b/package/gd/gd-no-zlib.patch
@@ -0,0 +1,51 @@
+[PATCH] gd_gd2: provide dummy implementations for all public symbols when !zlib
+
+gd_gd2.c only provides dummy implementations for some of it's public symbols
+when zlib isn't found, causing build failures in several of the tools.
+
+Fix it by providing dummy implementations for all of them.
+
+Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
+---
+ gd_gd2.c |   30 ++++++++++++++++++++++++++++++
+ 1 file changed, 30 insertions(+)
+
+Index: gd-2.0.35/gd_gd2.c
+===================================================================
+--- gd-2.0.35.orig/gd_gd2.c
++++ gd-2.0.35/gd_gd2.c
+@@ -1068,4 +1068,34 @@
+   fprintf (stderr, "GD2 support is not available - no libz\n");
+   return NULL;
+ }
++
++BGD_DECLARE(gdImagePtr) gdImageCreateFromGd2Part (FILE * inFile, int srcx, int srcy, int w, int h)
++{
++  fprintf (stderr, "GD2 support is not available - no libz\n");
++  return NULL;
++}
++
++BGD_DECLARE(gdImagePtr) gdImageCreateFromGd2PartPtr (int size, void *data, int srcx, int srcy, int w,
++			     int h)
++{
++  fprintf (stderr, "GD2 support is not available - no libz\n");
++  return NULL;
++}
++
++BGD_DECLARE(gdImagePtr) gdImageCreateFromGd2PartCtx (gdIOCtx * in, int srcx, int srcy, int w, int h)
++{
++  fprintf (stderr, "GD2 support is not available - no libz\n");
++  return NULL;
++}
++
++BGD_DECLARE(void) gdImageGd2 (gdImagePtr im, FILE * outFile, int cs, int fmt)
++{
++  fprintf (stderr, "GD2 support is not available - no libz\n");
++}
++
++BGD_DECLARE(void *) gdImageGd2Ptr (gdImagePtr im, int cs, int fmt, int *size)
++{
++  fprintf (stderr, "GD2 support is not available - no libz\n");
++  return NULL;
++}
+ #endif /* HAVE_LIBZ */
diff --git a/package/gd/gd.mk b/package/gd/gd.mk
new file mode 100644
index 0000000..4769764
--- /dev/null
+++ b/package/gd/gd.mk
@@ -0,0 +1,87 @@
+################################################################################
+#
+# gd
+#
+################################################################################
+
+GD_VERSION = 2.0.35
+GD_SOURCE = gd-$(GD_VERSION).tar.bz2
+GD_SITE = http://distfiles.gentoo.org/distfiles
+# needed because of configure.ac timestamp
+GD_AUTORECONF = YES
+GD_INSTALL_STAGING = YES
+GD_LICENSE = GD license
+GD_LICENSE_FILES = COPYING
+
+GD_CONF_OPT = --without-x --disable-rpath
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+GD_DEPENDENCIES += fontconfig
+GD_CONF_OPT += --with-fontconfig
+GD_CONF_ENV += ac_cv_path_FREETYPE_CONFIG=$(STAGING_DIR)/usr/bin/freetype-config
+endif
+
+ifeq ($(BR2_PACKAGE_JPEG),y)
+GD_DEPENDENCIES += jpeg
+GD_CONF_OPT += --with-jpeg
+endif
+
+ifeq ($(BR2_PACKAGE_LIBPNG),y)
+GD_DEPENDENCIES += libpng
+GD_CONF_OPT += --with-png
+endif
+
+ifeq ($(BR2_PACKAGE_XLIB_LIBXPM),y)
+GD_DEPENDENCIES += xlib_libXpm
+GD_CONF_OPT += --with-xpm
+endif
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+GD_DEPENDENCIES += zlib
+endif
+
+ifeq ($(BR2_PACKAGE_GETTEXT),y)
+GD_DEPENDENCIES += gettext
+else
+# configure.ac has newer timestamp than aclocal.m4 / configure, so we need
+# to autoreconf to regenerate them (or set configure.ac timestamp to older
+# than them) to make the Makefile happy.
+# configure.ac refers to AM_ICONV which we only have if gettext is enabled,
+# so add a dummy definition elsewise
+define GD_FIXUP_ICONV
+	echo 'm4_ifndef([AM_ICONV],[m4_define([AM_ICONV],[:])])' \
+		>> $(@D)/acinclude.m4
+endef
+
+GD_PRE_CONFIGURE_HOOKS += GD_FIXUP_ICONV
+endif
+
+define GD_FIXUP_GDLIB_CONFIG
+	$(SED) 's%prefix=/usr%prefix=$(STAGING_DIR)/usr%' \
+	    -e 's%exec_prefix=/usr%exec_prefix=$(STAGING_DIR)/usr%' \
+		$(STAGING_DIR)/usr/bin/gdlib-config
+endef
+
+GD_POST_INSTALL_STAGING_HOOKS += GD_FIXUP_GDLIB_CONFIG
+
+GD_TOOLS_                         	+= gdlib-config
+GD_TOOLS_$(BR2_PACKAGE_GD_ANNOTATE)	+= annotate
+GD_TOOLS_$(BR2_PACKAGE_GD_BDFTOGD)	+= bdftogd
+GD_TOOLS_$(BR2_PACKAGE_GD_GD2COPYPAL)	+= gd2copypal
+GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOGIF)	+= gd2togif
+GD_TOOLS_$(BR2_PACKAGE_GD_GD2TOPNG)	+= gd2topng
+GD_TOOLS_$(BR2_PACKAGE_GD_GDCMPGIF)	+= gdcmpgif
+GD_TOOLS_$(BR2_PACKAGE_GD_GDPARTTOPNG)	+= gdparttopng
+GD_TOOLS_$(BR2_PACKAGE_GD_GDTOPNG)	+= gdtopng
+GD_TOOLS_$(BR2_PACKAGE_GD_GIFTOGD2)	+= giftogd2
+GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD)	+= pngtogd
+GD_TOOLS_$(BR2_PACKAGE_GD_PNGTOGD2)	+= pngtogd2
+GD_TOOLS_$(BR2_PACKAGE_GD_WEBPNG)	+= webpng
+
+define GD_REMOVE_TOOLS
+	rm -f $(addprefix $(TARGET_DIR)/usr/bin/,$(GD_TOOLS_))
+endef
+
+GD_POST_INSTALL_TARGET_HOOKS += GD_REMOVE_TOOLS
+
+$(eval $(autotools-package))
