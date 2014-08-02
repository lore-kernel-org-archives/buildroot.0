From: Danomi Manchego <danomimanchego123@gmail.com>
Date: Fri,  1 Aug 2014 23:08:56 -0400
Subject: [Buildroot] [PATCH 1/1] qt: make installation of translation files
	optional
Message-ID: <1406948936-1962-1-git-send-email-danomimanchego123@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Commit 93917b6980f7f2b51302e1a3fa451b07cf7d674e introduced the
installation of the binary .qm translation files, unconditionally.
This patch introduces an option to disable this behavior, saving
almost 8MB of space.

Signed-off-by: Danomi Manchego <danomimanchego123@gmail.com>

---

Note: the new option is defaulted to "y", to match the current qt.mk operation.
---
 package/qt/Config.in |    7 +++++++
 package/qt/qt.mk     |    2 ++
 2 files changed, 9 insertions(+)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index 0a21e93..a84d082 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -416,6 +416,13 @@ config BR2_PACKAGE_QT_DECLARATIVE
 	  Build the Qt Declarative Module for qml support
 	  if unsure, say n.
 
+config BR2_PACKAGE_QT_INSTALL_TRANSLATION_FILES
+	bool "Install translation files"
+	default y
+	help
+	  Install binary .qm translation files.
+	  if unsure, say y.
+
 config BR2_PACKAGE_QT_TEST
 	bool "Test Module"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 82a5509..cbc4d35 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -670,12 +670,14 @@ define QT_INSTALL_TARGET_POWERVR
 endef
 endif
 
+ifeq ($(BR2_PACKAGE_QT_INSTALL_TRANSLATION_FILES),y)
 define QT_INSTALL_TARGET_TRANSLATIONS
 	if [ -d $(STAGING_DIR)/usr/share/qt/translations/ ] ; then \
 		mkdir -p $(TARGET_DIR)/usr/share/qt/translations ; \
 		cp -dpfr $(STAGING_DIR)/usr/share/qt/translations/* $(TARGET_DIR)/usr/share/qt/translations ; \
 	fi
 endef
+endif
 
 define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_LIBS)
-- 
1.7.9.5
