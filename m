From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat, 10 May 2014 12:02:41 +0200
Subject: [Buildroot] [PATCH v6 29/32] xbmc: Add option for Goom screensaver
In-Reply-To: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
References: <1399716164-6452-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1399716164-6452-30-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |   11 +++++++++++
 package/xbmc/xbmc.mk   |    6 ++++++
 2 files changed, 17 insertions(+)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index d04059c..cbf1fa9 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -125,6 +125,17 @@ config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	help
 	  Enable webserver feature
 
+config BR2_PACKAGE_XBMC_GOOM
+	bool "goom screensaver"
+	depends on BR2_i386 || BR2_x86_64 # it does not make sense to use goom on embedded archs
+	depends on BR2_PACKAGE_HAS_LIBGL
+	help
+	  Enable goom screensaver
+
+comment "goom needs an OpenGL backend"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_PACKAGE_HAS_LIBGL
+
 config BR2_PACKAGE_XBMC_LIBNFS
 	bool "nfs"
 	depends on BR2_TOOLCHAIN_HAS_NATIVE_RPC
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 9b52d18..bdefc8e 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -109,6 +109,12 @@ else
 XBMC_CONF_OPT += --disable-libmp3lame
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
