From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Mon, 30 Mar 2020 14:10:27 +0200
Subject: [Buildroot] [git commit] package/freescale-imx/imx-vpu-hantro: bump
 version to 1.15.0
Message-ID: <20200330115706.57F1C8A432@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=d7f553ba9f129dfeda71ff05bc38219aa3b4d02b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

To match NXP BSP 4.19.35-1.1.0 release:
https://source.codeaurora.org/external/imx/meta-fsl-bsp-release/tree/imx/meta-bsp/recipes-bsp/imx-vpu-hantro?h=warrior-4.19.35-1.1.0

Adds support for i.MX8MMini platform (Hantro H1 encoder).

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Tested-by: Laurent Gauthier <laurent.gauthier_1@oss.nxp.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 ...Fix-ion.h-header-inclusion-to-be-standard.patch | 64 ++++++++++++++++------
 .../0002-Fix-build-with-uclibc-toolchain.patch     | 51 +++++++++++++++++
 .../imx-vpu-hantro/imx-vpu-hantro.hash             |  6 +-
 .../freescale-imx/imx-vpu-hantro/imx-vpu-hantro.mk |  5 +-
 4 files changed, 105 insertions(+), 21 deletions(-)

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
 
diff --git a/package/freescale-imx/imx-vpu-hantro/0002-Fix-build-with-uclibc-toolchain.patch b/package/freescale-imx/imx-vpu-hantro/0002-Fix-build-with-uclibc-toolchain.patch
new file mode 100644
index 0000000000..eb18043c4b
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/0002-Fix-build-with-uclibc-toolchain.patch
@@ -0,0 +1,51 @@
+From 4f51b0a6b9a36cc56fa06eb0f76596d8e387f980 Mon Sep 17 00:00:00 2001
+From: Gary Bisson <gary.bisson@boundarydevices.com>
+Date: Fri, 27 Mar 2020 23:17:30 +0100
+Subject: [PATCH] Fix build with uclibc toolchain
+
+From: Laurent Gauthier (OSS) <laurent.gauthier_1@oss.nxp.com>
+
+By default, backtrace support is disabled in uclibc. In that case the
+execinfo.h header file is missing, producing a build error.
+
+Signed-off-by: Laurent Gauthier (OSS) <laurent.gauthier_1@oss.nxp.com>
+Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
+---
+ openmax_il/source/dbgmacros.h | 14 +++++++-------
+ 1 file changed, 7 insertions(+), 7 deletions(-)
+
+diff --git a/openmax_il/source/dbgmacros.h b/openmax_il/source/dbgmacros.h
+index 3771c91..37ae09f 100755
+--- a/openmax_il/source/dbgmacros.h
++++ b/openmax_il/source/dbgmacros.h
+@@ -50,13 +50,6 @@
+ #    define __USE_GNU
+ #endif
+ 
+-#ifndef ANDROID
+-#include <execinfo.h>
+-#include <link.h>
+-#endif
+-#include <dlfcn.h>
+-#include <elf.h>
+-
+ /*****************
+  ** DEBUG FLAGS **
+  *****************/
+@@ -76,6 +69,13 @@
+ #define TRACE_FILE "trace.log"
+ #endif
+ 
++#ifndef ANDROID
++#include <execinfo.h>
++#include <link.h>
++#endif
++#include <dlfcn.h>
++#include <elf.h>
++
+ #ifdef LOG_IN_FILE
+ #define TRACE(...)                                              \
+     {                                                           \
+-- 
+2.25.1
+
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
-	LINUX_KERNEL_ROOT=$(LINUX_DIR)
+	LINUX_KERNEL_ROOT=$(LINUX_DIR) \
+	PLATFORM=$(BR2_PACKAGE_FREESCALE_IMX_PLATFORM)
 
 IMX_VPU_HANTRO_LICENSE = NXP Semiconductor Software License Agreement
 IMX_VPU_HANTRO_LICENSE_FILES = EULA COPYING
