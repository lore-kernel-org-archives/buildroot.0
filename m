From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Fri, 24 Jan 2014 16:06:20 +0200
Subject: [Buildroot] [PATCH] qt5multimedia: install gsttools library to
	target
Message-ID: <1390572380-28031-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It is built when gst-plugins-base is selected.

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
Noticed-by: Pawe? Gibaszek <gibol666@gmail.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 1a3ca6b..5256920 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -20,6 +20,10 @@ QT5MULTIMEDIA_LICENSE = Commercial license
 QT5MULTIMEDIA_REDISTRIBUTE = NO
 endif
 
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
+endif
+
 define QT5MULTIMEDIA_CONFIGURE_CMDS
 	(cd $(@D); $(HOST_DIR)/usr/bin/qmake)
 endef
@@ -34,9 +38,16 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_PREFER_STATIC_LIB),)
+ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
+	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
+endef
+endif
+
 define QT5MULTIMEDIA_INSTALL_TARGET_LIBS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5Multimedia*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpfr $(STAGING_DIR)/usr/lib/qt/plugins/* $(TARGET_DIR)/usr/lib/qt/plugins
+	$(QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB)
 endef
 endif
 
-- 
1.8.5.2
