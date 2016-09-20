From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Tue, 20 Sep 2016 20:01:15 +0200
Subject: [Buildroot] [git commit] package/mesa3d: add support for Intel
	Vulkan driver
Message-ID: <20160920180219.BAE407FA71@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=42cdaaf945df203364cbb5be5f856636f9764260
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The Vulkan intel driver depends on the i965 dri driver:
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=12.0#n1653

and a sha1 implementation:
https://cgit.freedesktop.org/mesa/mesa/tree/configure.ac?h=12.0#n1656

The Vulkan driver needs linux/memfd.h
https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_allocator.c?h=12.0#n30
which is not available in kernel headers older than 3.18:
https://git.kernel.org/cgit/linux/kernel/git/stable/linux-stable.git/log/include/uapi/linux/memfd.h?id=refs/tags/v3.18.36

The Vulkan driver makes use of ifunc
https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_entrypoints_gen.py?h=12.0#n287
which is not available on uClibc:
https://gcc.gnu.org/git/?p=gcc.git;a=blob;f=gcc/config.gcc;h=82cc9a9959b5ab57c0b8779e054b80cdb95f169b;hb=gcc-6-branch#l1485
https://gcc.gnu.org/git/?p=gcc.git;a=commit;h=e6cdd6b1755033e8f416efaa4334d1294c0a43c6

The Vulkan driver makes use of static_assert
https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_private.h?h=12.0#n153

Compiling the Vulkan driver with uClibc and musl fails, therefore this
driver is glibc-only.

Although the configure script does not check for dri3 support if the
Intel Vulkan driver is enabled it needs it nonetheless:
https://cgit.freedesktop.org/mesa/mesa/tree/src/intel/vulkan/anv_wsi_x11.c?h=12.0#n682

Signed-off-by: Bernd Kuhls <bernd.kuhls@t-online.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 package/mesa3d/Config.in | 29 ++++++++++++++++++++++++++++-
 package/mesa3d/mesa3d.mk | 10 ++++++++++
 2 files changed, 38 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 738ca7a..bbab953 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -22,7 +22,7 @@ menuconfig BR2_PACKAGE_MESA3D
 
 if BR2_PACKAGE_MESA3D
 
-# inform the .mk file of gallium or dri driver selection
+# inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_MESA3D_DRIVER
 	bool
@@ -33,6 +33,10 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER
 	select BR2_PACKAGE_XPROTO_PRESENTPROTO if BR2_PACKAGE_XPROTO_DRI3PROTO
 	bool
 
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	bool
+	select BR2_PACKAGE_MESA3D_DRIVER
+
 config BR2_PACKAGE_MESA3D_DRIVER
 	bool
 
@@ -132,6 +136,29 @@ config BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON
 	help
 	  Legacy Radeon driver for R100 series GPUs.
 
+comment "Vulkan drivers"
+
+config BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL
+	bool "Vulkan Intel driver"
+	depends on BR2_i386 || BR2_x86_64
+	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 # memfd.h
+	depends on BR2_TOOLCHAIN_USES_GLIBC # ifunc, static_assert
+	depends on BR2_PACKAGE_XORG7 # xproto_dri3proto
+	# We need a SHA1 implementation. If either openssl or
+	# libgcrypt are already part of the build, we'll use one of
+	# them, otherwise, use the small libsha1 library.
+	select BR2_PACKAGE_LIBSHA1 if (!BR2_PACKAGE_OPENSSL && !BR2_PACKAGE_LIBGCRYPT)
+	select BR2_PACKAGE_MESA3D_DRI_DRIVER_I965
+	select BR2_PACKAGE_MESA3D_VULKAN_DRIVER
+	select BR2_PACKAGE_XPROTO_DRI3PROTO
+	help
+	  Vulkan driver for Intel hardware from Ivy Bridge onward.
+
+comment "intel vulkan depends on X.org and needs a glibc toolchain w/ headers >= 3.18"
+	depends on BR2_i386 || BR2_x86_64
+	depends on !BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_18 || \
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_PACKAGE_XORG7
+
 comment "Off-screen Rendering"
 
 config BR2_PACKAGE_MESA3D_OSMESA
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index a5380a7..1aa82d8 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -86,6 +86,8 @@ MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I915)   += i915
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_I965)   += i965
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_NOUVEAU) += nouveau
 MESA3D_DRI_DRIVERS-$(BR2_PACKAGE_MESA3D_DRI_DRIVER_RADEON) += radeon
+# Vulkan Drivers
+MESA3D_VULKAN_DRIVERS-$(BR2_PACKAGE_MESA3D_VULKAN_DRIVER_INTEL)   += intel
 
 ifeq ($(BR2_PACKAGE_MESA3D_GALLIUM_DRIVER),)
 MESA3D_CONF_OPTS += \
@@ -115,6 +117,14 @@ MESA3D_CONF_OPTS += \
 	--with-dri-drivers=$(subst $(space),$(comma),$(MESA3D_DRI_DRIVERS-y))
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_VULKAN_DRIVER),)
+MESA3D_CONF_OPTS += \
+	--without-vulkan-drivers
+else
+MESA3D_CONF_OPTS += \
+	--with-vulkan-drivers=$(subst $(space),$(comma),$(MESA3D_VULKAN_DRIVERS-y))
+endif
+
 # APIs
 
 ifeq ($(BR2_PACKAGE_MESA3D_OSMESA),y)
