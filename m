From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sat, 12 Sep 2020 15:15:30 +0200
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: new defconfig
Message-ID: <20200912130700.8669B814C5@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=a7a19b1c19a3c27cf96adb1e3eaf35d48e0a1f6a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Now that upstream supports this board add buildroot support for it,
too.

This supports:
 - latest upstream linux kernel. Since the support for this board and
   its SoC is still in active development, we want to follow the
   upstream kernel releases for now.
 - building an image which can be installed to eMMC, SD card or USB
   thumb drive.
 - upstream u-boot patches are pending, therefore no support for
   building a bootloader for now.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Heiko Thiery <heiko.thiery@gmail.com>
Tested-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 DEVELOPERS                                         |  2 +
 board/kontron/smarc-sal28/extlinux.conf            |  4 ++
 board/kontron/smarc-sal28/genimage.cfg             | 11 +++
 board/kontron/smarc-sal28/linux.fragment           | 18 +++++
 board/kontron/smarc-sal28/post-build.sh            |  7 ++
 board/kontron/smarc-sal28/readme.txt               | 80 ++++++++++++++++++++++
 .../etc/udev/rules.d/70-enetc-networking.rules     |  8 +++
 .../etc/udev/rules.d/70-felix-networking.rules     |  6 ++
 .../etc/udev/rules.d/71-smarc-networking.rules     | 19 +++++
 configs/kontron_smarc_sal28_defconfig              | 21 ++++++
 10 files changed, 176 insertions(+)

diff --git a/DEVELOPERS b/DEVELOPERS
index 2bb75d8ccc..884c79cfdf 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1878,6 +1878,8 @@ F:	package/jasper/
 F:	package/libstrophe/
 
 N:	Michael Walle <michael@walle.cc>
+F:	board/kontron/smarc-sal28/
+F:	configs/kontron_smarc_sal28_defconfig
 F:	package/libavl/
 
 N:	Micha?? ??yszczek <michal.lyszczek@bofc.pl>
diff --git a/board/kontron/smarc-sal28/extlinux.conf b/board/kontron/smarc-sal28/extlinux.conf
new file mode 100644
index 0000000000..bf60bc3798
--- /dev/null
+++ b/board/kontron/smarc-sal28/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetreedir /boot
+  append root=PARTUUID=%PARTUUID% rootwait
diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
new file mode 100644
index 0000000000..9ef37de757
--- /dev/null
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -0,0 +1,11 @@
+image sdcard-emmc.img {
+	hdimage {
+		gpt = true
+	}
+
+	partition rootfs {
+		offset = 2M
+		image = rootfs.ext4
+		partition-uuid = %PARTUUID%
+	}
+}
diff --git a/board/kontron/smarc-sal28/linux.fragment b/board/kontron/smarc-sal28/linux.fragment
new file mode 100644
index 0000000000..00bbcc0923
--- /dev/null
+++ b/board/kontron/smarc-sal28/linux.fragment
@@ -0,0 +1,18 @@
+CONFIG_NET_DSA=m
+CONFIG_NET_DSA_TAG_OCELOT=m
+CONFIG_NET_DSA_MSCC_FELIX=m
+CONFIG_NET_SCHED=y
+CONFIG_NET_SCH_CBS=m
+CONFIG_NET_SCH_ETF=m
+CONFIG_NET_SCH_TAPRIO=m
+CONFIG_CAN_FLEXCAN=m
+CONFIG_FSL_ENETC=y
+CONFIG_FSL_ENETC_VF=m
+CONFIG_FSL_ENETC_QOS=y
+CONFIG_MSCC_OCELOT_SWITCH=m
+CONFIG_PCIE_DW_PLAT_HOST=y
+CONFIG_GPIO_MPC8XXX=y
+CONFIG_SND_SOC_FSL_SAI=m
+CONFIG_SND_SOC_WM8904=m
+CONFIG_RTC_DRV_RV8803=y
+CONFIG_COMMON_CLK_FSL_SAI=y
diff --git a/board/kontron/smarc-sal28/post-build.sh b/board/kontron/smarc-sal28/post-build.sh
new file mode 100755
index 0000000000..bf8861f6a9
--- /dev/null
+++ b/board/kontron/smarc-sal28/post-build.sh
@@ -0,0 +1,7 @@
+#!/bin/sh
+BOARD_DIR="$(dirname $0)"
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
+
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/kontron/smarc-sal28/readme.txt b/board/kontron/smarc-sal28/readme.txt
new file mode 100644
index 0000000000..231c751b66
--- /dev/null
+++ b/board/kontron/smarc-sal28/readme.txt
@@ -0,0 +1,80 @@
+Kontron SMARC-sAL28
+===================
+
+How to build it
+===============
+
+Configure Buildroot:
+
+  $ make kontron_smarc_sal28_defconfig
+
+Change settings to fit your needs (optional):
+
+  $ make menuconfig
+
+Compile everything and build the rootfs image:
+
+  $ make
+
+Copying the image to a storage device
+=====================================
+
+Buildroot builds an image which can be written to the internal eMMC
+storage, a SD card or an USB thumb drive. You can use the following
+command on your host:
+
+  $ sudo dd if=output/images/sdcard-emmc.img of=/dev/sdx bs=1M
+
+Where /dev/sdx is the corresponding block device of your SD card or USB
+thumb drive. To flash it on your internal eMMC use the following command on
+the board:
+
+  # dd if=sdcard-emmc.img of=/dev/mmcblk1 bs=1M
+
+Be sure you have not booted from the internal eMMC in this case!
+
+Booting the board
+=================
+
+By default the bootloader will search for the first valid image, starting
+with the internal eMMC. Consult the vendor documentation on how to use the
+DIP switches to select specific boot devices. To use the bootloader
+environment set the boot_targets correspondingly. E.g.:
+
+  # setenv boot_targets usb0
+
+To boot from an USB thumb drive.
+
+The device tree is loaded according to the filename in fdtfile. The
+following command will set the default device tree, which works on almost
+all variants (with less features of course):
+
+  # setenv fdtfile freescale/fsl-ls1028a-kontron-sl28.dtb
+
+Set this to a device tree which fits your board variant.
+
+Connect your serial cable to SER1 and open your favorite terminal emulation
+program (baudrate 115200, 8n1). E.g.:
+
+  $ picocom -b 115200 /dev/ttyUSB0
+
+You will get a warning reported by fdisk when you examine the SD card.
+This is because the genimage.cfg file doesn't specify the SD card size
+(as people will naturally have different sized cards), so the
+secondary GPT header is placed after the rootfs rather than at the end
+of the disk where it is expected to be.
+
+You will see something like this at boot time:
+
+[    4.552797] GPT:Primary header thinks Alt. header is not at the end of the disk.
+[    4.560237] GPT:266272 != 7864319
+[    4.563565] GPT:Alternate GPT header not at the end of the disk.
+[    4.569596] GPT:266272 != 7864319
+[    4.572925] GPT: Use GNU Parted to correct GPT errors.
+
+What does not work
+==================
+
+For reasons unknown, the network card doesn't work if you use the original
+vendor bootloader. Board support patches for upstream u-boot are currently
+pending. Stay tuned.
diff --git a/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/70-enetc-networking.rules b/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/70-enetc-networking.rules
new file mode 100644
index 0000000000..8774bc5581
--- /dev/null
+++ b/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/70-enetc-networking.rules
@@ -0,0 +1,8 @@
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", NAME="eno0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", NAME="eno1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.2", DRIVERS=="fsl_enetc", NAME="eno2"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.6", DRIVERS=="fsl_enetc", NAME="eno3"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.0", DRIVERS=="fsl_enetc_vf", NAME="eno0vf0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.1", DRIVERS=="fsl_enetc_vf", NAME="eno0vf1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.2", DRIVERS=="fsl_enetc_vf", NAME="eno1vf0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:01.3", DRIVERS=="fsl_enetc_vf", NAME="eno1vf1"
diff --git a/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/70-felix-networking.rules b/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/70-felix-networking.rules
new file mode 100644
index 0000000000..917c0244ab
--- /dev/null
+++ b/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/70-felix-networking.rules
@@ -0,0 +1,6 @@
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p0", NAME="swp0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p1", NAME="swp1"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p2", NAME="swp2"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p3", NAME="swp3"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p4", NAME="swp4"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p5", NAME="swp5"
diff --git a/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/71-smarc-networking.rules b/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/71-smarc-networking.rules
new file mode 100644
index 0000000000..8c946b05fe
--- /dev/null
+++ b/board/kontron/smarc-sal28/rootfs_overlay/etc/udev/rules.d/71-smarc-networking.rules
@@ -0,0 +1,19 @@
+# Map the GBE0 and GBE1 names from the SMARC standard to the network
+# interfaces. This depends on the variant of the board.
+
+# get the variant compatible string
+PROGRAM=="/bin/grep '^kontron,sl28-var[1-4]$' /sys/firmware/devicetree/base/compatible", ENV{sl28_compatible}="%c"
+
+# variant 1
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", ENV{sl28_compatible}=="kontron,sl28-var1", NAME="gbe0"
+
+# variant 2
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p0", ENV{sl28_compatible}=="kontron,sl28-var2", NAME="gbe0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.5", DRIVERS=="mscc_felix", ATTR{phys_port_name}=="p1", ENV{sl28_compatible}=="kontron,sl28-var2", NAME="gbe1"
+
+# variant 3
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", ENV{sl28_compatible}=="kontron,sl28-var3", NAME="gbe0"
+
+# variant 4
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.0", DRIVERS=="fsl_enetc", ENV{sl28_compatible}=="kontron,sl28-var4", NAME="gbe0"
+ACTION=="add", SUBSYSTEM=="net", KERNELS=="0000:00:00.1", DRIVERS=="fsl_enetc", ENV{sl28_compatible}=="kontron,sl28-var4", NAME="gbe1"
diff --git a/configs/kontron_smarc_sal28_defconfig b/configs/kontron_smarc_sal28_defconfig
new file mode 100644
index 0000000000..9eaea2a636
--- /dev/null
+++ b/configs/kontron_smarc_sal28_defconfig
@@ -0,0 +1,21 @@
+BR2_aarch64=y
+BR2_cortex_a72=y
+BR2_TOOLCHAIN_BUILDROOT_WCHAR=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
+BR2_ROOTFS_OVERLAY="board/kontron/smarc-sal28/rootfs_overlay"
+BR2_ROOTFS_POST_BUILD_SCRIPT="board/kontron/smarc-sal28/post-build.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c $(BINARIES_DIR)/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/kontron/smarc-sal28/linux.fragment"
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/fsl-ls1028a-kontron-sl28 freescale/fsl-ls1028a-kontron-sl28-var2 freescale/fsl-ls1028a-kontron-sl28-var3-ads2 freescale/fsl-ls1028a-kontron-sl28-var4 freescale/fsl-ls1028a-kontron-kbox-a-230-ls"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+BR2_TARGET_ROOTFS_EXT2_SIZE="128M"
+BR2_PACKAGE_HOST_GENIMAGE=y
+BR2_PACKAGE_HOST_UBOOT_TOOLS=y
