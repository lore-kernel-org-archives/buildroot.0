From: Julien Corjon <corjon.j@ecagroup.com>
Date: Wed, 23 Dec 2015 13:12:48 +0100
Subject: [Buildroot] [PATCH 1/1] qt5/qt5webchannel: add qwebchannel.js
	installation choice
Message-ID: <1450872768-27153-1-git-send-email-corjon.j@ecagroup.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

To use webchannel in an application qwebchannel.js is needed but this file is not
installed. Add an option to fix that and let the user choose the location.

Signed-off-by: Julien Corjon <corjon.j@ecagroup.com>
---
 package/qt5/qt5webchannel/Config.in        | 12 ++++++++++++
 package/qt5/qt5webchannel/qt5webchannel.mk |  7 +++++++
 2 files changed, 19 insertions(+)

diff --git a/package/qt5/qt5webchannel/Config.in b/package/qt5/qt5webchannel/Config.in
index 218629a..3e6bb4e 100644
--- a/package/qt5/qt5webchannel/Config.in
+++ b/package/qt5/qt5webchannel/Config.in
@@ -9,3 +9,15 @@ config BR2_PACKAGE_QT5WEBCHANNEL
 	  This package corresponds to the qt5webchannel module.
 
 	  http://qt.io
+
+if BR2_PACKAGE_QT5WEBCHANNEL
+
+config BR2_PACKAGE_QT5WEBCHANNEL_JAVASCRIPT_FILE
+        string "qwebchannel.js installation path"
+        help
+	  It might be useful for your application to install
+	  qwebchannel.js file in a specific location on the target.
+
+	  Leave path empty to cancel qwebchannel.js installation.
+
+endif
diff --git a/package/qt5/qt5webchannel/qt5webchannel.mk b/package/qt5/qt5webchannel/qt5webchannel.mk
index cfb6da9..6901764 100644
--- a/package/qt5/qt5webchannel/qt5webchannel.mk
+++ b/package/qt5/qt5webchannel/qt5webchannel.mk
@@ -35,6 +35,12 @@ define QT5WEBCHANNEL_INSTALL_STAGING_CMDS
 	$(QT5_LA_PRL_FILES_FIXUP)
 endef
 
+ifneq ($(BR2_PACKAGE_QT5WEBCHANNEL_JAVASCRIPT_FILE),"")
+define QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT
+        $(INSTALL) -m 0644 -D $(@D)/src/webchannel/qwebchannel.js $(TARGET_DIR)$(BR2_PACKAGE_QT5WEBCHANNEL_JAVASCRIPT_FILE)/qwebchannel.js
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_QT5DECLARATIVE_QUICK),y)
 define QT5WEBCHANNEL_INSTALL_TARGET_QMLS
 	cp -dpfr $(STAGING_DIR)/usr/qml/QtWebChannel $(TARGET_DIR)/usr/qml/
@@ -56,6 +62,7 @@ endif
 define QT5WEBCHANNEL_INSTALL_TARGET_CMDS
 	$(QT5WEBCHANNEL_INSTALL_TARGET_LIBS)
 	$(QT5WEBCHANNEL_INSTALL_TARGET_QMLS)
+	$(QT5WEBCHANNEL_INSTALL_TARGET_JAVASCRIPT)
 endef
 
 $(eval $(generic-package))
-- 
2.5.0
