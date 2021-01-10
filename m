From: Peter Seiderer <ps.report@gmx.net>
Date: Sun, 10 Jan 2021 23:28:23 +0100
Subject: [Buildroot] [RFC v2 02/12] package/mesa3d: fix vulkan/intel
 dependencies
In-Reply-To: <20210110222833.26301-1-ps.report@gmx.net>
References: <20210110222833.26301-1-ps.report@gmx.net>
Message-ID: <20210110222833.26301-3-ps.report@gmx.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

- enable X11/GLX free build

- remove xorgproto dependency is already given via BR2_PACKAGE_MESA3D_OPENGL_GLX/BR2_PACKAGE_MESA3D_NEEDS_X11

- libxshmfence only needed in case BR2_PACKAGE_MESA3D_OPENGL_GLX is enabled

- the correct dependency for BR2_PACKAGE_XLIB_LIBXSHMFENCE would
  be 'depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX',
  but this results in:

  package/mesa3d/Config.in:81:error: recursive dependency detected!
  package/mesa3d/Config.in:81:    symbol BR2_PACKAGE_MESA3D_DRIVER is selected by BR2_PACKAGE_MESA3D_VULKAN_DRIVER
  package/mesa3d/Config.in:77:    symbol BR2_PACKAGE_MESA3D_VULKAN_DRIVER is selected by BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
  package/mesa3d/Config.in:406:   symbol BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL depends on BR2_PACKAGE_MESA3D_OPENGL_GLX
  package/mesa3d/Config.in:461:   symbol BR2_PACKAGE_MESA3D_OPENGL_GLX depends on BR2_PACKAGE_MESA3D_DRIVER
  For a resolution refer to Documentation/kbuild/kconfig-language.txt
  subsection "Kconfig recursive dependency limitations"

  so use unconditional 'depends on BR2_TOOLCHAIN_HAS_SYNC_4' instead

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
Changes v1 -> v2:
  - new patch
---
 package/mesa3d/Config.in | 10 ++++++----
 package/mesa3d/mesa3d.mk |  2 ++
 2 files changed, 8 insertions(+), 4 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 347b1a2726..d9c27f8b5c 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -398,15 +398,17 @@ comment "Vulkan drivers"
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
+	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 because of libxshmfence only
+	# in case GLX is enabled but the following results in 'recursive
+	# dependency detected!', so simple depend always on BR2_TOOLCHAIN_HAS_SYNC_4
+	# depends on BR2_TOOLCHAIN_HAS_SYNC_4 || !BR2_PACKAGE_MESA3D_OPENGL_GLX # libxshmfence in case GLX is enabled
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_17 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
-	depends on BR2_PACKAGE_XORG7 # xorgproto
 	select BR2_PACKAGE_EXPAT
-	select BR2_PACKAGE_MESA3D_DRI3
+	select BR2_PACKAGE_MESA3D_DRI3 if BR2_PACKAGE_MESA3D_OPENGL_GLX
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
-	select BR2_PACKAGE_XORGPROTO
-	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE if BR2_PACKAGE_MESA3D_OPENGL_GLX
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index ea6265d723..967b86810f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -146,7 +146,9 @@ ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=
 else
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)$(BR2_PACKAGE_MESA3D_OPENGL_GLX),yy)
 MESA3D_DEPENDENCIES += xlib_libxshmfence
+endif
 MESA3D_CONF_OPTS += \
 	-Dvulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
 endif
-- 
2.29.2
