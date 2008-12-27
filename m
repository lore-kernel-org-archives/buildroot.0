From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Sat, 27 Dec 2008 14:36:29 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package:  libglade
Message-ID: <20081227143629.D18C876BD4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2008-12-27 14:36:29 +0000 (Sat, 27 Dec 2008)
New Revision: 24568

Log:
package: add libglade

Added:
   trunk/buildroot/package/libglade/
   trunk/buildroot/package/libglade/Config.in
   trunk/buildroot/package/libglade/libglade.mk

Modified:
   trunk/buildroot/package/Config.in


Changeset:
Modified: trunk/buildroot/package/Config.in
===================================================================
--- trunk/buildroot/package/Config.in	2008-12-27 14:36:22 UTC (rev 24567)
+++ trunk/buildroot/package/Config.in	2008-12-27 14:36:29 UTC (rev 24568)
@@ -347,6 +347,7 @@
 source "package/pango/Config.in"
 source "package/libdrm/Config.in"
 source "package/liberation/Config.in"
+source "package/libglade/Config.in"
 source "package/libglib12/Config.in"
 source "package/libglib2/Config.in"
 source "package/libgtk12/Config.in"

Added: trunk/buildroot/package/libglade/Config.in
===================================================================
--- trunk/buildroot/package/libglade/Config.in	                        (rev 0)
+++ trunk/buildroot/package/libglade/Config.in	2008-12-27 14:36:29 UTC (rev 24568)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_LIBGLADE
+	bool "libglade"
+	depends on BR2_PACKAGE_LIBGTK2
+	select BR2_PACKAGE_PKGCONFIG
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_ATK
+	select BR2_PACKAGE_LIBXML2
+	help
+	  Libglade allows you to load glade interface files in a program
+	  at runtime. It doesn't require GLADE to be used, but GLADE is
+	  by far the easiest way to create the interface files.
+
+	  http://ftp.gnome.org/pub/GNOME/sources/libglade/

Added: trunk/buildroot/package/libglade/libglade.mk
===================================================================
--- trunk/buildroot/package/libglade/libglade.mk	                        (rev 0)
+++ trunk/buildroot/package/libglade/libglade.mk	2008-12-27 14:36:29 UTC (rev 24568)
@@ -0,0 +1,17 @@
+#############################################################
+#
+# libglade
+#
+#############################################################
+LIBGLADE_VERSION = 2.6.3
+LIBGLADE_SOURCE = libglade-$(LIBGLADE_VERSION).tar.bz2
+LIBGLADE_SITE = http://ftp.gnome.org/pub/GNOME/sources/libglade/2.6/
+LIBGLADE_INSTALL_STAGING = YES
+LIBGLADE_DEPENDENCIES = pkgconfig libglib2 libgtk2 atk libxml2
+
+$(eval $(call AUTOTARGETS,package,libglade))
+
+$(LIBGLADE_HOOK_POST_INSTALL):
+	rm -rf $(TARGET_DIR)/usr/share/gtk-doc \
+	       $(TARGET_DIR)/usr/share/xml/libglade \
+	       $(TARGET_DIR)/usr/bin/libglade-convert
