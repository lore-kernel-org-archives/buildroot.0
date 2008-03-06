From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:18:36 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  midori
Message-ID: <20080306181836.1730212024A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:18:35 -0800 (Thu, 06 Mar 2008)
New Revision: 21213

Log:
added midori browser

Added:
   trunk/buildroot/package/midori/
   trunk/buildroot/package/midori/Config.in
   trunk/buildroot/package/midori/midori-0.0.17-webkit.patch
   trunk/buildroot/package/midori/midori.mk


Changeset:
Added: trunk/buildroot/package/midori/Config.in
===================================================================
--- trunk/buildroot/package/midori/Config.in	                        (rev 0)
+++ trunk/buildroot/package/midori/Config.in	2008-03-06 18:18:35 UTC (rev 21213)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_MIDORI
+	bool "midori"
+	select BR2_PACKAGE_WEBKIT
+	select BR2_PACKAGE_LIBSEXY
+	default n
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	help
+	  Midori is a lightweight web browser based on WebKit
+
+	  http://software.twotoasts.de/?page=midori
+
+comment "midori		- disabled (requires Xorg(7))"
+	depends !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)

Added: trunk/buildroot/package/midori/midori-0.0.17-webkit.patch
===================================================================
--- trunk/buildroot/package/midori/midori-0.0.17-webkit.patch	                        (rev 0)
+++ trunk/buildroot/package/midori/midori-0.0.17-webkit.patch	2008-03-06 18:18:35 UTC (rev 21213)
@@ -0,0 +1,67 @@
+diff -rup midori-0.0.17-orig/configure.in midori-0.0.17/configure.in
+--- midori-0.0.17-orig/configure.in	2008-01-23 21:47:18.000000000 -0500
++++ midori-0.0.17/configure.in	2008-02-11 14:11:08.000000000 -0500
+@@ -53,13 +53,13 @@ GTK_VER=`pkg-config --modversion gtk+-2.
+ AC_DEFINE_UNQUOTED([GTK_VER], "$GTK_VER", [GTK+ version])
+ 
+ # Checks for WebKitGtk
+-PKG_CHECK_MODULES(WEBKIT, WebKitGtk, have_webkit=true, have_webkit=false)
++PKG_CHECK_MODULES(WEBKIT, webkit-1.0, have_webkit=true, have_webkit=false)
+ if test "x${have_webkit}" = "xfalse" ; then
+     AC_MSG_ERROR([No WebKitGtk package information found])
+ fi
+ AC_SUBST(WEBKIT_CFLAGS)
+ AC_SUBST(WEBKIT_LIBS)
+-WEBKIT_VER=`pkg-config --modversion WebKitGtk`
++WEBKIT_VER=`pkg-config --modversion webkit-1.0`
+ AC_DEFINE_UNQUOTED([WEBKIT_VER], "$WEBKITGTK_VER", [WebKitGtk version])
+ 
+ # Checks for libsexy
+diff -rup midori-0.0.17-orig/src/global.h midori-0.0.17/src/global.h
+--- midori-0.0.17-orig/src/global.h	2008-01-22 21:13:40.000000000 -0500
++++ midori-0.0.17/src/global.h	2008-02-11 14:01:54.000000000 -0500
+@@ -16,7 +16,7 @@
+ #include "../katze/katze.h"
+ 
+ #include <gtk/gtk.h>
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ // -- globals
+ 
+diff -rup midori-0.0.17-orig/src/helpers.c midori-0.0.17/src/helpers.c
+--- midori-0.0.17-orig/src/helpers.c	2008-01-20 11:46:16.000000000 -0500
++++ midori-0.0.17/src/helpers.c	2008-02-11 14:03:57.000000000 -0500
+@@ -16,7 +16,7 @@
+ #include "../katze/katze.h"
+ 
+ #include <string.h>
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ GtkIconTheme* get_icon_theme(GtkWidget* widget)
+ {
+diff -rup midori-0.0.17-orig/src/webSearch.h midori-0.0.17/src/webSearch.h
+--- midori-0.0.17-orig/src/webSearch.h	2007-12-14 22:09:47.000000000 -0500
++++ midori-0.0.17/src/webSearch.h	2008-02-11 14:03:25.000000000 -0500
+@@ -16,7 +16,7 @@
+ 
+ #include <gtk/gtk.h>
+ #include <libsexy/sexy.h>
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ // -- Types
+ 
+diff -rup midori-0.0.17-orig/src/webView.h midori-0.0.17/src/webView.h
+--- midori-0.0.17-orig/src/webView.h	2008-01-04 02:46:44.000000000 -0500
++++ midori-0.0.17/src/webView.h	2008-02-11 14:02:49.000000000 -0500
+@@ -16,7 +16,7 @@
+ #include "browser.h"
+ #include "debug.h"
+ 
+-#include <webkit.h>
++#include <webkit/webkit.h>
+ 
+ WebKitNavigationResponse
+ on_webView_navigation_requested(GtkWidget* webView, WebKitWebFrame* frame

Added: trunk/buildroot/package/midori/midori.mk
===================================================================
--- trunk/buildroot/package/midori/midori.mk	                        (rev 0)
+++ trunk/buildroot/package/midori/midori.mk	2008-03-06 18:18:35 UTC (rev 21213)
@@ -0,0 +1,21 @@
+#############################################################
+#
+# midori
+#
+#############################################################
+
+MIDORI_VERSION = 0.0.17
+MIDORI_SOURCE = midori-$(MIDORI_VERSION).tar.gz
+MIDORI_SITE = http://software.twotoasts.de/media/midori/
+MIDORI_AUTORECONF = YES
+MIDORI_INSTALL_STAGING = NO
+MIDORI_INSTALL_TARGET = YES
+
+MIDORI_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME)  --prefix=/usr --sysconfdir=/etc \
+		PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig 
+
+
+MIDORI_DEPENDENCIES = uclibc webkit libsexy $(XSERVER) 
+
+$(eval $(call AUTOTARGETS,package,midori))
