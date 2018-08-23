From: Yann E. MORIN <yann.morin.1998@free.fr>
Date: Thu, 23 Aug 2018 11:08:27 +0200
Subject: [Buildroot] [PATCH] package/mesa3d: vulkan with x11 needs dri3
Message-ID: <20180823090827.4003-1-yann.morin.1998@free.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Fixes:
    http://autobuild.buildroot.org/results/356/35653fc6f57dc169a8aae6baedb1acd1049b50ec/

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>
Cc: Romain Naour <romain.naour@gmail.com>
---
 package/mesa3d/Config.in | 3 +++
 package/mesa3d/mesa3d.mk | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index eec72654cd..06574ae513 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -210,16 +210,19 @@ comment "Vulkan drivers"
 config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
 	bool "Vulkan Intel driver"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libxshmfence
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
 	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
 	depends on BR2_PACKAGE_XORG7 # xorgproto
 	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
 	select BR2_PACKAGE_XORGPROTO
+	select BR2_PACKAGE_XLIB_LIBXSHMFENCE
 	help
 	  Vulkan driver for Intel hardware from Ivy Bridge onward.
 
 comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >= 3.18"
 	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 || \
 		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_XORG7
 
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5c01f92e22..f82facf7d1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -107,7 +107,7 @@ MESA3D_CONF_OPTS += \
 	--enable-gallium-extra-hud
 endif
 
-ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER),)
+ifeq ($(BR2_PACKAGE_MESA3D_DRI_DRIVER)$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
 MESA3D_CONF_OPTS += \
 	--without-dri-drivers --disable-dri3
 else
-- 
2.14.1
