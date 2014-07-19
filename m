From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 19 Jul 2014 12:15:33 +0200
Subject: [Buildroot] [git commit] dejavu: new package
Message-ID: <20140719101603.F32079D25A@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=8390d939f87581bc216897e6ecd2fded968d5b50
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas: refactor installation, only install fontconfig files when
fontconfig is enabled.]

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 package/Config.in        |    1 +
 package/dejavu/Config.in |   33 ++++++++++++++++++++++++
 package/dejavu/dejavu.mk |   62 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 96 insertions(+), 0 deletions(-)

diff --git a/package/Config.in b/package/Config.in
index f9722f6..5886cfa 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -253,6 +253,7 @@ comment "X applications"
 	source "package/xvkbd/Config.in"
 
 comment "X libraries and helper libraries"
+	source "package/dejavu/Config.in"
 	source "package/liberation/Config.in"
 	source "package/libsexy/Config.in"
 	source "package/x11r7/xkeyboard-config/Config.in"
diff --git a/package/dejavu/Config.in b/package/dejavu/Config.in
new file mode 100644
index 0000000..5d21e56
--- /dev/null
+++ b/package/dejavu/Config.in
@@ -0,0 +1,33 @@
+config BR2_PACKAGE_DEJAVU
+	bool "DejaVu fonts"
+	help
+	  The DejaVu fonts are a font family based on the Vera Fonts.
+	  Its purpose is to provide a wider range of characters while
+	  maintaining the original look and feel through the process
+	  of collaborative development, under a Free license.
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
index 0000000..65659c3
--- /dev/null
+++ b/package/dejavu/dejavu.mk
@@ -0,0 +1,62 @@
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
+DEJAVU_FONTS_INSTALL =
+DEJAVU_FONTCONFIG_CONF_INSTALL =
+
+ifeq ($(BR2_PACKAGE_DEJAVU_MONO),y)
+DEJAVU_FONTS_INSTALL += DejaVuSansMono*.ttf
+DEJAVU_FONTCONFIG_CONF_INSTALL += \
+	20-unhint-small-dejavu-sans-mono.conf \
+	57-dejavu-sans-mono.conf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS),y)
+DEJAVU_FONTS_INSTALL += DejaVuSans.ttf DejaVuSans-*.ttf
+DEJAVU_FONTCONFIG_CONF_INSTALL += \
+	20-unhint-small-dejavu-sans.conf \
+	57-dejavu-sans.conf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF),y)
+DEJAVU_FONTS_INSTALL += DejaVuSerif.ttf DejaVuSerif-*.ttf
+DEJAVU_FONTCONFIG_CONF_INSTALL += \
+	20-unhint-small-dejavu-serif.conf \
+	57-dejavu-serif.conf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SANS_CONDENSED),y)
+DEJAVU_FONTS_INSTALL += DejaVuSansCondensed*.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_DEJAVU_SERIF_CONDENSED),y)
+DEJAVU_FONTS_INSTALL += DejaVuSerifCondensed*.ttf
+endif
+
+ifeq ($(BR2_PACKAGE_FONTCONFIG),y)
+define DEJAVU_FONTCONFIG_CONF_INSTALL_CMDS
+	for i in $(DEJAVU_FONTCONFIG_CONF_INSTALL) ; do \
+		$(INSTALL) -D -m 0644 $(@D)/fontconfig/$$i \
+			$(TARGET_DIR)/usr/share/fontconfig/conf.avail/$$i || exit 1 ; \
+	done
+endef
+endif
+
+define DEJAVU_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/fonts/dejavu/
+	for i in $(DEJAVU_FONTS_INSTALL) ; do \
+		$(INSTALL) -m 0644 $(@D)/ttf/$$i \
+			$(TARGET_DIR)/usr/share/fonts/dejavu/ || exit 1 ; \
+	done
+	$(DEJAVU_FONTCONFIG_CONF_INSTALL_CMDS)
+endef
+
+$(eval $(generic-package))
