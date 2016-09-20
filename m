From: Peter Korsgaard <peter@korsgaard.com>
Date: Tue, 20 Sep 2016 14:33:52 +0200
Subject: [Buildroot] [git commit] configs/warp7: Add Wifi support
Message-ID: <20160920123859.A7BFE820FA@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=c4f453fd7e84617bd2082ebff0cdb526b6afd952
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Warp7 has a BRCM43430 Wifi chipset. Add support for it.

Signed-off-by: Fabio Estevam <fabio.estevam@nxp.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/warp7/linux.fragment                         |  2 ++
 board/warp7/readme.txt                             | 11 ++++++
 .../lib/firmware/brcm/brcmfmac43430-sdio.txt       | 42 ++++++++++++++++++++++
 configs/warp7_defconfig                            | 13 +++++++
 4 files changed, 68 insertions(+)

diff --git a/board/warp7/linux.fragment b/board/warp7/linux.fragment
new file mode 100644
index 0000000..00f74cb
--- /dev/null
+++ b/board/warp7/linux.fragment
@@ -0,0 +1,2 @@
+CONFIG_CFG80211_WEXT=y
+CONFIG_BRCMFMAC=m
diff --git a/board/warp7/readme.txt b/board/warp7/readme.txt
index 3c765f5..00325e7 100644
--- a/board/warp7/readme.txt
+++ b/board/warp7/readme.txt
@@ -90,4 +90,15 @@ To boot your newly created system:
   emulator at 115200 bps, 8n1;
 - power on the board.
 
+Using Wifi
+==========
+
+# modprobe brcmfmac
+# iwconfig wlan0 essid ACCESSPOINTNAME
+# wpa_passphrase ACCESSPOINTNAME > /etc/wpa.conf
+(enter the wifi password and press enter)
+# wpa_supplicant -Dwext -iwlan0 -c /etc/wpa.conf &
+# udhcpc -i wlan0
+# ping buildroot.org
+
 Enjoy!
diff --git a/board/warp7/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt b/board/warp7/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt
new file mode 100644
index 0000000..a1dc203
--- /dev/null
+++ b/board/warp7/rootfs_overlay/lib/firmware/brcm/brcmfmac43430-sdio.txt
@@ -0,0 +1,42 @@
+# 2.4 GHz, 20 MHz BW mode
+manfid=0x2d0
+prodid=0x0726
+vendid=0x14e4
+devid=0x43e2
+boardtype=0x0726
+boardrev=0x1202
+boardnum=22
+macaddr=00:90:4c:c5:12:38
+sromrev=11
+boardflags=0x00404201
+boardflags3=0x08000000
+xtalfreq=37400
+nocrc=1
+ag0=0
+aa2g=1
+ccode=ALL
+#pa0itssit=0x20
+extpagain2g=0
+pa2ga0=-168,7161,-820
+AvVmid_c0=0x0,0xc8
+cckpwroffset0=5
+maxp2ga0=90
+#txpwrbckof=6
+cckbw202gpo=0
+legofdmbw202gpo=0x66111111
+mcsbw202gpo=0x77711111
+propbw202gpo=0xdd
+ofdmdigfilttype=18
+ofdmdigfilttypebe=18
+papdmode=1
+papdvalidtest=1
+pacalidx2g=48
+papdepsoffset=-22
+papdendidx=58
+il0macaddr=00:90:4c:c5:12:38
+wl0id=0x431b
+#muxenab=0x10
+#BT COEX deferral limit setting
+#btc_params 8 45000
+#btc_params 10 20000
+#spurconfig=0x3
diff --git a/configs/warp7_defconfig b/configs/warp7_defconfig
index 95508d6..967df8e 100644
--- a/configs/warp7_defconfig
+++ b/configs/warp7_defconfig
@@ -8,12 +8,16 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_1=y
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 
+# rootfs overlay
+BR2_ROOTFS_OVERLAY="board/warp7/rootfs_overlay"
+
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="https://github.com/Freescale/linux-fslc.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="efaf36531fe7b1fc15a48033e5972825c91f9fc6"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v7"
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/warp7/linux.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx7s-warp"
 
@@ -24,6 +28,15 @@ BR2_TARGET_UBOOT_CUSTOM_VERSION=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2016.09"
 BR2_TARGET_UBOOT_FORMAT_IMX=y
 
+# wifi firmware for brcm43430
+BR2_PACKAGE_LINUX_FIRMWARE=y
+BR2_PACKAGE_LINUX_FIRMWARE_BRCM_BCM43XXX=y
+
+# wireless packages
+BR2_PACKAGE_WIRELESS_TOOLS=y
+BR2_PACKAGE_WPA_SUPPLICANT=y
+BR2_PACKAGE_WPA_SUPPLICANT_PASSPHRASE=y
+
 # Filesystem
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/warp7/post-image.sh"
 BR2_TARGET_ROOTFS_EXT2=y
