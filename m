From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:28:49 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  webkit
Message-ID: <20080306182849.78A0A12029A@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:28:48 -0800 (Thu, 06 Mar 2008)
New Revision: 21237

Log:
added webkit

Added:
   trunk/buildroot/package/webkit/
   trunk/buildroot/package/webkit/Config.in
   trunk/buildroot/package/webkit/webkit-r30267-trunc.patch
   trunk/buildroot/package/webkit/webkit.mk


Changeset:
Added: trunk/buildroot/package/webkit/Config.in
===================================================================
--- trunk/buildroot/package/webkit/Config.in	                        (rev 0)
+++ trunk/buildroot/package/webkit/Config.in	2008-03-06 18:28:48 UTC (rev 21237)
@@ -0,0 +1,14 @@
+config BR2_PACKAGE_WEBKIT
+	bool "webkit"
+	select BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_ICU
+	select BR2_PACKAGE_CURL 
+	select BR2_PACKAGE_LIBXML2 
+	select BR2_PACKAGE_LIBXSLT 
+	select BR2_PACKAGE_SQLITE
+	default n
+	help
+		WebKit is an open source, standards compliant web browser engine. 
+
+		http://webkit.org/
+

Added: trunk/buildroot/package/webkit/webkit-r30267-trunc.patch
===================================================================
--- trunk/buildroot/package/webkit/webkit-r30267-trunc.patch	                        (rev 0)
+++ trunk/buildroot/package/webkit/webkit-r30267-trunc.patch	2008-03-06 18:28:48 UTC (rev 21237)
@@ -0,0 +1,11 @@
+--- a/JavaScriptCore/wtf/MathExtras.h	2008-02-04 21:09:08.000000000 -0500
++++ b/JavaScriptCore/wtf/MathExtras.h	2008-02-11 13:31:28.000000000 -0500
+@@ -75,6 +75,8 @@ inline bool signbit(double x) { return x
+ 
+ #endif
+ 
++inline double trunc(double num) { return num > 0 ? floor(num) : ceil(num); }
++
+ #if COMPILER(MSVC)
+ 
+ inline bool isinf(double num) { return !_finite(num) && !_isnan(num); }

Added: trunk/buildroot/package/webkit/webkit.mk
===================================================================
--- trunk/buildroot/package/webkit/webkit.mk	                        (rev 0)
+++ trunk/buildroot/package/webkit/webkit.mk	2008-03-06 18:28:48 UTC (rev 21237)
@@ -0,0 +1,19 @@
+#############################################################
+#
+# webkit
+#
+#############################################################
+WEBKIT_VERSION = r30574
+WEBKIT_SOURCE = WebKit-$(WEBKIT_VERSION).tar.bz2
+WEBKIT_SITE = http://nightly.webkit.org/files/trunk/src/
+
+WEBKIT_INSTALL_STAGING = YES
+WEBKIT_INSTALL_TARGET = YES
+WEBKIT_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) install 
+
+WEBKIT_AUTORECONF = YES
+WEBKIT_DEPENDENCIES = icu curl libxml2 libxslt xserver_xorg-server libgtk2 sqlite
+WEBKIT_MAKE_OPT = GLIB_GENMARSHAL=/usr/bin/glib-genmarshal GLIB_MKENUMS=/usr/bin/glib-mkenums
+
+$(eval $(call AUTOTARGETS,package,webkit))
+
