From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Sun, 9 Feb 2020 17:28:48 +0100
Subject: [Buildroot] [git commit] package/mesa3d: add support for gallium
 r300 driver
Message-ID: <20200209161824.BCEB181490@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c5ae77c97a519d7a1c13d2fdacff1b132950f67f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
[yann.morin.1998 at free.fr: propagate libdrm's radeon dependencies]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/mesa3d/Config.in | 17 ++++++++++++++---
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 9965b0e972..ff39652508 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -166,6 +166,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST
 	help
 	  Mesa driver for ARM Mali Midgard and Bifrost GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300
+	bool "Gallium Radeon R300 driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_PACKAGE_LIBDRM_HAS_ATOMIC # libdrm's radeon
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	help
+	  Driver for ATI/AMD Radeon R300/R400/R500 GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	bool "Gallium Radeon R600 driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -275,17 +284,19 @@ config BR2_PACKAGE_MESA3D_VDPAU
 	bool "Gallium VDPAU state tracker"
 	depends on BR2_PACKAGE_XORG7
 	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
 	select BR2_PACKAGE_MESA3D_NEEDS_X11
 	select BR2_PACKAGE_LIBVDPAU
 	help
-	  VDPAU state tracker (needs r600, radeonsi or nouveau gallium
-	  drivers).
+	  VDPAU state tracker (needs r300, r600, radeonsi or nouveau
+	  gallium drivers).
 
-comment "Gallium VDPAU state tracker needs X.org and gallium drivers r600, radeonsi or nouveau"
+comment "Gallium VDPAU state tracker needs X.org and gallium drivers r300, r600, radeonsi or nouveau"
 	depends on !BR2_PACKAGE_XORG7 || \
 		!(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 \
 		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI)
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7fb07ae05c..c14716bf15 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -80,6 +80,7 @@ MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_LIMA)     += lima
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_PANFROST) += panfrost
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R300)     += r300
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
