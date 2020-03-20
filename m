From: Maeva Manuel <maeva.manuel@oss.nxp.com>
Date: Fri, 20 Mar 2020 17:31:57 +0100
Subject: [Buildroot] [PATCH 4/5] package/imx-mkimage: bump to version
 rel_imx_4.19.35_1.1.0
In-Reply-To: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
References: <20200320163158.18341-1-maeva.manuel@oss.nxp.com>
Message-ID: <20200320163158.18341-5-maeva.manuel@oss.nxp.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

This package needed to be updated to be aligned with NXP BSP
4.19.35_1.1.0
The package patches have also been rebased on top of rel_imx_4.19.35_1.1.0

Signed-off-by: Maeva Manuel <maeva.manuel@oss.nxp.com>
Signed-off-by: Julien Olivain <julien.olivain@oss.nxp.com>
---
 ...verriding-BL32-and-BL33-not-only-BL.patch} | 28 ++++++++++---------
 .../0002-Add-LDFLAGS-to-link-step.patch       | 26 +++++++++++++++++
 .../0002-add-ldflags-to-link-step.patch       | 26 -----------------
 .../0003-Add-unused-fake-version.patch        | 11 +++++---
 package/imx-mkimage/imx-mkimage.hash          |  2 +-
 package/imx-mkimage/imx-mkimage.mk            |  2 +-
 6 files changed, 50 insertions(+), 45 deletions(-)
 rename package/imx-mkimage/{0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch => 0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch} (65%)
 create mode 100644 package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
 delete mode 100644 package/imx-mkimage/0002-add-ldflags-to-link-step.patch

diff --git a/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
similarity index 65%
rename from package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch
rename to package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
index 430122f7ed..fde1ccfaa9 100644
--- a/package/imx-mkimage/0001-add-support-for-overriding-bl32-and-bl33-not-only-bl.patch
+++ b/package/imx-mkimage/0001-Add-support-for-overriding-BL32-and-BL33-not-only-BL.patch
@@ -1,20 +1,20 @@
-From 0677e6cff00506de56d11bfa230b6c366e74f6ed Mon Sep 17 00:00:00 2001
+From 4870df3d70e94f9f0d6c06f610cea2d88cd6edb5 Mon Sep 17 00:00:00 2001
 From: Erik Larsson <erik.larsson@combitech.se>
 Date: Thu, 8 Mar 2018 19:04:37 +0100
-Subject: [PATCH] Add support for overriding BL32 and BL33 not only BL31
+Subject: [PATCH 1/3] Add support for overriding BL32 and BL33 not only BL31
 
 Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
 Signed-off-by: Christopher Dahlberg <crille.dahlberg@gmail.com>
 Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
 ---
- iMX8M/mkimage_fit_atf.sh | 18 +++++++++---------
- 1 file changed, 9 insertions(+), 9 deletions(-)
+ iMX8M/mkimage_fit_atf.sh | 16 ++++++++--------
+ 1 file changed, 8 insertions(+), 8 deletions(-)
 
 diff --git a/iMX8M/mkimage_fit_atf.sh b/iMX8M/mkimage_fit_atf.sh
-index 3a3bd10..727f746 100755
+index 95749b1..c1aa902 100755
 --- a/iMX8M/mkimage_fit_atf.sh
 +++ b/iMX8M/mkimage_fit_atf.sh
-@@ -11,29 +11,29 @@ if [ ! -f $BL31 ]; then
+@@ -18,23 +18,23 @@ if [ ! -f $BL31 ]; then
  	echo "ERROR: BL31 file $BL31 NOT found" >&2
  	exit 0
  else
@@ -26,33 +26,35 @@ index 3a3bd10..727f746 100755
  
 -BL32="tee.bin"
 +[ -z "$BL32" ] && BL32="tee.bin"
+ LOADABLES="\"atf at 1\""
  
  if [ ! -f $BL32 ]; then
  	BL32=/dev/null
  else
--	echo "Building with TEE support, make sure your bl31 is compiled with spd. If you do not want tee, please delete tee.bin" >&2
+ 	echo "Building with TEE support, make sure your bl31 is compiled with spd. If you do not want tee, please delete tee.bin" >&2
 -	echo "tee.bin size: " >&2
 -	ls -lct tee.bin | awk '{print $5}' >&2
-+	echo "Building with TEE support, make sure your bl31 is compiled with spd. If you do not want tee, please delete $BL32" >&2
 +	echo "$BL32 size: " >&2
 +	ls -lct $BL32 | awk '{print $5}' >&2
+ 	LOADABLES="$LOADABLES, \"tee at 1\""
  fi
  
 -BL33="u-boot-nodtb.bin"
 +[ -z "$BL33" ] && BL33="u-boot-nodtb.bin"
+ DEK_BLOB="dek_blob_fit_dummy.bin"
  
- if [ ! -f $BL33 ]; then
- 	echo "ERROR: $BL33 file NOT found" >&2
+ if [ ! -f $DEK_BLOB ]; then
+@@ -49,8 +49,8 @@ if [ ! -f $BL33 ]; then
  	exit 0
  else
- 	
+ 
 -	echo "u-boot-nodtb.bin size: " >&2
 -	ls -lct u-boot-nodtb.bin | awk '{print $5}' >&2
-+	echo "$BL33: " >&2
++	echo "$BL33 size: " >&2
 +	ls -lct $BL33 | awk '{print $5}' >&2
  fi
  
  for dtname in $*
 -- 
-2.7.4
+2.25.1
 
diff --git a/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch b/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
new file mode 100644
index 0000000000..48d04868f6
--- /dev/null
+++ b/package/imx-mkimage/0002-Add-LDFLAGS-to-link-step.patch
@@ -0,0 +1,26 @@
+From 3ef9f773ce1a402607957fa73775d2e0a591a1a5 Mon Sep 17 00:00:00 2001
+From: Erik Larsson <erik.larsson@combitech.se>
+Date: Tue, 6 Mar 2018 12:28:39 +0100
+Subject: [PATCH 2/3] Add LDFLAGS to link step
+
+Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
+---
+ iMX8M/soc.mak | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
+index d714259..aecf84b 100644
+--- a/iMX8M/soc.mak
++++ b/iMX8M/soc.mak
+@@ -67,7 +67,7 @@ FW_DIR = imx-boot/imx-boot-tools/$(PLAT)
+ $(MKIMG): mkimage_imx8.c
+ 	@echo "PLAT="$(PLAT) "HDMI="$(HDMI)
+ 	@echo "Compiling mkimage_imx8"
+-	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) -lz
++	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) $(LDFLAGS) -lz
+ 
+ u-boot-spl-ddr.bin: u-boot-spl.bin lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_dmem.bin lpddr4_pmu_train_2d_imem.bin lpddr4_pmu_train_2d_dmem.bin
+ 	@objcopy -I binary -O binary --pad-to 0x8000 --gap-fill=0x0 lpddr4_pmu_train_1d_imem.bin lpddr4_pmu_train_1d_imem_pad.bin
+-- 
+2.25.1
+
diff --git a/package/imx-mkimage/0002-add-ldflags-to-link-step.patch b/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
deleted file mode 100644
index 1d5fe77596..0000000000
--- a/package/imx-mkimage/0002-add-ldflags-to-link-step.patch
+++ /dev/null
@@ -1,26 +0,0 @@
-From a73f20fbe921c7ecff3efda23bc506fdd935ee4d Mon Sep 17 00:00:00 2001
-From: Erik Larsson <erik.larsson@combitech.se>
-Date: Tue, 6 Mar 2018 12:28:39 +0100
-Subject: [PATCH] Add LDFLAGS to link step
-
-Signed-off-by: Erik Larsson <karl.erik.larsson@gmail.com>
----
- iMX8M/soc.mak | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/iMX8M/soc.mak b/iMX8M/soc.mak
-index 8346769..38a14bb 100644
---- a/iMX8M/soc.mak
-+++ b/iMX8M/soc.mak
-@@ -15,7 +15,7 @@ FW_DIR = imx-boot/imx-boot-tools/imx8mq
- 
- $(MKIMG): mkimage_imx8.c
- 	@echo "Compiling mkimage_imx8"
--	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) -lz
-+	$(CC) $(CFLAGS) mkimage_imx8.c -o $(MKIMG) $(LDFLAGS) -lz
- 
- $(DCD_CFG): $(DCD_CFG_SRC)
- 	@echo "Converting iMX8M DCD file" 
--- 
-2.7.4
-
diff --git a/package/imx-mkimage/0003-Add-unused-fake-version.patch b/package/imx-mkimage/0003-Add-unused-fake-version.patch
index 9652a817ba..7404343d9c 100644
--- a/package/imx-mkimage/0003-Add-unused-fake-version.patch
+++ b/package/imx-mkimage/0003-Add-unused-fake-version.patch
@@ -1,7 +1,10 @@
-From e75feef80b51c9060e3702390040495312648ad2 Mon Sep 17 00:00:00 2001
+From b25b4324be4c0dd9ee5fecdf2981d291fb187686 Mon Sep 17 00:00:00 2001
 From: =?UTF-8?q?Andr=C3=A9=20Hentschel?= <nerv@dawncrow.de>
 Date: Mon, 25 Feb 2019 22:15:55 +0100
-Subject: [PATCH] Add unused fake version
+Subject: [PATCH 3/3] Add unused fake version
+MIME-Version: 1.0
+Content-Type: text/plain; charset=UTF-8
+Content-Transfer-Encoding: 8bit
 
 The Makefile makes the assumption that the build process runs
 from a Git clone of the source code.
@@ -14,7 +17,7 @@ Signed-off-by: Andr? Hentschel <nerv@dawncrow.de>
  1 file changed, 1 insertion(+), 3 deletions(-)
 
 diff --git a/Makefile b/Makefile
-index ccf42e8..6041574 100644
+index 49ef486..b966399 100644
 --- a/Makefile
 +++ b/Makefile
 @@ -37,9 +37,7 @@ $(MKIMG): src/build_info.h $(SRCS)
@@ -29,5 +32,5 @@ index ccf42e8..6041574 100644
  help:
  	@echo $(CURR_DIR)
 -- 
-2.17.1
+2.25.1
 
diff --git a/package/imx-mkimage/imx-mkimage.hash b/package/imx-mkimage/imx-mkimage.hash
index e75619b8d4..6d5a329ed5 100644
--- a/package/imx-mkimage/imx-mkimage.hash
+++ b/package/imx-mkimage/imx-mkimage.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 ceeb297bb0aee02d7b105ee245d00f3cafd74fc73ef0c6182b058b234d5bbbd7  imx-mkimage-rel_imx_4.14.98_2.0.0_ga.tar.gz
+sha256 a7e4c1c45b0d36e088bd7891335aa3c726682750984b7ca072e3c6329def92cf  imx-mkimage-rel_imx_4.19.35_1.1.0.tar.gz
 sha256 231f7edcc7352d7734a96eef0b8030f77982678c516876fcb81e25b32d68564c  COPYING
diff --git a/package/imx-mkimage/imx-mkimage.mk b/package/imx-mkimage/imx-mkimage.mk
index a58ddf07b7..270ef2ee01 100644
--- a/package/imx-mkimage/imx-mkimage.mk
+++ b/package/imx-mkimage/imx-mkimage.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-IMX_MKIMAGE_VERSION = rel_imx_4.14.98_2.0.0_ga
+IMX_MKIMAGE_VERSION = rel_imx_4.19.35_1.1.0
 IMX_MKIMAGE_SITE = https://source.codeaurora.org/external/imx/imx-mkimage
 IMX_MKIMAGE_SITE_METHOD = git
 IMX_MKIMAGE_LICENSE = GPL-2.0+
-- 
2.17.1
