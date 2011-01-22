From: Luca Ceresoli <luca@lucaceresoli.net>
Date: Sat, 22 Jan 2011 17:59:14 +0100
Subject: [Buildroot] [PATCH 2/4] Configurable font install layout and
	directory
In-Reply-To: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
References: <1295715556-7239-1-git-send-email-luca@lucaceresoli.net>
Message-ID: <1295715556-7239-3-git-send-email-luca@lucaceresoli.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Luca Ceresoli <luca@lucaceresoli.net>
---
 package/fonts/Config.in                |   33 ++++++++++++++++++++++++++++++++
 package/fonts/liberation/liberation.mk |    9 ++++++-
 2 files changed, 40 insertions(+), 2 deletions(-)

diff --git a/package/fonts/Config.in b/package/fonts/Config.in
index 61072ad..11497a5 100644
--- a/package/fonts/Config.in
+++ b/package/fonts/Config.in
@@ -1,5 +1,38 @@
 menu "Fonts"
 
+choice
+	prompt "Font install layout"
+	default BR2_FONT_LAYOUT_FLAT if (BR2_PACKAGE_QT || BR2_PACKAGE_FREETYPE)
+	default BR2_FONT_LAYOUT_SUBDIRS
+	help
+	  Select where do you want buildroot to install fonts.
+
+	  Installing fonts in subdirectories is the standard layout, but
+	  some applications and libraries are unable to find fonts that are
+	  installed this way.
+	  If you need such applications or libraries, choose the flat install
+	  layout.
+
+config BR2_FONT_LAYOUT_SUBDIRS
+	bool "In subdirectories"
+	help
+	  Install each font family in a separate subdirectory.
+
+config BR2_FONT_LAYOUT_FLAT
+	bool "Flat"
+	help
+	  Install all fonts in the same directory.
+endchoice
+
+config BR2_FONT_LAYOUT_BASEDIR
+	string "Font install directory"
+	default "/usr/share/fonts"
+	help
+	  Directory where fonts must be installed.
+
+	  Depending on the font install layout chosen, fonts will be installed
+	  here or in a subdirectory for each family.
+
 source "package/fonts/liberation/Config.in"
 
 endmenu
diff --git a/package/fonts/liberation/liberation.mk b/package/fonts/liberation/liberation.mk
index 89987d6..6efa54b 100644
--- a/package/fonts/liberation/liberation.mk
+++ b/package/fonts/liberation/liberation.mk
@@ -7,7 +7,11 @@ LIBERATION_VERSION = 1.06.0.20100721
 LIBERATION_SITE = http://www.fedorahosted.org/releases/l/i/liberation-fonts
 LIBERATION_SOURCE = liberation-fonts-ttf-$(LIBERATION_VERSION).tar.gz
 
-LIBERATION_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/liberation
+LIBERATION_TARGET_DIR = $(TARGET_DIR)/$(call qstrip,$(BR2_FONT_LAYOUT_BASEDIR))
+
+ifeq ($(BR2_FONT_LAYOUT_SUBDIRS),y)
+LIBERATION_TARGET_DIR = $(LIBERATION_TARGET_DIR)/liberation
+endif
 
 define LIBERATION_INSTALL_TARGET_CMDS
 	mkdir -p $(LIBERATION_TARGET_DIR)
@@ -15,7 +19,8 @@ define LIBERATION_INSTALL_TARGET_CMDS
 endef
 
 define LIBERATION_CLEAN_CMDS
-	rm -rf $(LIBERATION_TARGET_DIR)
+	rm -rf $(LIBERATION_TARGET_DIR)/Liberation*.ttf
+	rmdir $(LIBERATION_TARGET_DIR) || true # remove dir if empty
 endef
 
 $(eval $(call GENTARGETS,package,liberation))
-- 
1.7.1
