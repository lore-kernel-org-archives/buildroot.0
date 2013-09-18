From: =?UTF-8?q?Fatih=20A=C5=9F=C4=B1c=C4=B1?= <fatih.asici@gmail.com>
Date: Wed, 18 Sep 2013 10:23:32 +0300
Subject: [Buildroot] [PATCH] qt5webkit: select libXrender if xcb is enabled
Message-ID: <1379489012-21883-1-git-send-email-fatih.asici@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Fatih A??c? <fatih.asici@gmail.com>
---
 package/qt5/qt5webkit/Config.in    |    1 +
 package/qt5/qt5webkit/qt5webkit.mk |    4 ++++
 2 files changed, 5 insertions(+)

diff --git a/package/qt5/qt5webkit/Config.in b/package/qt5/qt5webkit/Config.in
index 48b5125..ba051d6 100644
--- a/package/qt5/qt5webkit/Config.in
+++ b/package/qt5/qt5webkit/Config.in
@@ -4,6 +4,7 @@ config BR2_PACKAGE_QT5WEBKIT
 	select BR2_PACKAGE_QT5BASE_ICU
 	select BR2_PACKAGE_QT5BASE_GUI
 	select BR2_PACKAGE_SQLITE
+	select BR2_PACKAGE_XLIB_LIBXRENDER if BR2_PACKAGE_QT5BASE_XCB
 	# This module does not support static linking
 	depends on !BR2_PREFER_STATIC_LIB
 	help
diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index b51f5c5..5335d9e 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -21,6 +21,10 @@ QT5WEBKIT_LICENSE = Commercial license
 QT5WEBKIT_REDISTRIBUTE = NO
 endif
 
+ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
+QT5WEBKIT_DEPENDENCIES += xlib_libXrender
+endif
+
 define QT5WEBKIT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
-- 
1.7.10.4
