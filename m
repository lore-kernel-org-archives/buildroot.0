From: jeremie.scheer at armadeus.com <jeremie.scheer@armadeus.com>
Date: Tue,  4 Mar 2014 14:35:00 +0100
Subject: [Buildroot] [PATCH] Add package Marble
Message-ID: <1393940100-15788-1-git-send-email-jeremie.scheer@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Jeremie Scheer <jeremie.scheer@armadeus.com>


Signed-off-by: Jeremie Scheer <jeremie.scheer@armadeus.com>
---
 package/Config.in        |    3 +-
 package/marble/Config.in |  145 ++++++++++++++++++++++++++++
 package/marble/marble.mk |  238 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 385 insertions(+), 1 deletion(-)
 create mode 100644 package/marble/Config.in
 create mode 100644 package/marble/marble.mk

diff --git a/package/Config.in b/package/Config.in
index 417c9b8..19a48a4 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -199,8 +199,9 @@ source "package/sdl_sound/Config.in"
 source "package/sdl_ttf/Config.in"
 
 comment "Other GUIs"
-source "package/efl/Config.in"
+source "package/marble/Config.in"
 source "package/qt/Config.in"
+source "package/efl/Config.in"
 
 if BR2_PACKAGE_QT
 comment "QT libraries and helper libraries"
diff --git a/package/marble/Config.in b/package/marble/Config.in
new file mode 100644
index 0000000..282ed34
--- /dev/null
+++ b/package/marble/Config.in
@@ -0,0 +1,145 @@
+comment "Marble needs Qt to be installed"
+	depends on !BR2_PACKAGE_QT
+
+menuconfig BR2_PACKAGE_MARBLE
+	bool "KDE Marble"
+	depends on BR2_PACKAGE_QT
+	select BR2_PACKAGE_QT_SCRIPT
+	select BR2_PACKAGE_QT_SVG
+	select BR2_PACKAGE_QT_WEBKIT
+	select BR2_PACKAGE_QT_XML
+	help
+	  Compile & install KDE Marble for
+	  geolocalization applications.
+
+if BR2_PACKAGE_MARBLE
+
+config BR2_PACKAGE_MARBLE_BINARY
+	bool "Marble binary"
+	help
+	  Install Marble binary on target
+
+config BR2_PACKAGE_MARBLE_AUDIO
+	bool "Audio files"
+	help
+	  Install audio files on target
+
+config BR2_PACKAGE_MARBLE_BITMAPS
+	bool "Bitmaps"
+	help
+	  Install bitmaps on target
+
+config BR2_PACKAGE_MARBLE_FLAGS
+	bool "Flags"
+	help
+	  Install flags on target
+
+menu "Maps"
+
+menu "Earth maps"
+
+config BR2_PACKAGE_MARBLE_BLUEMARBLE
+	bool "Bluemarble"
+	help
+	  Install Bluemarble map on target
+
+config BR2_PACKAGE_MARBLE_CITYLIGHTS
+	bool "Citylights"
+	help
+	  Install Citylights map on target
+
+config BR2_PACKAGE_MARBLE_CLOUDS
+	bool "Clouds"
+	help
+	  Install Clouds map on target
+
+config BR2_PACKAGE_MARBLE_HILLSHADING
+	bool "Hillshading"
+	help
+	  Install Hillshading map on target
+
+config BR2_PACKAGE_MARBLE_OPENSTREETMAP
+	bool "OpenStreetMap"
+	help
+	  Install Openstreetmap map on target
+
+config BR2_PACKAGE_MARBLE_PLAIN
+	bool "Plain"
+	help
+	  Install Plain map on target
+
+config BR2_PACKAGE_MARBLE_PRECIP_DEC
+	bool "December precipitations"
+	help
+	  Install December precipitation map on target
+
+config BR2_PACKAGE_MARBLE_PRECIP_JULY
+	bool "July precipitations"
+	help
+	  Install July precipitation map on target
+
+config BR2_PACKAGE_MARBLE_SCHAGEN
+	bool "Schagen 1689"
+	help
+	  Install Schagen 1689 map on target
+
+config BR2_PACKAGE_MARBLE_SRTM
+	bool "SRTM"
+	help
+	  Install SRTM map on target
+
+config BR2_PACKAGE_MARBLE_SRTM2
+	bool "SRTM 2"
+	help
+	  Install SRTM 2 map on target
+
+config BR2_PACKAGE_MARBLE_TEMP_DEC
+	bool "December temperatures"
+	help
+	  Install December temperature map on target
+
+config BR2_PACKAGE_MARBLE_TEMP_JULY
+	bool "July temperatures"
+	help
+	  Install July temperature map on target
+
+endmenu #Earth maps
+
+menu "Moon maps"
+
+config BR2_PACKAGE_MARBLE_CLEMENTINE
+	bool "Clementine"
+	help
+	  Install Clementine map on target
+
+endmenu #Moon maps
+
+endmenu #Maps
+
+config BR2_PACKAGE_MARBLE_MWDBII
+	bool "MWDBII files"
+	help
+	  Install MWDBII files on target
+
+config BR2_PACKAGE_MARBLE_PLACEMARKS
+	bool "Placemarks"
+	help
+	  Install placemarks on target
+
+config BR2_PACKAGE_MARBLE_STARS
+	bool "Stars"
+	help
+	  Install star data on target
+
+config BR2_PACKAGE_MARBLE_SVG
+	bool "SVG files"
+	help
+	  Install SVG files on target
+
+config BR2_PACKAGE_MARBLE_WEATHER
+	bool "Weather data"
+	help
+	  Install weather data on target
+
+endif #BR2_PACKAGE_MARBLE
+
diff --git a/package/marble/marble.mk b/package/marble/marble.mk
new file mode 100644
index 0000000..54d1c0e
--- /dev/null
+++ b/package/marble/marble.mk
@@ -0,0 +1,238 @@
+#############################################################
+#
+# KDE Marble
+#
+#############################################################
+MARBLE_VERSION = 88ba87c90195dede8594375b2f81c9d926db3924
+MARBLE_SOURCE = marble-$(MARBLE_VERSION)-source.tar.gz
+MARBLE_SITE = git://anongit.kde.org/marble.git
+MARBLE_SITE_METHOD = git
+
+MARBLE_DEPENDENCIES = qt
+
+MARBLE_CONF_OPT += -DQTONLY=ON
+MARBLE_CONF_OPT += -DTILES_AT_COMPILETIME=OFF
+
+define MARBLE_CONFIGURE_CMDS
+	(cd $(@D) && \
+	rm -f CMakeCache.txt && \
+	$(HOST_DIR)/usr/bin/cmake $(@D) \
+		-DCMAKE_TOOLCHAIN_FILE="$(BASE_DIR)/host/usr/share/buildroot/toolchainfile.cmake" \
+		$(MARBLE_CONF_OPT) \
+	)
+endef
+
+define MARBLE_BUILD_CMDS
+	$(MAKE) -C $(@D)
+endef
+
+MARBLE_INSTALL_STAGING = YES
+
+define MARBLE_CLEAN_TARGET_INSTALL
+	rm -rf $(TARGET_DIR)/usr/local/share/marble/data/*
+	rm -rf $(TARGET_DIR)/usr/local/include/marble
+	rm -rf $(TARGET_DIR)/usr/local/bin/marble
+endef
+
+define MARBLE_INSTALL_BINARY
+	cp -rf $(STAGING_DIR)/usr/local/bin/marble $(TARGET_DIR)/usr/local/bin
+endef
+
+define MARBLE_INSTALL_AUDIO_FILES
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/audio $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_BITMAPS
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/bitmaps $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_FLAGS
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/flags $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_BLUEMARBLE_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/bluemarble $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_CITYLIGHTS_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/citylights $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_CLOUDS_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/clouds $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_HILLSHADING_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/hillshading $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_OPENSTREETMAP_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/openstreetmap $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_PLAIN_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/plain $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_PRECIP_DEC_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/precip-dec $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_PRECIP_JULY_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/precip-july $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_SCHAGEN_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/schagen1689 $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_SRTM_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/srtm $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_SRTM2_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/srtm2 $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_TEMP_DEC_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/temp-dec $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_TEMP_JULY_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/earth/temp-july $(TARGET_DIR)/usr/local/share/marble/data/maps/earth
+endef
+
+define MARBLE_INSTALL_CLEMENTINE_MAP
+	mkdir -p $(TARGET_DIR)/usr/local/share/marble/data/maps/moon
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/maps/moon/clementine $(TARGET_DIR)/usr/local/share/marble/data/maps/moon
+endef
+
+define MARBLE_INSTALL_MWDBII_FILES
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/mwdbii $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_PLACEMARKS
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/placemarks $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_STARS_DATA
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/stars $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_SVG
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/svg $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+define MARBLE_INSTALL_WEATHER_DATA
+	cp -rf $(STAGING_DIR)/usr/local/share/marble/data/weather $(TARGET_DIR)/usr/local/share/marble/data
+endef
+
+
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_CLEAN_TARGET_INSTALL
+
+ifeq ($(BR2_PACKAGE_MARBLE_BINARY),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BINARY
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_AUDIO),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_AUDIO_FILES
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_BITMAPS),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BITMAPS
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_FLAGS),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_FLAGS
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_BLUEMARBLE),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_BLUEMARBLE_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_CITYLIGHTS),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CITYLIGHTS_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_CLOUDS),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CLOUDS_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_HILLSHADING),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_HILLSHADING_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_OPENSTREETMAP),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_OPENSTREETMAP_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_PLAIN),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PLAIN_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_PRECIP_DEC),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PRECIP_DEC_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_PRECIP_JULY),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PRECIP_JULY_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_SCHAGEN),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SCHAGEN_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_SRTM),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SRTM_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_SRTM2),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SRTM2_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_TEMP_DEC),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_TEMP_DEC_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_TEMP_JULY),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_TEMP_JULY_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_CLEMENTINE),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_CLEMENTINE_MAP
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_MWDBII),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_MWDBII_FILES
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_PLACEMARKS),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_PLACEMARKS
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_STARS),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_STARS_DATA
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_SVG),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_SVG
+endif
+
+ifeq ($(BR2_PACKAGE_MARBLE_WEATHER),y)
+MARBLE_POST_INSTALL_TARGET_HOOKS += MARBLE_INSTALL_WEATHER_DATA
+endif
+
+$(eval $(cmake-package))
-- 
1.7.9.5
