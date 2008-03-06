From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 10:09:12 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  fltk
Message-ID: <20080306180912.873901201EB@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 10:09:12 -0800 (Thu, 06 Mar 2008)
New Revision: 21191

Log:
added fltk

Added:
   trunk/buildroot/package/fltk/
   trunk/buildroot/package/fltk/Config.in
   trunk/buildroot/package/fltk/fltk-1.1.7-tests.patch
   trunk/buildroot/package/fltk/fltk.mk


Changeset:
Added: trunk/buildroot/package/fltk/Config.in
===================================================================
--- trunk/buildroot/package/fltk/Config.in	                        (rev 0)
+++ trunk/buildroot/package/fltk/Config.in	2008-03-06 18:09:12 UTC (rev 21191)
@@ -0,0 +1,11 @@
+config BR2_PACKAGE_FLTK
+	bool "fltk"
+	default n
+	depends on BR2_PACKAGE_XORG||BR2_PACKAGE_XORG7
+	help
+	  a cross-platform C++ GUI toolkit for UNIX/Linux (X11), Microsoft Windows, and MacOS X.
+
+	  http://www.fltk.org/
+
+comment "fltk		- disabled (requires Xorg(7))"
+	depends !(BR2_PACKAGE_XORG || BR2_PACKAGE_XORG7)

Added: trunk/buildroot/package/fltk/fltk-1.1.7-tests.patch
===================================================================
--- trunk/buildroot/package/fltk/fltk-1.1.7-tests.patch	                        (rev 0)
+++ trunk/buildroot/package/fltk/fltk-1.1.7-tests.patch	2008-03-06 18:09:12 UTC (rev 21191)
@@ -0,0 +1,11 @@
+--- a/test/Makefile	2006-01-15 13:36:16.000000000 -0500
++++ b/test/Makefile	2008-02-12 13:34:25.000000000 -0500
+@@ -230,7 +230,7 @@ uninstall-osx:
+ # FLUID file rules
+ .fl.cxx .fl.h:	../fluid/fluid$(EXEEXT)
+ 	echo Generating $<...
+-	../fluid/fluid$(EXEEXT) -c $<
++	/usr/bin/fluid$(EXEEXT) -c $<
+ 
+ # All demos depend on the FLTK library...
+ $(ALL): ../lib/$(LIBNAME)

Added: trunk/buildroot/package/fltk/fltk.mk
===================================================================
--- trunk/buildroot/package/fltk/fltk.mk	                        (rev 0)
+++ trunk/buildroot/package/fltk/fltk.mk	2008-03-06 18:09:12 UTC (rev 21191)
@@ -0,0 +1,21 @@
+#############################################################
+#
+# fltk
+#
+#############################################################
+
+FLTK_VERSION = 1.1.7
+FLTK_SOURCE = fltk-$(FLTK_VERSION)-source.tar.bz2
+FLTK_SITE = http://ftp.easysw.com/pub/fltk/1.1.7/
+FLTK_AUTORECONF = NO
+FLTK_INSTALL_STAGING = YES
+FLTK_INSTALL_TARGET = YES
+FLTK_INSTALL_TARGET_OPT = DESTDIR=$(TARGET_DIR) install
+
+FLTK_CONF_OPT = --target=$(GNU_TARGET_NAME) --host=$(GNU_TARGET_NAME) \
+		--build=$(GNU_HOST_NAME) --prefix=/usr \
+		--sysconfdir=/etc 
+
+FLTK_DEPENDENCIES = uclibc $(XSERVER) 
+
+$(eval $(call AUTOTARGETS,package,fltk))
\ No newline@end of file
