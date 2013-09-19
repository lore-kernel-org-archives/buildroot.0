From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 19 Sep 2013 21:41:33 +0200
Subject: [Buildroot] [git commit] qt: install translations
Message-ID: <20130919195156.958619B7F4@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=93917b6980f7f2b51302e1a3fa451b07cf7d674e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Qt translation files are currently created and moved under
$(STAGING_DIR)/usr/translations but not installed on the target.

This patch defines the translations directory to
/usr/share/qt/translations and defines a QT_INSTALL_TARGET_TRANSLATIONS
macro to deploy them from the staging directory to the target directory.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Reviewed-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |    9 +++++++++
 1 files changed, 9 insertions(+), 0 deletions(-)

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
