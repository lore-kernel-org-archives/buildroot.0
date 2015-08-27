From: =?UTF-8?q?Beno=C3=AEt=20Th=C3=A9baudeau?= <benoit@wsystem.com>
Date: Thu, 27 Aug 2015 18:34:14 +0200
Subject: [Buildroot] [PATCH] package/qt5/qt5multimedia: fix gstreamer1
	support
Message-ID: <1440693254-31854-1-git-send-email-benoit@wsystem.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fix the missing gstreamer1 build dependencies, which could possibly
prevent the configuration of qt5multimedia from detecting the supported
gstreamer1 features.

Fix the missing gstreamer1 install rules, which resulted in the
following runtime error:

    defaultServiceProvider::requestService(): no service found for - "org.qt-project.qt.mediaplayer"

Signed-off-by: Beno?t Th?baudeau <benoit@wsystem.com>
---
 package/qt5/qt5multimedia/qt5multimedia.mk | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/qt5/qt5multimedia/qt5multimedia.mk b/package/qt5/qt5multimedia/qt5multimedia.mk
index 763fc28..50fdd57 100644
--- a/package/qt5/qt5multimedia/qt5multimedia.mk
+++ b/package/qt5/qt5multimedia/qt5multimedia.mk
@@ -21,6 +21,9 @@ endif
 ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
 QT5MULTIMEDIA_DEPENDENCIES += gst-plugins-base
 endif
+ifeq ($(BR2_PACKAGE_GST1_PLUGINS_BASE),y)
+QT5MULTIMEDIA_DEPENDENCIES += gst1-plugins-base
+endif
 
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
 QT5MULTIMEDIA_DEPENDENCIES += qt5declarative
@@ -40,7 +43,7 @@ define QT5MULTIMEDIA_INSTALL_STAGING_CMDS
 endef
 
 ifeq ($(BR2_STATIC_LIBS),)
-ifeq ($(BR2_PACKAGE_GST_PLUGINS_BASE),y)
+ifneq ($(BR2_PACKAGE_GST_PLUGINS_BASE)$(BR2_PACKAGE_GST1_PLUGINS_BASE),)
 define QT5MULTIMEDIA_INSTALL_TARGET_QGSTTOOLS_LIB
 	cp -dpf $(STAGING_DIR)/usr/lib/libqgsttools*.so.* $(TARGET_DIR)/usr/lib
 endef
-- 
2.1.4
