From: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay@savoirfairelinux.com>
Date: Tue, 12 Jun 2018 08:32:00 -0400
Subject: [Buildroot] [PATCH 3/9] qt5quickcontrols: install examples to target
In-Reply-To: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
References: <20180612123206.31523-1-gael.portay@savoirfairelinux.com>
Message-ID: <20180612123206.31523-4-gael.portay@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When BR2_PACKAGE_QT5BASE_EXAMPLES is set, the examples for this module
are installed in the staging directory but they are not shipped to the
target.

This commit copies the examples `quickcontrols' from the staging
directory to the target.

Signed-off-by: Ga?l PORTAY <gael.portay@savoirfairelinux.com>
---
 package/qt5/qt5quickcontrols/qt5quickcontrols.mk | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
index 5517cc1537..6e551d5a27 100644
--- a/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
+++ b/package/qt5/qt5quickcontrols/qt5quickcontrols.mk
@@ -25,6 +25,12 @@ define QT5QUICKCONTROLS_INSTALL_STAGING_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) install
 endef
 
+ifeq ($(BR2_PACKAGE_QT5BASE_EXAMPLES),y)
+define QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES
+	cp -dpfr $(STAGING_DIR)/usr/lib/qt/examples/quickcontrols $(TARGET_DIR)/usr/lib/qt/examples/
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK)$(BR2_PACKAGE_QT5BASE_WIDGETS),yy)
 define QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/PrivateWidgets $(TARGET_DIR)/usr/qml/QtQuick
@@ -43,6 +49,7 @@ define QT5QUICKCONTROLS_INSTALL_TARGET_CMDS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtQuick/Extras $(TARGET_DIR)/usr/qml/QtQuick
 	$(QT5QUICKCONTROLS_INSTALL_TARGET_PRIVATEWIDGETS)
 	$(QT5QUICKCONTROLS_INSTALL_TARGET_LAYOUTS)
+	$(QT5QUICKCONTROLS_INSTALL_TARGET_EXAMPLES)
 endef
 
 $(eval $(generic-package))
-- 
2.17.1
