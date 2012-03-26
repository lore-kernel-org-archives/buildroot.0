From: JoM <johann.mercadier@imerir.com>
Date: Mon, 26 Mar 2012 23:21:25 +0100
Subject: [Buildroot] [PATCH 1/2] fix help comment Signed-off-by: JoM
	<johann.mercadier@imerir.com>
Message-ID: <1332800486-11104-1-git-send-email-johann.mercadier@imerir.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

---
 package/Config.in        |    1 +
 package/fbterm/Config.in |   12 ++++++++++++
 package/fbterm/fbterm.mk |   23 +++++++++++++++++++++++
 3 files changed, 36 insertions(+), 0 deletions(-)
 create mode 100644 package/fbterm/Config.in
 create mode 100644 package/fbterm/fbterm.mk

diff --git a/package/Config.in b/package/Config.in
index 85583c6..c2d02b7 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -109,6 +109,7 @@ if BR2_PACKAGE_BUSYBOX_SHOW_OTHERS
 source "package/fbset/Config.in"
 endif
 source "package/fbv/Config.in"
+source "package/fbterm/Config.in"
 source "package/imagemagick/Config.in"
 source "package/linux-fusion/Config.in"
 source "package/lite/Config.in"
diff --git a/package/fbterm/Config.in b/package/fbterm/Config.in
new file mode 100644
index 0000000..0a36a9f
--- /dev/null
+++ b/package/fbterm/Config.in
@@ -0,0 +1,12 @@
+config BR2_PACKAGE_FBTERM
+	bool "fbterm"
+	  select BR2_PACKAGE_FREETYPE
+	  select BR2_PACKAGE_FONTCONFIG
+	  select BR2_PACKAGE_ZLIB
+	  select BR2_PACKAGE_EXPAT
+	help
+	  FbTerm (Frame buffer terminal emulator) is a fast terminal emulator and a 
+	  standalone replacement of GNU/Linux terminal that can function outside of
+	  Xorg with the frame buffer device or VESA video card.
+	  
+	  http://code.google.com/p/fbterm/
diff --git a/package/fbterm/fbterm.mk b/package/fbterm/fbterm.mk
new file mode 100644
index 0000000..44f63f1
--- /dev/null
+++ b/package/fbterm/fbterm.mk
@@ -0,0 +1,23 @@
+#############################################################
+#
+# fbterm
+#
+#############################################################
+FBTERM_BINARY = fbterm
+FBTERM_TARGET_BINARY = usr/bin/$(FBTERM_BINARY)
+FBTERM_VERSION = 1.7.0
+FBTERM_SITE = http://fbterm.googlecode.com/files
+FBTERM_DEPENDENCIES += freetype fontconfig
+
+ifeq ($(BR2_PACKAGE_ZLIB),y)
+	FBTERM_DEPENDENCIES += zlib
+endif
+
+FBTERM_DEPENDENCIES += $(if $(BR2_PACKAGE_EXPAT),expat)
+
+define FBTERM_UNINSTALL_CMDS
+	rm -f $(TARGET_DIR)/$(FBTERM_TARGET_BINARY)
+endef
+
+
+$(eval $(call AUTOTARGETS))
-- 
1.7.2.5
