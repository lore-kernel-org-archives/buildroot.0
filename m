From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 28 Feb 2017 15:55:29 +0100
Subject: [Buildroot] [git commit] qt5quickcontrols: fix installation of
	PrivateWidgets
Message-ID: <20170228145641.A6EB881D32@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c186c6ca1689111fb2a4a164f57b3b96ebd21c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit e482ebf51d9e8e00c3e58eb65af0dfb70d05d8cc attempted to fix the
installation of qt5quickcontrols by only installing the PrivateWidgets
directory for the 5.8.0 version.

However, the availability of PrivateWidgets has nothing to do with the
version; in both 5.6.2 and 5.8.0, the installation is gated by the
following statement in src/src.pro:

qtHaveModule(quick):qtHaveModule(widgets): SUBDIRS += widgets

i.e. it is installed when both the Quick and the Widgets module are
available. The Widgets module is controlled by Buildroot's
BR2_PACKAGE_QT5BASE_WIDGETS symbol, the Quick module is controlled by
Buildroot's BR2_PACKAGE_QT5DECLARATIVE_QUICK. The qt5quickcontrols
package selects BR2_PACKAGE_QT5DECLARATIVE_QUICK so it is not really
needed to include it in the condition. However, it is theoretically
possible to build this package without QtQuick. Also, adding this
condition makes it consistent with src.pro.

Note that commit e482ebf51d9e8e00c3e58eb65af0dfb70d05d8cc introduces a
second fix (not mentioned in the commit message): for version 5.6.2, the
Layouts directory is installed, but in 5.8.0 this directory doesn't
exist any more. Therefore, a separate condition on the version is still
needed.

Fixes:
http://autobuild.buildroot.net/results/1ff3e9ad4ba518d0a37f9fc12038bf9020f28094

Cc: Peter Seiderer <ps.report@gmx.net>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 8a63629..43254ba 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -30,20 +30,25 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
-ifeq ($(BR2_PACKAGE_QT5_VERSION_LATEST),y)
-define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
+
+ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5BASE_WIDGETS),yy)
+define QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
 endef
-else
+endif
+
+ifeq ($(BR2_PACKAGE_QT5_VERSION_5_6),y)
+define QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS
+	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Layouts $(TARGET_DIR)/usr/qml/QtQuick
+endef
+endif
+
 define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Controls $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Dialogs $(TARGET_DIR)/usr/qml/QtQuick
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
-	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Layouts $(TARGET_DIR)/usr/qml/QtQuick
+	$(QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS)
+	$(QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS)
 endef
-endif
 
 $(eval $(generic-package))
