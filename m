From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 25 Jul 2020 23:01:55 +0200
Subject: [Buildroot] [git commit] configs/globalscale_espressobin: new
 defconfig
Message-ID: <20200725205752.DDE0F8716D@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=1c714bf757115a85881da5e224ff7f06d8041f92
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Basic support for the Marvell ESPRESSObin, by Globalscale Technologies.

  http://espressobin.net

The kernel config has been extended with a fragment to enable switchcore
support, DSA drivers, and VLAN filtering in the bridge.  To make use of
this you need a custom libnl based application, or the iproute2 suite
rather than the brctl tools, which don't support the VLAN filtering.

Signed-off-by: Joachim Nilsson <troglobit@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                    |  1 +
 DEVELOPERS                                        |  4 +
 board/globalscale/espressobin/genimage.cfg        | 11 +++
 board/globalscale/espressobin/linux-extras.config | 14 ++++
 board/globalscale/espressobin/readme.txt          | 90 +++++++++++++++++++++++
 configs/globalscale_espressobin_defconfig         | 26 +++++++
 6 files changed, 146 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 673aa8b3e7..012398d876 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -198,6 +198,7 @@ friendlyarm_nanopi_a64_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo2_defconfig: { extends: .defconfig }
 friendlyarm_nanopi_neo_plus2_defconfig: { extends: .defconfig }
 galileo_defconfig: { extends: .defconfig }
+globalscale_espressobin_defconfig: { extends: .defconfig }
 grinn_chiliboard_defconfig: { extends: .defconfig }
 grinn_liteboard_defconfig: { extends: .defconfig }
 hifive_unleashed_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index bdbfa4728a..4329683ac9 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1271,6 +1271,10 @@ F:	package/libuhttpd/
 F:	package/libuwsc/
 F:	package/rtty/
 
+N:	Joachim Nilsson <troglobit@gmail.com>
+F:	configs/globalscale_espressobin_defconfig
+F:	board/globalscale/espressobin/
+
 N:	Joao Pinto <jpinto@synopsys.com>
 F:	board/synopsys/vdk/
 F:	configs/snps_aarch64_vdk_defconfig
diff --git a/board/globalscale/espressobin/genimage.cfg b/board/globalscale/espressobin/genimage.cfg
new file mode 100644
index 0000000000..360c8f098f
--- /dev/null
+++ b/board/globalscale/espressobin/genimage.cfg
@@ -0,0 +1,11 @@
+# Minimal image, no U-boot since v3/v5 cannot boot from sdcard, see
+# readme.txt for details on configuring the on-board u-boot.
+image sdcard.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
+}
diff --git a/board/globalscale/espressobin/linux-extras.config b/board/globalscale/espressobin/linux-extras.config
new file mode 100644
index 0000000000..7ce0a495c1
--- /dev/null
+++ b/board/globalscale/espressobin/linux-extras.config
@@ -0,0 +1,14 @@
+#
+# The Espressobin has a switchcore with full support in the kernel.
+# This fragment enables DSA and its drivers, inclding VLAN aware bridge
+# support to allow users to easily set up a LAN switch + WAN interface.
+#
+CONFIG_NET_DSA=m
+CONFIG_VLAN_8021Q=y
+
+CONFIG_BRIDGE=m
+CONFIG_BRIDGE_IGMP_SNOOPING=y
+CONFIG_BRIDGE_VLAN_FILTERING=y
+
+CONFIG_NET_DSA_MV88E6XXX=m
+CONFIG_NET_DSA_MV88E6XXX_PTP=y
diff --git a/board/globalscale/espressobin/readme.txt b/board/globalscale/espressobin/readme.txt
new file mode 100644
index 0000000000..c5af7e3c99
--- /dev/null
+++ b/board/globalscale/espressobin/readme.txt
@@ -0,0 +1,90 @@
+Marvell ESPRESSObin
+===================
+
+This default configuration allows you to quickly get up and running with
+the Marvell ESPRESSObin board by Globalscale Technologies Inc.
+
+The ESPRESSObin is based on the Marvell Armada 88F3720 SoC, coupled with
+a Marvell 88E6341 switch core "Topaz", with three exposed gigabit ports.
+
+     _________________________
+    |#  U     W   L  L    U  #|
+    |#  S     A   A  A    S  #|
+    |#  B     N   N  N    B  #|
+    |#            0  1       #|
+    |#      Mini             #|
+    |#      -PCI             #|
+    |#                       #|
+    |#  5                    #|
+    |#__V___usb_PWR_SATA__SW_#|
+
+    Fig 1: Overview of board
+
+Notice difference in Ethernet port layout compared to the Globalscale
+docs.  They order the ports; LAN2, LAN1, WAN (left to right in figure
+above).  For more information, see http://espressobin.net
+
+
+Building
+--------
+
+    $ make globalscale_espressobin_defconfig
+    $ make
+
+This generates the kernel image, the devicetree binary, the rootfs as a
+tar.gz, and a filesystem image containing everything.
+
+All build artifacts are located in `output/images/`
+
+
+Booting
+-------
+
+To boot, you need a UART connection, using the on-board micro USB port
+set to 115200 8N1.
+
+By default, the ESPRESSObin comes with a pre-flashed U-Boot set up to
+load the kernel, device-tree and rootfs from SPI NOR flash.  The board
+jumpers can be changed to boot from different sources, see the quick
+start guide for each board revision for details:
+
+- ftp://downloads.globalscaletechnologies.com/Downloads/Espressobin/ESPRESSObin%20V5/
+- ftp://downloads.globalscaletechnologies.com/Downloads/Espressobin/ESPRESSObin%20V7/
+
+Note: the v5, and earlier, cannot boot from sdcard, so you have to set
+up the factory U-Boot to boot into Buildroot:
+
+1. Flash rootfs image to sdcard drive, your `of=` device may differ:
+
+        $ sudo dd if=output/images/sdcard.img of=/dev/mmcblk0 bs=1M
+        $ sync
+
+2. Boot board from SPI NOR, interrupt boot by pressing any key ...
+3. Check with `printenv` that the default setup is OK, otherwise ensure
+   the following are set, and define `bootcmd` for automatic boot:
+
+        > setenv kernel_addr 0x5000000
+        > setenv fdt_addr 0x1800000
+        > setenv fdt_name boot/armada-3720-espressobin.dtb
+        > setenv console console=ttyMV0,115200 earlycon=ar3700_uart,0xd0012000
+        > setenv bootcmd 'mmc dev 0; ext4load mmc 0:1 $kernel_addr $image_name;ext4load mmc 0:1 $fdt_addr $fdt_name;setenv bootargs $console root=/dev/mmcblk0p1 rw rootwait; booti $kernel_addr - $fdt_addr'
+
+4. Call the boot command, or `reset` the board to start:
+
+        > run bootcmd
+
+
+Networking
+----------
+
+To enable Ethernet networking, load the `mv88e6xxx` kernel module, and
+bring up each respective interface needed:
+
+    # modprobe mv88e6xxx
+    # ifconfig wan up
+
+A more advanced scenario is setting up switching between the ports using
+the Linux bridge.  The kernel switchdev layer, and DSA driver, ensure
+switch functions are "offloaded" to the HW switch, i.e., all traffic
+between LAN ports never reach the CPU.  For this you need the iproute2
+suite of tools.
diff --git a/configs/globalscale_espressobin_defconfig b/configs/globalscale_espressobin_defconfig
new file mode 100644
index 0000000000..c0b9f69559
--- /dev/null
+++ b/configs/globalscale_espressobin_defconfig
@@ -0,0 +1,26 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_ARM_FPU_VFPV4=y
+
+# Linux headers same as kernel, a 5.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_6=y
+
+# Kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.6.11"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/globalscale/espressobin/linux-extras.config"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="marvell/armada-3720-espressobin marvell/armada-3720-espressobin-emmc marvell/armada-3720-espressobin-v7 marvell/armada-3720-espressobin-v7-emmc"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+
+# Filesystem
+BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Marvell ESPRESSObin"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
+BR2_TARGET_ROOTFS_TAR_GZIP=y
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/globalscale/espressobin/genimage.cfg"
