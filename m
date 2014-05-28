From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:29 +0200
Subject: [Buildroot] [PATCH 06/30] xbmc: hdmi cec supports needs udev for
	device scanning
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <ad931b21cf72b9b6d758551092cc756da7a541ca.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

libcec support in xbmc compiles without udev being linked to libcec,
but it is useless because xbmc uses libcec?s udev support for scanning
connected CEC devices since:
https://github.com/xbmc/xbmc/commit/59171c7a030f8a9c913abbce931967a6a8ff6897

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/xbmc/Config.in | 5 +++--
 package/xbmc/xbmc.mk   | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index 4db7378..52bf0cd 100644
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
index acbdb91..9f44c34 100644
--- a/package/xbmc/xbmc.mk
+++ b/package/xbmc/xbmc.mk
@@ -131,7 +131,7 @@ XBMC_CONF_OPT += --disable-avahi
 endif
 
 ifeq ($(BR2_PACKAGE_XBMC_LIBCEC),y)
-XBMC_DEPENDENCIES += libcec
+XBMC_DEPENDENCIES += libcec udev
 XBMC_CONF_OPT += --enable-libcec
 else
 XBMC_CONF_OPT += --disable-libcec
-- 
1.8.3.2
