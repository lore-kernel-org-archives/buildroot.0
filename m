From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 May 2014 22:41:01 +0200
Subject: [Buildroot] [PATCH v9 02/29] mesa3d: Bump version to 10.2-rc3,
	fix xa build
In-Reply-To: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
References: <1400618488-6995-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1400618488-6995-3-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building xa requires at least one non swrast gallium driver, needed since:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.2&id=e283e966660fdf037be6353dc96b7f63b8aa315a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |   14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 63ba574..8caa5c6 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.0.4
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
+MESA3D_VERSION = 10.2
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).0-rc3.tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
@@ -33,9 +33,13 @@ MESA3D_DEPENDENCIES += \
 	xlib_libXdamage \
 	xlib_libXfixes \
 	libxcb
-MESA3D_CONF_OPT += \
-	--enable-glx \
-	--enable-xa
+MESA3D_CONF_OPT += --enable-glx
+# quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
+ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA),)
+MESA3D_CONF_OPT += --enable-xa
+else
+MESA3D_CONF_OPT += --disable-xa
+endif
 else
 MESA3D_CONF_OPT += \
 	--disable-glx \
-- 
1.7.10.4
