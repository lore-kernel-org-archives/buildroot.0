From: spdawson at gmail.com <spdawson@gmail.com>
Date: Thu, 11 Oct 2012 10:28:05 +0100
Subject: [Buildroot] [PATCH v2] googlefontdirectory: new package
Message-ID: <1349947685-7261-1-git-send-email-spdawson@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Simon Dawson <spdawson@gmail.com>

Note that the Google code project does not provide an archive containing
just the font files. This package uses the third party archive provided at

  http://joemaller.com/1856/download-google-fonts/

Further information is available at the following URL.

  http://code.google.com/p/googlefontdirectory/issues/detail?id=2

Signed-off-by: Simon Dawson <spdawson@gmail.com>
---
 v2: Incorporate improvements suggested by Peter Korsgaard

 package/Config.in                                  |    1 +
 package/googlefontdirectory/Config.in              |   13 +++++++++
 package/googlefontdirectory/googlefontdirectory.mk |   28 ++++++++++++++++++++
 3 files changed, 42 insertions(+)
 create mode 100644 package/googlefontdirectory/Config.in
 create mode 100644 package/googlefontdirectory/googlefontdirectory.mk

diff --git a/package/Config.in b/package/Config.in
index fc6a26a..c56f438 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -519,6 +519,7 @@ endmenu
 menu "Miscellaneous"
 source "package/collectd/Config.in"
 source "package/empty/Config.in"
+source "package/googlefontdirectory/Config.in"
 source "package/mobile-broadband-provider-info/Config.in"
 source "package/shared-mime-info/Config.in"
 source "package/sound-theme-borealis/Config.in"
diff --git a/package/googlefontdirectory/Config.in b/package/googlefontdirectory/Config.in
new file mode 100644
index 0000000..872fe27
--- /dev/null
+++ b/package/googlefontdirectory/Config.in
@@ -0,0 +1,13 @@
+config BR2_PACKAGE_GOOGLEFONTDIRECTORY
+	bool "Google font directory"
+	help
+	  Google font directory
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
index 0000000..9377936
--- /dev/null
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -0,0 +1,28 @@
+#############################################################
+#
+# googlefontdirectory
+#
+#############################################################
+GOOGLEFONTDIRECTORY_VERSION = 1.0
+GOOGLEFONTDIRECTORY_SITE = \
+	https://s3.amazonaws.com/joemaller_google_webfonts
+GOOGLEFONTDIRECTORY_SOURCE = googlewebfonts.tgz
+GOOGLEFONTDIRECTORY_LICENSE = OFLv1.1
+
+GOOGLEFONTDIRECTORY_FONTS = \
+	$(call qstrip,$(BR2_PACKAGE_GOOGLEFONTDIRECTORY_FONTS))
+
+define GOOGLEFONTDIRECTORY_INSTALL_TARGET_CMDS
+	for i in $(GOOGLEFONTDIRECTORY_FONTS); \
+	do \
+		$(INSTALL) -d $(TARGET_DIR)/usr/share/fonts/$$i && \
+		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf \
+	done
+endef
+
+define GOOGLEFONTDIRECTORY_UNINSTALL_TARGET_CMDS
+	$(RM) -r \
+	$(foreach i,$(GOOGLEFONTDIRECTORY_FONTS),$(TARGET_DIR)/usr/share/fonts/$(i))
+endef
+
+$(eval $(generic-package))
-- 
1.7.9.5
