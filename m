From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sun, 24 Jul 2016 22:44:07 +0200
Subject: [Buildroot] [git commit] board/avnet: swap ramdisk and DT load
	addresses in U-Boot environment
Message-ID: <20160724204431.1523F80450@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4846700a1b51e7f2c48639dafdb5143ad8e9de41
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

As reported in bug #9091, the U-Boot environment we provide for the
Microzed and Zedboard platforms loads the ramdisk at 0x2000000 and the
DT at 0x3000000. This means that a large enough ramdisk overwrites the
DT. It makes more sense to load the DT at 0x2000000 and the ramdisk at
0x3000000.

Reported-by:  Michael Monaghan <michaellmonaghan@gmail.com>
Tested-by: Michael Monaghan <michaellmonaghan@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 .../0001-zynq-Create-microzed-specific-U-Boot-environment.patch   | 6 +++---
 .../0001-zynq-Create-zedboard-specific-U-Boot-environment.patch   | 8 ++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch b/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
index 6a7725f..b9d0c38 100644
--- a/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
+++ b/board/avnet/microzed/uboot/0001-zynq-Create-microzed-specific-U-Boot-environment.patch
@@ -29,9 +29,9 @@ Signed-off-by: Davide Viti <d.viti@infosolution.it>
 +	"sdboot=echo Booting from SD...;"                      \
 +	" run envload; run fpgaboot;"                          \
 +	" fatload mmc 0 0x1000000 ${kernel_image}"             \
-+	" && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
-+	" && fatload mmc 0 0x3000000 ${devicetree_image}"      \
-+	" && bootm 0x1000000 0x2000000 0x3000000\0"            \
++	" && fatload mmc 0 0x3000000 ${ramdisk_image}"         \
++	" && fatload mmc 0 0x2000000 ${devicetree_image}"      \
++	" && bootm 0x1000000 0x3000000 0x2000000\0"            \
 +	"fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
 +	" then echo Booting FPGA from ${fpga_image};"          \
 +	" fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
diff --git a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
index 6dae31e..b7f8297 100644
--- a/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
+++ b/board/avnet/zedboard/uboot/0001-zynq-Create-zedboard-specific-U-Boot-environment.patch
@@ -11,7 +11,7 @@ diff --git a/include/configs/zynq_zed.h b/include/configs/zynq_zed.h
 index 946de95..2400a88 100644
 --- a/include/configs/zynq_zed.h
 +++ b/include/configs/zynq_zed.h
-@@ -24,4 +24,28 @@
+@@ -24,0 +24,0 @@
 
  #include <configs/zynq-common.h>
 
@@ -30,9 +30,9 @@ index 946de95..2400a88 100644
 +	"fpga_image=system.bit\0"                              \
 +	"sdboot=echo Booting from SD...; run fpgaboot;"        \
 +	" fatload mmc 0 0x1000000 ${kernel_image}"             \
-+	" && fatload mmc 0 0x2000000 ${ramdisk_image}"         \
-+	" && fatload mmc 0 0x3000000 ${devicetree_image}"      \
-+	" && bootm 0x1000000 0x2000000 0x3000000\0"            \
++	" && fatload mmc 0 0x3000000 ${ramdisk_image}"         \
++	" && fatload mmc 0 0x2000000 ${devicetree_image}"      \
++	" && bootm 0x1000000 0x3000000 0x2000000\0"            \
 +	"fpgaboot=if fatload mmc 0 0x1000000 ${fpga_image};"   \
 +	" then echo Booting FPGA from ${fpga_image};"          \
 +	" fpga info 0 && fpga loadb 0 0x1000000 $filesize;"    \
