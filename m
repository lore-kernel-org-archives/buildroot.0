From: Romain Naour <romain.naour@gmail.com>
Date: Mon,  3 Jul 2017 12:18:44 +0200
Subject: [Buildroot] [RFC 7/9] package/mesa3d: enable llvm support
In-Reply-To: <20170703101846.1158-1-romain.naour@gmail.com>
References: <20170703101846.1158-1-romain.naour@gmail.com>
Message-ID: <20170703101846.1158-8-romain.naour@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Romain Naour <romain.naour@gmail.com>
Cc: Adrian Perez de Castro <aperez@igalia.com>
---
 package/mesa3d/Config.in |  8 ++++++++
 package/mesa3d/mesa3d.mk | 17 ++++++++++++++---
 2 files changed, 22 insertions(+), 3 deletions(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index ad41b1c..94ef767 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -23,6 +23,14 @@ menuconfig BR2_PACKAGE_MESA3D
 
 if BR2_PACKAGE_MESA3D
 
+config BR2_PACKAGE_MESA3D_LLVM
+	bool "mesa3d w/ llvm"
+	depends on BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+	select BR2_PACKAGE_LLVM
+
+comment "mesa3d w/ llvm needs a llvm compiler"
+	depends on !BR2_PACKAGE_LLVM_ARCH_SUPPORTS
+
 # inform the .mk file of gallium, dri or vulkan driver selection
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER
 	bool
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 7b312e3..4633bff 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -26,6 +26,20 @@ MESA3D_DEPENDENCIES = \
 # Disable assembly usage.
 MESA3D_CONF_OPTS = --disable-asm
 
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
@@ -213,7 +227,4 @@ else
 MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
-# Avoid automatic search of llvm-config
-MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
-
 $(eval $(autotools-package))
-- 
2.9.4
