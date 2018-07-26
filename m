From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu, 26 Jul 2018 11:26:27 +0200
Subject: [Buildroot] [PATCH v2 4/8] imx-vpu-hantro: new package
In-Reply-To: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
References: <20180726092631.4888-1-gary.bisson@boundarydevices.com>
Message-ID: <20180726092631.4888-5-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package provides the user-space libraries needed to use the Hantro
VPU present in processors such as the i.MX8MQ.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Changelog v2:
- Mention i.MX8Mx in Config.in help text (Baruch)
---
 package/freescale-imx/Config.in               |  4 +-
 ...on.h-header-inclusion-to-be-standard.patch | 44 +++++++++++++++++++
 .../freescale-imx/imx-vpu-hantro/Config.in    | 17 +++++++
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  2 +
 .../imx-vpu-hantro/imx-vpu-hantro.mk          | 42 ++++++++++++++++++
 5 files changed, 108 insertions(+), 1 deletion(-)
 create mode 100644 package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
 create mode 100644 package/freescale-imx/imx-vpu-hantro/Config.in
 create mode 100644 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
 create mode 100644 package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk

diff --git a/package/freescale-imx/Config.in b/package/freescale-imx/Config.in
index 5e0c7ff291..9b47958ff3 100644
--- a/package/freescale-imx/Config.in
+++ b/package/freescale-imx/Config.in
@@ -63,7 +63,8 @@ config BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
 	default y if BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX27ADS || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || \
 		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53 || \
-		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX6Q || \
+		BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX8M
 
 config BR2_PACKAGE_FREESCALE_IMX_HAS_VIV_GPU
 	bool
@@ -80,6 +81,7 @@ source "package/freescale-imx/imx-m4fwloader/Config.in"
 source "package/freescale-imx/imx-parser/Config.in"
 source "package/freescale-imx/imx-uuc/Config.in"
 source "package/freescale-imx/imx-vpu-cnm/Config.in"
+source "package/freescale-imx/imx-vpu-hantro/Config.in"
 source "package/freescale-imx/imx-vpuwrap/Config.in"
 source "package/freescale-imx/firmware-imx/Config.in"
 if (BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX51 || BR2_PACKAGE_FREESCALE_IMX_PLATFORM_IMX53)
diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
new file mode 100644
index 0000000000..951ead9824
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
@@ -0,0 +1,44 @@
+From 872c82e7cbb9a0a0e761e8ac70fc28e19a55b4c3 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Thu, 12 Jul 2018 11:38:28 +0200
+Subject: [PATCH] Fix ion.h header inclusion to be standard
+
+NXP "solution" was to manually copy the header to include/linux.
+Let's point the Makefile to the proper (mainline) location instead:
+https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h
+
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ Makefile                                  | 2 ++
+ decoder_sw/software/linux/dwl/dwl_linux.c | 2 +-
+ 2 files changed, 3 insertions(+), 1 deletion(-)
+
+diff --git a/Makefile b/Makefile
+index b74e23a..a5ce22b 100755
+--- a/Makefile
++++ b/Makefile
+@@ -11,6 +11,8 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
+ INCLUDE_HEADERS += -I$(SOURCE_ROOT)/linux/memalloc
+ #INCLUDE_HEADERS += -I$(SOURCE_ROOT)/linux/ldriver
+ INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
++# ION header location
++INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
+ 
+ CFLAGS += -DDEC_MODULE_PATH=\"/dev/mxc_hantro\" -DUSE_FAKE_RFC_TABLE -DFIFO_DATATYPE=void* -DNDEBUG -DDOWN_SCALER \
+            -DUSE_EXTERNAL_BUFFER -DUSE_FAST_EC -DUSE_VP9_EC -DGET_FREE_BUFFER_NON_BLOCK \
+diff --git a/decoder_sw/software/linux/dwl/dwl_linux.c b/decoder_sw/software/linux/dwl/dwl_linux.c
+index 8183660..ed37d86 100644
+--- a/decoder_sw/software/linux/dwl/dwl_linux.c
++++ b/decoder_sw/software/linux/dwl/dwl_linux.c
+@@ -41,7 +41,7 @@
+ #include "dwl.h"
+ #include <linux/hantrodec.h>
+ #ifdef USE_ION
+-#include <linux/ion.h>
++#include <ion.h>
+ #ifdef ANDROID
+ #include <linux/mxc_ion.h>
+ #endif
+-- 
+2.18.0
+
diff --git a/package/freescale-imx/imx-vpu-hantro/Config.in b/package/freescale-imx/imx-vpu-hantro/Config.in
new file mode 100644
index 0000000000..5c6fdf44ed
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/Config.in
@@ -0,0 +1,17 @@
+comment "imx-vpu-hantro needs an i.MX platform with VPU support"
+	depends on BR2_aarch64
+	depends on !BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+
+config BR2_PACKAGE_IMX_VPU_HANTRO
+	bool "imx-vpu-hantro"
+	depends on BR2_aarch64 # Only relevant for i.MX8
+	depends on BR2_PACKAGE_FREESCALE_IMX_HAS_VPU
+	help
+	  Library of userspace helpers specific for the NXP i.MX SoC
+	  integrating a Hantro Video Processing Unit (VPU) such as the
+	  i.MX8MQ/i.MX8MM.
+	  It requires a kernel that includes the i.MX specific headers
+	  to be built.
+
+	  This library is provided by NXP as-is and doesn't have an
+	  upstream.
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
new file mode 100644
index 0000000000..3b1a545b3f
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -0,0 +1,2 @@
+sha256  cbc648e41f005aad209f74c9e5dd346138dca12efeb7b27e471de7474c4da302  imx-vpu-hantro-1.6.0.bin
+sha256  0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
new file mode 100644
index 0000000000..57ce411e63
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -0,0 +1,42 @@
+################################################################################
+#
+# imx-vpu-hantro
+#
+################################################################################
+
+IMX_VPU_HANTRO_VERSION = 1.6.0
+IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
+IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
+
+IMX_VPU_HANTRO_INSTALL_STAGING = YES
+
+IMX_VPU_HANTRO_MAKE_ENV = \
+	$(TARGET_MAKE_ENV) \
+	$(TARGET_CONFIGURE_OPTS) \
+	CROSS_COMPILE="$(TARGET_CROSS)" \
+	SDKTARGETSYSROOT=$(STAGING_DIR) \
+	LINUX_KERNEL_ROOT=$(LINUX_DIR)
+
+IMX_VPU_HANTRO_LICENSE = NXP Semiconductor Software License Agreement
+IMX_VPU_HANTRO_LICENSE_FILES = EULA COPYING
+IMX_VPU_HANTRO_REDISTRIBUTE = NO
+
+define IMX_VPU_HANTRO_EXTRACT_CMDS
+	$(call FREESCALE_IMX_EXTRACT_HELPER,$(IMX_VPU_HANTRO_DL_DIR)/$(IMX_VPU_HANTRO_SOURCE))
+endef
+
+define IMX_VPU_HANTRO_BUILD_CMDS
+	$(IMX_VPU_HANTRO_MAKE_ENV) $(MAKE1) -C $(@D)
+endef
+
+define IMX_VPU_HANTRO_INSTALL_STAGING_CMDS
+	$(IMX_VPU_HANTRO_MAKE_ENV) $(MAKE1) -C $(@D) \
+		DEST_DIR=$(STAGING_DIR) libdir=/usr/lib install
+endef
+
+define IMX_VPU_HANTRO_INSTALL_TARGET_CMDS
+	$(IMX_VPU_HANTRO_MAKE_ENV) $(MAKE1) -C $(@D) \
+		DEST_DIR=$(TARGET_DIR) libdir=/usr/lib install
+endef
+
+$(eval $(generic-package))
-- 
2.18.0
