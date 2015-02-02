From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:43:13 +0100
Subject: [Buildroot] [git commit] package/mesa3d: Enable support for Radeon
	r600 gallium driver
Message-ID: <20150202204317.8DAF88011C@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=59a962af7a8ef15b97724c421b8658a030e308ac
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

--
v2: - rebased patch from micro1183: http://patchwork.ozlabs.org/patch/398858/
    - removed support for r300 & radeonsi because they need llvm support
      which is not provided by buildroot

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    9 +++++++++
 package/mesa3d/mesa3d.mk |    1 +
 2 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d8ee8c2..c407ece 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -50,6 +50,15 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	help
 	  Supports all Nvidia GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	bool "Gallium Radeon R600 driver"
+	depends on BR2_i386 || BR2_x86_64
+	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
+	help
+	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	bool "Gallium vmware svga driver"
 	depends on BR2_i386 || BR2_x86_64
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index de647a6..8a84de3 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -56,6 +56,7 @@ endif
 
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA)     += svga
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SWRAST)   += swrast
 # DRI Drivers
