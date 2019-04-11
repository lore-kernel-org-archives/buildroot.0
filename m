From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 11 Apr 2019 19:19:07 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add KMSRO support for vc4
Message-ID: <20190411171514.C227B8E4BF@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c19e2f44cccf65f34c416ecda9a9ebd96608891f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

kmsro allow to support KMS displays with the renderonly layer used to
attach a GPU [1].

Quote from mesa3d meson.build: "kmsro driver requires one or more
renderonly drivers (vc4, etnaviv, freedreno)". But only vc4 support is
available by using the (deprecated) autotools build system [2].

This will also be used by mesa to support KMSRO with the upcomming
Panfrost and Lima Gallium drivers.

[1] https://cgit.freedesktop.org/mesa/mesa/commit/?id=ed65aeec7810a7d98a19461ba933bd77268cb0f6
[2] https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=mesa-19.0.1#n2864

Signed-off-by: Romain Naour <romain.naour@smile.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/Config.in | 17 +++++++++++++++++
 package/mesa3d/mesa3d.mk |  1 +
 2 files changed, 18 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index fdd64b0337..3f44e94229 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -83,6 +83,12 @@ config BR2_PACKAGE_MESA3D_DRIVER
 config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
+# Quote from mesa3d meson.build: "kmsro driver requires one or more
+# renderonly drivers (vc4, etnaviv, freedreno)". But only vc4 support
+# is available by using the (deprecated) autotools build system.
+config BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	bool
+
 comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
@@ -93,6 +99,16 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
 	help
 	  Mesa driver for Vivante GPUs.
 
+config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO
+	bool "Gallium KMSRO driver"
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+	help
+	  Support various sorts of KMS displays with the
+	  renderonly layer used to attach a GPU.
+
+comment "Gallium KMSRO needs one or more renderonly drivers"
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
+
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU
 	bool "Gallium nouveau driver"
 	depends on BR2_i386 || BR2_x86_64
@@ -166,6 +182,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_VC4
 	bool "Gallium vc4 driver"
 	depends on BR2_ARM_CPU_HAS_NEON || BR2_aarch64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+	select BR2_PACKAGE_MESA3D_GALLIUM_KMSRO
 	select BR2_PACKAGE_LIBDRM_VC4
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	select BR2_PACKAGE_MESA3D_OPENGL_EGL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 76affe5704..02c8a8a57a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -99,6 +99,7 @@ endif
 
 #Gallium Drivers
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV)  += etnaviv
+MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_KMSRO)    += kmsro
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU)  += nouveau
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600)     += r600
 MESA3D_GALLIUM_DRIVERS-$(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI) += radeonsi
