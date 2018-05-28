From: Jagan Teki <jagan@amarulasolutions.com>
Date: Mon, 28 May 2018 22:42:27 +0530
Subject: [Buildroot] [PATCH 2/2] board: amarula: a64-relic: Add WiFi support
In-Reply-To: <20180528171227.8352-1-jagan@amarulasolutions.com>
References: <20180528171227.8352-1-jagan@amarulasolutions.com>
Message-ID: <20180528171227.8352-2-jagan@amarulasolutions.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Amarula A64-Relic board has AP6330 WiFi/BT combo, but does
not have ethernet port. So it makes sense to enable wireless
networking by default:
- add broadcom wireless firmware package to image
- add basic wireless tools to image
- add rootfs overlay with proper NVRAM file for on-board AP6330 chip
- add init script to load modules
- update readme.txt to test wifi

Signed-off-by: Jagan Teki <jagan@amarulasolutions.com>
---
 board/amarula/a64-relic/readme.txt                 |  9 +++
 .../rootfs_overlay/etc/init.d/S02-modload          | 12 ++++
 .../rootfs_overlay/etc/modules-load.d/modules.conf |  1 +
 .../lib/firmware/brcm/brcmfmac4330-sdio.txt        | 83 ++++++++++++++++++++++
 configs/amarula_a64_relic_defconfig                | 12 ++++
 5 files changed, 117 insertions(+)
 create mode 100755 board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload
 create mode 100644 board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf
 create mode 100644 board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt

diff --git a/board/amarula/a64-relic/readme.txt b/board/amarula/a64-relic/readme.txt
index 534ed32e7b..18824e1669 100644
--- a/board/amarula/a64-relic/readme.txt
+++ b/board/amarula/a64-relic/readme.txt
@@ -57,4 +57,13 @@ GPT:
   $ fastboot -i 0x1f3a flash esp boot.vfat
   $ fastboot -i 0x1f3a flash system rootfs.ext2
 
+WiFi
+====
+
+ # wpa_passphrase ACCESSPOINTNAME >> /etc/wpa_supplicant.conf
+   (type password and enter)
+ # wpa_supplicant -i wlan0 -c /etc/wpa_supplicant.conf -B
+ # udhcpc -i wlan0
+ # ping google.com
+
 Enjoy!
diff --git a/board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload b/board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload
new file mode 100755
index 0000000000..81d85ce01c
--- /dev/null
+++ b/board/amarula/a64-relic/rootfs_overlay/etc/init.d/S02-modload
@@ -0,0 +1,12 @@
+#!/bin/sh
+#
+
+load_modules()
+{
+	while IFS= read -r line; do
+		modprobe -a $line
+	done < "/etc/modules-load.d/modules.conf"
+}
+
+load_modules
+echo "Loading modules: OK"
diff --git a/board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf b/board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf
new file mode 100644
index 0000000000..a86ef4c668
--- /dev/null
+++ b/board/amarula/a64-relic/rootfs_overlay/etc/modules-load.d/modules.conf
@@ -0,0 +1 @@
+brcmfmac
diff --git a/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt b/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
new file mode 100644
index 0000000000..d095f24c26
--- /dev/null
+++ b/board/amarula/a64-relic/rootfs_overlay/lib/firmware/brcm/brcmfmac4330-sdio.txt
@@ -0,0 +1,83 @@
+#AP6330_NVRAM_V1.0_20121130
+#Sample variables file for BCM94330 SD FC AGB board
+manfid=0x2d0
+prodid=0x0547
+vendid=0x14e4
+devid=0x4360
+boardtype=0x05e1
+boardrev=0x1202
+boardflags=0x0080200
+nocrc=1
+xtalfreq=26000
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+ag0=254
+aa2g=1
+ccode=ALL
+pa0itssit=0x20
+pa0b0=5587
+pa0b1=-633
+pa0b2=-158
+rssismf2g=0xa
+rssismc2g=0x3
+rssisav2g=0x7
+#rssi params for 5GHz
+rssismf5g=0x4
+rssismc5g=0x3
+rssisav5g=0x7
+#PA parameters for lower a-band
+pa1lob0=4748
+pa1lob1=-566
+pa1lob2=-180
+#PA parameters for midband
+pa1b0=4762
+pa1b1=-593
+pa1b2=-172
+#PA parameters for high band
+#pa1hib0=4596
+pa1hib0=4666
+pa1hib1=-619
+pa1hib2=-163
+rxpo5g=0
+maxp2ga0=74
+maxp5ga0=66
+maxp5gla0=66
+maxp5gha0=66
+# 2.4G Tx Power offsets
+cck2gpo=0x2222
+ofdm2gpo=0x44444444
+mcs2gpo0=0x6666
+mcs2gpo1=0x6666
+# 5G Tx Power offsets
+ofdm5gpo=0x44444444
+ofdm5glpo=0x44444444
+ofdm5ghpo=0x44444444
+mcs5gpo0=0x6666
+mcs5gpo1=0x6666
+mcs5glpo0=0x6666
+mcs5glpo1=0x6666
+mcs5ghpo0=0x6666
+mcs5ghpo1=0x6666
+sromrev=3
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+cckPwrOffset=4
+swctrlmap_2g=0x44844484,0x42824282,0x40804484,0x18282,0x1ff
+triso5g=0
+swctrlmap_5g=0x00100010,0x20202020,0x20202020,0x14202,0x0f0
+rfreg033=0x19
+rfreg033_cck=0x1f
+dacrate2g=160
+dacrate5g=160
+txalpfbyp2g=1
+bphyscale=17
+cckPwrIdxCorr=-15
+pacalidx2g=50
+#pacalidx5g=20
+noise_cal_ref_2g=53
+noise_cal_po_2g=0
+noise_cal_ref_5g=52
+noise_cal_po_5g=5,0,0
+# 4330 OOB parameter: High level trigger
+muxenab=0x10
+
diff --git a/configs/amarula_a64_relic_defconfig b/configs/amarula_a64_relic_defconfig
index 07f1a72363..d1da97ed5c 100644
--- a/configs/amarula_a64_relic_defconfig
+++ b/configs/amarula_a64_relic_defconfig
@@ -45,3 +45,15 @@ BR2_PACKAGE_HOST_MTOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/amarula/a64-relic/genimage.cfg"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/amarula/a64-relic/post-build.sh"
+BR2_ROOTFS_OVERLAY="board/amarula/a64-relic/rootfs_overlay"
+
+# wireless firmware
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XX=y
+
+# wireless tools
+BR2_PACKAGE_IW=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_NL80211=y
+BR2_PACKAGE_WPA_SUPPLICANT_AP_SUPPORT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
-- 
2.14.3
