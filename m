From: Lothar Felten <lothar.felten@gmail.com>
Date: Tue, 15 Oct 2019 23:30:59 +0200
Subject: [Buildroot] [RFC PATCH 2/4] ti-sgx-*: bump to latest TI version
In-Reply-To: <20191015213101.27460-1-lothar.felten@gmail.com>
References: <20191015213101.27460-1-lothar.felten@gmail.com>
Message-ID: <20191015213101.27460-2-lothar.felten@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

bump the ti-sgx-km,-um and -demos to the TI version that matches
the TI SDK 06.00.00.07.

Removed all targets except AM335x.
powervr.ini is no longer used in the TI SDK, remove it too.

Signed-off-by: Lothar Felten <lothar.felten@gmail.com>
---
 package/ti-sgx-demos/ti-sgx-demos.hash |  2 +-
 package/ti-sgx-demos/ti-sgx-demos.mk   |  6 ++---
 package/ti-sgx-km/Config.in            | 37 +-------------------------
 package/ti-sgx-km/ti-sgx-km.hash       |  2 +-
 package/ti-sgx-km/ti-sgx-km.mk         | 22 +++++----------
 package/ti-sgx-um/Config.in            |  2 ++
 package/ti-sgx-um/powervr.ini          |  6 -----
 package/ti-sgx-um/ti-sgx-um.hash       |  2 +-
 package/ti-sgx-um/ti-sgx-um.mk         | 17 +++++-------
 9 files changed, 23 insertions(+), 73 deletions(-)
 delete mode 100644 package/ti-sgx-um/powervr.ini

diff --git a/package/ti-sgx-demos/ti-sgx-demos.hash b/package/ti-sgx-demos/ti-sgx-demos.hash
index 43acf9102..c99e2499c 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.hash
+++ b/package/ti-sgx-demos/ti-sgx-demos.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 9d1d4da2c2b35303e239f99eb4003b8b206078a682aa083d5fb831ee4197f3bf ti-sgx-demos-f24650bc8243b25c23d6a0a502ed79fc472ac424.tar.gz
+sha256 c7238342e3eab4698cf81a65e001ffe91d27fc10129250a6fef380abb5440ad0 ti-sgx-demos-e76ae77b27ef570e7b8494c3d7067fd3d72b5976.tar.gz
diff --git a/package/ti-sgx-demos/ti-sgx-demos.mk b/package/ti-sgx-demos/ti-sgx-demos.mk
index 80af79b98..27418e66a 100644
--- a/package/ti-sgx-demos/ti-sgx-demos.mk
+++ b/package/ti-sgx-demos/ti-sgx-demos.mk
@@ -4,14 +4,14 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_DEMOS_VERSION = f24650bc8243b25c23d6a0a502ed79fc472ac424
+# This correpsonds to SDK 06.00.00.07
+TI_SGX_DEMOS_VERSION = e76ae77b27ef570e7b8494c3d7067fd3d72b5976
 TI_SGX_DEMOS_SITE = git://git.ti.com/graphics/img-pvr-sdk.git
 TI_SGX_DEMOS_LICENSE = Imagination Technologies License Agreement
 TI_SGX_DEMOS_LICENSE_FILES = LegalNotice.txt
 
 define TI_SGX_DEMOS_INSTALL_TARGET_CMDS
-	cp -dpfr $(@D)/targetfs/Examples/Advanced/OGLES* \
+	cp -dpfr $(@D)/targetfs/arm/Examples/Advanced/Wayland/OGLES* \
 		$(TARGET_DIR)/usr/bin/
 endef
 
diff --git a/package/ti-sgx-km/Config.in b/package/ti-sgx-km/Config.in
index 348efdeb8..1e49a538f 100644
--- a/package/ti-sgx-km/Config.in
+++ b/package/ti-sgx-km/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_TI_SGX_KM
 	select BR2_LINUX_NEEDS_MODULES
 	help
 	  Kernel modules for TI CPUs with SGX GPU.
-	  This package supports AM335x, AM437x, AM4430 and AM5430.
+	  This package supports AM335x only.
 	  It builds the kernel module and the user space binaries.
 	  For older CPUs or kernels use the ti-gfx package.
 
@@ -16,38 +16,3 @@ config BR2_PACKAGE_TI_SGX_KM
 
 	  http://git.ti.com/graphics/omap5-sgx-ddk-linux
 
-if BR2_PACKAGE_TI_SGX_KM
-
-choice
-	prompt "Target"
-	default BR2_PACKAGE_TI_SGX_KM_AM335X if BR2_PACKAGE_TI_SGX_AM335X # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM437X if BR2_PACKAGE_TI_SGX_AM437X # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM4430 if BR2_PACKAGE_TI_SGX_AM4430 # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM5430 if BR2_PACKAGE_TI_SGX_AM5430 # legacy
-	default BR2_PACKAGE_TI_SGX_KM_AM335X
-	help
-	  Select the SOC for which you would like to install drivers.
-
-config BR2_PACKAGE_TI_SGX_KM_AM335X
-	bool "AM335x"
-	help
-	  AM335x CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM437X
-	bool "AM437x"
-	help
-	  AM437x CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM4430
-	bool "AM4430"
-	help
-	  AM4430 CPU
-
-config BR2_PACKAGE_TI_SGX_KM_AM5430
-	bool "AM5430"
-	help
-	  AM5430 CPU
-
-endchoice
-
-endif
diff --git a/package/ti-sgx-km/ti-sgx-km.hash b/package/ti-sgx-km/ti-sgx-km.hash
index 7f7e0acd4..2bb5e55f6 100644
--- a/package/ti-sgx-km/ti-sgx-km.hash
+++ b/package/ti-sgx-km/ti-sgx-km.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 47728ff8fc48827116cc042efa777a22a83dd4bd17c494e2a53b8c204ca59624 ti-sgx-km-2b7523d07a13ab704a24a7664749551f4a13ed32.tar.gz
+sha256 f1505f38f9e82f958673bb1755e65090bdbc513a68d41640561d9d491bc4b0e3 ti-sgx-km-4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d.tar.gz
diff --git a/package/ti-sgx-km/ti-sgx-km.mk b/package/ti-sgx-km/ti-sgx-km.mk
index 0e1bc3390..6e1f3fa40 100644
--- a/package/ti-sgx-km/ti-sgx-km.mk
+++ b/package/ti-sgx-km/ti-sgx-km.mk
@@ -4,8 +4,8 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_KM_VERSION = 2b7523d07a13ab704a24a7664749551f4a13ed32
+# This correpsonds to SDK 06.00.00.07
+TI_SGX_KM_VERSION = 4519ed3b83d1d72207ddc2874c7eb5e5a7f20d8d
 TI_SGX_KM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-linux.git
 TI_SGX_KM_LICENSE = GPL-2.0
 TI_SGX_KM_LICENSE_FILES = GPL-COPYING
@@ -15,19 +15,11 @@ TI_SGX_KM_DEPENDENCIES = linux
 TI_SGX_KM_MAKE_OPTS = \
 	$(LINUX_MAKE_FLAGS) \
 	KERNELDIR=$(LINUX_DIR) \
-	PVR_NULLDRM=1
-
-ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM335X),y)
-TI_SGX_KM_PLATFORM_NAME = omap335x
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM437X),y)
-TI_SGX_KM_PLATFORM_NAME = omap437x
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_AM4430),y)
-TI_SGX_KM_PLATFORM_NAME = omap4430
-else ifeq ($(BR2_PACKAGE_TI_SGX_KM_5430),y)
-TI_SGX_KM_PLATFORM_NAME = omap5430
-endif
-
-TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/$(TI_SGX_KM_PLATFORM_NAME)_linux
+	TARGET_PRODUCT=$(TI_SGX_KM_PLATFORM_NAME)
+
+TI_SGX_KM_PLATFORM_NAME = ti335x
+
+TI_SGX_KM_SUBDIR = eurasia_km/eurasiacon/build/linux2/omap_linux
 
 define TI_SGX_KM_BUILD_CMDS
 	$(TARGET_MAKE_ENV) $(MAKE) $(TI_SGX_KM_MAKE_OPTS) \
diff --git a/package/ti-sgx-um/Config.in b/package/ti-sgx-um/Config.in
index 8e1e4fb27..b9cbd143b 100644
--- a/package/ti-sgx-um/Config.in
+++ b/package/ti-sgx-um/Config.in
@@ -15,6 +15,8 @@ config BR2_PACKAGE_TI_SGX_UM
 	select BR2_PACKAGE_HAS_LIBEGL
 	select BR2_PACKAGE_HAS_LIBGLES
 	select BR2_PACKAGE_HAS_POWERVR
+	select BR2_PACKAGE_TI_SGX_LIBGBM
+	select BR2_PACKAGE_LIBFFI
 	help
 	  Graphics libraries for TI CPUs with SGX5xx GPU.
 	  This package supports AM335x, AM437x, AM4430 and AM5430.
diff --git a/package/ti-sgx-um/powervr.ini b/package/ti-sgx-um/powervr.ini
deleted file mode 100644
index fc92d45d5..000000000
--- a/package/ti-sgx-um/powervr.ini
+++ /dev/null
@@ -1,6 +0,0 @@
-[default]
-#defaul library without double buffering:
-WindowSystem=libpvrDRMWSEGL_FRONT.so
-#alternative library, slower but with double buffering
-#WindowSystem=libpvrDRMWSEGL.so
-DisableHWTQTextureUpload=1
diff --git a/package/ti-sgx-um/ti-sgx-um.hash b/package/ti-sgx-um/ti-sgx-um.hash
index a6a056646..10c23374f 100644
--- a/package/ti-sgx-um/ti-sgx-um.hash
+++ b/package/ti-sgx-um/ti-sgx-um.hash
@@ -1,2 +1,2 @@
 # Locally computed:
-sha256 c17f23d255cff8fe72fc3f5cae3d7550e387af07d036954b4f08e573379406d0 ti-sgx-um-e15f1543bab4de9e8927a2c4934addf3fd16ffcb.tar.gz
+sha256 592ecafab76b67a86174fd87dbf0302a4b3a620eaa0e5a2872fbf6e9a33eec69 ti-sgx-um-87d7e5c1e4db1bab048939c9719059d549c1e8dd.tar.gz
diff --git a/package/ti-sgx-um/ti-sgx-um.mk b/package/ti-sgx-um/ti-sgx-um.mk
index d5c50a016..f4397e30d 100644
--- a/package/ti-sgx-um/ti-sgx-um.mk
+++ b/package/ti-sgx-um/ti-sgx-um.mk
@@ -4,28 +4,25 @@
 #
 ################################################################################
 
-# This correpsonds to SDK 02.00.00.00
-TI_SGX_UM_VERSION = e15f1543bab4de9e8927a2c4934addf3fd16ffcb
+# This correpsonds to SDK 06.00.00.07
+TI_SGX_UM_VERSION = 87d7e5c1e4db1bab048939c9719059d549c1e8dd
 TI_SGX_UM_SITE = git://git.ti.com/graphics/omap5-sgx-ddk-um-linux.git
 TI_SGX_UM_LICENSE = TI TSPA License
 TI_SGX_UM_LICENSE_FILES = OMAP5-Linux-Graphics-DDK-UM-Manifest.doc
 TI_SGX_UM_INSTALL_STAGING = YES
+TI_SGX_UM_TARGET=ti335x
 
 # ti-sgx-um is a egl/gles provider only if libdrm is installed
 TI_SGX_UM_DEPENDENCIES = libdrm
 
 define TI_SGX_UM_INSTALL_STAGING_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) install
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(STAGING_DIR) \
+		TARGET_PRODUCT=$(TI_SGX_UM_TARGET) install
 endef
 
 define TI_SGX_UM_INSTALL_TARGET_CMDS
-	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) install
-endef
-
-# libs use the following file for configuration
-define TI_SGX_UM_INSTALL_CONF
-	$(INSTALL) -D -m 0644 package/ti-sgx-um/powervr.ini \
-		$(TARGET_DIR)/etc/powervr.ini
+	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) DISCIMAGE=$(TARGET_DIR) \
+		TARGET_PRODUCT=$(TI_SGX_UM_TARGET) install
 endef
 
 TI_SGX_UM_POST_INSTALL_TARGET_HOOKS += TI_SGX_UM_INSTALL_CONF
-- 
2.17.1
