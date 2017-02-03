From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  3 Feb 2017 17:20:31 +0100
Subject: [Buildroot] [PATCH v2 37/38] package/kodi: add Kconfig option to
	make TexturePacker optional
In-Reply-To: <20170203162032.2923-1-bernd.kuhls@t-online.de>
References: <20170203162032.2923-1-bernd.kuhls@t-online.de>
Message-ID: <20170203162032.2923-38-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi uses a tool named TexturePacker to compile all images used in a
skin into a single file. The benefit of it is that images inside the
Textures.xbt will load faster in the skin. This is done by converting
all images into a format that take less processing by Kodi when they
need to be rendered onto the screen.

Previously this was done by default, this patch provides support for
the corresponding configure options in Kodi while still taking care
to remove the original media files when TexturePacker support is
enabled, also add this to package kodi-skin-confluence.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 .../kodi-skin-confluence/kodi-skin-confluence.mk   | 11 +++++++
 package/kodi/Config.in                             | 15 ++++++++++
 package/kodi/kodi.mk                               | 34 ++++++++++++++++------
 3 files changed, 51 insertions(+), 9 deletions(-)

diff --git a/package/kodi-skin-confluence/kodi-skin-confluence.mk b/package/kodi-skin-confluence/kodi-skin-confluence.mk
index 65f27150a..8ffa817a3 100644
--- a/package/kodi-skin-confluence/kodi-skin-confluence.mk
+++ b/package/kodi-skin-confluence/kodi-skin-confluence.mk
@@ -10,9 +10,20 @@ KODI_SKIN_CONFLUENCE_LICENSE = GPLv2+
 KODI_SKIN_CONFLUENCE_LICENSE_FILES = COPYING
 KODI_SKIN_CONFLUENCE_DEPENDENCIES = kodi
 
+ifeq ($(BR2_PACKAGE_KODI_TEXTUREPACKER),y)
+define KODI_SKIN_CONFLUENCE_BUILD_CMDS
+	$(HOST_DIR)/usr/bin/TexturePacker -input $(@D)/media/ -output $(@D)/media/Textures.xbt -dupecheck -use_none
+endef
+define KODI_SKIN_CONFLUENCE_CLEAN
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.jpg -delete
+	find $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence/media -name *.png -delete
+endef
+endif
+
 define KODI_SKIN_CONFLUENCE_INSTALL_TARGET_CMDS
 	mkdir -p $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
 	cp -dpfr $(@D)/* $(TARGET_DIR)/usr/share/kodi/addons/skin.confluence
+	$(KODI_SKIN_CONFLUENCE_CLEAN)
 endef
 
 $(eval $(generic-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 40b9cfb36..67435d34f 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -345,6 +345,21 @@ config BR2_PACKAGE_KODI_SKIN_DEFAULT_CONFLUENCE
 
 endchoice
 
+config BR2_PACKAGE_KODI_TEXTUREPACKER
+	bool "kodi-texturepacker"
+	default y
+	help
+	  Kodi uses a tool named TexturePacker to compile all images
+	  used in a skin into a single file. The benefit of it is that
+	  images inside the Textures.xbt will load faster in the skin.
+	  This is done by converting all images into a format that take
+	  less processing by Kodi when they need to be rendered onto the
+	  screen.
+
+	  http://kodi.wiki/view/TexturePacker
+
+comment "Skins"
+
 config BR2_PACKAGE_KODI_SKIN_ESTUARY
 	bool "kodi-skin-estuary"
 	default y
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index d86ac6d36..f9e7434aa 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -18,11 +18,7 @@ KODI_DEPENDENCIES = \
 	freetype \
 	host-gawk \
 	host-gettext \
-	host-giflib \
 	host-gperf \
-	host-libjpeg \
-	host-libpng \
-	host-lzo \
 	host-nasm \
 	host-swig \
 	host-xmlstarlet \
@@ -53,10 +49,7 @@ KODI_CONF_ENV = \
 	PYTHON_LDFLAGS="-lpython$(PYTHON_VERSION_MAJOR) -lpthread -ldl -lutil -lm" \
 	PYTHON_CPPFLAGS="-I$(STAGING_DIR)/usr/include/python$(PYTHON_VERSION_MAJOR)" \
 	PYTHON_SITE_PKG="$(STAGING_DIR)/usr/lib/python$(PYTHON_VERSION_MAJOR)/site-packages" \
-	PYTHON_NOVERSIONCHECK="no-check" \
-	use_texturepacker_native=yes \
-	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
-	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
+	PYTHON_NOVERSIONCHECK="no-check"
 
 KODI_MAKE_ENV = \
 	DVD_PREFIX="$(STAGING_DIR)"
@@ -286,11 +279,30 @@ endif
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define KODI_BOOTSTRAP
 	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/JsonSchemaBuilder
-	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/TexturePacker
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
 endef
 KODI_PRE_CONFIGURE_HOOKS += KODI_BOOTSTRAP
 
+ifeq ($(BR2_PACKAGE_KODI_TEXTUREPACKER),y)
+KODI_DEPENDENCIES += \
+	host-giflib \
+	host-libjpeg \
+	host-libpng \
+	host-lzo
+KODI_CONF_ENV += \
+	use_texturepacker_native=yes \
+	USE_TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr" \
+	TEXTUREPACKER_NATIVE_ROOT="$(HOST_DIR)/usr"
+define KODI_BUILD_TEXTUREPACKER
+	$(HOST_CONFIGURE_OPTS) $(MAKE) -C $(@D)/tools/depends/native/TexturePacker
+	$(INSTALL) -m 755 -D $(@D)/tools/depends/native/TexturePacker/bin/TexturePacker $(HOST_DIR)/usr/bin/TexturePacker
+endef
+KODI_PRE_CONFIGURE_HOOKS += KODI_BUILD_TEXTUREPACKER
+KODI_CONF_OPTS += --enable-texturepacker
+else
+KODI_CONF_OPTS += --disable-texturepacker
+endif
+
 # Remove versioncheck addon, updating Kodi is done by building a new
 # buildroot image.
 
@@ -306,12 +318,14 @@ KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_UNUSED_ADDONS
 # Skins estuary and estouchy are installed by default and need to be
 # removed if they are disabled in buildroot
 ifeq ($(BR2_PACKAGE_KODI_SKIN_ESTUARY),y)
+ifeq ($(BR2_PACKAGE_KODI_TEXTUREPACKER),y)
 define KODI_CLEAN_SKIN_ESTUARY
 	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.gif -delete
 	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.jpg -delete
 	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary/media -name *.png -delete
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_SKIN_ESTUARY
+endif
 else
 define KODI_REMOVE_SKIN_ESTUARY
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/skin.estuary
@@ -323,12 +337,14 @@ KODI_POST_INSTALL_TARGET_HOOKS += KODI_REMOVE_SKIN_ESTUARY
 endif
 
 ifeq ($(BR2_PACKAGE_KODI_SKIN_ESTOUCHY),y)
+ifeq ($(BR2_PACKAGE_KODI_TEXTUREPACKER),y)
 define KODI_CLEAN_SKIN_ESTOUCHY
 	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.gif -delete
 	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.jpg -delete
 	find $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy/media -name *.png -delete
 endef
 KODI_POST_INSTALL_TARGET_HOOKS += KODI_CLEAN_SKIN_ESTOUCHY
+endif
 else
 define KODI_REMOVE_SKIN_ESTOUCHY
 	rm -Rf $(TARGET_DIR)/usr/share/kodi/addons/skin.estouchy
-- 
2.11.0
