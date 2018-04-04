From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Wed,  4 Apr 2018 18:31:20 +0200
Subject: [Buildroot] [PATCH v5 3/7] package/mesa3d: enable llvm support
In-Reply-To: <20180404163124.27934-1-valentin.korenblit@smile.fr>
References: <20180404163124.27934-1-valentin.korenblit@smile.fr>
Message-ID: <20180404163124.27934-4-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides LLVM support for Mesa3D, enabling llvmpipe
software rasterizer if Gallium swrast is selected.

In case Gallium r600 is selected, llvm AMDGPU backend is built.

Having llvm installed also enables radeonsi Gallium driver, but
it is not provided with this patch as it hasn't been tested.

It uses llvm-config (host variant) installed in STAGING_DIR/usr/bin
to get LLVM libraries. Assuming that LLVM version 5.0.1 is installed,
llvm-config --libs will output -lLLVM-5.0.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
Tested-by: J?r?me Oufella <jerome.oufella@savoirfairelinux.com>
---

llvmpipe tested running glmark2-es2 on x86, ARM and Aarch64

 package/mesa3d/Config.in |  6 ++++++
 package/mesa3d/mesa3d.mk | 14 +++++++++++---
 2 files changed, 17 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f141587c4d..ffe0287ac5 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -25,6 +25,11 @@ menuconfig BR2_PACKAGE_MESA3D
 
 if BR2_PACKAGE_MESA3D
 
+config BR2_PACKAGE_MESA3D_LLVM
+	bool "llvm support"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	select BR2_PACKAGE_LLVM
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
@@ -77,6 +82,7 @@ config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_R600
 	depends on BR2_i386 || BR2_x86_64
 	select BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	select BR2_PACKAGE_LIBDRM_RADEON
+	select BR2_PACKAGE_LLVM_AMDGPU if BR2_PACKAGE_MESA3D_LLVM
 	select BR2_PACKAGE_MESA3D_NEEDS_XA
 	help
 	  Driver for ATI/AMD Radeon R600/R700/HD5000/HD6000 GPUs.
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 1d88fd8480..506f84274f 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -32,6 +32,17 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
 MESA3D_CONF_OPTS += --disable-static
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_LLVM),y)
+MESA3D_DEPENDENCIES += host-llvm llvm
+MESA3D_CONF_OPTS += \
+	--with-llvm-prefix=$(STAGING_DIR)/usr \
+	--enable-llvm-shared-libs \
+	--enable-llvm
+else
+# Avoid automatic search of llvm-config
+MESA3D_CONF_OPTS += --disable-llvm
+endif
+
 # The Sourcery MIPS toolchain has a special (non-upstream) feature to
 # have "compact exception handling", which unfortunately breaks with
 # mesa3d, so we disable it here by passing -mno-compact-eh.
@@ -219,7 +230,4 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
-# Avoid automatic search of llvm-config
-MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
-
 $(eval $(autotools-package))
-- 
2.14.3
