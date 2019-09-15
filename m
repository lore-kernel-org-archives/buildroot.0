From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Sun, 15 Sep 2019 16:00:56 +0200
Subject: [Buildroot] [git commit] configs/lafrite: new defconfig
Message-ID: <20190915135714.DF71B8E3F2@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=4bed0934bcab9fe5d23b4d300b353d1eb3085025
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add basic support for the Libre Computer "La Frite" SBC.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 .gitlab-ci.yml                                     |  1 +
 DEVELOPERS                                         |  2 ++
 board/librecomputer/lafrite/genimage.cfg           | 10 +++++++
 .../lafrite/overlay/extlinux/extlinux.conf         |  4 +++
 board/librecomputer/lafrite/readme.txt             | 34 ++++++++++++++++++++++
 configs/lafrite_defconfig                          | 20 +++++++++++++
 6 files changed, 71 insertions(+)

diff --git a/.gitlab-ci.yml b/.gitlab-ci.yml
index 6243107ee9..7b443b0cff 100644
--- a/.gitlab-ci.yml
+++ b/.gitlab-ci.yml
@@ -200,6 +200,7 @@ imx7d-sdb_defconfig: { extends: .defconfig }
 imx7dpico_defconfig: { extends: .defconfig }
 imx8mmpico_defconfig: { extends: .defconfig }
 imx8mpico_defconfig: { extends: .defconfig }
+lafrite_defconfig: { extends: .defconfig }
 lego_ev3_defconfig: { extends: .defconfig }
 licheepi_zero_defconfig: { extends: .defconfig }
 linksprite_pcduino_defconfig: { extends: .defconfig }
diff --git a/DEVELOPERS b/DEVELOPERS
index e424876903..9d972f5b40 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1771,12 +1771,14 @@ F:	package/libunistring/
 
 N:	Peter Korsgaard <peter@korsgaard.com>
 F:	board/minnowboard/
+F:	board/librecomputer/lafrite/
 F:	board/nexbox/a95x/
 F:	board/openblocks/a6/
 F:	board/orangepi/
 F:	board/pandaboard/
 F:	board/roseapplepi/
 F:	boot/shim/
+F:	configs/lafrite_defconfig
 F:	configs/minnowboard_max-graphical_defconfig
 F:	configs/minnowboard_max_defconfig
 F:	configs/nexbox_a95x_defconfig
diff --git a/board/librecomputer/lafrite/genimage.cfg b/board/librecomputer/lafrite/genimage.cfg
new file mode 100644
index 0000000000..212f829527
--- /dev/null
+++ b/board/librecomputer/lafrite/genimage.cfg
@@ -0,0 +1,10 @@
+image usb.img {
+	hdimage {
+	}
+
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+		size = 512M
+	}
+}
diff --git a/board/librecomputer/lafrite/overlay/extlinux/extlinux.conf b/board/librecomputer/lafrite/overlay/extlinux/extlinux.conf
new file mode 100644
index 0000000000..60aa9d6e70
--- /dev/null
+++ b/board/librecomputer/lafrite/overlay/extlinux/extlinux.conf
@@ -0,0 +1,4 @@
+label linux
+  kernel /boot/Image
+  devicetree /boot/meson-gxl-s805x-libretech-ac.dtb
+  append console=ttyAML0,115200 earlyprintk root=/dev/sda1 rootwait
diff --git a/board/librecomputer/lafrite/readme.txt b/board/librecomputer/lafrite/readme.txt
new file mode 100644
index 0000000000..c439c5e91d
--- /dev/null
+++ b/board/librecomputer/lafrite/readme.txt
@@ -0,0 +1,34 @@
+Intro
+=====
+
+Libre Computer "La Frite" is a low cost SBC based around an Amlogic
+s805x SoC (quad A53), 512MB/1GB DDR4 and a 16MB SPI NOR flash:
+
+https://libre.computer/products/boards/aml-s805x-ac/
+
+How to build it
+===============
+
+Configure Buildroot:
+
+    $ make lafrite_defconfig
+
+Compile everything and build the USB flash drive image:
+
+    $ make
+
+How to write the USB flash drive image
+======================================
+
+Once the build process is finished you will have an image called "usb.img"
+in the output/images/ directory.
+
+Copy the bootable "usb.img" onto a USB flash drive with "dd":
+
+  $ sudo dd if=output/images/usb.img of=/dev/sdX
+
+How to boot
+===========
+
+Insert flash drive to the USB connector furthest away from the IR
+receiver and power up board. The system will boot automatically.
diff --git a/configs/lafrite_defconfig b/configs/lafrite_defconfig
new file mode 100644
index 0000000000..63370928e5
--- /dev/null
+++ b/configs/lafrite_defconfig
@@ -0,0 +1,20 @@
+BR2_aarch64=y
+BR2_cortex_a53=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_2=y
+BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
+BR2_SYSTEM_DHCP="eth0"
+BR2_ROOTFS_OVERLAY="board/librecomputer/lafrite/overlay/"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/librecomputer/lafrite/genimage.cfg"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.2.14"
+BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
+BR2_LINUX_KERNEL_DTS_SUPPORT=y
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="amlogic/meson-gxl-s805x-libretech-ac"
+BR2_LINUX_KERNEL_INSTALL_TARGET=y
+BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_EXT2_4=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_PACKAGE_HOST_GENIMAGE=y
