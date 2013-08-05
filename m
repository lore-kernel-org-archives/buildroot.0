From: Hans Bulfone <hans@nil.at>
Date: Tue, 6 Aug 2013 01:36:43 +0200
Subject: [Buildroot] [PATCH 1/1] qt5multimedia: depend on gst-plugins-base
 if selected, install libqgsttools
Message-ID: <mailman.0.1375747702.3404.buildroot@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

qt5multimedia can use gstreamer, so make sure they are compiled in the
right order.  If gstreamer is used libqgsttools is required at run time.

Signed-off-by: Hans Bulfone <hans@nil.at>
---
 package/qt5/qt5multimedia/qt5multimedia.mk |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 8f62274..ec3d5e0 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -21,6 +21,10 @@ QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
 endef
@@ -37,6 +41,7 @@ endef
 ifeq ($(BR2_PREFER_STATIC_LIB),)
 define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
+	-cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
 endef
 endif
-- 
1.7.10.4
