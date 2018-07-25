From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Wed, 25 Jul 2018 17:01:43 +0200
Subject: [Buildroot] [PATCH 2/8] imx-vpu: rename package to imx-vpu-cnm
In-Reply-To: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
References: <20180725150149.30774-1-gary.bisson@boundarydevices.com>
Message-ID: <20180725150149.30774-3-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

So far the i.MX processors have been using a Chips&Media CODA VPU.
But the latest generation of processors (starting with i.MX8MQ) uses
VPU cores from Hantro which is provided as imx-vpu-hantro package.

NXP chose in Yocto to keep the imx-vpu naming for Chips&Media package
and created a virtual "imxvpu" package that can either be provided by
imx-vpu or imx-vpu-hantro.

Since this naming can be confusing (IMO), renaming the imx-vpu package
to imx-vpu-cnm and then create a virtual imx-vpu one should be clearer.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in               |  2 +-
 package/freescale-imx/imx-codec/imx-codec.mk  |  2 +-
 .../{imx-vpu => imx-vpu-cnm}/Config.in        | 12 +++---
 .../imx-vpu-cnm.hash}                         |  0
 .../freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk  | 39 +++++++++++++++++++
 package/freescale-imx/imx-vpu/imx-vpu.mk      | 39 -------------------
 package/freescale-imx/imx-vpuwrap/Config.in   |  2 +-
 .../freescale-imx/imx-vpuwrap/imx-vpuwrap.mk  |  2 +-
 package/libimxvpuapi/Config.in                |  2 +-
 package/libimxvpuapi/libimxvpuapi.mk          |  2 +-
 10 files changed, 51 insertions(+), 51 deletions(-)
 rename package/freescale-imx/{imx-vpu => imx-vpu-cnm}/Config.in (54%)
 rename package/freescale-imx/{imx-vpu/imx-vpu.hash => imx-vpu-cnm/imx-vpu-cnm.hash} (100%)
 create mode 100644 package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
 delete mode 100644 package/freescale-imx/imx-vpu/imx-vpu.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 30e71b825f..5e0c7ff291 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -79,7 +79,7 @@ source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
-source "package/freescale-imx/imx-vpu/Config.in"
+source "package/freescale-imx/imx-vpu-cnm/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 784c1fa4a9..7b8a5bd4d5 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -21,7 +21,7 @@ ifeq ($(BR2_ARM_EABIHF),y)
 IMX_CODEC_CONF_OPTS += --enable-fhw
 endif
 
-ifeq ($(BR2_PACKAGE_IMX_VPU),y)
+ifeq ($(BR2_PACKAGE_IMX_VPU_CNM),y)
 IMX_CODEC_CONF_OPTS += --enable-vpu
 endif
 
diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu-cnm/Config.in
similarity index 54%
rename from package/freescale-imx/imx-vpu/Config.in
rename to package/freescale-imx/imx-vpu-cnm/Config.in
index 779717f5ed..1d8b1cb397 100644
--- a/package/freescale-imx/imx-vpu/Config.in
+++ b/package/freescale-imx/imx-vpu-cnm/Config.in
@@ -1,17 +1,17 @@
-comment "imx-vpu needs an i.MX platform with VPU support"
+comment "imx-vpu-cnm needs an i.MX platform with VPU support"
 	depends on BR2_arm
 	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 
-config BR2_PACKAGE_IMX_VPU
-	bool "imx-vpu"
+config BR2_PACKAGE_IMX_VPU_CNM
+	bool "imx-vpu-cnm"
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_FIRMWARE_IMX
 	help
 	  Library of userspace helpers specific for the Freescale i.MX
-	  platform. It wraps the kernel interfaces for the i.MX platform
-	  Video Processing Unit (VPU) driver. It requires a kernel that
-	  includes the i.MX specific headers to be built.
+	  platform integrating a Chips&Media CODA Video Processing Unit
+	  (VPU). It requires a kernel that includes the i.MX specific
+	  headers to be built.
 
 	  This library is provided by Freescale as-is and doesn't have
 	  an upstream.
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.hash b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash
similarity index 100%
rename from package/freescale-imx/imx-vpu/imx-vpu.hash
rename to package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.hash
diff --git a/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
new file mode 100644
index 0000000000..a6cca08e9c
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-cnm/imx-vpu-cnm.mk
@@ -0,0 +1,39 @@
+################################################################################
+#
+# imx-vpu-cnm
+#
+################################################################################
+
+IMX_VPU_CNM_VERSION = 5.4.37
+IMX_VPU_CNM_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPU_CNM_SOURCE = imx-vpu-$(IMX_VPU_CNM_VERSION).bin
+
+IMX_VPU_CNM_INSTALL_STAGING = YES
+
+IMX_VPU_CNM_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
+
+IMX_VPU_CNM_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPU_CNM_LICENSE_FILES = EULA COPYING
+IMX_VPU_CNM_REDISTRIBUTE = NO
+
+define IMX_VPU_CNM_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_CNM_DL_DIR)/$(IMX_VPU_CNM_SOURCE))
+endef
+
+define IMX_VPU_CNM_BUILD_CMDS
+	$(IMX_VPU_CNM_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define IMX_VPU_CNM_INSTALL_STAGING_CMDS
+	$(IMX_VPU_CNM_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
+endef
+
+define IMX_VPU_CNM_INSTALL_TARGET_CMDS
+	$(IMX_VPU_CNM_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
+endef
+
+$(eval $(generic-package))
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
deleted file mode 100644
index 2bcfe53eba..0000000000
--- a/package/freescale-imx/imx-vpu/imx-vpu.mk
+++ /dev/null
@@ -1,39 +0,0 @@
-################################################################################
-#
-# imx-vpu
-#
-################################################################################
-
-IMX_VPU_VERSION = 5.4.37
-IMX_VPU_SITE = $(FREESCALE_IMX_SITE)
-IMX_VPU_SOURCE = imx-vpu-$(IMX_VPU_VERSION).bin
-
-IMX_VPU_INSTALL_STAGING = YES
-
-IMX_VPU_MAKE_ENV = \
-	$(TARGET_MAKE_ENV) \
-	$(TARGET_CONFIGURE_OPTS) \
-	CROSS_COMPILE="$(TARGET_CROSS)" \
-	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
-
-IMX_VPU_LICENSE = NXP Semiconductor Software License Agreement
-IMX_VPU_LICENSE_FILES = EULA COPYING
-IMX_VPU_REDISTRIBUTE = NO
-
-define IMX_VPU_EXTRACT_CMDS
-	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_DL_DIR)/$(IMX_VPU_SOURCE))
-endef
-
-define IMX_VPU_BUILD_CMDS
-	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D)
-endef
-
-define IMX_VPU_INSTALL_STAGING_CMDS
-	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(STAGING_DIR) install
-endef
-
-define IMX_VPU_INSTALL_TARGET_CMDS
-	$(IMX_VPU_MAKE_ENV) $(MAKE1) -C $(@D) DEST_DIR=$(TARGET_DIR) install
-endef
-
-$(eval $(generic-package))
diff --git a/package/freescale-imx/imx-vpuwrap/Config.in b/package/freescale-imx/imx-vpuwrap/Config.in
index bdfa147867..85eb16004d 100644
--- a/package/freescale-imx/imx-vpuwrap/Config.in
+++ b/package/freescale-imx/imx-vpuwrap/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_IMX_VPUWRAP
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
-	select BR2_PACKAGE_IMX_VPU
+	select BR2_PACKAGE_IMX_VPU_CNM
 	help
 	  Wrapper library for the vpu library, giving it a different
 	  API.
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index edba87279f..0b60868e9a 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -7,7 +7,7 @@
 IMX_VPUWRAP_VERSION = 1.0.68
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu
+IMX_VPUWRAP_DEPENDENCIES = imx-vpu-cnm
 IMX_VPUWRAP_INSTALL_STAGING = YES
 
 IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
diff --git a/package/libimxvpuapi/Config.in b/package/libimxvpuapi/Config.in
index 8b8b839ce8..3d25b3b751 100644
--- a/package/libimxvpuapi/Config.in
+++ b/package/libimxvpuapi/Config.in
@@ -6,7 +6,7 @@ config BR2_PACKAGE_LIBIMXVPUAPI
 	bool "libimxvpuapi"
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
-	select BR2_PACKAGE_IMX_VPU
+	select BR2_PACKAGE_IMX_VPU_CNM
 	help
 	  This library provides an API for using the iMX6 VPU video
 	  engine. It is an alternative to Freescale's VPU
diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index bcabbf3877..27189ff044 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -8,7 +8,7 @@ LIBIMXVPUAPI_VERSION = 0.10.3
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
 LIBIMXVPUAPI_LICENSE = LGPL-2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
-LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
+LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu-cnm
 LIBIMXVPUAPI_INSTALL_STAGING = YES
 
 $(eval $(waf-package))
-- 
2.18.0
