From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Jul 2018 11:26:28 +0200
Subject: [Buildroot] [PATCH v2 5/8] imx-vpu: new virtual package
In-Reply-To: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
References: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
Message-ID: <20180726092631.4888-6-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Since it can be provided by either imx-vpu-cnm or imx-vpu-hantro.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 package/freescale-imx/Config.in                      | 1 +
 package/freescale-imx/imx-codec/imx-codec.mk         | 2 +-
 package/freescale-imx/imx-vpu-cnm/Config.in          | 8 ++++++++
 package/freescale-imx/imx-vpu-hantro/Config.in       | 8 ++++++++
 package/freescale-imx/imx-vpu/Config.in              | 6 ++++++
 package/freescale-imx/imx-vpu/imx-vpu.mk             | 7 +++++++
 package/freescale-imx/imx-vpuwrap/Config.in          | 7 +++----
 package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk     | 2 +-
 package/gstreamer/gst-fsl-plugins/Config.in          | 2 +-
 package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk | 2 +-
 package/libimxvpuapi/Config.in                       | 7 +++----
 package/libimxvpuapi/libimxvpuapi.mk                 | 2 +-
 12 files changed, 41 insertions(+), 13 deletions(-)
 create mode 100644 package/freescale-imx/imx-vpu/Config.in
 create mode 100644 package/freescale-imx/imx-vpu/imx-vpu.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 9b47958ff3..bcddf647ef 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -80,6 +80,7 @@ source "package/freescale-imx/imx-lib/Config.in"
 source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
+source "package/freescale-imx/imx-vpu/Config.in"
 source "package/freescale-imx/imx-vpu-cnm/Config.in"
 source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
diff --git a/package/freescale-imx/imx-codec/imx-codec.mk b/package/freescale-imx/imx-codec/imx-codec.mk
index 7b8a5bd4d5..7f738d8129 100644
--- a/package/freescale-imx/imx-codec/imx-codec.mk
+++ b/package/freescale-imx/imx-codec/imx-codec.mk
@@ -21,7 +21,7 @@ ifeq ($(BR2_ARM_EABIHF),y)
 IMX_CODEC_CONF_OPTS += --enable-fhw
 endif
 
-ifeq ($(BR2_PACKAGE_IMX_VPU_CNM),y)
+ifeq ($(BR2_PACKAGE_HAS_IMX_VPU),y)
 IMX_CODEC_CONF_OPTS += --enable-vpu
 endif
 
diff --git a/package/freescale-imx/imx-vpu-cnm/Config.in b/package/freescale-imx/imx-vpu-cnm/Config.in
index dfe9608600..89e77017da 100644
--- a/package/freescale-imx/imx-vpu-cnm/Config.in
+++ b/package/freescale-imx/imx-vpu-cnm/Config.in
@@ -7,6 +7,7 @@ config BR2_PACKAGE_IMX_VPU_CNM
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	select BR2_PACKAGE_FIRMWARE_IMX
+	select BR2_PACKAGE_HAS_IMX_VPU
 	help
 	  Library of userspace helpers specific for the NXP i.MX SoC
 	  integrating a Chips&Media CODA Video Processing Unit (VPU)
@@ -16,3 +17,10 @@ config BR2_PACKAGE_IMX_VPU_CNM
 
 	  This library is provided by NXP as-is and doesn't have an
 	  upstream.
+
+if BR2_PACKAGE_IMX_VPU_CNM
+
+config BR2_PACKAGE_PROVIDES_IMX_VPU
+	default "imx-vpu-cnm"
+
+endif
diff --git a/package/freescale-imx/imx-vpu-hantro/Config.in b/package/freescale-imx/imx-vpu-hantro/Config.in
index 5c6fdf44ed..60dc5d8db0 100644
--- a/package/freescale-imx/imx-vpu-hantro/Config.in
+++ b/package/freescale-imx/imx-vpu-hantro/Config.in
@@ -6,6 +6,7 @@ config BR2_PACKAGE_IMX_VPU_HANTRO
 	bool "imx-vpu-hantro"
 	depends on BR2_aarch64 # Only relevant for i.MX8
 	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	select BR2_PACKAGE_HAS_IMX_VPU
 	help
 	  Library of userspace helpers specific for the NXP i.MX SoC
 	  integrating a Hantro Video Processing Unit (VPU) such as the
@@ -15,3 +16,10 @@ config BR2_PACKAGE_IMX_VPU_HANTRO
 
 	  This library is provided by NXP as-is and doesn't have an
 	  upstream.
+
+if BR2_PACKAGE_IMX_VPU_HANTRO
+
+config BR2_PACKAGE_PROVIDES_IMX_VPU
+	default "imx-vpu-hantro"
+
+endif
diff --git a/package/freescale-imx/imx-vpu/Config.in b/package/freescale-imx/imx-vpu/Config.in
new file mode 100644
index 0000000000..caefe9db8c
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/Config.in
@@ -0,0 +1,6 @@
+config BR2_PACKAGE_HAS_IMX_VPU
+	bool
+
+config BR2_PACKAGE_PROVIDES_IMX_VPU
+	depends on BR2_PACKAGE_HAS_IMX_VPU
+	string
diff --git a/package/freescale-imx/imx-vpu/imx-vpu.mk b/package/freescale-imx/imx-vpu/imx-vpu.mk
new file mode 100644
index 0000000000..6e44ad1fce
--- /dev/null
+++ b/package/freescale-imx/imx-vpu/imx-vpu.mk
@@ -0,0 +1,7 @@
+################################################################################
+#
+# imx-vpu
+#
+################################################################################
+
+$(eval $(virtual-package))
diff --git a/package/freescale-imx/imx-vpuwrap/Config.in b/package/freescale-imx/imx-vpuwrap/Config.in
index 85eb16004d..87303cca9d 100644
--- a/package/freescale-imx/imx-vpuwrap/Config.in
+++ b/package/freescale-imx/imx-vpuwrap/Config.in
@@ -2,16 +2,15 @@ comment "imx-vpuwrap needs an imx-specific Linux kernel to be built"
 	depends on BR2_arm
 	depends on !BR2_LINUX_KERNEL
 
-comment "imx-vpuwrap needs an i.MX platform with VPU support"
+comment "imx-vpuwrap needs an i.MX VPU backend provider"
 	depends on BR2_arm
-	depends on BR2_LINUX_KERNEL && !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	depends on BR2_LINUX_KERNEL && !BR2_PACKAGE_HAS_IMX_VPU
 
 config BR2_PACKAGE_IMX_VPUWRAP
 	bool "imx-vpuwrap"
 	depends on BR2_LINUX_KERNEL
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
-	select BR2_PACKAGE_IMX_VPU_CNM
+	depends on BR2_PACKAGE_HAS_IMX_VPU
 	help
 	  Wrapper library for the vpu library, giving it a different
 	  API.
diff --git a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
index 0b60868e9a..edba87279f 100644
--- a/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
+++ b/package/freescale-imx/imx-vpuwrap/imx-vpuwrap.mk
@@ -7,7 +7,7 @@
 IMX_VPUWRAP_VERSION = 1.0.68
 IMX_VPUWRAP_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPUWRAP_SOURCE = imx-vpuwrap-$(IMX_VPUWRAP_VERSION).bin
-IMX_VPUWRAP_DEPENDENCIES = imx-vpu-cnm
+IMX_VPUWRAP_DEPENDENCIES = imx-vpu
 IMX_VPUWRAP_INSTALL_STAGING = YES
 
 IMX_VPUWRAP_LICENSE = NXP Semiconductor Software License Agreement
diff --git a/package/gstreamer/gst-fsl-plugins/Config.in b/package/gstreamer/gst-fsl-plugins/Config.in
index a2ff11ec3e..86226c31fb 100644
--- a/package/gstreamer/gst-fsl-plugins/Config.in
+++ b/package/gstreamer/gst-fsl-plugins/Config.in
@@ -11,7 +11,7 @@ config BR2_PACKAGE_GST_FSL_PLUGINS
 	depends on BR2_arm # Only relevant for i.MX
 	depends on BR2_TOOLCHAIN_USES_GLIBC # imx-codec
 	select BR2_PACKAGE_GST_PLUGINS_BASE
-	select BR2_PACKAGE_IMX_VPUWRAP if BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	select BR2_PACKAGE_IMX_VPUWRAP if BR2_PACKAGE_HAS_IMX_VPU
 	select BR2_PACKAGE_IMX_LIB
 	select BR2_PACKAGE_IMX_PARSER
 	select BR2_PACKAGE_IMX_CODEC
diff --git a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
index 547d253e88..45a629ba39 100644
--- a/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
+++ b/package/gstreamer/gst-fsl-plugins/gst-fsl-plugins.mk
@@ -18,7 +18,7 @@ GST_FSL_PLUGINS_AUTORECONF = YES
 GST_FSL_PLUGINS_DEPENDENCIES += host-pkgconf gstreamer gst-plugins-base \
 	imx-lib imx-parser imx-codec
 
-ifeq ($(BR2_PACKAGE_FREESCALE_IMX_HAS_VPU),y)
+ifeq ($(BR2_PACKAGE_HAS_IMX_VPU),y)
 GST_FSL_PLUGINS_DEPENDENCIES += imx-vpuwrap
 endif
 
diff --git a/package/libimxvpuapi/Config.in b/package/libimxvpuapi/Config.in
index 3d25b3b751..479377743d 100644
--- a/package/libimxvpuapi/Config.in
+++ b/package/libimxvpuapi/Config.in
@@ -1,12 +1,11 @@
-comment "libimxvpuapi needs an i.MX platform with VPU support"
+comment "libimxvpuapi needs an i.MX VPU backend provider"
 	depends on BR2_arm
-	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	depends on !BR2_PACKAGE_HAS_IMX_VPU
 
 config BR2_PACKAGE_LIBIMXVPUAPI
 	bool "libimxvpuapi"
 	depends on BR2_arm # Only relevant for i.MX
-	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
-	select BR2_PACKAGE_IMX_VPU_CNM
+	depends on BR2_PACKAGE_HAS_IMX_VPU
 	help
 	  This library provides an API for using the iMX6 VPU video
 	  engine. It is an alternative to Freescale's VPU
diff --git a/package/libimxvpuapi/libimxvpuapi.mk b/package/libimxvpuapi/libimxvpuapi.mk
index 27189ff044..bcabbf3877 100644
--- a/package/libimxvpuapi/libimxvpuapi.mk
+++ b/package/libimxvpuapi/libimxvpuapi.mk
@@ -8,7 +8,7 @@ LIBIMXVPUAPI_VERSION = 0.10.3
 LIBIMXVPUAPI_SITE = $(call github,Freescale,libimxvpuapi,$(LIBIMXVPUAPI_VERSION))
 LIBIMXVPUAPI_LICENSE = LGPL-2.1+
 LIBIMXVPUAPI_LICENSE_FILES = LICENSE
-LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu-cnm
+LIBIMXVPUAPI_DEPENDENCIES = host-pkgconf host-python imx-vpu
 LIBIMXVPUAPI_INSTALL_STAGING = YES
 
 $(eval $(waf-package))
-- 
2.18.0
