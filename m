From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  8 Dec 2008 09:48:31 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia:
	gstreamer
Message-ID: <20081208174831.928DF3C814@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-08 09:48:31 -0800 (Mon, 08 Dec 2008)
New Revision: 24328

Log:
gstreamer: add new multimedia package gstreamer

gstreamer is powerful framework for streaming media.



Added:
   trunk/buildroot/package/multimedia/gstreamer/
   trunk/buildroot/package/multimedia/gstreamer/Config.in
   trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
   trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:45:59 UTC (rev 24327)
+++ trunk/buildroot/package/multimedia/Config.in	2008-12-08 17:48:31 UTC (rev 24328)
@@ -3,6 +3,7 @@
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"

Added: trunk/buildroot/package/multimedia/gstreamer/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gstreamer/Config.in	2008-12-08 17:48:31 UTC (rev 24328)
@@ -0,0 +1,9 @@
+config BR2_PACKAGE_GSTREAMER
+	bool "gstreamer"
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_LIBXML2
+	select BR2_PACKAGE_PKGCONFIG
+	help
+	  GStreamer is an open source multimedia framework.
+
+	  http://gstreamer.freedesktop.org/

Added: trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch	2008-12-08 17:48:31 UTC (rev 24328)
@@ -0,0 +1,43 @@
+Submitted By: Ken Moffat <ken@linuxfromscratch dot org>
+Date: 2008-10-15
+Initial Package Version: 0.10.21
+Upstream Status: Not yet known, just raised as gnome bug 556348.
+Origin: Self
+Description: Allows 'make install' to succeed if gtkdoc-rebase is not present.
+
+diff -Naur gstreamer-0.10.21.orig/common/gtk-doc.mak gstreamer-0.10.21/common/gtk-doc.mak
+--- gstreamer-0.10.21.orig/common/gtk-doc.mak	2008-09-10 10:13:16.000000000 +0100
++++ gstreamer-0.10.21/common/gtk-doc.mak	2008-10-15 18:12:18.000000000 +0100
+@@ -201,7 +201,7 @@
+ 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
+ 	  fi; \
+ 	  which gtkdoc-rebase >/dev/null && \
+-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
++	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
+ 	fi) 
+ uninstall-local:
+ 	(installfiles=`echo ./html/*.html`; \
+diff -Naur gstreamer-0.10.21.orig/docs/gst/Makefile.in gstreamer-0.10.21/docs/gst/Makefile.in
+--- gstreamer-0.10.21.orig/docs/gst/Makefile.in	2008-10-02 22:54:18.000000000 +0100
++++ gstreamer-0.10.21/docs/gst/Makefile.in	2008-10-15 18:12:45.000000000 +0100
+@@ -809,7 +809,7 @@
+ 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
+ 	  fi; \
+ 	  which gtkdoc-rebase >/dev/null && \
+-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
++	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
+ 	fi) 
+ uninstall-local:
+ 	(installfiles=`echo ./html/*.html`; \
+diff -Naur gstreamer-0.10.21.orig/docs/libs/Makefile.in gstreamer-0.10.21/docs/libs/Makefile.in
+--- gstreamer-0.10.21.orig/docs/libs/Makefile.in	2008-10-02 22:54:18.000000000 +0100
++++ gstreamer-0.10.21/docs/libs/Makefile.in	2008-10-15 18:12:18.000000000 +0100
+@@ -811,7 +811,7 @@
+ 	           $(DESTDIR)$(TARGET_DIR)/$(DOC_MODULE)- at GST_MAJORMINOR@.devhelp2; \
+ 	  fi; \
+ 	  which gtkdoc-rebase >/dev/null && \
+-	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) ; \
++	    gtkdoc-rebase --relative --dest-dir=$(DESTDIR) --html-dir=$(DESTDIR)$(TARGET_DIR) || true ; \
+ 	fi) 
+ uninstall-local:
+ 	(installfiles=`echo ./html/*.html`; \

Added: trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk
===================================================================
--- trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/gstreamer/gstreamer.mk	2008-12-08 17:48:31 UTC (rev 24328)
@@ -0,0 +1,33 @@
+#############################################################
+#
+# gstreamer
+#
+#############################################################
+GSTREAMER_VERSION = 0.10.21
+GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
+GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
+GSTREAMER_INSTALL_STAGING = YES
+
+# Checking if unaligned memory access works correctly cannot be done when cross
+# compiling. For the following architectures there is no information available
+# in the configure script.
+ifeq ($(BR2_avr32),y)
+GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_nios2),y)
+GSTREAMER_CONF_ENV = as_cv_unaligned_access=no
+endif
+ifeq ($(BR2_s390),y)
+GSTREAMER_CONF_ENV = as_cv_unaligned_access=yes
+endif
+
+GSTREAMER_CONF_OPT = \
+		$(DISABLE_NLS) \
+		$(DISABLE_LARGEFILE) \
+		--disable-examples \
+		--disable-tests \
+		--disable-failing-tests
+
+GSTREAMER_DEPENDENCIES = libglib2 libxml2 pkgconfig
+
+$(eval $(call AUTOTARGETS,package/multimedia,gstreamer))
