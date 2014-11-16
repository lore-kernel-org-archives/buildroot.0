From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 16 Nov 2014 20:44:25 +0100
Subject: [Buildroot] [RFC/PATCH v6 12/17] package/kodi: New option to enable
	support for optical drives
In-Reply-To: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
References: <1416167070-27299-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1416167070-27299-13-git-send-email-bernd.kuhls@t-online.de>
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
index ed89936..c153fed 100644
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
 
 source "package/kodi-addon-xvdr/Config.in"
diff --git a/package/kodi/kodi.mk b/package/kodi/kodi.mk
index 6ad1472..16eacd5 100644
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
@@ -190,6 +189,12 @@ else
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
