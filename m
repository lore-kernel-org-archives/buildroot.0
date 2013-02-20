From: =?UTF-8?q?Daniel=20Nystr=C3=B6m?= <daniel.nystrom@timeterminal.se>
Date: Wed, 20 Feb 2013 11:18:51 +0100
Subject: [Buildroot] [PATCH] qt: install QML imports on target
Message-ID: <1361355531-2909-1-git-send-email-daniel.nystrom@timeterminal.se>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When selecting the Qt declarative module, all the QML imports was
built and installed to staging, but never installed to the target.

Signed-off-by: Daniel Nystr?m <daniel.nystrom@timeterminal.se>
---
 package/qt/qt.mk |   10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index ee1a88b..3767810 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -498,6 +498,7 @@ define QT_CONFIGURE_CMDS
 		-no-separate-debug-info \
 		-prefix /usr \
 		-plugindir /usr/lib/qt/plugins \
+		-importdir /usr/lib/qt/imports \
 		-hostprefix $(STAGING_DIR) \
 		-fast \
 		-no-rpath \
@@ -610,6 +611,14 @@ define QT_INSTALL_TARGET_PLUGINS
 	fi
 endef
 
+# Import installation
+define QT_INSTALL_TARGET_IMPORTS
+	if [ -d $(STAGING_DIR)/usr/lib/qt/imports/ ] ; then \
+		mkdir -p $(TARGET_DIR)/usr/lib/qt/imports ; \
+		cp -dpfr $(STAGING_DIR)/usr/lib/qt/imports/* $(TARGET_DIR)/usr/lib/qt/imports ; \
+	fi
+endef
+
 # Fonts installation
 ifneq ($(QT_FONTS),)
 define QT_INSTALL_TARGET_FONTS
@@ -628,6 +637,7 @@ endif
 define QT_INSTALL_TARGET_CMDS
 	$(QT_INSTALL_TARGET_LIBS)
 	$(QT_INSTALL_TARGET_PLUGINS)
+	$(QT_INSTALL_TARGET_IMPORTS)
 	$(QT_INSTALL_TARGET_FONTS)
 	$(QT_INSTALL_TARGET_FONTS_TTF)
 endef
-- 
1.7.10.4
