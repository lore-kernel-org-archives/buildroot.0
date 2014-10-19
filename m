From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 19 Oct 2014 18:54:31 +0200
Subject: [Buildroot] [RFC/PATCH v4 07/12] package/kodi: New option to enable
	support for optical drives
In-Reply-To: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
References: <1413737676-25455-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1413737676-25455-8-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This also enables dvdcss support, provided by an internal library.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/kodi/Config.in |    5 +++++
 package/kodi/kodi.mk   |    7 ++++++-
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/package/kodi/Config.in b/package/kodi/Config.in
index 2dcd8b3..ececca4 100644
--- a/package/kodi/Config.in
+++ b/package/kodi/Config.in
@@ -235,6 +235,11 @@ config BR2_PACKAGE_KODI_WAVPACK
 	  Enable WAV input support.
 	  Select this if you want to play back WV files.
 
+config BR2_PACKAGE_KODI_OPTICALDRIVE
+	bool "optical drive"
+	help
+	  Enable support for optical drives
+
 comment "Kodi addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 2ca98c4..014b1a9 100644
--- a/package/kodi/kodi.mk
+++ b/package/kodi/kodi.mk
@@ -38,7 +38,6 @@ KODI_CONF_OPTS +=  \
 	--disable-joystick \
 	--disable-mysql \
 	--disable-openmax \
-	--disable-optical-drive \
 	--disable-projectm \
 	--disable-pulse \
 	--disable-ssh \
@@ -183,6 +182,12 @@ else
 KODI_CONF_OPTS += --disable-vaapi
 endif
 
+ifeq ($(BR2_PACKAGE_KODI_OPTICALDRIVE),y)
+KODI_CONF_OPTS += --enable-optical-drive --enable-dvdcss
+else
+KODI_CONF_OPTS += --disable-optical-drive --disable-dvdcss
+endif
+
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define KODI_BOOTSTRAP
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
-- 
1.7.10.4
