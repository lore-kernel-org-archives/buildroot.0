From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Fri,  1 Aug 2014 19:32:38 +0200
Subject: [Buildroot] [PATCH v16 2/3] xbmc: Add option for Goom screensaver
In-Reply-To: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
References: <1406914359-31106-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1406914359-31106-3-git-send-email-bernd.kuhls@t-online.de>
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
index 04bc86f..6a00531 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -128,6 +128,15 @@ config BR2_PACKAGE_XBMC_LIBBLURAY
 comment "libbluray support needs a toolchain w/ dynamic library"
 	depends on BR2_PREFER_STATIC_LIB
 
+config BR2_PACKAGE_XBMC_GOOM
+	bool "goom screensaver"
+	depends on BR2_PACKAGE_XBMC_GL
+	help
+	  Enable goom screensaver
+
+comment "goom needs an OpenGL backend"
+	depends on !BR2_PACKAGE_XBMC_GL
+
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index c868b59..920d731 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -109,6 +109,12 @@ XBMC_CONF_OPT += --disable-gles
 endif
 endif
 
+ifeq ($(BR2_PACKAGE_XBMC_GOOM),y)
+XBMC_CONF_OPT += --enable-goom
+else
+XBMC_CONF_OPT += --disable-goom
+endif
+
 ifeq ($(BR2_PACKAGE_XBMC_LIBUSB),y)
 XBMC_DEPENDENCIES += libusb-compat
 XBMC_CONF_OPT += --enable-libusb
-- 
1.7.10.4
