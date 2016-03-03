From: Gary Bisson <gary.bisson@boundarydevices.com>
Date: Thu,  3 Mar 2016 15:57:17 +0100
Subject: [Buildroot] [PATCH 1/2] board/boundarydevices: update u-boot
	scripts for i.MX7 support
In-Reply-To: <1457017038-4023-1-git-send-email-gary.bisson@boundarydevices.com>
References: <1457017038-4023-1-git-send-email-gary.bisson@boundarydevices.com>
Message-ID: <1457017038-4023-2-git-send-email-gary.bisson@boundarydevices.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Also remove useless tfp410 enablement since a basic kernel driver has
been added.

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
---
 board/boundarydevices/nitrogen6x/6x_bootscript.txt | 33 +++++++++++-----------
 board/boundarydevices/nitrogen6x/6x_upgrade.txt    |  2 +-
 2 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/board/boundarydevices/nitrogen6x/6x_bootscript.txt b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
index 4a9be0b..e8a08aa 100644
--- a/board/boundarydevices/nitrogen6x/6x_bootscript.txt
+++ b/board/boundarydevices/nitrogen6x/6x_bootscript.txt
@@ -1,8 +1,19 @@
 setenv bootargs ''
 
-a_script=0x10800000
-a_zImage=0x10800000
-a_fdt=0x13000000
+if itest.s x6SX == "x${cpu}" || itest.s x7D == "x${cpu}"; then
+	a_script=0x80800000
+	a_zImage=0x80800000
+	a_fdt=0x83000000
+	m4=''
+	if itest.s "x1" == "x$m4enabled" ; then
+		run m4boot;
+		m4='-m4';
+	fi
+else
+	a_script=0x10800000
+	a_zImage=0x10800000
+	a_fdt=0x13000000
+fi
 
 setenv initrd_high 0xffffffff
 if itest.s "x" == "x${dtbname}" ; then
@@ -13,15 +24,9 @@ if itest.s "x" == "x${dtbname}" ; then
 	elif itest.s x6QP == "x${cpu}" ; then
 		dtbname=imx6qp-${board}.dtb;
 	elif itest.s x6SX == "x${cpu}" ; then
-		if itest.s "x1" != "x$m4enabled" ; then
-			dtbname=imx6sx-${board}.dtb;
-		else
-			run m4boot;
-			dtbname=imx6sx-${board}-m4.dtb;
-		fi
-		a_script=0x80800000
-		a_zImage=0x80800000
-		a_fdt=0x83000000
+		dtbname=imx6sx-${board}${m4}.dtb;
+	elif itest.s x7D == "x${cpu}" ; then
+		dtbname=imx7d-${board}${m4}.dtb;
 	else
 		dtbname=imx6q-${board}.dtb;
 	fi
@@ -47,10 +52,6 @@ else
 	exit;
 fi
 
-# first enable tfp410
-i2c dev 1
-i2c mw 38 8.1 bd
-
 cmd_xxx_present=
 fdt resize
 if itest.s "x" != "x${cmd_custom}" ; then
diff --git a/board/boundarydevices/nitrogen6x/6x_upgrade.txt b/board/boundarydevices/nitrogen6x/6x_upgrade.txt
index 9715f16..e012ff9 100644
--- a/board/boundarydevices/nitrogen6x/6x_upgrade.txt
+++ b/board/boundarydevices/nitrogen6x/6x_upgrade.txt
@@ -7,7 +7,7 @@ offset=0x400
 a_uImage1=0x12000000
 a_uImage2=0x12400000
 
-if itest.s x6SX == "x$cpu" ; then
+if itest.s x6SX == "x${cpu}" || itest.s x7D == "x${cpu}"; then
 	a_uImage1=0x82000000
 	a_uImage2=0x82400000
 fi
-- 
2.7.0
