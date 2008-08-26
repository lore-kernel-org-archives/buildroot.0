From: laird at uclibc.org <laird@uclibc.org>
Date: Tue, 26 Aug 2008 07:52:17 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  lite
Message-ID: <20080826145217.E39523C864@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: laird
Date: 2008-08-26 07:52:17 -0700 (Tue, 26 Aug 2008)
New Revision: 23208

Log:
Adds support for building LiTE - see DirectFB.org
Will close bug 0003974

Daniel Laird



Added:
   trunk/buildroot/package/lite/
   trunk/buildroot/package/lite/Config.in
   trunk/buildroot/package/lite/lite.mk
   trunk/buildroot/package/lite/no_tests.patch

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-08-26 14:01:37 UTC (rev 23207)
+++ trunk/buildroot/package/Config.in	2008-08-26 14:52:17 UTC (rev 23208)
@@ -329,6 +329,7 @@
 source "package/libart/Config.in"
 source "package/libpng/Config.in"
 source "package/libungif/Config.in"
+source "package/lite/Config.in"
 source "package/sdl/Config.in"
 source "package/sdl_image/Config.in"
 source "package/sdl_mixer/Config.in"

Added: trunk/buildroot/package/lite/Config.in
===================================================================
--- trunk/buildroot/package/lite/Config.in	                        (rev 0)
+++ trunk/buildroot/package/lite/Config.in	2008-08-26 14:52:17 UTC (rev 23208)
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_LITE
+	bool "LiTE (toolbox engine)"
+	depends on BR2_PACKAGE_DIRECTFB
+	help
+	   LiTE stands for LiTE is a Toolbox Engine. 
+	   Its role is to facilitate the functions of DirectFB so that a
+	   toolbox could be written on top of DirectFB with less effort.
+	   As such LiTE has abstractions for the underlying graphics and
+	   event systems.
+
+	   See http://www.directfb.org/wiki/index.php/LiTE:Architecture
+

Added: trunk/buildroot/package/lite/lite.mk
===================================================================
--- trunk/buildroot/package/lite/lite.mk	                        (rev 0)
+++ trunk/buildroot/package/lite/lite.mk	2008-08-26 14:52:17 UTC (rev 23208)
@@ -0,0 +1,25 @@
+#############################################################
+#
+# LiTE
+#
+#############################################################
+LITE_VERSION:=0.8.9
+LITE_SOURCE:=LiTE-$(LITE_VERSION).tar.gz
+LITE_SITE:=http://www.directfb.org/downloads/Libs
+LITE_AUTORECONF = NO
+LITE_INSTALL_STAGING = YES
+LITE_INSTALL_TARGET = YES
+LITE_INSTALL_STAGING_OPT = DESTDIR=$(STAGING_DIR) LDFLAGS=-L$(STAGING_DIR)/usr/lib install
+LITE_CONF_ENV = DFB_CFLAGS=-I$(STAGING_DIR)/usr/include/directfb
+LITE_CONF_OPT =
+LITE_DEPENDENCIES = directfb
+
+$(eval $(call AUTOTARGETS,package,lite))
+
+$(LITE_HOOK_POST_INSTALL):
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/LiTE/examples/
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/truetype
+	$(INSTALL) -m0644 $(LITE_DIR)/data/*.png $(TARGET_DIR)/usr/share/LiTE/
+	$(INSTALL) -m0644 $(LITE_DIR)/examples/*.png $(TARGET_DIR)/usr/share/LiTE/examples/
+	$(INSTALL) -m0644 $(LITE_DIR)/fonts/*.ttf $(TARGET_DIR)/usr/share/fonts/truetype/ 
+	touch $@
\ No newline at end of file

Added: trunk/buildroot/package/lite/no_tests.patch
===================================================================
--- trunk/buildroot/package/lite/no_tests.patch	                        (rev 0)
+++ trunk/buildroot/package/lite/no_tests.patch	2008-08-26 14:52:17 UTC (rev 23208)
@@ -0,0 +1,14 @@
+--- package/lite/no-examples-no-tests.patch	(revision 0)
++++ package/lite/no-examples-no-tests.patch	(revision 0)
+@@ -0,0 +1,11 @@
+--- Makefile.in.orig	2008-07-07 13:07:12.000000000 +0200
++++ Makefile.in	2008-07-07 13:07:05.000000000 +0200
+@@ -202,7 +202,7 @@
+ target_vendor = @target_vendor@
+ top_builddir = @top_builddir@
+ top_srcdir = @top_srcdir@
+-SUBDIRS = data fonts lite leck examples tests
++SUBDIRS = data fonts lite leck examples
+ EXTRA_DIST = TODO lite.pc.in leck.pc.in
+ pkgconfigdir = $(libdir)/pkgconfig
+ pkgconfig_DATA = lite.pc leck.pc
