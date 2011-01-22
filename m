From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 22 Jan 2011 17:59:16 +0100
Subject: [Buildroot] [PATCH 4/4] qt: optionally skip installation of bundled
	TrueType fonts
In-Reply-To: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
References: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1295715556-7239-5-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/qt/Config.in |   12 ++++++++++++
 package/qt/qt.mk     |    2 ++
 2 files changed, 14 insertions(+), 0 deletions(-)

diff --git a/package/qt/Config.in b/package/qt/Config.in
index e5fe325..ef37352 100644
--- a/package/qt/Config.in
+++ b/package/qt/Config.in
@@ -152,6 +152,18 @@ config BR2_PACKAGE_QT_SYSTEMFREETYPE
 	  See http://www.freetype.org/
 endchoice
 
+if !BR2_PACKAGE_QT_NOFREETYPE
+
+config BR2_PACKAGE_QT_BUNDLED_TTF
+	bool "Install TTF fonts bundled with Qt"
+	default y
+	help
+	  Qt is distributed with a selection of opensource TrueType fonts.
+	  Say yes if you want to install those fonts, no if you want to install
+	  a different selection of TrueType fonts.
+
+endif # !BR2_PACKAGE_QT_NOFREETYPE
+
 config BR2_PACKAGE_QT_GIF
 	bool "Enable GIF support"
 	help
diff --git a/package/qt/qt.mk b/package/qt/qt.mk
index 6eb31bc..ddee4fa 100644
--- a/package/qt/qt.mk
+++ b/package/qt/qt.mk
@@ -545,8 +545,10 @@ ifneq ($(QT_FONTS),)
 	cp -dpf $(QT_FONTS) $(TARGET_DIR)/usr/lib/fonts
 endif
 ifneq ($(BR2_PACKAGE_QT_NOFREETYPE),y)
+ifeq ($(BR2_PACKAGE_QT_BUNDLED_TTF),y)
 	cp -dpf $(STAGING_DIR)/usr/lib/fonts/*.ttf $(TARGET_DIR)/usr/lib/fonts
 endif
+endif
 	# Install image plugins if they are built
 	$(call QT_INSTALL_PLUGINS,imageformats)
 ifeq ($(BR2_PACKAGE_QT_SHARED),y)
-- 
1.7.1
