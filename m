From: jacmet at uclibc.org <jacmet@uclibc.org>
Date: Thu, 23 Apr 2009 20:26:28 +0000 (UTC)
Subject: [Buildroot] svn commit: [26199] trunk/buildroot/package/multimedia:
	taglib
Message-ID: <20090423202628.ABA2A77182@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: jacmet
Date: 2009-04-23 20:26:28 +0000 (Thu, 23 Apr 2009)
New Revision: 26199

Log:
package/multimeda: add taglib package

Based on patch by Sven Neumann <s.neumann@phase-zero.de>, closes #283.

Added:
   trunk/buildroot/package/multimedia/taglib/
   trunk/buildroot/package/multimedia/taglib/Config.in
   trunk/buildroot/package/multimedia/taglib/taglib.mk

Modified:
   trunk/buildroot/package/multimedia/Config.in


Changeset:
Modified: trunk/buildroot/package/multimedia/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/Config.in	2009-04-23 19:29:23 UTC (rev 26198)
+++ trunk/buildroot/package/multimedia/Config.in	2009-04-23 20:26:28 UTC (rev 26199)
@@ -20,5 +20,6 @@
 source "package/multimedia/mplayer/Config.in"
 source "package/multimedia/speex/Config.in"
 source "package/multimedia/festival/Config.in"
+source "package/multimedia/taglib/Config.in"
 source "package/multimedia/vlc/Config.in"
 endmenu

Added: trunk/buildroot/package/multimedia/taglib/Config.in
===================================================================
--- trunk/buildroot/package/multimedia/taglib/Config.in	                        (rev 0)
+++ trunk/buildroot/package/multimedia/taglib/Config.in	2009-04-23 20:26:28 UTC (rev 26199)
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_TAGLIB
+	bool "taglib"
+	depends on BR2_INSTALL_LIBSTDCPP
+	help
+	  TagLib is a library for reading and editing the meta-data of
+          several popular audio formats. Currently it supports both ID3v1
+          and ID3v2 for MP3 files, Ogg Vorbis comments and ID3 tags and
+          Vorbis comments in FLAC, MPC, Speex, WavPack and TrueAudio files.
+
+	  http://developer.kde.org/~wheeler/taglib.html
+
+comment "taglib requires a toolchain with C++ support enabled"
+	depends on !BR2_INSTALL_LIBSTDCPP

Added: trunk/buildroot/package/multimedia/taglib/taglib.mk
===================================================================
--- trunk/buildroot/package/multimedia/taglib/taglib.mk	                        (rev 0)
+++ trunk/buildroot/package/multimedia/taglib/taglib.mk	2009-04-23 20:26:28 UTC (rev 26199)
@@ -0,0 +1,27 @@
+#############################################################
+#
+# taglib
+#
+#############################################################
+TAGLIB_VERSION = 1.5
+TAGLIB_SOURCE = taglib-$(TAGLIB_VERSION).tar.gz
+TAGLIB_SITE = http://developer.kde.org/~wheeler/files/src
+TAGLIB_LIBTOOL_PATCH = NO
+TAGLIB_INSTALL_STAGING = YES
+
+TAGLIB_DEPENDENCIES = uclibc
+
+TAGLIB_CONF_ENV = \
+	DO_NOT_COMPILE='bindings tests examples' \
+	ac_cv_header_cppunit_extensions_HelperMacros_h=no \
+	ac_cv_header_zlib_h=$(if $(BR2_PACKAGE_ZLIB),yes,no)
+
+TAGLIB_CONF_OPT = --disable-libsuffix --program-prefix=''
+
+$(eval $(call AUTOTARGETS,package/multimedia,taglib))
+
+ifneq ($(BR2_HAVE_DEVFILES),y)
+$(TAGLIB_HOOK_POST_INSTALL):
+	rm -f $(TARGET_DIR)/usr/bin/taglib-config
+	touch $@
+endif
