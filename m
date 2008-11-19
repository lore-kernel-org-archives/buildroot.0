From: Markus Heidelberg <markus.heidelberg@web.de>
Date: Wed, 19 Nov 2008 02:53:18 +0100
Subject: [Buildroot] [PATCH 7/7] qtopia4: add Phonon support
In-Reply-To: <200811190244.44817.markus.heidelberg@web.de>
References: <200811190244.44817.markus.heidelberg@web.de>
Message-ID: <200811190253.18927.markus.heidelberg@web.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Phonon is the multimedia API from KDE 4 which has been integrated into
Qt 4.4. For playback under Linux the GStreamer multimedia framework is
used.

Signed-off-by: Markus Heidelberg <markus.heidelberg@web.de>
---
 package/qtopia4/Config.in  |    9 +++++++++
 package/qtopia4/qtopia4.mk |   16 ++++++++++++++++
 2 files changed, 25 insertions(+), 0 deletions(-)

diff --git a/package/qtopia4/Config.in b/package/qtopia4/Config.in
index fb156af..e0eda92 100644
--- a/package/qtopia4/Config.in
+++ b/package/qtopia4/Config.in
@@ -234,6 +234,15 @@ config BR2_PACKAGE_QTOPIA4_XMLPATTERNS
 	  Build QtXmlPatterns module.
 	  If unsure, say n
 
+config BR2_PACKAGE_QTOPIA4_PHONON
+	bool "Phonon Module"
+	select BR2_PACKAGE_GSTREAMER
+	select BR2_PACKAGE_GST_PLUGINS_BASE
+	help
+	  Build the Phonon module. Support for different audio/video
+	  formats can be configured at the GStreamer package.
+	  If unsure, say n.
+
 config BR2_PACKAGE_QTOPIA4_SVG
 	bool "SVG Module"
 	help
diff --git a/package/qtopia4/qtopia4.mk b/package/qtopia4/qtopia4.mk
index ef40528..dc3d183 100644
--- a/package/qtopia4/qtopia4.mk
+++ b/package/qtopia4/qtopia4.mk
@@ -262,6 +262,13 @@ else
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
@@ -363,6 +370,10 @@ $(TARGET_DIR)/usr/lib/libQtCore.so.4: $(STAGING_DIR)/usr/lib/libQtCore.la
 ifeq ($(BR2_PACKAGE_QTOPIA4_SHARED),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt*.so.* $(TARGET_DIR)/usr/lib/
 	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libQt*.so.*
+ifeq ($(BR2_PACKAGE_QTOPIA4_PHONON),y)
+	cp -dpf $(STAGING_DIR)/usr/lib/libphonon.so.* $(TARGET_DIR)/usr/lib/
+	-$(STRIPCMD) $(STRIP_STRIP_UNNEEDED) $(TARGET_DIR)/usr/lib/libphonon.so.*
+endif
 endif
 	# Install image plugins if they are built
 	if [ -d $(STAGING_DIR)/usr/plugins/imageformats ]; then \
@@ -370,6 +381,11 @@ endif
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
-- 
1.6.0.4.762.g0567f
