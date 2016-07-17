From: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Date: Sun, 17 Jul 2016 16:36:03 -0300
Subject: [Buildroot] [PATCH] uboot-tools: fix conditional build of FIT
	support
Message-ID: <20160717193603.13671-1-ricardo.martincoski@gmail.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The removal of the inconditional linking of some .o files were missed when
porting the patch 0003 to the version 2016.07, leading to errors like these:

tools/fit_common.o: In function `fit_verify_header':
fit_common.c:(.text+0x0): multiple definition of `fit_verify_header'
tools/fit_common.o:fit_common.c:(.text+0x0): first defined here
tools/fit_common.o: In function `fit_check_image_types':
fit_common.c:(.text+0x10): multiple definition of `fit_check_image_types'

Signed-off-by: Ricardo Martincoski <ricardo.martincoski@gmail.com>
Reported-by: Masahiro Yamada <yamada.masahiro@socionext.com>
CC: Fabio Estevam <festevam@gmail.com>
CC: Carlos Santos <casantos@datacom.ind.br>
---
CC: Masahiro Yamada <yamada.masahiro@socionext.com>
Unfortunately I could only build test because I have no access to hardware
with u-boot right now.
I probably can test on hardware this week ... if no one do this earlier ;)
---
 .../0003-Make-FIT-support-really-optional.patch    | 25 ++++++++++++++++------
 1 file changed, 19 insertions(+), 6 deletions(-)

diff --git a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
index 3ba5389..71c7d6f 100644
--- a/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
+++ b/package/uboot-tools/0003-Make-FIT-support-really-optional.patch
@@ -1,4 +1,4 @@
-From ddcd6cd622889a2d74d0a16efae8e3b2d098f717 Mon Sep 17 00:00:00 2001
+From 196c924e0353604a30a257c5b5fbc5eac86f347a Mon Sep 17 00:00:00 2001
 From: Carlos Santos <casantos@datacom.ind.br>
 Date: Sun, 8 May 2016 11:11:39 -0300
 Subject: [PATCH] Make FIT support really optional
@@ -19,11 +19,13 @@ following changes:
 Signed-off-by: Carlos Santos <casantos@datacom.ind.br>
 [fabio: adapt for 2016.07]
 Signed-off-by: Fabio Estevam <festevam@gmail.com>
+[Ricardo: fix conditional linking of the files mentioned above for 2016.07]
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
@@ -59,7 +61,7 @@ index 4981377..94d62a1 100644
  int boot_selected_os(int argc, char * const argv[], int state,
  		     bootm_headers_t *images, boot_os_fn *boot_fn);
 diff --git a/tools/Makefile b/tools/Makefile
-index f72294a..adf7c83 100644
+index f72294a..ccf5120 100644
 --- a/tools/Makefile
 +++ b/tools/Makefile
 @@ -54,6 +54,7 @@ mkenvimage-objs := mkenvimage.o os_support.o lib/crc32.o
@@ -70,7 +72,7 @@ index f72294a..adf7c83 100644
  FIT_SIG_OBJS-$(CONFIG_FIT_SIGNATURE) := common/image-sig.o
  # Flattened device tree objects
  LIBFDT_OBJS := $(addprefix lib/libfdt/, \
-@@ -68,6 +69,7 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
+@@ -68,16 +69,13 @@ ROCKCHIP_OBS = lib/rc4.o rkcommon.o rkimage.o rksd.o rkspi.o
  # common objs for dumpimage and mkimage
  dumpimage-mkimage-objs := aisimage.o \
  			atmelimage.o \
@@ -78,5 +80,16 @@ index f72294a..adf7c83 100644
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
-- 
2.9.1
