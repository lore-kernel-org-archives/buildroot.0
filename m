From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 31 Jul 2014 02:16:42 +0200
Subject: [Buildroot] [PATCH 07/14 v4] package/libcec: needs libudev,
	not a udev daemon
In-Reply-To: <cover.1406765723.git.yann.morin.1998@free.fr>
References: <cover.1406765723.git.yann.morin.1998@free.fr>
Message-ID: <e9dbb8a80f665101d5329a9ca157a416764e46a6.1406765723.git.yann.morin.1998@free.fr>
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
index 05d28ee..6aa9937 100644
--- a/package/xbmc/Config.in
+++ b/package/xbmc/Config.in
@@ -106,14 +106,14 @@ comment "libbluray support needs a toolchain w/ dynamic library"
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
