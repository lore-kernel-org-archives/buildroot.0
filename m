From: Miquel Raynal <miquel.raynal@bootlin.com>
Date: Fri,  6 Mar 2020 08:14:36 +0100
Subject: [Buildroot] [PATCH 3/7] package/rockchip-mali-bifrost: new package
 with binary blobs
In-Reply-To: <20200306071440.30433-1-miquel.raynal@bootlin.com>
References: <20200306071440.30433-1-miquel.raynal@bootlin.com>
Message-ID: <20200306071440.30433-4-miquel.raynal@bootlin.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Maxime Chevallier <maxime.chevallier@bootlin.com>

There is already a package adding Mali blobs for Sunxi Mali Utgard
GPUs. Many Rockchip SoCs feature a Mali Bifrost GPU and need specific
libraries provided under binary form with a non-GPL compliant license
by Rockchip. Package these libraries.

Define a common *_INSTALL_CMDS macro, which takes as argument the base
destination path, and use it to implement *_INSTALL_TARGET_CMDS and
*_INSTALL_STAGING_CMDS.

Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
---
 package/Config.in                             |   1 +
 ...4-binaries-and-only-install-the-bifr.patch | 169 ++++++++++++++++++
 package/rockchip-mali-bifrost/Config.in       |  20 +++
 .../rockchip-mali-bifrost.hash                |   2 +
 .../rockchip-mali-bifrost.mk                  |  85 +++++++++
 5 files changed, 277 insertions(+)
 create mode 100644 package/rockchip-mali-bifrost/0001-cmake-Use-AArch64-binaries-and-only-install-the-bifr.patch
 create mode 100644 package/rockchip-mali-bifrost/Config.in
 create mode 100644 package/rockchip-mali-bifrost/rockchip-mali-bifrost.hash
 create mode 100644 package/rockchip-mali-bifrost/rockchip-mali-bifrost.mk

diff --git a/package/Config.in b/package/Config.in
index 2137aa88ed..f2217ee1d5 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -516,6 +516,7 @@ endmenu
 	source "package/raspi-gpio/Config.in"
 	source "package/read-edid/Config.in"
 	source "package/rng-tools/Config.in"
+	source "package/rockchip-mali-bifrost/Config.in"
 	source "package/rpi-userland/Config.in"
 	source "package/rs485conf/Config.in"
 	source "package/rtc-tools/Config.in"
diff --git a/package/rockchip-mali-bifrost/0001-cmake-Use-AArch64-binaries-and-only-install-the-bifr.patch b/package/rockchip-mali-bifrost/0001-cmake-Use-AArch64-binaries-and-only-install-the-bifr.patch
new file mode 100644
index 0000000000..c5cddea414
--- /dev/null
+++ b/package/rockchip-mali-bifrost/0001-cmake-Use-AArch64-binaries-and-only-install-the-bifr.patch
@@ -0,0 +1,169 @@
+From 8e076bbbd17f05e248e7cb139e437b0a75481983 Mon Sep 17 00:00:00 2001
+From: Maxime Chevallier <maxime.chevallier@bootlin.com>
+Date: Mon, 23 Dec 2019 09:20:22 +0100
+Subject: [PATCH] cmake: Use AArch64 binaries, and only install the bifrost
+ libraries
+
+Signed-off-by: Maxime Chevallier <maxime.chevallier@bootlin.com>
+---
+ CMakeLists.txt           | 24 ++----------------------
+ pkgconfig/OpenCL.pc      | 11 +++++++++++
+ pkgconfig/egl.pc         | 12 ++++++++++++
+ pkgconfig/gbm.pc         | 12 ++++++++++++
+ pkgconfig/glesv2.pc      | 12 ++++++++++++
+ pkgconfig/mali.pc        | 10 ++++++++++
+ pkgconfig/wayland-egl.pc | 12 ++++++++++++
+ 7 files changed, 71 insertions(+), 22 deletions(-)
+ create mode 100644 pkgconfig/OpenCL.pc
+ create mode 100644 pkgconfig/egl.pc
+ create mode 100644 pkgconfig/gbm.pc
+ create mode 100644 pkgconfig/glesv2.pc
+ create mode 100644 pkgconfig/mali.pc
+ create mode 100644 pkgconfig/wayland-egl.pc
+
+diff --git a/CMakeLists.txt b/CMakeLists.txt
+index b0affff..363da33 100644
+--- a/CMakeLists.txt
++++ b/CMakeLists.txt
+@@ -21,31 +21,11 @@ INSTALL(FILES "${CMAKE_CURRENT_SOURCE_DIR}/include/mali.icd"
+ DESTINATION "${CMAKE_INSTALL_SYSCONFDIR}/OpenCL/vendors/")
+ 
+ INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-midgard-t86x-r14p0.so"
++"${CMAKE_CURRENT_SOURCE_DIR}/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-wayland-gbm.so"
+ DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+ 
+ INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-midgard-t76x-r14p0-r1p0.so"
+-DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+-
+-INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-midgard-t76x-r14p0-r0p0.so"
+-DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+-
+-INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-midgard-t76x-r14p0-r0p0-wayland.so"
+-DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+-
+-INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-utgard-450-r7p0.so"
+-DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+-
+-INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-utgard-400-r7p0.so"
+-DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+-
+-INSTALL(FILES
+-"${CMAKE_CURRENT_SOURCE_DIR}/lib/arm-linux-gnueabihf/libmali-bifrost-g31-rxp0-wayland-gbm.so"
++"${CMAKE_CURRENT_SOURCE_DIR}/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-gbm.so"
+ DESTINATION "${CMAKE_INSTALL_LIBDIR}")
+ 
+ INSTALL(FILES "${CMAKE_CURRENT_BINARY_DIR}/egl.pc"
+diff --git a/pkgconfig/OpenCL.pc b/pkgconfig/OpenCL.pc
+new file mode 100644
+index 0000000..218d0ff
+--- /dev/null
++++ b/pkgconfig/OpenCL.pc
+@@ -0,0 +1,11 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include
++
++Name: OpenCL
++Description: Mali OpenCL library
++Requires.private:
++Version: 1.2
++Libs: -L${libdir} -lMaliOpenCL
++Cflags: -I${includedir} 
+diff --git a/pkgconfig/egl.pc b/pkgconfig/egl.pc
+new file mode 100644
+index 0000000..fe9e23a
+--- /dev/null
++++ b/pkgconfig/egl.pc
+@@ -0,0 +1,12 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include
++
++Name: egl
++Description: Mali EGL library
++Requires.private: 
++Version: 7.10
++Libs: -L${libdir} -lEGL
++Libs.private: -lm -lpthread
++Cflags: -I${includedir} 
+diff --git a/pkgconfig/gbm.pc b/pkgconfig/gbm.pc
+new file mode 100644
+index 0000000..e06a1e5
+--- /dev/null
++++ b/pkgconfig/gbm.pc
+@@ -0,0 +1,12 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include
++
++Name: gbm
++Description: Mali GBM library
++Requires.private: 
++Version: 10.4.0
++Libs: -L${libdir} -lgbm
++Libs.private: 
++Cflags: -I${includedir} 
+diff --git a/pkgconfig/glesv2.pc b/pkgconfig/glesv2.pc
+new file mode 100644
+index 0000000..51b4fca
+--- /dev/null
++++ b/pkgconfig/glesv2.pc
+@@ -0,0 +1,12 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include
++
++Name: glesv2
++Description: Mali GLESV2 library
++Requires.private:
++Version:
++Libs: -L${libdir} -lGLESv2
++Libs.private: -lm -lpthread
++Cflags: -I${includedir} 
+diff --git a/pkgconfig/mali.pc b/pkgconfig/mali.pc
+new file mode 100644
+index 0000000..b9aa626
+--- /dev/null
++++ b/pkgconfig/mali.pc
+@@ -0,0 +1,10 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include
++
++Name: mali
++Description: Mali EGL library
++Requires.private: 
++Libs: -L${libdir} -lMali
++Cflags: -I${includedir} 
+diff --git a/pkgconfig/wayland-egl.pc b/pkgconfig/wayland-egl.pc
+new file mode 100644
+index 0000000..7539f8c
+--- /dev/null
++++ b/pkgconfig/wayland-egl.pc
+@@ -0,0 +1,12 @@
++prefix=/usr
++exec_prefix=${prefix}
++libdir=${prefix}/lib
++includedir=${prefix}/include
++
++Name: wayland-egl
++Description: Mali EGL library
++Requires.private: 
++Version: 7.10
++Libs: -L${libdir} -lMali
++Libs.private: -lm -lpthread
++Cflags: -I${includedir} 
+-- 
+2.24.1
+
diff --git a/package/rockchip-mali-bifrost/Config.in b/package/rockchip-mali-bifrost/Config.in
new file mode 100644
index 0000000000..499cf0d8a9
--- /dev/null
+++ b/package/rockchip-mali-bifrost/Config.in
@@ -0,0 +1,20 @@
+config BR2_PACKAGE_ROCKCHIP_MALI_BIFROST
+	bool "rockchip-mali-bifrost"
+	depends on BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_arm || BR2_aarch64
+	select BR2_PACKAGE_HAS_LIBEGL
+	select BR2_PACKAGE_HAS_LIBGLES
+	help
+	  Install the binary user-space libraries for the ARM Mali GPU.
+	  This package requires a kernel with the ARM Mali GPU Kernel
+	  Drivers enabled.
+
+if BR2_PACKAGE_ROCKCHIP_MALI_BIFROST
+
+config BR2_PACKAGE_PROVIDES_LIBEGL
+	default "rockchip-mali-bifrost"
+
+config BR2_PACKAGE_PROVIDES_LIBGLES
+	default "rockchip-mali-bifrost"
+
+endif
diff --git a/package/rockchip-mali-bifrost/rockchip-mali-bifrost.hash b/package/rockchip-mali-bifrost/rockchip-mali-bifrost.hash
new file mode 100644
index 0000000000..68f0d3dce0
--- /dev/null
+++ b/package/rockchip-mali-bifrost/rockchip-mali-bifrost.hash
@@ -0,0 +1,2 @@
+sha256 ee440d859e9d7dfdf29b9a00c7a633337913c407be567d3651c29c12eb75fd9c  rockchip-mali-bifrost-721653b5b3b525a4f80d15aa7e2f9df7b7e60427.tar.gz
+sha256 a78acc73de9909efb879800d4daa4640c4aaa55cd751238a133954aba15e4285  END_USER_LICENCE_AGREEMENT.txt
diff --git a/package/rockchip-mali-bifrost/rockchip-mali-bifrost.mk b/package/rockchip-mali-bifrost/rockchip-mali-bifrost.mk
new file mode 100644
index 0000000000..aefcd5057f
--- /dev/null
+++ b/package/rockchip-mali-bifrost/rockchip-mali-bifrost.mk
@@ -0,0 +1,85 @@
+################################################################################
+#
+# rockchip_mali_bifrost For Linux
+#
+################################################################################
+
+ROCKCHIP_MALI_BIFROST_VERSION = 721653b5b3b525a4f80d15aa7e2f9df7b7e60427
+ROCKCHIP_MALI_BIFROST_SITE = $(call github,rockchip-linux,libmali,$(ROCKCHIP_MALI_BIFROST_VERSION))
+ROCKCHIP_MALI_BIFROST_LICENSE = END_USER_LICENCE_AGREEMENT.txt
+
+ROCKCHIP_MALI_BIFROST_INSTALL_STAGING = YES
+
+ROCKCHIP_MALI_BIFROST_DEPENDENCIES = host-patchelf libdrm
+
+ROCKCHIP_MALI_BIFROST_PROVIDES = libegl libgles
+
+#ifeq ($(BR2_PACKAGE_WAYLAND),y)
+#ROCKCHIP_MALI_BIFROST_SUFFIX = -wayland
+#else
+#ifeq ($(BR2_PACKAGE_XORG7)),y)
+#ROCKCHIP_MALI_BIFROST_SUFFIX =
+#else
+ROCKCHIP_MALI_BIFROST_SUFFIX = -gbm
+#endif
+#endif
+
+ROCKCHIP_MALI_BIFROST_LIBS = libmali-bifrost-g31-rxp0$(ROCKCHIP_MALI_BIFROST_SUFFIX).so
+
+ROCKCHIP_MALI_BIFROST_ARCH_DIR = $(if $(BR2_arm),arm-linux-gnueabihf,aarch64-linux-gnu)
+
+ifeq ($(BR2_PACKAGE_WAYLAND),y)
+define ROCKCHIP_MALI_BIFROST_CREATE_WAYLAND_LINKS
+	rm -f $(1)/usr/lib/libwayland-egl.so*
+
+	ln -sf libmali.so $(1)/usr/lib/libwayland-egl.so.1
+	ln -sf libwayland-egl.so.1 $(1)/usr/lib/libwayland-egl.so
+endef
+endif
+
+ROCKCHIP_MALI_BIFROST_HEADERS_DIRS = CL EGL FBDEV GLES GLES2 GLES3 KHR
+
+define ROCKCHIP_MALI_BIFROST_INSTALL_CMDS
+	mkdir -p $(1)/usr/lib
+	cp -dpfr $(@D)/lib/$(ROCKCHIP_MALI_BIFROST_ARCH_DIR)/$(ROCKCHIP_MALI_BIFROST_LIBS) $(1)/usr/lib
+
+	$(foreach l,$(ROCKCHIP_MALI_BIFROST_LIBS),
+		$(HOST_DIR)/bin/patchelf --set-soname libmali.so.1 $(1)/usr/lib/$(l)
+	)
+
+	ln -sf $(firstword $(ROCKCHIP_MALI_BIFROST_LIBS)) $(1)/usr/lib/libmali.so.1
+
+	$(foreach d,$(ROCKCHIP_MALI_BIFROST_HEADERS_DIRS),\
+		cp -dpfr $(@D)/include/$(d) $(1)/usr/include/
+	)
+	cp -dpfr $(@D)/include/gbm.h $(1)/usr/include/
+	mkdir -p $(1)/usr/lib/pkgconfig/
+	cp -dpfr $(@D)/pkgconfig/*.pc $(1)/usr/lib/pkgconfig/
+	ln -sf libmali.so.1 $(1)/usr/lib/libmali.so
+	ln -sf libmali.so $(1)/usr/lib/libMali.so.1
+	ln -sf libMali.so.1 $(1)/usr/lib/libMali.so
+
+	ln -sf libmali.so $(1)/usr/lib/libEGL.so.1
+	ln -sf libEGL.so.1 $(1)/usr/lib/libEGL.so
+
+	ln -sf libmali.so $(1)/usr/lib/libgbm.so.1
+	ln -sf libgbm.so.1 $(1)/usr/lib/libgbm.so
+	ln -sf libgbm.so.1 $(1)/usr/lib/libgbm.so.1.0.0
+
+	ln -sf libmali.so $(1)/usr/lib/libGLESv1_CM.so.1
+	ln -sf libGLESv1_CM.so.1 $(1)/usr/lib/libGLESv1_CM.so
+
+	ln -sf libmali.so $(1)/usr/lib/libGLESv2.so.2
+	ln -sf libGLESv2.so.2 $(1)/usr/lib/libGLESv2.so
+	$(call ROCKCHIP_MALI_BIFROST_CREATE_WAYLAND_LINKS,$(1))
+endef
+
+define ROCKCHIP_MALI_BIFROST_INSTALL_TARGET_CMDS
+	$(call ROCKCHIP_MALI_BIFROST_INSTALL_CMDS,$(TARGET_DIR))
+endef
+
+define ROCKCHIP_MALI_BIFROST_INSTALL_STAGING_CMDS
+	$(call ROCKCHIP_MALI_BIFROST_INSTALL_CMDS,$(STAGING_DIR))
+endef
+
+$(eval $(generic-package))
-- 
2.20.1
