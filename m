From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Wed, 23 Jul 2014 06:40:24 +0200
Subject: [Buildroot] [PATCH v15 8/9] xbmc: Add option for Goom screensaver
In-Reply-To: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406090425-5925-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406090425-5925-9-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |    9 +++++++++
 package/xbmc/xbmc.mk   |    6 ++++++
 2 files changed, 15 insertions(+)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 08b0a0f..a31788c 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -194,6 +194,15 @@ config BR2_PACKAGE_XBMC_WAVPACK
 	  Enable WAV input support.
 	  Select this if you want to play back WV files.
 
+config BR2_PACKAGE_XBMC_GOOM
+	bool "goom screensaver"
+	depends on BR2_PACKAGE_XBMC_GL
+	help
+	  Enable goom screensaver
+
+comment "goom needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XBMC_GL
+
 comment "XBMC addons"
 
 source "package/xbmc-addon-xvdr/Config.in"
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 82158ae..a1fb022 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -183,6 +183,12 @@ ifeq ($(BR2_PACKAGE_XBMC_LIBTHEORA),y)
 XBMC_DEPENDENCIES += libtheora
 endif
 
+ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
+XBMC_CONF_OPT += --enable-goom
+else
+XBMC_CONF_OPT += --disable-goom
+endif
+
 # Add HOST_DIR to PATH for codegenerator.mk to find swig
 define XBMC_BOOTSTRAP
 	cd $(@D) && PATH=$(BR_PATH) ./bootstrap
-- 
1.7.10.4
