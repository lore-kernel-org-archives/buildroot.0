From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Jul 2015 21:05:36 +0200
Subject: [Buildroot] [PATCH/RFC v3 31/50] package/kodi-audiodecoder-modplug:
	new package
In-Reply-To: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
References: <1437332755-9764-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1437332755-9764-32-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi-audiodecoder-modplug/Config.in           |    8 ++++++++
 .../kodi-audiodecoder-modplug.mk                      |   17 +++++++++++++++++
 package/kodi/Config.in                                |    4 ++++
 3 files changed, 29 insertions(+)
 create mode 100644 package/kodi-audiodecoder-modplug/Config.in
 create mode 100644 package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk

diff --git a/package/kodi-audiodecoder-modplug/Config.in b/package/kodi-audiodecoder-modplug/Config.in
new file mode 100644
index 0000000..0269973
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/Config.in
@@ -0,0 +1,8 @@
+config BR2_PACKAGE_KODI_AUDIODECODER_MODPLUG
+	bool "kodi-audiodecoder-modplug"
+	select BR2_PACKAGE_KODI_PLATFORM
+	select BR2_PACKAGE_LIBMODPLUG
+	help
+	  Modplug decoder addon for Kodi
+
+	  https://github.com/notspiff/audiodecoder.modplug
diff --git a/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
new file mode 100644
index 0000000..69cb622
--- /dev/null
+++ b/package/kodi-audiodecoder-modplug/kodi-audiodecoder-modplug.mk
@@ -0,0 +1,17 @@
+################################################################################
+#
+# kodi-audiodecoder-modplug
+#
+################################################################################
+
+KODI_AUDIODECODER_MODPLUG_VERSION = 5ae7349f39a8e5552c86dfdad339fb18c7e52550
+KODI_AUDIODECODER_MODPLUG_SITE = $(call github,notspiff,audiodecoder.modplug,$(KODI_AUDIODECODER_MODPLUG_VERSION))
+KODI_AUDIODECODER_MODPLUG_LICENSE = GPLv2+
+KODI_AUDIODECODER_MODPLUG_LICENSE_FILES = src/ModplugCodec.cpp
+
+KODI_AUDIODECODER_MODPLUG_DEPENDENCIES = kodi-platform libmodplug
+
+KODI_AUDIODECODER_MODPLUG_CONF_OPTS += \
+	-DCMAKE_MODULE_PATH=$(STAGING_DIR)/usr/lib/kodi
+
+$(eval $(cmake-package))
diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index e3a9393..f7041c3 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -271,6 +271,10 @@ menu "PVR addons"
 	source "package/kodi-pvr-wmc/Config.in"
 endmenu
 
+menu "Audio decoder addons"
+	source "package/kodi-audiodecoder-modplug/Config.in"
+endmenu
+
 menu "Audio encoder addons"
 	source "package/kodi-audioencoder-flac/Config.in"
 	source "package/kodi-audioencoder-lame/Config.in"
-- 
1.7.10.4
