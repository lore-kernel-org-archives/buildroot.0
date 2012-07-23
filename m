From: spdawson at gmail.com <spdawson@gmail.com>
Date: Mon, 23 Jul 2012 15:24:54 +0100
Subject: [Buildroot] [PATCH] googlefontdirectory: new package
Message-ID: <1343053494-21248-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 package/Config.in                                  |    1 +
 package/googlefontdirectory/Config.in              |   13 +++++++
 package/googlefontdirectory/googlefontdirectory.mk |   36 ++++++++++++++++++++
 3 files changed, 50 insertions(+)
 create mode 100644 package/googlefontdirectory/Config.in
 create mode 100644 package/googlefontdirectory/googlefontdirectory.mk

diff --git a/package/Config.in b/package/Config.in
index f664b8e..89dc036 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -498,6 +498,7 @@ endmenu
 menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
+source "package/googlefontdirectory/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/googlefontdirectory/Config.in b/package/googlefontdirectory/Config.in
new file mode 100644
index 0000000..2ff81b7
--- /dev/null
+++ b/package/googlefontdirectory/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GOOGLEFONTDIRECTORY
+	bool "Google Web Fonts"
+	help
+	  Download Google Web Fonts
+
+	  http://code.google.com/p/googlefontdirectory/
+
+config BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS
+	string "List of fonts to install"
+	default "droid"
+	depends on BR2_PACKAGE_GOOGLEFONTDIRECTORY
+	help
+	  Specify a space-separated list of fonts to install
diff --git a/package/googlefontdirectory/googlefontdirectory.mk b/package/googlefontdirectory/googlefontdirectory.mk
new file mode 100644
index 0000000..f13c100
--- /dev/null
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -0,0 +1,36 @@
+#############################################################
+#
+# googlefontdirectory
+#
+#############################################################
+GOOGLEFONTDIRECTORY_VERSION = 1.0
+GOOGLEFONTDIRECTORY_SITE = \
+	https://s3.amazonaws.com/joemaller_google_webfonts
+GOOGLEFONTDIRECTORY_SOURCE = googlewebfonts.tgz
+
+GOOGLEFONTDIRECTORY_FONTS = \
+	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
+
+define GOOGLEFONTDIRECTORY_INSTALL_SINGLE_FONT
+	$(info Installing single font $(1))
+	$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$(1)
+	cp -a $(@D)/$(1)/*.ttf	$(TARGET_DIR)/usr/share/fonts/$(1)
+	chmod 0644 $(TARGET_DIR)/usr/share/fonts/$(1)/*.ttf
+endef
+
+define GOOGLEFONTDIRECTORY_UNINSTALL_SINGLE_FONT
+	$(info Uninstalling single font $(1))
+	$(RM) -r $(TARGET_DIR)/usr/share/fonts/$(1)
+endef
+
+define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
+	$(foreach thing,$(GOOGLEFONTDIRECTORY_FONTS),\
+		$(call GOOGLEFONTDIRECTORY_INSTALL_SINGLE_FONT,$(thing)))
+endef
+
+define GOOGLEFONTDIRECTORY_UNINSTALL_TARGET_CMDS
+	$(foreach thing,$(GOOGLEFONTDIRECTORY_FONTS),\
+		$(call GOOGLEFONTDIRECTORY_UNINSTALL_SINGLE_FONT,$(thing)))
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
