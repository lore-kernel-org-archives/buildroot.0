From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 13:14:10 +0200
Subject: [Buildroot] [PATCH v8 1/1] package/kodi: add optional support for
	pulseaudio
Message-ID: <20170429111410.29929-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
v8: exteneded comment about libglib2 dependency and its role in Kodi
    (Thomas)

 package/kodi/Config.in | 11 +++++++++++
 package/kodi/kodi.mk   |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bf4ea01549..fc403432fd 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -192,6 +192,17 @@ config BR2_PACKAGE_KODI_NONFREE
 	  Enable components with non-free licenses. This option
 	  currently only controls support for RAR archives.
 
+config BR2_PACKAGE_KODI_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
+	# Pulseaudio support in kodi needs glib support in Pulseaudio,
+	# see FindPulseAudio.cmake. Kodi meets all dependencies of
+	# libglib2, so there is no need to propagate them here.
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable Pulseaudio support.
+
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
 	select BR2_PACKAGE_LIBSHAIRPLAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index a4835f0207..12dc3117f8 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -333,6 +333,13 @@ else
 KODI_CONF_OPTS += -DENABLE_OPTICAL=OFF
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_PULSEAUDIO),y)
+KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=ON
+KODI_DEPENDENCIES += pulseaudio
+else
+KODI_CONF_OPTS += -DENABLE_PULSEAUDIO=OFF
+endif
+
 # Remove versioncheck addon, updating Kodi is done by building a new
 # buildroot image.
 KODI_ADDON_MANIFEST = $(TARGET_DIR)/usr/share/kodi/system/addon-manifest.xml
-- 
2.11.0
