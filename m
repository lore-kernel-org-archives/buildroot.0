From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Wed, 28 May 2014 13:08:34 +0200
Subject: [Buildroot] [PATCH 11/30] mesa3d: Bump version to 10.2-rc4,
	fix xa build
In-Reply-To: <cover.1401274944.git.yann.morin.1998@free.fr>
References: <cover.1401274944.git.yann.morin.1998@free.fr>
Message-ID: <a47d8c833a7b1239decc6bb00256929b9e23b4fa.1401274944.git.yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Bernd Kuhls <bernd.kuhls@t-online.de>

Building xa requires at least one non swrast gallium driver, needed since:
http://cgit.freedesktop.org/mesa/mesa/commit/configure.ac?h=10.2&id=e283e966660fdf037be6353dc96b7f63b8aa315a

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/mesa3d.mk | 14 +++++++++-----
 1 file changed, 9 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fa17177..38bb3ca 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-MESA3D_VERSION = 10.0.4
-MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).tar.bz2
+MESA3D_VERSION = 10.2
+MESA3D_SOURCE = MesaLib-$(MESA3D_VERSION).0-rc4.tar.bz2
 MESA3D_SITE = ftp://ftp.freedesktop.org/pub/mesa/$(MESA3D_VERSION)
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
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
1.8.3.2
