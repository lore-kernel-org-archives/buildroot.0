From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sat,  7 Jun 2014 14:31:10 +0200
Subject: [Buildroot] [PATCH v12 10/32] mesa3d: Bump version to 10.2.1,
	fix xa build
In-Reply-To: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
References: <1402144292-27837-1-git-send-email-bernd.kuhls@t-online.de>
Message-ID: <1402144292-27837-11-git-send-email-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Building xa requires at least one non swrast gallium driver, needed since:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.2&id=e283e966660fdf037be6353dc96b7f63b8aa315a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk |   12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fa17177..1a61af8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.0.4
+MESA3D_VERSION = 10.2.1
 MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
@@ -35,9 +35,13 @@ MESA3D_DEPENDENCIES += \
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
