From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 20 Feb 2017 23:31:27 +0100
Subject: [Buildroot] [git commit] qt5quickcontrols: fix LTS (5.6) qml file
	install
Message-ID: <20170220223309.AB2C082229@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=e482ebf51d9e8e00c3e58eb65af0dfb70d05d8cc
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes #9666 [1]

  cp -dpfr .../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtQuick/PrivateWidgets .../target/usr/qml/QtQuick
  cp: cannot stat ???.../host/usr/arm-buildroot-linux-uclibcgnueabi/sysroot/usr/qml/QtQuick/PrivateWidgets???: No such file or directory

[1] https://bugs.busybox.net/show_bug.cgi?id=9666

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index c2946bc..8a63629 100644
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
