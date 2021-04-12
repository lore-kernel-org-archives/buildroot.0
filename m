From: =?UTF-8?q?S=C3=A9bastien=20Szymanski?= <sebastien.szymanski@armadeus.com>
Date: Mon, 12 Apr 2021 14:05:33 +0200
Subject: [Buildroot] [PATCH 1/1] package/freescale-imx/imx-vpu-hantro: fix
 build with gcc 10
Message-ID: <20210412120533.8930-1-sebastien.szymanski@armadeus.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

imx-vpu-hantro build with gcc 10 fails with the following errors:

decoder_sw/software/linux/dwl/dwl_linux_hw.o:(.bss+0x44): multiple
definition of `DWLInitParam';
decoder_sw/software/linux/dwl/dwl_linux.o:(.bss+0x1200): first defined
here

decoder_sw/software/linux/dwl/dwl_linux_hw.o:(.bss+0x48): multiple
definition of `DecPicCodingType';
decoder_sw/software/linux/dwl/dwl_linux.o:(.bss+0x1204): first defined
here

Add a patch found at https://github.com/Freescale/meta-freescale to fix
this issue.

Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
---
 ...solve-compilation-error-with-fcommon.patch | 57 +++++++++++++++++++
 1 file changed, 57 insertions(+)
 create mode 100644 package/freescale-imx/imx-vpu-hantro/0003-decoder_sw-resolve-compilation-error-with-fcommon.patch

diff --git a/package/freescale-imx/imx-vpu-hantro/0003-decoder_sw-resolve-compilation-error-with-fcommon.patch b/package/freescale-imx/imx-vpu-hantro/0003-decoder_sw-resolve-compilation-error-with-fcommon.patch
new file mode 100644
index 0000000000..8ae9b7c5ee
--- /dev/null
+++ b/package/freescale-imx/imx-vpu-hantro/0003-decoder_sw-resolve-compilation-error-with-fcommon.patch
@@ -0,0 +1,57 @@
+From 5bfb24738c47003fd04a86bfd5a49f8c6354ed23 Mon Sep 17 00:00:00 2001
+From: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
+Date: Fri, 28 Aug 2020 07:46:35 +0000
+Subject: [PATCH] decoder_sw: resolve compilation error with -fcommon
+
+-fcommon is enabled by default in gcc10 compiler, which results in
+following build errors:
+
+decoder_sw/software/source/inc/decapicommon.h:272: multiple definition
+of `DecPicCodingType'; decoder_sw/software/linux/dwl/dwl_linux.o:
+decoder_sw/software/source/inc/decapicommon.h:272: first defined here
+
+decoder_sw/software/source/inc/dwl.h:94: multiple definition of
+`DWLInitParam'; decoder_sw/software/linux/dwl/dwl_linux.o:
+decoder_sw/software/source/inc/dwl.h:94: first defined here
+
+Drop multiple enum name definitions, which solves above compilation
+issues.
+
+Signed-off-by: Andrey Zhizhikin <andrey.zhizhikin@leica-geosystems.com>
+
+Fetch from: https://github.com/Freescale/meta-freescale/blob/master/recipes-bsp/imx-vpu-hantro/imx-vpu-hantro/0001-decoder_sw-resolve-compilation-error-with-fcommon.patch
+Signed-off-by: S?bastien Szymanski <sebastien.szymanski@armadeus.com>
+---
+ decoder_sw/software/source/inc/decapicommon.h | 2 +-
+ decoder_sw/software/source/inc/dwl.h          | 2 +-
+ 2 files changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/decoder_sw/software/source/inc/decapicommon.h b/decoder_sw/software/source/inc/decapicommon.h
+index 0f02092..fc8cccf 100755
+--- a/decoder_sw/software/source/inc/decapicommon.h
++++ b/decoder_sw/software/source/inc/decapicommon.h
+@@ -269,7 +269,7 @@ enum DecPicCodingType {
+   DEC_PIC_TYPE_D           = 3,
+   DEC_PIC_TYPE_FI          = 4,
+   DEC_PIC_TYPE_BI          = 5
+-} DecPicCodingType;
++};
+ 
+ /* Output picture pixel format types for raster scan or down scale output */
+ enum DecPicturePixelFormat {
+diff --git a/decoder_sw/software/source/inc/dwl.h b/decoder_sw/software/source/inc/dwl.h
+index 6991f03..fd357b3 100755
+--- a/decoder_sw/software/source/inc/dwl.h
++++ b/decoder_sw/software/source/inc/dwl.h
+@@ -91,7 +91,7 @@ struct DWLLinearMem {
+ /* DWLInitParam is used to pass parameters when initializing the DWL */
+ struct DWLInitParam {
+   u32 client_type;
+-} DWLInitParam;
++};
+ 
+ /* Hardware configuration description, same as in top API */
+ typedef struct DecHwConfig DWLHwConfig;
+-- 
+2.17.1
+
-- 
2.26.3
