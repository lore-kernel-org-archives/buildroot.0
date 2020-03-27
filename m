From: Laurent Gauthier (OSS) <laurent.gauthier_1@oss.nxp.com>
Date: Fri, 27 Mar 2020 10:31:03 +0000
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-vpu-hantro:
 bump version to 1.15.0
In-Reply-To: <20200326164943.564656-3-gary.bisson@boundarydevices.com>
References: <20200326164943.564656-1-gary.bisson@boundarydevices.com>,
 <20200326164943.564656-3-gary.bisson@boundarydevices.com>
Message-ID: <AM0PR04MB4067D7B4191AAAC3986CFEE7B6CC0@AM0PR04MB4067.eurprd04.prod.outlook.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Hi Gary,

While testing your change I ran into a build problem due to the fact that execinfo.h is included in some debug macro header.

This failure occurred because I build with a uclibc in default configuration and by default backtrace support is not enabled (and therefore this header file is not available).

After looking at the details I came up with the following patch that can be applied to properly avoid the build issue.

package/freescale-imx/imx-vpu-hantro/0002-disable-debug-macros.patch
---- 8< -----------------
--- a/openmax_il/source/dbgmacros.h     2019-09-30 05:21:45.000000000 +0200
+++ b/openmax_il/source/dbgmacros.h     2020-03-27 10:34:07.354415087 +0100
@@ -50,13 +50,6 @@
 #    define __USE_GNU
 #endif

-#ifndef ANDROID
-#include <execinfo.h>
-#include <link.h>
-#endif
-#include <dlfcn.h>
-#include <elf.h>
-
 /*****************
  ** DEBUG FLAGS **
  *****************/
@@ -76,6 +69,13 @@
 #define TRACE_FILE "trace.log"
 #endif

+#ifndef ANDROID
+#include <execinfo.h>
+#include <link.h>
+#endif
+#include <dlfcn.h>
+#include <elf.h>
+
 #ifdef LOG_IN_FILE
 #define TRACE(...)                                              \
     {                                                           \
---- 8< -----------------

I hope this helps.

Kind Regards, Laurent.

________________________________________
From: buildroot <buildroot-bounces@busybox.net> on behalf of Gary Bisson <gary.bisson@boundarydevices.com>
Sent: Thursday, March 26, 2020 4:49 PM
To: buildroot at buildroot.org
Cc: Gary Bisson; Refik Tuzakli
Subject: [Buildroot] [PATCH 2/2] package/freescale-imx/imx-vpu-hantro: bump version to 1.15.0

To match NXP BSP 4.19.35-1.1.0 release:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-vpu-hantro?h=warrior-4.19.35-1.1.0

Adds support for i.MX8MMini platform (Hantro H1 encoder).

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 ...on.h-header-inclusion-to-be-standard.patch | 64 ++++++++++++++-----
 .../imx-vpu-hantro/imx-vpu-hantro.hash        |  6 +-
 .../imx-vpu-hantro/imx-vpu-hantro.mk          |  5 +-
 3 files changed, 54 insertions(+), 21 deletions(-)

diff --git a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
index 951ead9824..f5a67cd514 100644
--- a/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
+++ b/package/freescale-imx/imx-vpu-hantro/0001-Fix-ion.h-header-inclusion-to-be-standard.patch
@@ -1,6 +1,6 @@
-From 872c82e7cbb9a0a0e761e8ac70fc28e19a55b4c3 Mon Sep 17 00:00:00 2001
+From e776e7360f80da9ac03f81a5df27d8b7fabc7ac7 Mon Sep 17 00:00:00 2001
 From: Gary Bisson <gary.bisson@boundarydevices.com>
-Date: Thu, 12 Jul 2018 11:38:28 +0200
+Date: Thu, 26 Mar 2020 16:00:33 +0100
 Subject: [PATCH] Fix ion.h header inclusion to be standard

 NXP "solution" was to manually copy the header to include/linux.
@@ -9,25 +9,44 @@ https://elixir.bootlin.com/linux/v4.17/source/drivers/staging/android/uapi/ion.h

 Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
 ---
- Makefile                                  | 2 ++
- decoder_sw/software/linux/dwl/dwl_linux.c | 2 +-
- 2 files changed, 3 insertions(+), 1 deletion(-)
+ Makefile_G1G2                                             | 4 ++--
+ Makefile_H1                                               | 4 ++--
+ decoder_sw/software/linux/dwl/dwl_linux.c                 | 2 +-
+ h1_encoder/software/linux_reference/ewl/ewl_x280_common.c | 2 +-
+ 4 files changed, 6 insertions(+), 6 deletions(-)

-diff --git a/Makefile b/Makefile
-index b74e23a..a5ce22b 100755
---- a/Makefile
-+++ b/Makefile
-@@ -11,6 +11,8 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
+diff --git a/Makefile_G1G2 b/Makefile_G1G2
+index 8280cce..4c9fc34 100755
+--- a/Makefile_G1G2
++++ b/Makefile_G1G2
+@@ -10,8 +10,8 @@ INCLUDE_HEADERS = -I./decoder_sw -I$(SOURCE_ROOT)/source/inc -I$(SOURCE_ROOT)/so
+
  INCLUDE_HEADERS += -I$(SOURCE_ROOT)/linux/memalloc
  #INCLUDE_HEADERS += -I$(SOURCE_ROOT)/linux/ldriver
- INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
-+# ION header location
+-#INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
+-INCLUDE_HEADERS += -I$(SDKTARGETSYSROOT)/usr/include/imx
++INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
 +INCLUDE_HEADERS += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi

  CFLAGS += -DDEC_MODULE_PATH=\"/dev/mxc_hantro\" -DUSE_FAKE_RFC_TABLE -DFIFO_DATATYPE=void* -DNDEBUG -DDOWN_SCALER \
             -DUSE_EXTERNAL_BUFFER -DUSE_FAST_EC -DUSE_VP9_EC -DGET_FREE_BUFFER_NON_BLOCK \
+diff --git a/Makefile_H1 b/Makefile_H1
+index 9ab62e1..8d366e3 100755
+--- a/Makefile_H1
++++ b/Makefile_H1
+@@ -17,8 +17,8 @@ ENV += -DMEMALLOC_MODULE_PATH=\\\"/dev/ion\\\"
+ #ENV += -DSDRAM_LM_BASE=0x00000000
+ ENV += -DEWL_NO_HW_TIMEOUT
+ ENV += -DUSE_ION
+-#ENV += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
+-ENV += -I$(SDKTARGETSYSROOT)/usr/include/imx
++ENV += -I$(LINUX_KERNEL_ROOT)/include/uapi -I$(LINUX_KERNEL_ROOT)/include
++ENV += -I$(LINUX_KERNEL_ROOT)/drivers/staging/android/uapi
+
+ LIBENCNAME = libcodec_enc
+ LIBSENC = -L./ -lhantro_h1 -lpthread
 diff --git a/decoder_sw/software/linux/dwl/dwl_linux.c b/decoder_sw/software/linux/dwl/dwl_linux.c
-index 8183660..ed37d86 100644
+index 9b057f0..43225f6 100755
 --- a/decoder_sw/software/linux/dwl/dwl_linux.c
 +++ b/decoder_sw/software/linux/dwl/dwl_linux.c
 @@ -41,7 +41,7 @@
@@ -36,9 +55,22 @@ index 8183660..ed37d86 100644
  #ifdef USE_ION
 -#include <linux/ion.h>
 +#include <ion.h>
+ #include <linux/dma-buf.h>
+ #include <linux/version.h>
+ #ifdef ANDROID
+diff --git a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
+index fef1307..20b6f95 100755
+--- a/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
++++ b/h1_encoder/software/linux_reference/ewl/ewl_x280_common.c
+@@ -49,7 +49,7 @@
+
+ #include "linux/hx280enc.h"
+ #ifdef USE_ION
+-#include <linux/ion.h>
++#include <ion.h>
+ #include <linux/dma-buf.h>
+ #include <linux/version.h>
  #ifdef ANDROID
- #include <linux/mxc_ion.h>
- #endif
 --
-2.18.0
+2.25.1

diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
index 4fa48fb806..7f02f92467 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.hash
@@ -1,3 +1,3 @@
-sha256  cbc648e41f005aad209f74c9e5dd346138dca12efeb7b27e471de7474c4da302  imx-vpu-hantro-1.6.0.bin
-sha256  0f34f6175247762e2e1c38319aadf657a53f00ce124e569dfc61b30451549e7a  COPYING
-sha256  faf01d10e484879247963eb97d96622a980232e22a35e487dfe53b13708b686a  EULA
+sha256  8d189156d713f12b255f16badd0093aaacd16859aa3191603908de07567485a5  imx-vpu-hantro-1.15.0.bin
+sha256  d55f024af2bfff714b90de596f6d0399124b999e8c18a86b13a3b507bae6f561  COPYING
+sha256  9665930f69c0b6f4a4c055d7fe2b8ee563e771efbc83892abb1955e61492cdf7  EULA
diff --git a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
index a82899e64b..dbdbd4dc7b 100644
--- a/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
+++ b/package/freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################

-IMX_VPU_HANTRO_VERSION = 1.6.0
+IMX_VPU_HANTRO_VERSION = 1.15.0
 IMX_VPU_HANTRO_SITE = $(FREESCALE_IMX_SITE)
 IMX_VPU_HANTRO_SOURCE = imx-vpu-hantro-$(IMX_VPU_HANTRO_VERSION).bin
 IMX_VPU_HANTRO_DEPENDENCIES = linux
@@ -15,7 +15,8 @@ IMX_VPU_HANTRO_MAKE_ENV = \
        $(TARGET_CONFIGURE_OPTS) \
        CROSS_COMPILE="$(TARGET_CROSS)" \
        SDKTARGETSYSROOT=$(STAGING_DIR) \
-       LINUX_KERNEL_ROOT=$(LINUX_DIR)
+       LINUX_KERNEL_ROOT=$(LINUX_DIR) \
+       PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)

 IMX_VPU_HANTRO_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_LICENSE_FILES = EULA COPYING
--
2.25.1

_______________________________________________
buildroot mailing list
buildroot at busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
