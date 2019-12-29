From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 29 Dec 2019 14:14:53 +0100
Subject: [Buildroot] [PATCH 2/2] package/mesa3d: x11 needs EGL,
 GLX or a vulkan driver
In-Reply-To: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
References: <20191229131453.327907-1-fontaine.fabrice@gmail.com>
Message-ID: <20191229131453.327907-2-fontaine.fabrice@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

As specified in meson.build, x11 platform needs EGL, GLX or a vulkan
driver:

if with_platform_x11
  if with_any_vk or with_egl or (with_glx == 'dri' and with_dri_platform == 'drm')
    pre_args += '-DHAVE_X11_PLATFORM'
  endif

Fixes:
 - http://autobuild.buildroot.org/results/e044609e603ca68695d842d08809fdcb35bc8127

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/mesa3d/Config.in | 1 +
 1 file changed, 1 insertion(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 844360950c..373fe7004c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -87,6 +87,7 @@ config BR2_PACKAGE_MESA3D_NEEDS_X11
 	bool
 	depends on BR2_PACKAGE_XORG7
 	select BR2_PACKAGE_LIBXCB
+	select BR2_PACKAGE_MESA3D_OPENGL_EGL if !(BR2_PACKAGE_MESA3D_OPENGL_GLX || BR2_PACKAGE_MESA3D_VULKAN_DRIVER)
 	select BR2_PACKAGE_XLIB_LIBX11
 	select BR2_PACKAGE_XLIB_LIBXDAMAGE
 	select BR2_PACKAGE_XLIB_LIBXEXT
-- 
2.24.0
