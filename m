From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  6 May 2019 11:54:47 +0200
Subject: [Buildroot] [PATCH v3 5/9] package/mesa3d: add xvmc option
In-Reply-To: <20190506095451.26522-1-romain.naour@smile.fr>
References: <20190506095451.26522-1-romain.naour@smile.fr>
Message-ID: <20190506095451.26522-5-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

"XVMC state tracker requires at least one of the following gallium drivers: r600, nouveau."

https://cgit.freedesktop.org/mesa/mesa/commit/?id=22a817af8a89eb3c762fc3e07b443a3ce37d7416

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 14 ++++++++++++++
 package/mesa3d/mesa3d.mk |  2 +-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 6ec395723a..72548adf57 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -312,6 +312,20 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 config BR2_PACKAGE_PROVIDES_LIBOPENCL
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
 
+config BR2_PACKAGE_MESA3D_XVMC
+	bool "XvMC state tracker"
+	depends on BR2_PACKAGE_XORG7
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
+		|| BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	select BR2_PACKAGE_XLIB_LIBXVMC
+	help
+	  XVMC state tracker (needs r600 or nouveau gallium drivers).
+
+comment "XvMC depends on X.org and needs gallium drivers: r600, nouveau"
+	depends on !BR2_PACKAGE_XORG7
+	depends on !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_NOUVEAU \
+		|| !BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+
 endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index fde74dfd65..70aa2e4866 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -220,7 +220,7 @@ else
 MESA3D_CONF_OPTS += --disable-gles1 --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_XLIB_LIBXVMC),y)
+ifeq ($(BR2_PACKAGE_MESA3D_XVMC),y)
 MESA3D_DEPENDENCIES += xlib_libXvMC
 MESA3D_CONF_OPTS += --enable-xvmc
 else
-- 
2.20.1
