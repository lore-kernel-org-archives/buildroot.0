From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Thu, 12 Sep 2013 15:12:36 -0400
Subject: [Buildroot] [PATCH] qt: install translations
Message-ID: <1379013156-9918-1-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The Qt translation files are currently created and moved under
$(STAGING_DIR)/usr/translations but not installed on the target.

This patch defines the translations directory to
/usr/share/qt/translations and defines a QT_INSTALL_TARGET_TRANSLATIONS
macro to deploy them from the staging directory to the target directory.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 package/qt/qt.mk | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index daade3c..48d39fc 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -516,6 +516,7 @@ define QT_CONFIGURE_CMDS
 		-prefix /usr \
 		-plugindir /usr/lib/qt/plugins \
 		-importdir /usr/lib/qt/imports \
+		-translationdir /usr/share/qt/translations \
 		-hostprefix $(STAGING_DIR) \
 		-fast \
 		-no-rpath \
@@ -666,6 +667,13 @@ define QT_INSTALL_TARGET_POWERVR
 endef
 endif
 
+define QT_INSTALL_TARGET_TRANSLATIONS
+	if [ -d $(STAGING_DIR)/usr/share/qt/translations/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/share/qt/translations ; \
+		cp -dpfr $(STAGING_DIR)/usr/share/qt/translations/* $(TARGET_DIR)/usr/share/qt/translations ; \
+	fi
+endef
+
 define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_LIBS)
 	$(QT_INSTALL_TARGET_PLUGINS)
@@ -673,6 +681,7 @@ define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_FONTS)
 	$(QT_INSTALL_TARGET_FONTS_TTF)
 	$(QT_INSTALL_TARGET_POWERVR)
+	$(QT_INSTALL_TARGET_TRANSLATIONS)
 endef
 
 define QT_CLEAN_CMDS
-- 
1.8.4
