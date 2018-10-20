From: Valentin Korenblit <valentinkorenblit@gmail.com>
Date: Sat, 20 Oct 2018 16:34:50 +0200
Subject: [Buildroot] [PATCH v8 3/4] package/mesa3d: enable OpenCL support
In-Reply-To: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
References: <1540046091-13736-1-git-send-email-valentinkorenblit@gmail.com>
Message-ID: <1540046091-13736-4-git-send-email-valentinkorenblit@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides Clover, the OpenCL 1.1 API implementation by Mesa
for AMD GPUs. It generates libOpenCL.so.

Add --disable-opencl-icd because in Mesa 18 it defaults to on.
When disabled, the shared library is named libOpenCL instead
of libMesaOpenCL and CL headers are installed.

Given that clc headers are being installed to a non-standard location, it is
necessary to specify this path in configure.ac. Otherwise, pkg-config
will output the absolute path to these headers located in STAGING_DIR, which
will cause a runtime error when calling clBuildProgram.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Signed-off-by: Valentin Korenblit <valentinkorenblit@gmail.com>
---
 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch | 26 +++++++++++++++++++++++++
 package/mesa3d/Config.in                        |  9 +++++++++
 package/mesa3d/mesa3d.mk                        | 11 ++++++++++-
 3 files changed, 45 insertions(+), 1 deletion(-)
 create mode 100644 package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch

diff --git a/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
new file mode 100644
index 0000000..e9a8b25
--- /dev/null
+++ b/package/mesa3d/0003-set-LIBCLC_INCLUDEDIR.patch
@@ -0,0 +1,26 @@
+From 94bceeb621e36f3188c6246a763def8695526578 Mon Sep 17 00:00:00 2001
+From: Valentin Korenblit <valentinkorenblit@gmail.com>
+Date: Sat, 20 Oct 2018 10:56:23 +0200
+Subject: [PATCH 1/1] set LIBCLC_INCLUDEDIR
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
index 872859b..f16f1b1 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -50,6 +50,15 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+#clang and libclc dependencies are satisfied by BR2_PACKAGE_MESA3D_LLVM
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "OpenCL support"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600 || \
+		BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_RADEONSI
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_LIBCLC
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 48041dd..b32ce59 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -10,6 +10,7 @@ MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://mesa.freedesktop.org/archive
 MESA3D_LICENSE = MIT, SGI, Khronos
 MESA3D_LICENSE_FILES = docs/license.html
+# 0003-set-LIBCLC_INCLUDEDIR.patch needed when OpenCL is enabled
 MESA3D_AUTORECONF = YES
 
 MESA3D_INSTALL_STAGING = YES
@@ -43,8 +44,16 @@ else
 MESA3D_CONF_OPTS += --disable-llvm
 endif
 
-# Disable opencl in case libclc is detected
+# Disable opencl-icd: OpenCL lib will be named libOpenCL instead of
+# libMesaOpenCL and CL headers are installed
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_DEPENDENCIES += clang libclc
+MESA3D_CONF_OPTS += --enable-opencl \
+	--disable-opencl-icd \
+	--with-clang-libdir=$(STAGING_DIR)/usr/lib
+else
 MESA3D_CONF_OPTS += --disable-opencl
+endif
 
 ifeq ($(BR2_PACKAGE_MESA3D_NEEDS_ELFUTILS),y)
 MESA3D_DEPENDENCIES += elfutils
-- 
2.7.4
