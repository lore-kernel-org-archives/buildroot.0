From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Wed, 27 Feb 2013 23:57:50 +0100
Subject: [Buildroot] [git commit branch/next] qt: install QML imports on
	target
Message-ID: <20130227225812.0B5AB9ADCE@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=1942836999ad64b7a84bd95a6bd1f5c75b81bf45
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

When selecting the Qt declarative module, all the QML imports was
built and installed to staging, but never installed to the target.

Signed-off-by: Daniel Nystr??m <daniel.nystrom@timeterminal.se>
Acked-by: Alexander Lukichev <alexander.lukichev@gmail.com>
Acked-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Tested-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/qt/qt.mk |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

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
