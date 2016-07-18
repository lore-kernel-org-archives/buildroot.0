From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon, 18 Jul 2016 23:09:12 +0200
Subject: [Buildroot] [git commit] uboot-tools: fix conditional build of FIT
	support
Message-ID: <20160718211128.0235F81E86@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=31afc5866855ac480b5f327341c52655ee5b17fe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The removal of the unconditional compilation and linking of some .o files were
missed when porting the patch 0003 to the version 2016.07, leading to errors
like these when FIT support is enabled:

tools/fit_common.o: In function `fit_verify_header':
fit_common.c:(.text+0x0): multiple definition of `fit_verify_header'
tools/fit_common.o:fit_common.c:(.text+0x0): first defined here
tools/fit_common.o: In function `fit_check_image_types':
fit_common.c:(.text+0x10): multiple definition of `fit_check_image_types'

When FIT support is disabled, the build does not fail but it includes FIT
support.

Fix the patch 0003 to be equivalent to the original one.

Fixes:
http://autobuild.buildroot.net/results/7494a5b22e3df1c05cdcc47670deaf54d9e04133
http://autobuild.buildroot.net/results/f98f30bbf9d4cdde37a96b9310873d83dd649c54

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Carlos Santos <casantos@datacom.ind.br>
Tested-by: Yegor Yefremov <yegorslists@googlemail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0003-Make-FIT-support-really-optional.patch    | 26 +++++++++++++++++-----
 1 file changed, 20 insertions(+), 6 deletions(-)

diff --git a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
index 3ba5389..8853198 100644
--- a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
+++ b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
@@ -1,4 +1,4 @@
-From ddcd6cd622889a2d74d0a16efae8e3b2d098f717 Mon Sep 17 00:00:00 2001
+From d9d7d7cf8b27516d45c66daa1bf0a18c878c4e33 Mon Sep 17 00:00:00 2001
 From: Carlos Santos <casantos@datacom.ind.br>
 Date: Sun, 8 May 2016 11:11:39 -0300
 Subject: [PATCH] Make FIT support really optional
@@ -19,11 +19,14 @@ following changes:
 Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 [fabio: adapt for 2016.07]
 Signed-off-by: Fabio Estevam <festevam@gmail.com>
+[Ricardo: fix conditional compilation and linking of the files mentioned above
+for 2016.07]
+Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
 ---
  common/bootm.c  | 2 ++
  include/bootm.h | 2 ++
- tools/Makefile  | 2 ++
- 3 files changed, 6 insertions(+)
+ tools/Makefile  | 6 ++----
+ 3 files changed, 6 insertions(+), 4 deletions(-)
 
 diff --git a/common/bootm.c b/common/bootm.c
 index 2431019..7e1adc8 100644
@@ -59,7 +62,7 @@ index 4981377..94d62a1 100644
  int boot_selected_os(int argc, char * const argv[], int state,
  		     bootm_headers_t *images, boot_os_fn *boot_fn);
 diff --git a/tools/Makefile b/tools/Makefile
-index f72294a..adf7c83 100644
+index f72294a..ccf5120 100644
 --- a/tools/Makefile
 +++ b/tools/Makefile
 @@ -54,6 +54,7 @@ mkenvimage-objs := mkenvimage.o os_support.o lib/crc32.o
@@ -70,7 +73,7 @@ index f72294a..adf7c83 100644
  FIT_SIG_OBJS-$(CONFIG_FIT_SIGNATURE) := common/image-sig.o
  # Flattened device tree objects
  LIBFDT_OBJS := $(addprefix lib/libfdt/, \
-@@ -68,6 +69,7 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
+@@ -68,16 +69,13 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
  # common objs for dumpimage and mkimage
  dumpimage-mkimage-objs := aisimage.o \
  			atmelimage.o \
@@ -78,5 +81,16 @@ index f72294a..adf7c83 100644
  			$(FIT_SIG_OBJS-y) \
  			common/bootm.o \
  			lib/crc32.o \
+ 			default_image.o \
+ 			lib/fdtdec_common.o \
+ 			lib/fdtdec.o \
+-			fit_common.o \
+-			fit_image.o \
+-			common/image-fit.o \
+-			image-host.o \
+ 			common/image.o \
+ 			imagetool.o \
+ 			imximage.o \
 -- 
-1.9.1
+2.9.1
+
