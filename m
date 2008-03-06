From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:26:43 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  sylpheed
Message-ID: <20080306182643.988A1120281@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:26:43 -0800 (Thu, 06 Mar 2008)
New Revision: 21231

Log:
added sylpheed

Added:
   trunk/buildroot/package/sylpheed/
   trunk/buildroot/package/sylpheed/Config.in
   trunk/buildroot/package/sylpheed/sylpheed-2.4.8-makefile.patch
   trunk/buildroot/package/sylpheed/sylpheed.mk


Changeset:
Added: trunk/buildroot/package/sylpheed/Config.in
===================================================================
--- trunk/buildroot/package/sylpheed/Config.in	                        (rev 0)
+++ trunk/buildroot/package/sylpheed/Config.in	2008-03-06 18:26:43 UTC (rev 21231)
@@ -0,0 +1,7 @@
+config BR2_PACKAGE_SYLPHEED
+	bool "sylpheed"
+	default n
+	help
+	  lightweight and user-friendly e-mail client.
+
+	  http://sylpheed.sraoss.jp/sylpheed/v2.4

Added: trunk/buildroot/package/sylpheed/sylpheed-2.4.8-makefile.patch
===================================================================
--- trunk/buildroot/package/sylpheed/sylpheed-2.4.8-makefile.patch	                        (rev 0)
+++ trunk/buildroot/package/sylpheed/sylpheed-2.4.8-makefile.patch	2008-03-06 18:26:43 UTC (rev 21231)
@@ -0,0 +1,23 @@
+--- a/libsylph/Makefile.in	2007-12-20 23:48:26.000000000 -0500
++++ b/libsylph/Makefile.in	2008-02-14 16:34:17.000000000 -0500
+@@ -143,7 +143,7 @@ manualdir = @manualdir@
+ AM_CPPFLAGS =  	-DG_LOG_DOMAIN=\"LibSylph\" 	-DSYSCONFDIR=\""$(sysconfdir)"\"
+ 
+ 
+-INCLUDES = $(GLIB_CFLAGS) -I$(top_srcdir) -I$(includedir)
++INCLUDES = $(GLIB_CFLAGS) -I$(top_srcdir) 
+ 
+ #lib_LTLIBRARIES = libsylph.la
+ noinst_LTLIBRARIES = libsylph.la
+
+--- a/src/Makefile.in	2007-12-20 23:48:26.000000000 -0500
++++ b/src/Makefile.in	2008-02-14 16:47:46.000000000 -0500
+@@ -153,7 +153,7 @@ BUILT_SOURCES =  	quote_fmt_lex.c 	quote
+ EXTRA_DIST =  	quote_fmt_parse.h 	sylpheed-marshal.list 	version.h.in 	sylpheed.rc.in
+ 
+ 
+-INCLUDES =  	-DG_LOG_DOMAIN=\"Sylpheed\" 	$(GTK_CFLAGS) 	$(GDK_PIXBUF_CFLAGS) 	$(GPGME_CFLAGS) 	-I$(includedir) 	-I$(top_srcdir)/libsylph
++INCLUDES =  	-DG_LOG_DOMAIN=\"Sylpheed\" 	$(GTK_CFLAGS) 	$(GDK_PIXBUF_CFLAGS) 	$(GPGME_CFLAGS) 	-I$(top_srcdir)/libsylph
+ 
+ @HAVE_WINDRES_TRUE at SYLPHEED_RES = sylpheed.res
+ @HAVE_WINDRES_FALSE at SYLPHEED_RES = 

Added: trunk/buildroot/package/sylpheed/sylpheed.mk
===================================================================
--- trunk/buildroot/package/sylpheed/sylpheed.mk	                        (rev 0)
+++ trunk/buildroot/package/sylpheed/sylpheed.mk	2008-03-06 18:26:43 UTC (rev 21231)
@@ -0,0 +1,20 @@
+#############################################################
+#
+# sylpheed
+#
+#############################################################
+SYLPHEED_VERSION = 2.4.8
+SYLPHEED_SOURCE = sylpheed-$(SYLPHEED_VERSION).tar.bz2
+SYLPHEED_SITE = http://sylpheed.sraoss.jp/sylpheed/v2.4
+SYLPHEED_AUTORECONF = NO
+SYLPHEED_INSTALL_STAGING = NO
+SYLPHEED_INSTALL_TARGET = YES
+SYLPHEED_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+SYLPHEED_CONF_ENV = PKG_CONFIG_PATH=$(STAGING_DIR)/usr/lib/pkgconfig
+SYLPHEED_CONF_OPT = --disable-gtkspell
+
+SYLPHEED_DEPENDENCIES = uclibc 
+
+$(eval $(call AUTOTARGETS,package,sylpheed))
+
