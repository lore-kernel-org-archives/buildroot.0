From: Peter Seiderer <ps.report@gmx.net>
Date: Wed,  4 Jun 2014 23:07:44 +0200
Subject: [Buildroot] [PATCH] dejavu: new package
Message-ID: <1401916064-11345-1-git-send-email-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in        |  1 +
 package/dejavu/Config.in | 33 +++++++++++++++++++++++++
 package/dejavu/dejavu.mk | 63 ++++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 97 insertions(+)
 create mode 100644 package/dejavu/Config.in
 create mode 100644 package/dejavu/dejavu.mk

diff --git a/package/Config.in b/package/Config.in
index 5a92032..89b0ef4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -245,6 +245,7 @@ source "package/xterm/Config.in"
 source "package/xvkbd/Config.in"
 
 comment "X libraries and helper libraries"
+source "package/dejavu/Config.in"
 source "package/liberation/Config.in"
 source "package/libsexy/Config.in"
 source "package/x11r7/xkeyboard-config/Config.in"
diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
new file mode 100644
index 0000000..bd38d58
--- /dev/null
+++ b/package/dejavu/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_DEJAVU
+	bool "DejaVu fonts"
+	help
+	  The DejaVu fonts are a font family based on the Vera Fonts.
+	  Its purpose is to provide a wider range of characters while maintaining
+	  the original look and feel through the process of collaborative
+	  development, under a Free license. 
+
+	  http://dejavu-fonts.org
+
+if BR2_PACKAGE_DEJAVU
+
+config BR2_PACKAGE_DEJAVU_MONO
+	bool "mono fonts"
+	default y
+
+config BR2_PACKAGE_DEJAVU_SANS
+	bool "sans fonts"
+	default y
+
+config BR2_PACKAGE_DEJAVU_SERIF
+	bool "serif fonts"
+	default y
+
+config BR2_PACKAGE_DEJAVU_SANS_CONDENSED
+	bool "sans condensed fonts"
+	default y
+
+config BR2_PACKAGE_DEJAVU_SERIF_CONDENSED
+	bool "serif condensed fonts"
+	default y
+
+endif
diff --git a/package/dejavu/dejavu.mk b/package/dejavu/dejavu.mk
new file mode 100644
index 0000000..a2252cd
--- /dev/null
+++ b/package/dejavu/dejavu.mk
@@ -0,0 +1,63 @@
+################################################################################
+#
+# dejavu
+#
+################################################################################
+
+DEJAVU_VERSION = 2.34
+DEJAVU_SITE = http://sourceforge.net/projects/dejavu/files/dejavu/$(DEJAVU_VERSION)
+DEJAVU_SOURCE = dejavu-fonts-ttf-$(DEJAVU_VERSION).tar.bz2
+DEJAVU_LICENSE_FILES = LICENSE
+
+DEJAVU_TARGET_DIR = $(TARGET_DIR)/usr/share/fonts/dejavu
+DEJAVU_FONTCONFIG_TARGET_DIR = $(TARGET_DIR)/usr/share/fontconfig/conf.avail
+
+ifeq ($(BR2_PACKAGE_DEJAVU_MONO),y)
+define DEJAVU_INSTALL_MONO
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSansMono*.ttf $(DEJAVU_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/fontconfig/20-unhint-small-dejavu-sans-mono.conf $(DEJAVU_FONTCONFIG_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/fontconfig/57-dejavu-sans-mono.conf $(DEJAVU_FONTCONFIG_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS),y)
+define DEJAVU_INSTALL_SANS
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSans.ttf $(DEJAVU_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSans-*.ttf $(DEJAVU_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/fontconfig/20-unhint-small-dejavu-sans.conf $(DEJAVU_FONTCONFIG_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/fontconfig/57-dejavu-sans.conf $(DEJAVU_FONTCONFIG_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF),y)
+define DEJAVU_INSTALL_SERIF
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSerif.ttf $(DEJAVU_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSerif-*.ttf $(DEJAVU_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/fontconfig/20-unhint-small-dejavu-serif.conf $(DEJAVU_FONTCONFIG_TARGET_DIR)
+	$(INSTALL) -m 644 $(@D)/fontconfig/57-dejavu-serif.conf $(DEJAVU_FONTCONFIG_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS_CONDENSED),y)
+define DEJAVU_INSTALL_SANS_CONDENSED
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSansCondensed*.ttf $(DEJAVU_TARGET_DIR)
+endef
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF_CONDENSED),y)
+define DEJAVU_INSTALL_SERIF_CONDENSED
+	$(INSTALL) -m 644 $(@D)/ttf/DejaVuSerifCondensed*.ttf $(DEJAVU_TARGET_DIR)
+endef
+endif
+
+define DEJAVU_INSTALL_TARGET_CMDS
+	mkdir -p $(DEJAVU_TARGET_DIR)
+	mkdir -p $(DEJAVU_FONTCONFIG_TARGET_DIR)
+	$(DEJAVU_INSTALL_MONO)
+	$(DEJAVU_INSTALL_SANS)
+	$(DEJAVU_INSTALL_SERIF)
+	$(DEJAVU_INSTALL_SANS_CONDENSED)
+	$(DEJAVU_INSTALL_SERIF_CONDENSED)
+endef
+
+$(eval $(generic-package))
-- 
1.8.1.4
