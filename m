From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Mon,  7 Nov 2016 17:54:00 +0100
Subject: [Buildroot] [PATCH] board/boundarydevices: fix boot partition
	number in bootscript
Message-ID: <20161107165400.28802-1-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

It was previously hardcoded to use the 1st partition although the
bootpart variable was used to download kernel/dtb from any partition.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
Hi,

Just realized our bootscript was harcoding the partition number.

It is not suitable for systems which need to boot from any partition. It is
especially useful when using a A/B update scheme which means you either boot
from part 1 or 2 depending on last update (testing swupdate right now,
nice project!).

Regards,
Gary
---
 board/boundarydevices/common/6x_bootscript.txt | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/board/boundarydevices/common/6x_bootscript.txt b/board/boundarydevices/common/6x_bootscript.txt
index e8a08aa..2fc687a 100644
--- a/board/boundarydevices/common/6x_bootscript.txt
+++ b/board/boundarydevices/common/6x_bootscript.txt
@@ -92,14 +92,12 @@ fi
 
 setenv bootargs "${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc"
 
-bpart=1
-
 if test "sata" = "${dtype}" ; then
-	setenv bootargs "${bootargs} root=/dev/sda${bpart}" ;
+	setenv bootargs "${bootargs} root=/dev/sda${bootpart}" ;
 elif test "usb" = "${dtype}" ; then
-	setenv bootargs "${bootargs} root=/dev/sda${bpart}" ;
+	setenv bootargs "${bootargs} root=/dev/sda${bootpart}" ;
 else
-	setenv bootargs "${bootargs} root=/dev/mmcblk${disk}p${bpart}"
+	setenv bootargs "${bootargs} root=/dev/mmcblk${disk}p${bootpart}"
 fi
 
 if itest.s "x" != "x${disable_giga}" ; then
-- 
2.9.3
