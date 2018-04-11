From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed, 11 Apr 2018 18:14:51 +0200
Subject: [Buildroot] [PATCH v6 3/4] package/mesa3d: enable OpenCL support
In-Reply-To: <20180411161452.25043-1-valentin.korenblit@smile.fr>
References: <20180411161452.25043-1-valentin.korenblit@smile.fr>
Message-ID: <20180411161452.25043-4-valentin.korenblit@smile.fr>
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
 package/mesa3d/Config.in | 8 ++++++++
 package/mesa3d/mesa3d.mk | 9 +++++++++
 2 files changed, 17 insertions(+)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index bd3d050e29..f27aed949a 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -47,6 +47,14 @@ comment "llvm support needs a toolchain not affected by GCC bug 64735"
 	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
 
+#clang and libclc dependencies are satisfied by BR2_PACKAGE_MESA3D_LLVM
+config BR2_PACKAGE_MESA3D_OPENCL
+	bool "OpenCL support"
+	depends on BR2_PACKAGE_MESA3D_LLVM
+	depends on BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
+	select BR2_PACKAGE_CLANG
+	select BR2_PACKAGE_LIBCLC
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 506f84274f..11245be2ba 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -230,4 +230,13 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_OPENCL),y)
+MESA3D_DEPENDENCIES += clang elfutils libclc
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
