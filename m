From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:29:00 +0100
Subject: [Buildroot] [PATCH v4 39/39] package/kodi: add Kconfig options to
	remove default skins
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-40-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The skins estuary and estouchy are new in Kodi 17-Krypton and replace
the skin confluence, used until Kodi 16-Jarvis.

This patch allows to disable one or both of the new skins, it also takes
care that at least one skin needs to be enabled. With this patch Kodi
can be used only with skin confluence.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-skin-confluence/Config.in |  1 +
 package/kodi/Config.in                 | 35 ++++++++++++++++++++
 package/kodi/kodi.mk                   | 58 ++++++++++++++++++++++++++++++++++
 3 files changed, 94 insertions(+)

diff --git a/package/kodi-skin-confluence/Config.in b/package/kodi-skin-confluence/Config.in
index 08b656808..a623b03da 100644
--- a/package/kodi-skin-confluence/Config.in
+++ b/package/kodi-skin-confluence/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_KODI_SKIN_CONFLUENCE
 	bool "kodi-skin-confluence"
+	select BR2_PACKAGE_KODI_SKIN_ENABLED
 	help
 	  Kodi confluence skin
 
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index b93d42bb1..351e625eb 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -64,6 +64,7 @@ menuconfig BR2_PACKAGE_KODI
 	select BR2_PACKAGE_FONTCONFIG
 	select BR2_PACKAGE_FREETYPE
 	select BR2_PACKAGE_GMP
+	select BR2_PACKAGE_KODI_SKIN_ESTUARY if !BR2_PACKAGE_KODI_SKIN_ENABLED
 	select BR2_PACKAGE_LIBASS
 	select BR2_PACKAGE_LIBCDIO
 	select BR2_PACKAGE_LIBCROSSGUID
@@ -329,6 +330,40 @@ menu "Screensavers"
 endmenu
 
 menu "Skins"
+
+config BR2_PACKAGE_KODI_SKIN_ENABLED
+	bool
+
+choice
+	prompt "Default skin"
+
+config BR2_PACKAGE_KODI_SKIN_DEFAULT_ESTUARY
+	bool "kodi-skin-estuary"
+	depends on BR2_PACKAGE_KODI_SKIN_ESTUARY
+
+config BR2_PACKAGE_KODI_SKIN_DEFAULT_ESTOUCHY
+	bool "kodi-skin-estouchy"
+	depends on BR2_PACKAGE_KODI_SKIN_ESTOUCHY
+
+config BR2_PACKAGE_KODI_SKIN_DEFAULT_CONFLUENCE
+	bool "kodi-skin-confluence"
+	depends on BR2_PACKAGE_KODI_SKIN_CONFLUENCE
+
+endchoice
+
+config BR2_PACKAGE_KODI_SKIN_ESTUARY
+	bool "kodi-skin-estuary"
+	default y
+	help
+	  Default skin Estuary
+
+config BR2_PACKAGE_KODI_SKIN_ESTOUCHY
+	bool "kodi-skin-estouchy"
+	default y
+	select BR2_PACKAGE_KODI_SKIN_ENABLED
+	help
+	  Default skin Estouchy
+
 	source "package/kodi-skin-confluence/Config.in"
 endmenu
 
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 7c4695668..1b90ba15e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -348,6 +348,64 @@ define KODI_CLEAN_UNUSED_ADDONS
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_UNUSED_ADDONS
 
+# Skins estuary and estouchy are installed by default and need to be
+# removed if they are disabled in buildroot
+ifeq ($(BR2_PACKAGE_KODI_SKIN_ESTUARY),y)
+define KODI_CLEAN_SKIN_ESTUARY
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.gif -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.jpg -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.png -delete
+endef
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_SKIN_ESTUARY
+else
+define KODI_REMOVE_SKIN_ESTUARY
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary
+	$(HOST_DIR)/usr/bin/xml ed -L \
+		-d "/addons/addon[text()='skin.estuary']" \
+		$(KODI_ADDON_MANIFEST)
+endef
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_REMOVE_SKIN_ESTUARY
+endif
+
+ifeq ($(BR2_PACKAGE_KODI_SKIN_ESTOUCHY),y)
+define KODI_CLEAN_SKIN_ESTOUCHY
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.gif -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.jpg -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.png -delete
+endef
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_SKIN_ESTOUCHY
+else
+define KODI_REMOVE_SKIN_ESTOUCHY
+	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy
+	$(HOST_DIR)/usr/bin/xml ed -L \
+		-d "/addons/addon[text()='skin.estouchy']" \
+		$(KODI_ADDON_MANIFEST)
+endef
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_REMOVE_SKIN_ESTOUCHY
+endif
+
+# The default value 'skin.estuary' is stored in
+# xbmc/system/settings/settings.xml.
+# If skin estuary is disabled this value needs to be changed to avoid
+# https://github.com/xbmc/xbmc/blob/32a6916059a0b14ab5fc65cedb17b2615c039918/xbmc/Application.cpp#L1124
+
+define KODI_SET_DEFAULT_SKIN_ESTOUCHY
+	$(SED) 's/skin.estuary/skin.estouchy/#g' $(TARGET_DIR)/usr/share/kodi/system/settings/settings.xml
+endef
+
+define KODI_SET_DEFAULT_SKIN_CONFLUENCE
+	$(SED) 's/skin.estuary/skin.confluence/#g' $(TARGET_DIR)/usr/share/kodi/system/settings/settings.xml
+	$(HOST_DIR)/usr/bin/xml ed -L -O --subnode "/addons" \
+		-t elem -n "addon" -v "skin.confluence" \
+		$(KODI_ADDON_MANIFEST)
+endef
+
+ifeq ($(BR2_PACKAGE_KODI_SKIN_DEFAULT_ESTOUCHY),y)
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_SET_DEFAULT_SKIN_ESTOUCHY
+else ifeq ($(BR2_PACKAGE_KODI_SKIN_DEFAULT_CONFLUENCE),y)
+KODI_POST_INSTALL_TARGET_HOOKS += KODI_SET_DEFAULT_SKIN_CONFLUENCE
+endif
+
 define KODI_INSTALL_BR_WRAPPER
 	$(INSTALL) -D -m 0755 package/kodi/br-kodi \
 		$(TARGET_DIR)/usr/bin/br-kodi
-- 
2.11.0
