From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Fri, 20 Feb 2009 13:02:13 +0000 (UTC)
Subject: [Buildroot] svn commit: trunk/buildroot/package/multimedia:  flac
Message-ID: <20090220130214.3172976454@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-02-20 13:02:13 +0000 (Fri, 20 Feb 2009)
New Revision: 25391

Log:
package/multimeda: add flac package

Patch by Sven Neumann (from #99).

Removed optimization patch, cleaned up configure args and fixed download URL.

Added:
   trunk/buildroot/package/multimedia/flac/
   trunk/buildroot/package/multimedia/flac/Config.in
   trunk/buildroot/package/multimedia/flac/flac.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2009-02-20 04:56:00 UTC (rev 25390)
+++ trunk/buildroot/package/multimedia/Config.in	2009-02-20 13:02:13 UTC (rev 25391)
@@ -3,6 +3,7 @@
 source "package/multimedia/alsa-utils/Config.in"
 source "package/multimedia/asterisk/Config.in"
 source "package/multimedia/aumix/Config.in"
+source "package/multimedia/flac/Config.in"
 source "package/multimedia/gstreamer/Config.in"
 source "package/multimedia/gst-plugins-base/Config.in"
 source "package/multimedia/gst-plugins-good/Config.in"

Added: trunk/buildroot/package/multimedia/flac/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/flac/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/flac/Config.in	2009-02-20 13:02:13 UTC (rev 25391)
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_FLAC
+	bool "flac"
+	help
+          FLAC is an Open Source lossless audio codec.
+
+	  http://flac.sourceforge.net/

Added: trunk/buildroot/package/multimedia/flac/flac.mk
===================================================================
--- trunk/buildroot/package/multimedia/flac/flac.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/flac/flac.mk	2009-02-20 13:02:13 UTC (rev 25391)
@@ -0,0 +1,26 @@
+################################################################################
+#
+# flac
+#
+################################################################################
+
+FLAC_VERSION = 1.2.1
+FLAC_SOURCE = flac-$(FLAC_VERSION).tar.gz
+FLAC_SITE = http://$(BR2_SOURCEFORGE_MIRROR).dl.sourceforge.net/sourceforge/flac/
+FLAC_AUTORECONF = NO
+FLAC_INSTALL_TARGET = YES
+FLAC_INSTALL_STAGING = YES
+
+FLAC_CONF_OPT = \
+	--enable-shared \
+	--disable-cpplibs \
+	--disable-xmms-plugin
+
+ifeq ($(BR2_PACKAGE_LIBOGG),y)
+FLAC_CONF_OPT += --with-ogg=$(STAGING_DIR)/usr
+FLAC_DEPENDENCIES = libogg
+else
+FLAC_CONF_OPT += --disable-ogg
+endif
+
+$(eval $(call AUTOTARGETS,package/multimedia,flac))
