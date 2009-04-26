From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sun, 26 Apr 2009 21:40:32 +0000 (UTC)
Subject: [Buildroot] svn commit: [26214] trunk/buildroot/package:  libsoup
Message-ID: <20090426214032.AFDF377456@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-26 21:40:32 +0000 (Sun, 26 Apr 2009)
New Revision: 26214

Log:
package: add libsoup package

Based on patch by Sven Neumann <s.neumann@phase-zero.de>, closes #35.

Added:
   trunk/buildroot/package/libsoup/
   trunk/buildroot/package/libsoup/Config.in
   trunk/buildroot/package/libsoup/libsoup.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2009-04-26 21:17:33 UTC (rev 26213)
+++ trunk/buildroot/package/Config.in	2009-04-26 21:40:32 UTC (rev 26214)
@@ -155,6 +155,7 @@
 source "package/libeXosip2/Config.in"
 source "package/libosip2/Config.in"
 source "package/libpcap/Config.in"
+source "package/libsoup/Config.in"
 source "package/libupnp/Config.in"
 if !BR2_PACKAGE_BUSYBOX_HIDE_OTHERS
 source "package/lighttpd/Config.in"

Added: trunk/buildroot/package/libsoup/Config.in
===================================================================
--- trunk/buildroot/package/libsoup/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libsoup/Config.in	2009-04-26 21:40:32 UTC (rev 26214)
@@ -0,0 +1,10 @@
+config BR2_PACKAGE_LIBSOUP
+	bool "libsoup"
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_LIBGLIB2
+	help
+	  libsoup is an HTTP client/server library. It uses GObject
+	  and the GLib main loop, to integrate well with GNOME
+	  applications.
+
+	  http://live.gnome.org/LibSoup

Added: trunk/buildroot/package/libsoup/libsoup.mk
===================================================================
--- trunk/buildroot/package/libsoup/libsoup.mk	                        (rev 0)
+++ trunk/buildroot/package/libsoup/libsoup.mk	2009-04-26 21:40:32 UTC (rev 26214)
@@ -0,0 +1,30 @@
+#############################################################
+#
+# libsoup
+#
+#############################################################
+
+LIBSOUP_VERSION:=2.4.1
+LIBSOUP_SOURCE:=libsoup-$(LIBSOUP_VERSION).tar.gz
+LIBSOUP_SITE:=http://ftp.gnome.org/pub/gnome/sources/libsoup/2.4
+LIBSOUP_AUTORECONF = NO
+LIBSOUP_INSTALL_STAGING = YES
+LIBSOUP_INSTALL_TARGET = YES
+
+LIBSOUP_CONF_ENV = \
+		ac_cv_path_GLIB_GENMARSHAL=$(HOST_GLIB)/bin/glib-genmarshal
+
+ifneq ($(BR2_INET_IPV6),y)
+LIBSOUP_CONF_ENV += soup_cv_ipv6=no
+endif
+
+LIBSOUP_CONF_OPT = \
+	--enable-shared		\
+	--enable-static		\
+	--disable-explicit-deps \
+	--disable-glibtest	\
+	--disable-gtk-doc --without-html-dir
+
+LIBSOUP_DEPENDENCIES = uclibc gettext libintl host-pkgconfig host-libglib2 libglib2 libxml2
+
+$(eval $(call AUTOTARGETS,package,libsoup))
