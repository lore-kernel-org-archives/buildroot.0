From: Carsten Schoenert <c.schoenert@gmail.com>
Date: Mon,  1 Jul 2013 21:20:01 +0200
Subject: [Buildroot] [PATCH v3] package/libsvg: new package
Message-ID: <1372706401-10935-1-git-send-email-c.schoenert@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Carsten Schoenert <c.schoenert@gmail.com>

Libsvg provides a library for parsing SVG content in files or buffers.
Libsvg does not do any rendering, but instead provides a function-based
interface that can be used by various rendering engines.

Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
---
Changes v3:
	- removing specific config option for selection of XML parser, the
	  XML parser can be changed by selecting BR2_PACKAGE_EXPAT from the
	  user manually, otherwise BR2_PACKAGE_LIBXML2 will be automatically
	  selected
	- setting selection for BR2_PACKAGE_LIBPNG and _LIBJPEG in Config.in

Changes v2:
	- reworking the whole patch after suggestions from Peter and Thomas
	- adding patch to preventing compiler errors while linking
	  against libexpat

 package/Config.in                                  |    1 +
 package/libsvg/Config.in                           |   12 +++++++
 .../libsvg-fix-expat-static-declaration.patch      |   33 ++++++++++++++++++++
 package/libsvg/libsvg.mk                           |   23 ++++++++++++++
 4 files changed, 69 insertions(+)
 create mode 100644 package/libsvg/Config.in
 create mode 100644 package/libsvg/libsvg-fix-expat-static-declaration.patch
 create mode 100644 package/libsvg/libsvg.mk

diff --git a/package/Config.in b/package/Config.in
index ebeabeb..7f5714d 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -461,6 +461,7 @@ source "package/libpng/Config.in"
 source "package/libqrencode/Config.in"
 source "package/libraw/Config.in"
 source "package/librsvg/Config.in"
+source "package/libsvg/Config.in"
 source "package/libsvgtiny/Config.in"
 source "package/libungif/Config.in"
 source "package/opencv/Config.in"
diff --git a/package/libsvg/Config.in b/package/libsvg/Config.in
new file mode 100644
index 0000000..e3a5e72
--- /dev/null
+++ b/package/libsvg/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LIBSVG
+	bool "libsvg"
+	select BR2_PACKAGE_LIBPNG
+	select BR2_PACKAGE_LIBJPEG
+	select BR2_PACKAGE_LIBXML2 if !BR2_PACKAGE_EXPAT
+	help
+	  Libsvg provides a parser for SVG content in files or buffers.
+	  Libsvg does not do any rendering, but instead provides a
+	  function-based interface that can be used by various rendering
+	  engines.
+
+	  http://cairographics.org/snapshots/
diff --git a/package/libsvg/libsvg-fix-expat-static-declaration.patch b/package/libsvg/libsvg-fix-expat-static-declaration.patch
new file mode 100644
index 0000000..58ef286
--- /dev/null
+++ b/package/libsvg/libsvg-fix-expat-static-declaration.patch
@@ -0,0 +1,33 @@
+Newer expat versions use different declarations of the following functions:
+
+static void _svg_parser_sax_start_element ();
+static void _svg_parser_sax_end_element ();
+static void _svg_parser_sax_characters ();
+
+We need to patch the libsvg source to not follow into a build error like
+   "static declaration of 'foo' follows non-static declaration"
+and use the functions from the expat library instead from the libsvg source.
+
+Patch based on
+http://oe-lite.org/redmine/projects/xorg/repository/revisions/c4df7951e846e1be718f37f2455696a1d0861f3d/entry/recipes/cairo/libsvg-0.1.4/gcc4_and_expat.patch
+
+Signed-off-by: Carsten Schoenert <c.schoenert@gmail.com>
+
+diff -bur libsvg-0.1.4~orig/src/svg_parser_expat.c libsvg-0.1.4/src/svg_parser_expat.c
+--- libsvg-0.1.4~orig/src/svg_parser_expat.c	2005-02-14 11:26:26.000000000 -0600
++++ libsvg-0.1.4/src/svg_parser_expat.c	2006-02-10 21:58:20.000000000 -0600
+@@ -30,6 +30,7 @@
+ #include "svgint.h"
+ #include "svg_hash.h"
+ 
++#ifndef LIBSVG_EXPAT
+ static void
+ _svg_parser_sax_start_element (void		*closure,
+ 			       const XML_Char	*name,
+@@ -43,6 +44,7 @@
+ _svg_parser_sax_characters (void		*closure,
+ 			    const XML_Char	*ch,
+ 			    int			len);
++#endif
+ 
+ static void
diff --git a/package/libsvg/libsvg.mk b/package/libsvg/libsvg.mk
new file mode 100644
index 0000000..de480ab
--- /dev/null
+++ b/package/libsvg/libsvg.mk
@@ -0,0 +1,23 @@
+################################################################################
+#
+# libsvg
+#
+################################################################################
+
+LIBSVG_VERSION         = 0.1.4
+LIBSVG_SITE            = http://cairographics.org/snapshots/
+LIBSVG_DEPENDENCIES    = host-pkgconf libpng libjpeg
+LIBSVG_INSTALL_STAGING = YES
+LIBSVG_LICENSE         = LGPLv2+
+LIBSVG_LICENSE_FILES   = COPYING
+
+# libsvg needs at last a XML parser
+ifeq ($(BR2_PACKAGE_EXPAT),y)
+LIBSVG_CONF_OPT += --with-expat
+LIBSVG_DEPENDENCIES += expat
+else ifeq ($(BR2_PACKAGE_LIBXML2),y)
+LIBSVG_CONF_OPT += --with-libxml2
+LIBSVG_DEPENDENCIES += libxml2
+endif
+
+$(eval $(autotools-package))
-- 
1.7.10.4
