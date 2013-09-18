From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 18 Sep 2013 12:26:17 +0200
Subject: [Buildroot] [git commit] qt5webkit: install qml's only if
	declarative module is selected
Message-ID: <20130918102655.6B9D09B7BB@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=7816cc9ae624460fa0cccf50c1f0889b9d01151d
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes http://autobuild.buildroot.net/results/a9bbba68f22076ea2c86ee09ebe8a0a5e86b3b54/

Signed-off-by: Fatih A????c?? <fatih.asici@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt5/qt5webkit/qt5webkit.mk |   12 +++++++++++-
 1 files changed, 11 insertions(+), 1 deletions(-)

diff --git a/package/qt5/qt5webkit/qt5webkit.mk b/package/qt5/qt5webkit/qt5webkit.mk
index c95f3b4..320a2ea 100644
--- a/package/qt5/qt5webkit/qt5webkit.mk
+++ b/package/qt5/qt5webkit/qt5webkit.mk
@@ -25,6 +25,10 @@ ifeq ($(BR2_PACKAGE_QT5BASE_XCB),y)
 QT5WEBKIT_DEPENDENCIES += xlib_libXext xlib_libXrender
 endif
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+QT5WEBKIT_DEPENDENCIES += qt5declarative
+endif
+
 define QT5WEBKIT_CONFIGURE_CMDS
 	(cd $(@D); $(TARGET_MAKE_ENV) $(HOST_DIR)/usr/bin/qmake)
 endef
@@ -38,10 +42,16 @@ define QT5WEBKIT_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE),y)
+define QT5WEBKIT_INSTALL_TARGET_QMLS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
+endef
+endif
+
 define QT5WEBKIT_INSTALL_TARGET_CMDS
 	cp -dpf $(STAGING_DIR)/usr/lib/libQt5WebKit*.so.* $(TARGET_DIR)/usr/lib
 	cp -dpf $(@D)/bin/* $(TARGET_DIR)/usr/bin/
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebKit $(TARGET_DIR)/usr/qml/
+	$(QT5WEBKIT_INSTALL_TARGET_QMLS)
 endef
 
 $(eval $(generic-package))
