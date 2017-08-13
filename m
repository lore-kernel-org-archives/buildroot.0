From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 13 Aug 2017 15:05:29 +0200
Subject: [Buildroot] [PATCHv2] package/mesa3d: vc4 backend is an EGL provider
Message-ID: <20170813130529.21513-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The VC4 GPU does not support full GL, it only provides EGL.

Currently, it is possible to build the VC4 backend without ELG support,
but that does not make sense in the slighest.

So, forcibly enable EGL with VC4, like is done for etnaviv and virgl.

Reported-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Waldemar Brodkorb <wbx@openadk.org>

---
Note:
Currently, as soon as mesa3d and Xorg are both enabled, then we consider
that full GL is available. However, that is definitely not the case with
the VC4 backend, obviously, as the hardware is not capable of that at
all. Fixing this situation is a bigger endeavour, for anotehr patch(set).

---
Changes v1 -> v2:
  - enhgance the commit log to explain why we forcibly enable EGL.
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ad41b1cd2a..13c118ee68 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -102,6 +102,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL
 	help
 	  Driver for Broadcom VC4 (rpi2/3) GPUs.
 	  It requires a vanilla 4.5+ kernel with drm vc4 (open) support.
-- 
2.11.0
