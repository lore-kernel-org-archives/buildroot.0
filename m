From: Gwenhael Goavec-Merou <gwenj@trabucayre.com>
Date: Fri, 13 Nov 2015 13:49:14 +0100
Subject: [Buildroot] [PATCH] zedboard: uboot: load env earlier
Message-ID: <1447418954-3350-1-git-send-email-gwenj@trabucayre.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

From: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>

By default, with the original patch bootcmd runs sdboot before loading uEnv.txt.
Consequently, if the user change modeboot, the user's defined content is updated
too late.
By loading uEnv.txt before 'run $modeboot' the correct boot mode is used instead
of default mode.

Signed-off-by: Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>
---
 .../0001-zynq-Create-zedboard-specific-U-Boot-environment.patch    | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
index 1971503..6dae31e 100644
--- a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
+++ b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
@@ -11,7 +11,7 @@ diff --git a/include/configs/zynq_zed.h b/include/configs/zynq_zed.h
 index 946de95..2400a88 100644
 --- a/include/configs/zynq_zed.h
 +++ b/include/configs/zynq_zed.h
-@@ -24,4 +24,29 @@
+@@ -24,4 +24,28 @@
 
  #include <configs/zynq-common.h>
 
@@ -20,7 +20,7 @@ index 946de95..2400a88 100644
 +	"envload=mmc info && if fatload mmc 0 0x1000 uEnv.txt;"\
 +	" then echo Importing uEnv.txt; env import -t 0x1000"  \
 +	" $filesize; fi;\0"                                    \
-+	"bootcmd=run $modeboot\0"                              \
++	"bootcmd=run envload; run $modeboot\0"                 \
 +	"modeboot=sdboot\0"                                    \
 +	"baudrate=115200\0"                                    \
 +	"bootenv=uEnv.txt\0"                                   \
@@ -28,8 +28,7 @@ index 946de95..2400a88 100644
 +	"kernel_image=uImage\0"                                \
 +	"ramdisk_image=rootfs.cpio.uboot\0"                    \
 +	"fpga_image=system.bit\0"                              \
-+	"sdboot=echo Booting from SD...;"                      \
-+	" run envload; run fpgaboot;"                          \
++	"sdboot=echo Booting from SD...; run fpgaboot;"        \
 +	" fatload mmc 0 0x1000000 ${kernel_image}"             \
 +	" && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
 +	" && fatload mmc 0 0x3000000 ${devicetree_image}"      \
-- 
2.4.10
