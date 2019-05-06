From: Romain Naour <romain.naour@smile.fr>
Date: Mon,  6 May 2019 11:54:49 +0200
Subject: [Buildroot] [PATCH v3 7/9] package/mesa3d: add a new option to
 enable GLX support
In-Reply-To: <20190506095451.26522-1-romain.naour@smile.fr>
References: <20190506095451.26522-1-romain.naour@smile.fr>
Message-ID: <20190506095451.26522-7-romain.naour@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

When switching to meson build system, enabling GLX support
require at least one DRI or Gallium dirver.

So add a dependency on BR2_PACKAGE_MESA3D_DRIVER for
BR2_PACKAGE_MESA3D_OPENGL_GLX option.

quoting the meson build system:
"dri based GLX requires at least one DRI driver." [1]
"Even when building just gallium drivers the user probably wants dri." [2]

[1] https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.0#n340
[2] https://cgit.freedesktop.org/mesa/mesa/tree/meson.build?h=19.0#n266

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/mesa3d/Config.in | 12 ++++++++++++
 package/mesa3d/mesa3d.mk |  2 +-
 2 files changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eba218efb2..ceed097d71 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -281,6 +281,18 @@ comment "OSMesa classic requires dri (classic) swrast"
 
 if BR2_PACKAGE_MESA3D_DRIVER
 
+comment "OpenGL API Support"
+
+config BR2_PACKAGE_MESA3D_OPENGL_GLX
+	bool "OpenGL GLX"
+	depends on BR2_PACKAGE_XORG7
+	help
+	  Enable GLX graphic acceleration (OpenGL + X11).
+	  GLX support needs X11 and at least one DRI or Gallium driver.
+
+comment "OpenGL GLX support needs X11"
+	depends on !BR2_PACKAGE_XORG7
+
 comment "Additional API Support"
 
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 271353b72e..426676a520 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -72,7 +72,7 @@ MESA3D_CONF_ENV += CFLAGS="$(TARGET_CFLAGS) -mno-compact-eh"
 MESA3D_CONF_ENV += CXXFLAGS="$(TARGET_CXXFLAGS) -mno-compact-eh"
 endif
 
-ifeq ($(BR2_PACKAGE_XORG7),y)
+ifeq ($(BR2_PACKAGE_MESA3D_OPENGL_GLX),y)
 MESA3D_DEPENDENCIES += \
 	xlib_libX11 \
 	xlib_libXext \
-- 
2.20.1
