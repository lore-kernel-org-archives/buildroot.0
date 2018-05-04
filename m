From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  4 May 2018 13:46:02 +0200
Subject: [Buildroot] [PATCH v7 2/3] package/mesa3d: enable OpenCL support
In-Reply-To: <20180504114603.10135-1-valentin.korenblit@smile.fr>
References: <20180504114603.10135-1-valentin.korenblit@smile.fr>
Message-ID: <20180504114603.10135-3-valentin.korenblit@smile.fr>
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

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/mesa3d/Config.in | 9 +++++++++
 package/mesa3d/mesa3d.mk | 9 +++++++++
 2 files changed, 18 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 8c1877fbc1..ba6eaa55d2 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -51,6 +51,15 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
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
index fb9189741f..95ea0581df 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -237,4 +237,13 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_DEPENDENCIES += clang libclc
+MESA3D_CONF_OPTS += --enable-opencl \
+	--disable-opencl-icd \
+	--with-clang-libdir=$(STAGING_DIR)/usr/lib
+else
+MESA3D_CONF_OPTS += --disable-opencl
+endif
+
 $(eval $(autotools-package))
-- 
2.14.3
