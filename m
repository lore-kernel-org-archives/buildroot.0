From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Thu, 4 May 2017 21:09:08 +0200
Subject: [Buildroot] [git commit] package/kodi-skin-confluence: new package
Message-ID: <20170504190932.C87E082899@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=97bebe2d00141bdd6613cbfa7990767468fb55b2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Reviewed-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Tested-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
[Thomas:
 - use SPDX license code
 - license is GPL-2.0, not GPL-2.0+
 - remove unused _CONF_OPTS variable]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi-skin-confluence/Config.in             |  6 ++++++
 .../kodi-skin-confluence/kodi-skin-confluence.hash |  2 ++
 .../kodi-skin-confluence/kodi-skin-confluence.mk   | 24 ++++++++++++++++++++++
 package/kodi/Config.in                             |  4 ++++
 4 files changed, 36 insertions(+)

diff --git a/package/kodi-skin-confluence/Config.in b/package/kodi-skin-confluence/Config.in
new file mode 100644
index 0000000..08b6568
--- /dev/null
+++ b/package/kodi-skin-confluence/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_KODI_SKIN_CONFLUENCE
+	bool "kodi-skin-confluence"
+	help
+	  Kodi confluence skin
+
+	  https://github.com/xbmc/skin.confluence
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.hash b/package/kodi-skin-confluence/kodi-skin-confluence.hash
new file mode 100644
index 0000000..9aa2ea4
--- /dev/null
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.hash
@@ -0,0 +1,2 @@
+# Locally computed
+sha256 47970d61b2f617921dfbc36188ed11de9af366cd97d9105e19cbe96598fe7b62  kodi-skin-confluence-7044dabb3a818d7ff47b7a34bfb3480f2a9441d9.tar.gz
diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
new file mode 100644
index 0000000..5078a80
--- /dev/null
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -0,0 +1,24 @@
+################################################################################
+#
+# kodi-skin-confluence
+#
+################################################################################
+
+KODI_SKIN_CONFLUENCE_VERSION = 7044dabb3a818d7ff47b7a34bfb3480f2a9441d9
+KODI_SKIN_CONFLUENCE_SITE = $(call github,xbmc,skin.confluence,$(KODI_SKIN_CONFLUENCE_VERSION))
+KODI_SKIN_CONFLUENCE_LICENSE = GPL-2.0
+KODI_SKIN_CONFLUENCE_LICENSE_FILES = LICENSE.txt
+KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
+
+define KODI_SKIN_CONFLUENCE_BUILD_CMDS
+	$(HOST_DIR)/usr/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
+endef
+
+define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
+	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
+	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
+endef
+
+$(eval $(generic-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e7156c7..6586701 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -328,6 +328,10 @@ menu "Screensavers"
 	source "package/kodi-screensaver-stars/Config.in"
 endmenu
 
+menu "Skins"
+	source "package/kodi-skin-confluence/Config.in"
+endmenu
+
 menu "Visualisations"
 	source "package/kodi-visualisation-fishbmc/Config.in"
 	source "package/kodi-visualisation-goom/Config.in"
