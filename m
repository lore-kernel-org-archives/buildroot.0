From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu, 26 Mar 2020 21:47:57 +0100
Subject: [Buildroot] [git commit] board/boundarydevices: update boot scripts
Message-ID: <20200326203815.AA9D0882F5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=86d3602fc2d01c305ae5832b268f5798edacaaba
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

- Add support for 8MMini and 8MNano
- Upgrade script now resets by default

Signed-off-by: Gary Bisson <gary.bisson@boundarydevices.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/boundarydevices/common/boot.cmd    | 24 +++++++++++++++---------
 board/boundarydevices/common/upgrade.cmd | 20 +++++++++++++++-----
 2 files changed, 30 insertions(+), 14 deletions(-)

diff --git a/board/boundarydevices/common/boot.cmd b/board/boundarydevices/common/boot.cmd
index 760363da9b..dbc3b3c373 100644
--- a/board/boundarydevices/common/boot.cmd
+++ b/board/boundarydevices/common/boot.cmd
@@ -9,9 +9,9 @@ if itest.s x51 == "x${imx_cpu}" ; then
 	a_base=0x90000000
 elif itest.s x53 == "x${imx_cpu}"; then
 	a_base=0x70000000
-elif itest.s x6SX == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
+elif itest.s x6SX == "x${imx_cpu}" || itest.s x6ULL == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
 	a_base=0x80000000
-elif itest.s x8MQ == "x${imx_cpu}"; then
+elif itest.s x8MQ == "x${imx_cpu}" || itest.s x8MM == "x${imx_cpu}" || itest.s x8MMQ == "x${imx_cpu}" || itest.s x8MNano == "x${imx_cpu}"; then
 	a_base=0x40000000
 	kernelimage=Image
 	bootcommand=booti
@@ -43,10 +43,18 @@ if itest.s "x" == "x${fdt_file}" ; then
 		fdt_file=imx6qp-${board}.dtb;
 	elif itest.s x6SX == "x${imx_cpu}" ; then
 		fdt_file=imx6sx-${board}${m4}.dtb;
+	elif itest.s x6ULL == "x${imx_cpu}" ; then
+		fdt_file=imx6ull-${board}.dtb;
 	elif itest.s x7D == "x${imx_cpu}" ; then
 		fdt_file=imx7d-${board}${m4}.dtb;
 	elif itest.s x8MQ == "x${imx_cpu}" ; then
 		fdt_file=imx8mq-${board}${m4}.dtb;
+	elif itest.s x8MM == "x${imx_cpu}" ; then
+		fdt_file=imx8mm-${board}${m4}.dtb;
+	elif itest.s x8MMQ == "x${imx_cpu}" ; then
+		fdt_file=imx8mm-${board}${m4}.dtb;
+	elif itest.s x8MNano == "x${imx_cpu}" ; then
+		fdt_file=imx8mn-${board}${m4}.dtb;
 	elif itest.s x51 == "x${imx_cpu}" ; then
 		fdt_file=imx51-${board}.dtb;
 	elif itest.s x53 == "x${imx_cpu}" ; then
@@ -63,7 +71,6 @@ fi
 if load ${devtype} ${devnum}:${distro_bootpart} ${a_script} uEnv.txt ; then
     env import -t ${a_script} ${filesize}
 fi
-
 setenv bootargs ${bootargs} console=${console},115200 vmalloc=400M consoleblank=0 rootwait fixrtc cpu=${imx_cpu} board=${board}
 
 if load ${devtype} ${devnum}:${distro_bootpart} ${a_fdt} ${prefix}${fdt_file} ; then
@@ -74,21 +81,20 @@ else
 	exit;
 fi
 
-fdt resize
+fdt resize 4096
+if itest.s "x" != "x${cmd_board}" ; then
+	run cmd_board
+fi
 if itest.s "x" != "x${cmd_custom}" ; then
 	run cmd_custom
 fi
 if itest.s "x" != "x${cmd_hdmi}" ; then
 	run cmd_hdmi
-	if itest.s x == x${allow_noncea} ; then
-		setenv bootargs ${bootargs} mxc_hdmi.only_cea=1;
-		echo "only CEA modes allowed on HDMI port";
-	else
+	if itest.s x != x${allow_noncea} ; then
 		setenv bootargs ${bootargs} mxc_hdmi.only_cea=0;
 		echo "non-CEA modes allowed on HDMI, audio may be affected";
 	fi
 fi
-
 if itest.s "x" != "x${cmd_lcd}" ; then
 	run cmd_lcd
 fi
diff --git a/board/boundarydevices/common/upgrade.cmd b/board/boundarydevices/common/upgrade.cmd
index 24b705eb76..ce32d77b5b 100644
--- a/board/boundarydevices/common/upgrade.cmd
+++ b/board/boundarydevices/common/upgrade.cmd
@@ -13,11 +13,14 @@ if itest.s x51 == "x${imx_cpu}"; then
 	a_base=0x92000000
 elif itest.s x53 == "x${imx_cpu}"; then
 	a_base=0x72000000
-elif itest.s x6SX == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
+elif itest.s x6SX == "x${imx_cpu}" || itest.s x6ULL == "x${imx_cpu}" || itest.s x7D == "x${imx_cpu}"; then
 	a_base=0x82000000
-elif itest.s x8MQ == "x${imx_cpu}"; then
+elif itest.s x8MQ == "x${imx_cpu}" || itest.s x8MM == "x${imx_cpu}" || itest.s x8MMQ == "x${imx_cpu}"; then
 	a_base=0x42000000
 	offset=0x8400
+elif itest.s x8MNano == "x${imx_cpu}"; then
+	a_base=0x42000000
+	offset=0x8000
 fi
 
 qspi_match=1
@@ -56,6 +59,7 @@ mmc dev ${env_dev} ${env_part}
 mmc read ${a_uImage2} ${cntoffset} ${cntfile}
 if cmp.b ${a_uImage1} ${a_uImage2} ${filesize} ; then
 	echo "------- U-Boot versions match" ;
+	echo "------- U-Boot upgrade NOT needed" ;
 	exit ;
 fi
 
@@ -134,7 +138,7 @@ fi
 if cmp.b ${a_uImage1} ${a_uImage2} $filesize ; then
 	echo "------- U-Boot versions match" ;
 	if itest.s "${qspi_match}" == "1" ; then
-		echo "------- upgrade not needed" ;
+		echo "------- U-Boot upgrade NOT needed" ;
 		if itest.s "x" != "x${next}" ; then
 			if ${fs}load ${devtype} ${devnum}:${distro_bootpart} ${a_script} ${next} ; then
 				source ${a_script}
@@ -206,6 +210,12 @@ if itest.s "x" != "x${next}" ; then
 fi
 fi
 
-while echo "---- U-Boot upgraded. Please reset the board" ; do
-	sleep 120
+if itest.s "xno" == "x${reset}" ; then
+	while echo "---- U-Boot upgraded. Please reset the board" ; do
+		sleep 120
+	done
+fi
+echo "---- U-Boot upgraded. The board will now reset."
+sleep 1
+reset
 done
