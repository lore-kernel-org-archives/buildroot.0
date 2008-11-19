From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:50:50 +0100
Subject: [Buildroot] [PATCH 3/7] package/multimedia: add gstreamer package
In-Reply-To: <200811190244.44817.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
Message-ID: <200811190250.50913.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

GStreamer is an open source multimedia framework.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/multimedia/Config.in                       |    1 +
 package/multimedia/gstreamer/Config.in             |    9 ++++
 ...streamer-0.10.21-build_fix_missing_gtkdoc.patch |   43 ++++++++++++++++++++
 package/multimedia/gstreamer/gstreamer.mk          |   35 ++++++++++++++++
 4 files changed, 88 insertions(+), 0 deletions(-)
 create mode 100644 package/multimedia/gstreamer/Config.in
 create mode 100644 package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
 create mode 100644 package/multimedia/gstreamer/gstreamer.mk

diff --git a/package/multimedia/Config.in b/package/multimedia/Config.in
index 4c74f7e..36676e5 100644
--- a/package/multimedia/Config.in
+++ b/package/multimedia/Config.in
@@ -3,6 +3,7 @@ source "package/multimedia/alsa-lib/Config.in"
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/libid3tag/Config.in"
 source "package/multimedia/libmad/Config.in"
 source "package/multimedia/libogg/Config.in"
diff --git a/package/multimedia/gstreamer/Config.in b/package/multimedia/gstreamer/Config.in
new file mode 100644
index 0000000..37e1427
--- /dev/null
+++ b/package/multimedia/gstreamer/Config.in
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
diff --git a/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch b/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
new file mode 100644
index 0000000..246b3db
--- /dev/null
+++ b/package/multimedia/gstreamer/gstreamer-0.10.21-build_fix_missing_gtkdoc.patch
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
diff --git a/package/multimedia/gstreamer/gstreamer.mk b/package/multimedia/gstreamer/gstreamer.mk
new file mode 100644
index 0000000..903264a
--- /dev/null
+++ b/package/multimedia/gstreamer/gstreamer.mk
@@ -0,0 +1,35 @@
+#############################################################
+#
+# gstreamer
+#
+#############################################################
+GSTREAMER_VERSION = 0.10.21
+GSTREAMER_SOURCE = gstreamer-$(GSTREAMER_VERSION).tar.bz2
+GSTREAMER_SITE = http://gstreamer.freedesktop.org/src/gstreamer
+GSTREAMER_AUTORECONF = NO
+GSTREAMER_INSTALL_STAGING = YES
+GSTREAMER_INSTALL_TARGET = YES
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
+GSTREAMER_DEPENDENCIES = uclibc libglib2 libxml2 pkgconfig
+
+$(eval $(call AUTOTARGETS,package/multimedia,gstreamer))
-- 
1.6.0.4.762.g0567f
