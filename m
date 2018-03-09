From: Valentin Korenblit <valentin.korenblit@smile.fr>
Date: Fri,  9 Mar 2018 17:49:37 +0100
Subject: [Buildroot] [PATCH v3 4/6] package/mesa3d: enable llvm support
In-Reply-To: <20180309164939.16075-1-valentin.korenblit@smile.fr>
References: <20180309164939.16075-1-valentin.korenblit@smile.fr>
Message-ID: <20180309164939.16075-5-valentin.korenblit@smile.fr>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This patch provides LLVM support for Mesa3D, enabling llvmpipe
software rasterizer.

It uses llvm-config (host variant) installed in STAGING_DIR/usr/bin
to get LLVM libraries. Assuming that LLVM version 5.0.1 is installed,
llvm-config --libs will output -lLLVM-5.0.

Signed-off-by: Valentin Korenblit <valentin.korenblit@smile.fr>
---
 package/mesa3d/Config.in |  8 ++++++++
 package/mesa3d/mesa3d.mk | 17 ++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index f141587c4d..e99e737d31 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -25,6 +25,14 @@ menuconfig BR2_PACKAGE_MESA3D
 
 if BR2_PACKAGE_MESA3D
 
+config BR2_PACKAGE_MESA3D_LLVM
+	bool "mesa3d w/ llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	select BR2_PACKAGE_LLVM
+
+comment "mesa3d w/ llvm needs llvm"
+	depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 5f4832c0f0..03104c3c00 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -32,6 +32,20 @@ ifeq ($(BR2_SHARED_STATIC_LIBS),y)
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
+MESA3D_CONF_OPTS += \
+	--with-llvm-prefix=$(STAGING_DIR)/usr \
+	--disable-llvm-shared-libs \
+	--disable-llvm
+endif
+
 # The Sourcery MIPS toolchain has a special (non-upstream) feature to
 # have "compact exception handling", which unfortunately breaks with
 # mesa3d, so we disable it here by passing -mno-compact-eh.
@@ -219,7 +233,4 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
-# Avoid automatic search of llvm-config
-MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
-
 $(eval $(autotools-package))
-- 
2.14.3
