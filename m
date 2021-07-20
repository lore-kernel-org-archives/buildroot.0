From: Bernd Kuhls <bernd.kuhls@t-online.de>
Date: Tue, 20 Jul 2021 19:29:11 +0200
Subject: [Buildroot] [PATCH 1/1] package/mesa3d: DRI drivers need either glx,
 egl or gbm
Message-ID: <20210720172911.15840-1-bernd.kuhls@t-online.de>
List-Id: <buildroot.busybox.net>
To: buildroot@busybox.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Fixes build error:
../output-1/build/mesa3d-21.1.5/meson.build:520:4:
 ERROR: Problem encountered: building dri drivers require at least one windowing system

OSMesa is not seen as a valid windowing system for DRI drivers anymore:
https://cgit.freedesktop.org/mesa/mesa/commit/meson.build?h=21.1&id=ee802372180a2b4460cc7abb53438e45c6b6f1e4

Fixes:
http://autobuild.buildroot.net/results/46e3a66ddc13a064e512aad0f3afd8655889ab9d/

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
---
 package/mesa3d/Config.in | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d1b3af2054..41c90c49af 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -63,8 +63,7 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
 	select BR2_PACKAGE_MESA3D_GBM if \
 		!BR2_PACKAGE_MESA3D_OPENGL_GLX && \
-		!BR2_PACKAGE_MESA3D_OPENGL_EGL && \
-		!BR2_PACKAGE_MESA3D_OSMESA_GALLIUM
+		!BR2_PACKAGE_MESA3D_OPENGL_EGL
 	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if \
 		(BR2_PACKAGE_XORG7 && BR2_TOOLCHAIN_HAS_SYNC_4)
 
-- 
2.30.2
