From: Adrian Perez de Castro <aperez@igalia.com>
Date: Fri, 16 Jun 2017 23:41:43 +0300
Subject: [Buildroot] [PATCH 2/2] mesa3d: Allow optionally using LLVM in
	drivers
In-Reply-To: <20170616204143.29198-1-aperez@igalia.com>
References: <20170616204143.29198-1-aperez@igalia.com>
Message-ID: <20170616204143.29198-3-aperez@igalia.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Signed-off-by: Adrian Perez de Castro <aperez@igalia.com>
---
 package/mesa3d/Config.in | 11 +++++++++++
 package/mesa3d/mesa3d.mk |  9 ++++++++-
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/package/mesa3d/Config.in b/package/mesa3d/Config.in
index 36a0304e27..03a0668a01 100644
--- a/package/mesa3d/Config.in
+++ b/package/mesa3d/Config.in
@@ -44,6 +44,17 @@ config BR2_PACKAGE_MESA3D_DRIVER
 config BR2_PACKAGE_MESA3D_NEEDS_XA
 	bool
 
+config BR2_PACKAGE_MESA3D_USE_LLVM
+	bool "Enable LLVM usage"
+	default y
+	depends on BR2_PACKAGE_LLVM
+	select BR2_PACKAGE_LLVM_ENABLE_RTTI
+	help
+		Build optimized driver code which makes use of LLVM (e.g. llvmpipe).
+
+comment "optional llvm support depends on llvm"
+	depends on !BR2_PACKAGE_LLVM
+
 comment "Gallium drivers"
 
 config BR2_PACKAGE_MESA3D_GALLIUM_DRIVER_ETNAVIV
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2884063526..2e402e53aa 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -57,6 +57,13 @@ MESA3D_CONF_OPTS += \
 	--disable-xa
 endif
 
+ifeq ($(BR2_PACKAGE_MESA3D_USE_LLVM),y)
+MESA3D_DEPENDENCIES += llvm
+MESA3D_CONF_OPTS += --enable-llvm
+else
+MESA3D_CONF_OPTS += --disable-llvm
+endif
+
 # Drivers
 
 #Gallium Drivers
@@ -211,6 +218,6 @@ MESA3D_CONF_OPTS += --disable-lmsensors
 endif
 
 # Avoid automatic search of llvm-config
-MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr/bin
+MESA3D_CONF_OPTS += --with-llvm-prefix=$(STAGING_DIR)/usr
 
 $(eval $(autotools-package))
-- 
2.13.1
