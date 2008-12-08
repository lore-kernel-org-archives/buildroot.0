From: egtvedt at uclibc.org <egtvedt@uclibc.org>
Date: Mon,  8 Dec 2008 10:00:55 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot/package/qtopia4
Message-ID: <20081208180055.1A56C3C767@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: egtvedt
Date: 2008-12-08 10:00:54 -0800 (Mon, 08 Dec 2008)
New Revision: 24332

Log:
qtopia4: add kconfig option to enable Phonon

This patch adds a kconfig option to enable Phonon when configuring Qt.

Phonon is the multimedia API from KDE 4 which has been integrated into
Qt 4.4. For playback under Linux the GStreamer multimedia framework is
used.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
Signed-off-by: Hans-Christian Egtvedt <hans-christian.egtvedt@atmel.com>



Modified:
   trunk/buildroot/package/qtopia4/Config.in
   trunk/buildroot/package/qtopia4/qtopia4.mk


Changeset:
Modified: trunk/buildroot/package/qtopia4/Config.in
===================================================================
--- trunk/buildroot/package/qtopia4/Config.in	2008-12-08 17:57:26 UTC (rev 24331)
+++ trunk/buildroot/package/qtopia4/Config.in	2008-12-08 18:00:54 UTC (rev 24332)
@@ -228,6 +228,15 @@
 source "package/qtopia4/Config.gfx.in"
 source "package/qtopia4/Config.mouse.in"
 
+config BR2_PACKAGE_QTOPIA4_PHONON
+	bool "Phonon Module"
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  Build the Phonon module. Support for different audio/video
+	  formats can be configured at the GStreamer package.
+	  If unsure, say n.
+
 config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
 	bool "XML Patterns Module"
 	help

Modified: trunk/buildroot/package/qtopia4/qtopia4.mk
===================================================================
--- trunk/buildroot/package/qtopia4/qtopia4.mk	2008-12-08 17:57:26 UTC (rev 24331)
+++ trunk/buildroot/package/qtopia4/qtopia4.mk	2008-12-08 18:00:54 UTC (rev 24332)
@@ -262,6 +262,13 @@
 QTOPIA4_CONFIGURE+= -no-xmlpatterns
 endif
 
+ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
+QTOPIA4_CONFIGURE+= -phonon
+QTOPIA4_DEP_LIBS+=gstreamer gst-plugins-base
+else
+QTOPIA4_CONFIGURE+= -no-phonon
+endif
+
 ifeq ($(BR2_PACKAGE_QTOPIA4_SVG),y)
 QTOPIA4_CONFIGURE+= -svg
 else
@@ -361,13 +368,22 @@
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
+ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libphonon.so.*
 endif
+endif
 	# Install image plugins if they are built
 	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
 		mkdir -p $(TARGET_DIR)/usr/plugins; \
 		cp -dpfr $(STAGING_DIR)/usr/plugins/imageformats $(TARGET_DIR)/usr/plugins/; \
 		$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/imageformats/*; \
 	fi
+ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
+	mkdir -p $(TARGET_DIR)/usr/plugins
+	cp -dpfr $(STAGING_DIR)/usr/plugins/phonon_backend $(TARGET_DIR)/usr/plugins/
+	$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/plugins/phonon_backend/*
+endif
 ifneq ($(BR2_PACKAGE_QTOPIA4_SQL_MODULE),y)
 	# Remove Sql libraries, not needed
 	-rm $(TARGET_DIR)/usr/lib/libQtSql*
