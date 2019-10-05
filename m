From: Danilo Bargen <mail@dbrgn.ch>
Date: Sat, 5 Oct 2019 02:40:23 +0200
Subject: [Buildroot] [PATCH 1/1] board/pcengines/apu2: add config
Message-ID: <20191005024023.40f198c9@x2000>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

The apu2 by PC Engines is a 64 bit single board computer with coreboot
BIOS. It only has serial output, but no graphics chip. With its 2?4
ethernet ports, it is often used to build a firewall or router.

The provided defconfig configures busybox and isolinux. It will output a
hybrid ISO image that can be written to a USB stick or burned to a CD.

Configuration based on a blogpost by Tony Arkles:

http://www.better-bsp.com/blog/2017/03/02/buildrooting-for-apu2/

Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
---
 DEVELOPERS                        |  4 +++
 board/pcengines/apu2/isolinux.cfg |  6 ++++
 board/pcengines/apu2/linux.config | 51 +++++++++++++++++++++++++++++++
 board/pcengines/apu2/readme.txt   | 40 ++++++++++++++++++++++++
 configs/pcengines_apu2_defconfig  | 16 ++++++++++
 5 files changed, 117 insertions(+)
 create mode 100644 board/pcengines/apu2/isolinux.cfg
 create mode 100644 board/pcengines/apu2/linux.config
 create mode 100644 board/pcengines/apu2/readme.txt
 create mode 100644 configs/pcengines_apu2_defconfig

diff --git a/DEVELOPERS b/DEVELOPERS
index 7b93110179..35c31f620f 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -611,6 +611,10 @@ F:	package/redis/
 N:	Daniel Sangue <daniel.sangue@sangue.ch>
 F:	package/libftdi1/
 
+N:  Danilo Bargen <mail@dbrgn.ch>
+F:  board/pcengines/apu2/
+F:  configs/pcengines_apu2_defconfig
+
 N:	Danomi Manchego <danomimanchego123@gmail.com>
 F:	package/cjson/
 F:	package/jq/
diff --git a/board/pcengines/apu2/isolinux.cfg b/board/pcengines/apu2/isolinux.cfg
new file mode 100644
index 0000000000..cb19b5a89e
--- /dev/null
+++ b/board/pcengines/apu2/isolinux.cfg
@@ -0,0 +1,6 @@
+serial 0 115200
+default 1
+label 1
+      kernel __KERNEL_PATH__
+      initrd __INITRD_PATH__
+      append root=/dev/sr0 console=ttyS0,115200n8
diff --git a/board/pcengines/apu2/linux.config b/board/pcengines/apu2/linux.config
new file mode 100644
index 0000000000..5e3593b018
--- /dev/null
+++ b/board/pcengines/apu2/linux.config
@@ -0,0 +1,51 @@
+CONFIG_SYSVIPC=y
+CONFIG_CGROUPS=y
+CONFIG_BLK_DEV_INITRD=y
+CONFIG_SMP=y
+CONFIG_HYPERVISOR_GUEST=y
+CONFIG_PARAVIRT=y
+CONFIG_MODULES=y
+CONFIG_MODULE_UNLOAD=y
+CONFIG_NET=y
+CONFIG_PACKET=y
+CONFIG_UNIX=y
+CONFIG_INET=y
+# CONFIG_WIRELESS is not set
+CONFIG_DEVTMPFS=y
+CONFIG_DEVTMPFS_MOUNT=y
+CONFIG_VIRTIO_BLK=y
+CONFIG_BLK_DEV_SD=y
+CONFIG_SCSI_VIRTIO=y
+CONFIG_ATA=y
+CONFIG_SATA_AHCI=y
+CONFIG_ATA_PIIX=y
+CONFIG_NETDEVICES=y
+CONFIG_VIRTIO_NET=y
+CONFIG_IGB=y
+CONFIG_NE2K_PCI=y
+CONFIG_8139CP=y
+# CONFIG_WLAN is not set
+CONFIG_INPUT_EVDEV=y
+CONFIG_SERIAL_8250=y
+CONFIG_SERIAL_8250_CONSOLE=y
+CONFIG_VIRTIO_CONSOLE=y
+CONFIG_HW_RANDOM_VIRTIO=m
+CONFIG_DRM=y
+CONFIG_SOUND=y
+CONFIG_SND=y
+# CONFIG_SND_PCI is not set
+CONFIG_USB=y
+CONFIG_USB_XHCI_HCD=y
+CONFIG_USB_EHCI_HCD=y
+CONFIG_USB_UHCI_HCD=y
+CONFIG_USB_STORAGE=y
+CONFIG_VIRTIO_PCI=y
+CONFIG_VIRTIO_BALLOON=y
+CONFIG_VIRTIO_INPUT=y
+CONFIG_VIRTIO_MMIO=y
+CONFIG_VIRTIO_MMIO_CMDLINE_DEVICES=y
+CONFIG_EXT4_FS=y
+CONFIG_AUTOFS4_FS=y
+CONFIG_TMPFS=y
+CONFIG_TMPFS_POSIX_ACL=y
+CONFIG_UNWINDER_FRAME_POINTER=y
diff --git a/board/pcengines/apu2/readme.txt b/board/pcengines/apu2/readme.txt
new file mode 100644
index 0000000000..9da1b802cc
--- /dev/null
+++ b/board/pcengines/apu2/readme.txt
@@ -0,0 +1,40 @@
+Intro
+=====
+
+This is a board configuration for the apu2 platform by PC Engines.
+
+https://pcengines.ch/apu2.htm
+
+Since the apu2 does not have any graphical output, the default configuration
+will ensure that the kernel output as well as the login prompt will be sent to
+the serial port.
+
+How to build
+============
+
+The provided defconfig creates a hybrid isolinux image that can be booted from
+either an USB stick or a CD.
+
+    $ make pcengines_apu2_defconfig
+    $ make
+
+How to write to an USB stick
+============================
+
+Once the build process is finished you will have an image
+called "rootfs.iso9660" in the output/images/ directory.
+
+Copy the bootable "rootfs.iso9660" onto the USB stick with "dd":
+
+    $ sudo dd if=output/images/rootfs.iso9660 of=/dev/sdX bs=1M conv=fsync
+    $ sudo sync
+
+How to connect to the apu2
+==========================
+
+Connect to the DB9 serial port of the apu2 board (either directly or through a
+USB adapter) with a baudrate of 115200.
+
+For example with miniterm (part of pyserial):
+
+    $ miniterm.py -f direct /dev/ttyUSB0 115200
diff --git a/configs/pcengines_apu2_defconfig b/configs/pcengines_apu2_defconfig
new file mode 100644
index 0000000000..68cebb8f6a
--- /dev/null
+++ b/configs/pcengines_apu2_defconfig
@@ -0,0 +1,16 @@
+BR2_x86_64=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+BR2_TARGET_GENERIC_HOSTNAME="apu2"
+BR2_TARGET_GENERIC_GETTY_PORT="ttyS0"
+BR2_SYSTEM_DHCP="eth0"
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.16"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pcengines/apu2/linux.config"
+BR2_TARGET_ROOTFS_EXT2=y
+BR2_TARGET_ROOTFS_ISO9660=y
+BR2_TARGET_ROOTFS_ISO9660_BOOT_MENU="board/pcengines/apu2/isolinux.cfg"
+BR2_TARGET_ROOTFS_ISO9660_HYBRID=y
+# BR2_TARGET_ROOTFS_TAR is not set
+BR2_TARGET_SYSLINUX=y
-- 
2.23.0
