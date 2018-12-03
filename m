From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 3 Dec 2018 23:07:20 +0100
Subject: [Buildroot] [git commit] package/mesa3d: enable OpenCL support
Message-ID: <20181203220540.D05478A62B@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=fddf7a04a5b86ec56a77b963c69892aead17f97a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch provides Clover, the OpenCL 1.1 API implementation by Mesa
for AMD GPUs. It generates libOpenCL.so.

Add --disable-opencl-icd because in Mesa 18 it defaults to on.  When
disabled, the shared library is named libOpenCL instead of
libMesaOpenCL and CL headers are installed.

Given that clc headers are being installed to a non-standard location,
it is necessary to specify this path in configure.ac. Otherwise,
pkg-config will output the absolute path to these headers located in
STAGING_DIR, which will cause a runtime error when calling
clBuildProgram.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
[Thomas:
 - improve the description of the patch, based on input from Romain
 - register as a libopencl provider]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Valentin Korenblit <a class="moz-txt-link-rfc2396E" href="mailto:valentin.korenblit@smile.fr">&lt;valentin.korenblit at smile.fr&gt;</a>
Signed-off-by: Valentin Korenblit <a class="moz-txt-link-rfc2396E" href="mailto:valentinkorenblit@gmail.com">&lt;valentinkorenblit at gmail.com&gt;</a>
Signed-off-by: Thomas Petazzoni <a class="moz-txt-link-rfc2396E" href="mailto:thomas.petazzoni@bootlin.com">&lt;thomas.petazzoni at bootlin.com&gt;</a>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 37 +++++++++++++++++++++++++
 package/mesa3d/Config.in                        | 14 ++++++++++
 package/mesa3d/mesa3d.mk                        | 12 +++++++-
 3 files changed, 62 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
new file mode 100644
index 0000000000..42ae826a36
--- /dev/null
+++ b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
@@ -0,0 +1,37 @@
+From 94bceeb621e36f3188c6246a763def8695526578 Mon Sep 17 00:00:00 2001
+From: Valentin Korenblit <valentinkorenblit@gmail.com>
+Date: Sat, 20 Oct 2018 10:56:23 +0200
+Subject: [PATCH] Set proper value for LIBCLC_INCLUDEDIR
+
+LIBCLC_INCLUDEDIR is the location where mesa3d OpenCL implementation
+will look for OpenCL "headers" on the target, when building the OpenCL
+kernels.
+
+The value returned by pkg-config for includedir is relevant when
+cross-compiling, on the build machine. But in this specific case, we
+really need a value that is valid on the target.
+
+Those headers are installed by the libclc package in /usr/share so
+that they are not removed by Buildroot target-finalize logic.
+
+Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
+---
+ configure.ac | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/configure.ac b/configure.ac
+index 864dcae..cc2390b 100644
+--- a/configure.ac
++++ b/configure.ac
+@@ -2429,7 +2429,7 @@ if test "x$enable_opencl" = xyes; then
+                     PKG_CONFIG_PATH environment variable.
+                     By default libclc.pc is installed to /usr/local/share/pkgconfig/])
+     else
+-        LIBCLC_INCLUDEDIR=`$PKG_CONFIG --variable=includedir libclc`
++        LIBCLC_INCLUDEDIR="/usr/share"
+         LIBCLC_LIBEXECDIR=`$PKG_CONFIG --variable=libexecdir libclc`
+         AC_SUBST([LIBCLC_INCLUDEDIR])
+         AC_SUBST([LIBCLC_LIBEXECDIR])
+-- 
+2.7.4
+
diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index c9e08af09f..5019f2683b 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -51,6 +51,17 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+# clang and libclc dependencies are satisfied by
+# BR2_PACKAGE_MESA3D_LLVM
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "OpenCL support"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_LIBCLC
+	select BR2_PACKAGE_HAS_LIBOPENCL
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
@@ -271,6 +282,9 @@ config BR2_PACKAGE_PROVIDES_LIBEGL
 config BR2_PACKAGE_PROVIDES_LIBGLES
 	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENGL_ES
 
+config BR2_PACKAGE_PROVIDES_LIBOPENCL
+	default "mesa3d" if BR2_PACKAGE_MESA3D_OPENCL
+
 endif # BR2_PACKAGE_MESA3D
 
 comment "mesa3d needs a toolchain w/ C++, NPTL, dynamic library"
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 176997068a..6d36499747 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -11,6 +11,7 @@ MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
 # 0002-configure.ac-invert-order-for-wayland-scanner-check.patch
+# 0003-set-LIBCLC_INCLUDEDIR.patch
 MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
@@ -44,8 +45,17 @@ else
 MESA3D_CONF_OPTS += --disable-llvm
 endif
 
-# Disable opencl in case libclc is detected
+# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
+# libMesaOpenCL and CL headers are installed
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_PROVIDES += libopencl
+MESA3D_DEPENDENCIES += clang libclc
+MESA3D_CONF_OPTS += --enable-opencl \
+	--disable-opencl-icd \
+	--with-clang-libdir=$(STAGING_DIR)/usr/lib
+else
 MESA3D_CONF_OPTS += --disable-opencl
+endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
 MESA3D_DEPENDENCIES += elfutils
