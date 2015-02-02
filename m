From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 2 Feb 2015 21:39:15 +0100
Subject: [Buildroot] [git commit] package/mesa3d: Refactor XA support to
	prepare support for ATI drivers
Message-ID: <20150202203947.4F2D0807E3@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=2dde40081c49852bac0ee9c723911761bd5fc91e
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/master

[Thomas:
  - move the new blind option next to the other existing blind options
    in the package.
  - edit the commit log to remove the changelog.]

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in |    5 +++++
 package/mesa3d/mesa3d.mk |    2 +-
 2 files changed, 6 insertions(+), 1 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eb977b6..d8ee8c2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -36,6 +36,9 @@ config BR2_PACKAGE_PROVIDES_LIBGL
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
+config BR2_PACKAGE_MESA3D_NEEDS_XA
+	bool
+
 comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
@@ -43,6 +46,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_NOUVEAU
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Supports all Nvidia GPUs.
 
@@ -51,6 +55,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_VMWGFX
+	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  This is a virtual GPU driver for VMWare virtual machines.
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 3d780f9..4ff7e09 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -36,7 +36,7 @@ MESA3D_DEPENDENCIES += \
 	libxcb
 MESA3D_CONF_OPTS += --enable-glx
 # quote from mesa3d configure "Building xa requires at least one non swrast gallium driver."
-ifneq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_SVGA),)
+ifneq ($(BR2_PACKAGE_MESA3D_NEEDS_XA),)
 MESA3D_CONF_OPTS += --enable-xa
 else
 MESA3D_CONF_OPTS += --disable-xa
