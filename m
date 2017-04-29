From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 29 Apr 2017 10:37:44 +0200
Subject: [Buildroot] [PATCH v7 24/31] package/kodi: add optional support for
	pulseaudio
In-Reply-To: <20170429083751.19625-1-bernd.kuhls@t-online.de>
References: <20170429083751.19625-1-bernd.kuhls@t-online.de>
Message-ID: <20170429083751.19625-25-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 10 ++++++++++
 package/kodi/kodi.mk   |  7 +++++++
 2 files changed, 17 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 5dd41652a2..6768533d0c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -178,6 +178,16 @@ config BR2_PACKAGE_KODI_NONFREE
 	  Enable components with non-free licenses. This option
 	  currently only controls support for RAR archives.
 
+config BR2_PACKAGE_KODI_PULSEAUDIO
+	bool "pulseaudio"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # pulseaudio -> json-c
+	# Kodi meets all dependencies of libglib2, so there is no need
+	# to propagate its dependencies here.
+	select BR2_PACKAGE_LIBGLIB2
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable Pulseaudio support.
+
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
 	select BR2_PACKAGE_LIBSHAIRPLAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 3a8f08d449..483f798b2e 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -320,6 +320,13 @@ else
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
