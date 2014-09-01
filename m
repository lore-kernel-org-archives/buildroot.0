From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Mon,  1 Sep 2014 15:38:20 +0200
Subject: [Buildroot] [PATCH 08/15 v5] package/libcec: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1409578332.git.yann.morin.1998@free.fr>
References: <cover.1409578332.git.yann.morin.1998@free.fr>
Message-ID: <15c8d6ee69d54d70c29a9e30b7ec7bdbe8591ca5.1409578332.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

libcec is happy enough with just a libudev, which it uses to
enumerate CEC devices, and does not require a udev daemon.

Propagate the new dependency to XBMC.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Maxime Hadjinlian <maxime.hadjinlian@gmail.com>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Acked-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libcec/libcec.mk | 4 ++--
 package/xbmc/Config.in   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libcec/libcec.mk b/package/libcec/libcec.mk
index ad919fc..49e4dbd 100644
--- a/package/libcec/libcec.mk
+++ b/package/libcec/libcec.mk
@@ -18,8 +18,8 @@ ifeq ($(BR2_PACKAGE_LOCKDEV),y)
 LIBCEC_DEPENDENCIES += lockdev
 endif
 
-ifeq ($(BR2_PACKAGE_HAS_UDEV),y)
-LIBCEC_DEPENDENCIES += udev
+ifeq ($(BR2_PACKAGE_HAS_LIBUDEV),y)
+LIBCEC_DEPENDENCIES += libudev
 endif
 
 ifeq ($(BR2_PACKAGE_RPI_USERLAND),y)
diff --git a/package/xbmc/Config.in b/package/xbmc/Config.in
index ebe0882..85dfcee 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -141,14 +141,14 @@ comment "goom needs an OpenGL backend"
 config BR2_PACKAGE_XBMC_LIBCEC
 	bool "hdmi cec"
 	depends on !BR2_PREFER_STATIC_LIB # libcec
-	depends on BR2_PACKAGE_HAS_UDEV
+	depends on BR2_PACKAGE_HAS_LIBUDEV # libcec
 	select BR2_PACKAGE_LIBCEC
 	help
 	  Enable CEC (Consumer Electronics Control) support.
 	  Select this if you want XBMC to support HDMI CEC.
 
-comment "hdmi cec support needs udev /dev management and a toolchain w/ dynamic library"
-	depends on BR2_PREFER_STATIC_LIB || !BR2_PACKAGE_HAS_UDEV
+comment "hdmi cec support needs a toolchain w/ dynamic library"
+	depends on BR2_PREFER_STATIC_LIB
 
 config BR2_PACKAGE_XBMC_LIBMICROHTTPD
 	bool "web server"
-- 
1.9.1
