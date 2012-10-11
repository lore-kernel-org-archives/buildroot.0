From: Peter Korsgaard <jacmet@sunsite.dk>
Date: Thu, 11 Oct 2012 22:22:09 +0200
Subject: [Buildroot] [git commit] googlefontdirectory: new package
Message-ID: <20121011202903.38C5E99836@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=dfaf64fe5a1d6346708c3cc94171a4a500f0b236
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Note that the Google code project does not provide an archive containing
just the font files. This package uses the third party archive provided at

  http://joemaller.com/1856/download-google-fonts/

Further information is available at the following URL.

  http://code.google.com/p/googlefontdirectory/issues/detail?id=2

[Peter: drop version, fix install and simplify uninstall]
Signed-off-by: Simon Dawson <spdawson@gmail.com>
Signed-off-by: Peter Korsgaard <jacmet@sunsite.dk>
---
 package/Config.in                                  |    1 +
 package/googlefontdirectory/Config.in              |   13 +++++++++
 package/googlefontdirectory/googlefontdirectory.mk |   27 ++++++++++++++++++++
 3 files changed, 41 insertions(+), 0 deletions(-)

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
index 0000000..ddc832a
--- /dev/null
+++ b/package/googlefontdirectory/googlefontdirectory.mk
@@ -0,0 +1,27 @@
+#############################################################
+#
+# googlefontdirectory
+#
+#############################################################
+
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
+		$(INSTALL) -m 0644 -t $(TARGET_DIR)/usr/share/fonts/$$i $(@D)/$$i/*.ttf; \
+	done
+endef
+
+define GOOGLEFONTDIRECTORY_UNINSTALL_TARGET_CMDS
+	rm -rf $(addprefix $(TARGET_DIR)/usr/share/fonts/,$(GOOGLEFONTDIRECTORY_FONTS))
+endef
+
+$(eval $(generic-package))
