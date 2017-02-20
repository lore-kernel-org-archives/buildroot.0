From: Peter Seiderer <ps.report@gmx.net>
Date: Mon, 20 Feb 2017 22:41:05 +0100
Subject: [Buildroot] [PATCH v1] qt5quickcontrols: fix LTS (5.6) qml file
	install
Message-ID: <20170220214105.8106-1-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes [1]:

  cp -dpfr .../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtQuick/PrivateWidgets .../target/usr/qml/QtQuick
  cp: cannot stat ?.../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtQuick/PrivateWidgets?: No such file or directory

[1] https://bugs.busybox.net/show_bug.cgi?id=9666

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index c2946bc75..8a63629c3 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -30,11 +30,20 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
 define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
 endef
+else
+define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Layouts $(TARGET_DIR)/usr/qml/QtQuick
+endef
+endif
 
 $(eval $(generic-package))
-- 
2.11.0
