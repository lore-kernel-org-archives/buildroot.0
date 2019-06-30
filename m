From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Sun, 30 Jun 2019 16:04:56 +0200
Subject: [Buildroot] [PATCH 02/31] package/libva: remove optional mesa3d
 support
In-Reply-To: <20190630140525.6537-1-bernd.kuhls@t-online.de>
References: <20190630140525.6537-1-bernd.kuhls@t-online.de>
Message-ID: <20190630140525.6537-3-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Kodi 18.0-Leia will support vaapi on r600 and radeonsi.
We need libva support in mesa3d for this. To avoid the circular
dependency we switch from using mesa3d in libva to use libva in mesa3d.

This patch is the first step: disable mesa3d support in libva.

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/libva/libva.mk | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/package/libva/libva.mk b/package/libva/libva.mk
index e876a1a3d0..e64f5cf392 100644
--- a/package/libva/libva.mk
+++ b/package/libva/libva.mk
@@ -15,17 +15,14 @@ LIBVA_DEPENDENCIES = host-pkgconf libdrm
 # libdrm is a hard-dependency
 LIBVA_CONF_OPTS = \
 	--enable-drm \
+	--disable-glx \
 	--with-drivers-path="/usr/lib/va"
 
 ifeq ($(BR2_PACKAGE_XORG7),y)
 LIBVA_DEPENDENCIES += xlib_libX11 xlib_libXext xlib_libXfixes
 LIBVA_CONF_OPTS += --enable-x11
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),y)
-LIBVA_DEPENDENCIES += mesa3d
-LIBVA_CONF_OPTS += --enable-glx
-endif
 else
-LIBVA_CONF_OPTS += --disable-glx --disable-x11
+LIBVA_CONF_OPTS += --disable-x11
 endif
 
 ifeq ($(BR2_PACKAGE_WAYLAND),y)
-- 
2.20.1
