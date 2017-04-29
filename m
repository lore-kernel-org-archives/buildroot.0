From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 29 Apr 2017 13:47:45 +0200
Subject: [Buildroot] [git commit] package/kodi: add optional support for
	pulseaudio
Message-ID: <20170429115125.78BB282543@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=ff45194b3c61a5b88b3cac047b16ba85bef8a15e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/kodi/Config.in | 11 +++++++++++
 package/kodi/kodi.mk   |  7 +++++++
 2 files changed, 18 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index bf4ea01..fc40343 100644
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
index a4835f0..12dc311 100644
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
