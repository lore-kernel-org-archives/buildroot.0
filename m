From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 27 Jul 2010 16:46:15 +0200
Subject: [Buildroot] [PATCH 06/16] midori: bump to 0.2.6
In-Reply-To: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
References: <cover.1280241791.git.thomas.petazzoni@free-electrons.com>
Message-ID: <1d4629a89f611d666e2e25f8efc384e317543a9e.1280241791.git.thomas.petazzoni@free-electrons.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/midori/Config.in                  |    2 +-
 package/midori/midori-0.0.18-webkit.patch |   67 -----------------------------
 package/midori/midori.mk                  |   27 +++++++++---
 3 files changed, 22 insertions(+), 74 deletions(-)
 delete mode 100644 package/midori/midori-0.0.18-webkit.patch

diff --git a/package/midori/Config.in b/package/midori/Config.in
index 80b7f77..f9117ea 100644
--- a/package/midori/Config.in
+++ b/package/midori/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_MIDORI
 	bool "midori"
 	select BR2_PACKAGE_WEBKIT
 	select BR2_PACKAGE_LIBSEXY
-	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_LIBGTK2
 	help
 	  Midori is a lightweight web browser based on WebKit
 
diff --git a/package/midori/midori-0.0.18-webkit.patch b/package/midori/midori-0.0.18-webkit.patch
deleted file mode 100644
index 6a5e5ff..0000000
--- a/package/midori/midori-0.0.18-webkit.patch
+++ /dev/null
@@ -1,67 +0,0 @@
-diff -rup midori-0.0.17-orig/configure.in midori-0.0.17/configure.in
---- midori-0.0.17-orig/configure.in	2008-01-23 21:47:18.000000000 -0500
-+++ midori-0.0.17/configure.in	2008-02-11 14:11:08.000000000 -0500
-@@ -53,13 +53,13 @@ GTK_VER=`pkg-config --modversion gtk+-2.
- AC_DEFINE_UNQUOTED([GTK_VER], "$GTK_VER", [GTK+ version])
- 
- # Checks for WebKitGtk
--PKG_CHECK_MODULES(WEBKIT, WebKitGtk, have_webkit=true, have_webkit=false)
-+PKG_CHECK_MODULES(WEBKIT, webkit-1.0, have_webkit=true, have_webkit=false)
- if test "x${have_webkit}" = "xfalse" ; then
-     AC_MSG_ERROR([No WebKitGtk package information found])
- fi
- AC_SUBST(WEBKIT_CFLAGS)
- AC_SUBST(WEBKIT_LIBS)
--WEBKIT_VER=`pkg-config --modversion WebKitGtk`
-+WEBKIT_VER=`pkg-config --modversion webkit-1.0`
- AC_DEFINE_UNQUOTED([WEBKIT_VER], "$WEBKITGTK_VER", [WebKitGtk version])
- 
- # Checks for libsexy
-diff -rup midori-0.0.17-orig/src/global.h midori-0.0.17/src/global.h
---- midori-0.0.17-orig/src/global.h	2008-01-22 21:13:40.000000000 -0500
-+++ midori-0.0.17/src/global.h	2008-02-11 14:01:54.000000000 -0500
-@@ -16,7 +16,7 @@
- #include "../katze/katze.h"
- 
- #include <gtk/gtk.h>
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- // -- globals
- 
-diff -rup midori-0.0.17-orig/src/helpers.c midori-0.0.17/src/helpers.c
---- midori-0.0.17-orig/src/helpers.c	2008-01-20 11:46:16.000000000 -0500
-+++ midori-0.0.17/src/helpers.c	2008-02-11 14:03:57.000000000 -0500
-@@ -16,7 +16,7 @@
- #include "../katze/katze.h"
- 
- #include <string.h>
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- GtkIconTheme* get_icon_theme(GtkWidget* widget)
- {
-diff -rup midori-0.0.17-orig/src/webSearch.h midori-0.0.17/src/webSearch.h
---- midori-0.0.17-orig/src/webSearch.h	2007-12-14 22:09:47.000000000 -0500
-+++ midori-0.0.17/src/webSearch.h	2008-02-11 14:03:25.000000000 -0500
-@@ -16,7 +16,7 @@
- 
- #include <gtk/gtk.h>
- #include <libsexy/sexy.h>
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- // -- Types
- 
-diff -rup midori-0.0.17-orig/src/webView.h midori-0.0.17/src/webView.h
---- midori-0.0.17-orig/src/webView.h	2008-01-04 02:46:44.000000000 -0500
-+++ midori-0.0.17/src/webView.h	2008-02-11 14:02:49.000000000 -0500
-@@ -16,7 +16,7 @@
- #include "browser.h"
- #include "debug.h"
- 
--#include <webkit.h>
-+#include <webkit/webkit.h>
- 
- WebKitNavigationResponse
- on_webView_navigation_requested(GtkWidget* webView, WebKitWebFrame* frame
diff --git a/package/midori/midori.mk b/package/midori/midori.mk
index 400b528..d83de7c 100644
--- a/package/midori/midori.mk
+++ b/package/midori/midori.mk
@@ -4,13 +4,28 @@
 #
 #############################################################
 
-MIDORI_VERSION = 0.0.18
-MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.gz
-MIDORI_SITE = http://software.twotoasts.de/media/midori/
-MIDORI_AUTORECONF = YES
+MIDORI_VERSION = 0.2.6
+MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.bz2
+MIDORI_SITE = http://archive.xfce.org/src/apps/midori/0.2/
 MIDORI_INSTALL_STAGING = NO
 MIDORI_INSTALL_TARGET = YES
 
-MIDORI_DEPENDENCIES = host-pkg-config webkit libsexy xserver_xorg-server
+MIDORI_DEPENDENCIES = host-pkg-config webkit libsexy host-intltool
 
-$(eval $(call AUTOTARGETS,package,midori))
+define MIDORI_CONFIGURE_CMDS
+       (cd $(@D); \
+               $(TARGET_CONFIGURE_OPTS)        \
+               ./waf configure                 \
+               --prefix=/usr                   \
+       )
+endef
+
+define MIDORI_BUILD_CMDS
+       (cd $(@D); ./waf build -j $(BR2_JLEVEL))
+endef
+
+define MIDORI_INSTALL_TARGET_CMDS
+       (cd $(@D); ./waf --destdir=$(TARGET_DIR) install)
+endef
+
+$(eval $(call GENTARGETS,package,midori))
-- 
1.7.0.4
