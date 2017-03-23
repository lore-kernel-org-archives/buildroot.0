From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Thu, 23 Mar 2017 18:28:40 +0100
Subject: [Buildroot] [PATCH v4 19/39] package/kodi: add optional support for
	pulseaudio
In-Reply-To: <20170323172900.25458-1-bernd.kuhls@t-online.de>
References: <20170323172900.25458-1-bernd.kuhls@t-online.de>
Message-ID: <20170323172900.25458-20-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in | 6 ++++++
 package/kodi/kodi.mk   | 7 +++++++
 2 files changed, 13 insertions(+)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 9537c0f7e..835af932c 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -188,6 +188,12 @@ config BR2_PACKAGE_KODI_NONFREE
 	  Enable components with non-free licenses. This option
 	  currently only controls support for RAR archives.
 
+config BR2_PACKAGE_KODI_PULSEAUDIO
+	bool "pulseaudio"
+	select BR2_PACKAGE_PULSEAUDIO
+	help
+	  Enable Pulseaudio support.
+
 config BR2_PACKAGE_KODI_LIBSHAIRPLAY
 	bool "shairport"
 	select BR2_PACKAGE_LIBSHAIRPLAY
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index af8836992..3fba83aa9 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -317,6 +317,13 @@ else
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
