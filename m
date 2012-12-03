From: Charles Manning <cdhmanning@gmail.com>
Date: Mon,  3 Dec 2012 14:06:31 +1300
Subject: [Buildroot] [PATCH] Allow selection of individual Liberation font
	sets
Message-ID: <1354496791-13337-1-git-send-email-cdhmanning@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

We don't always want all the font sets on small systems.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
---
 package/liberation/Config.in     |   26 ++++++++++++++++++++++++++
 package/liberation/liberation.mk |   28 +++++++++++++++++++++++++++-
 2 files changed, 53 insertions(+), 1 deletions(-)

diff --git a/package/liberation/Config.in b/package/liberation/Config.in
index 48d4195..11be2b5 100644
--- a/package/liberation/Config.in
+++ b/package/liberation/Config.in
@@ -5,3 +5,29 @@ config BR2_PACKAGE_LIBERATION
 	  three most commonly used fonts on Microsoft systems:
 	  Times New Roman, Arial, and Courier New.
 
+config BR2_PACKAGE_LIBERATION_SELECT_ALL
+	bool "Select all Liberation fonts"
+	depends on BR2_PACKAGE_LIBERATION
+	default y
+	help
+	  Select all Liberation fonts. Otherwise elect individual fonts
+
+if !BR2_PACKAGE_LIBERATION_SELECT_ALL
+
+menu "Individual Liberation Fonts"
+
+config BR2_PACKAGE_LIBERATION_SELECT_MONO
+	bool "Liberation Mono fonts"
+	default n
+
+config BR2_PACKAGE_LIBERATION_SELECT_SANS
+	bool "Liberation Sans fonts"
+	depends on !BR2_PACKAGE_LIBERATION_SELECT_ALL
+	default n
+
+config BR2_PACKAGE_LIBERATION_SELECT_SERIF
+	bool "Liberation Serif fonts"
+	default n
+endmenu
+
+endif
diff --git a/package/liberation/liberation.mk b/package/liberation/liberation.mk
index 7d55650..277d426 100644
--- a/package/liberation/liberation.mk
+++ b/package/liberation/liberation.mk
@@ -9,9 +9,35 @@ LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
 LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
 
+ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_ALL),y)
+BR2_PACKAGE_LIBERATION_SELECT_MONO = y
+BR2_PACKAGE_LIBERATION_SELECT_SANS = y
+BR2_PACKAGE_LIBERATION_SELECT_SERIF = y
+endif
+
+ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_MONO),y)
+define LIBERATION_INSTALL_MONO
+	$(INSTALL) -m 644 $(@D)/LiberationMono*.ttf $(LIBERATION_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_SANS),y)
+define LIBERATION_INSTALL_SANS
+	$(INSTALL) -m 644 $(@D)/LiberationSans*.ttf $(LIBERATION_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_LIBERATION_SELECT_SERIF),y)
+define LIBERATION_INSTALL_SERIF
+	$(INSTALL) -m 644 $(@D)/LiberationSerif*.ttf $(LIBERATION_TARGET_DIR)
+endef
+endif
+
 define LIBERATION_INSTALL_TARGET_CMDS
+	$(LIBERATION_INSTALL_MONO)
+	$(LIBERATION_INSTALL_SANS)
+	$(LIBERATION_INSTALL_SERIF)
 	mkdir -p $(LIBERATION_TARGET_DIR)
-	$(INSTALL) -m 644 $(@D)/*.ttf $(LIBERATION_TARGET_DIR)
 endef
 
 define LIBERATION_CLEAN_CMDS
-- 
1.7.1
