From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:24 +0100
Subject: [Buildroot] [RFC v2 03/12] package/mesa3d: fix gbm config warning
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-4-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes for the following defconfig:

  BR2_x86_64=y
  BR2_TOOLCHAIN_BUILDROOT_GLIBC=y
  BR2_TOOLCHAIN_BUILDROOT_CXX=y
  BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
  BR2_TARGET_GENERIC_GETTY_PORT="tty1"
  BR2_PACKAGE_MESA3D=y
  BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL=y
  BR2_PACKAGE_MESA3D_OPENGL_EGL=y
  BR2_PACKAGE_MESA3D_OPENGL_ES=y

this warning:

  WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_GBM
    Depends on [n]: BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y] && (BR2_PACKAGE_MESA3D_DRI_DRIVER [=n] || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER [=n] && BR2_PACKAGE_MESA3D_OPENGL_EGL [=y])
    Selected by [y]:
    - BR2_PACKAGE_MESA3D_OPENGL_EGL [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y]

  WARNING: unmet direct dependencies detected for BR2_PACKAGE_MESA3D_GBM
    Depends on [n]: BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y] && (BR2_PACKAGE_MESA3D_DRI_DRIVER [=n] || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER [=n] && BR2_PACKAGE_MESA3D_OPENGL_EGL [=y])
    Selected by [y]:
    - BR2_PACKAGE_MESA3D_OPENGL_EGL [=y] && BR2_PACKAGE_MESA3D [=y] && BR2_PACKAGE_MESA3D_DRIVER [=y]

as BR2_PACKAGE_MESA3D_VULKAN_DRIVER selects BR2_PACKAGE_MESA3D_DRIVER which
enables possible selection of BR2_PACKAGE_MESA3D_OPENGL_EGL selecting
BR2_PACKAGE_MESA3D_GBM.

Selecting EGL with only a vulkan driver selected gives the following configure
failure:

  .../build/mesa3d-20.3.2/meson.build:424:4: ERROR: Problem encountered: EGL requires dri

Note dri means here an dri or gallium driver (see meson.build and look
for with_dri).

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/mesa3d/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index d9c27f8b5c..7a976f4b2c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -452,6 +452,8 @@ config BR2_PACKAGE_MESA3D_OPENGL_GLX
 comment "OpenGL GLX support needs X11"
 	depends on !BR2_PACKAGE_XORG7
 
+if BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+
 config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	bool "OpenGL EGL"
 	select BR2_PACKAGE_HAS_LIBEGL
@@ -461,6 +463,8 @@ config BR2_PACKAGE_MESA3D_OPENGL_EGL
 	  Use the Khronos EGL APIs. EGL is a window manager for OpenGL
 	  applications similar to GLX, for X, and WGL, for Windows.
 
+endif # BR2_PACKAGE_MESA3D_DRI_DRIVER || BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
+
 config BR2_PACKAGE_MESA3D_OPENGL_ES
 	bool "OpenGL ES"
 	select BR2_PACKAGE_HAS_LIBGLES
-- 
2.29.2
