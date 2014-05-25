From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 25 May 2014 22:26:15 +0200
Subject: [Buildroot] [PATCH v10 22/29] xbmc: hdmi cec supports needs udev
	for device scanning
In-Reply-To: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
References: <1401049582-2110-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1401049582-2110-23-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcec support in xbmc compiles without udev being linked to libcec,
but it is useless because xbmc uses libcec?s udev support for scanning
connected CEC devices since:
https://github.com/xbmc/xbmc/commit/59171c7a030f8a9c913abbce931967a6a8ff6897

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in |    5 +++--
 package/xbmc/xbmc.mk   |    2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 0f45f5c..0c449b8 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -98,13 +98,14 @@ comment "libbluray support needs a toolchain w/ dynamic library"
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
+	depends on BR2_PACKAGE_HAS_UDEV
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want XBMC to support HDMI CEC.
 
-comment "hdmi cec support needs a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB
+comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_UDEV
 
 config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	bool "web server"
diff --git a/package/xbmc/xbmc.mk b/package/xbmc/xbmc.mk
index 2debe16..3290bca 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -132,7 +132,7 @@ XBMC_CONF_OPT += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
-XBMC_DEPENDENCIES += libcec
+XBMC_DEPENDENCIES += libcec udev
 XBMC_CONF_OPT += --enable-libcec
 else
 XBMC_CONF_OPT += --disable-libcec
-- 
1.7.10.4
