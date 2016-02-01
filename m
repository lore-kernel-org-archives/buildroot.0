From: Peter Korsgaard <peter@korsgaard.com>
Date: Mon, 1 Feb 2016 11:51:08 +0100
Subject: [Buildroot] [git commit] support/scripts: drop ancient
	build-ext3-img script
Message-ID: <20160201224710.6A5147F892@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: https://git.buildroot.net/buildroot/commit/?id=53703ee67a645c15cfda837f0b46be2bf813dbfe
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

It hasn't been updated since it was added in 2008, and nowadays things kind
of stuff should be handled with genimage.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/build-ext3-img | 152 -----------------------------------------
 1 file changed, 152 deletions(-)

diff --git a/support/scripts/build-ext3-img b/support/scripts/build-ext3-img
deleted file mode 100755
index 1cab710..0000000
--- a/support/scripts/build-ext3-img
+++ /dev/null
@@ -1,152 +0,0 @@
-#!/bin/sh
-
-BLOCKSIZE=516096
-WORKING_DIR=`pwd`
-
-echo "This script will create a bootable ext3 image from buildroot."
-
-echo "Enter the path to the image (${WORKING_DIR})"
-read IMG_PATH
-
-if [ "${IMAGE_PATH}" = "" ]; then
-	IMAGE_PATH=${WORKING_DIR}
-fi
-
-echo "Enter the name of the image file (buildroot.img)"
-read IMG_NAME
-
-if [ "${IMAGE_NAME}" = "" ]; then
-	IMAGE_NAME="buildroot.img"
-fi
-
-IMAGE=${IMAGE_PATH}/${IMAGE_NAME}
-
-echo "Enter the path and filename for the root filesystem"
-echo "tarball that you want to install into the image"
-read ROOT_PATH
-
-if [ "${ROOT_PATH}" = "" ]; then
-	echo "Error: you must specify a path."
-	exit 1
-fi
-
-CYLINDERS=`du --summarize --block-size=${BLOCKSIZE} ${ROOT_PATH}`
-BYTE_SIZE=`du --summarize --block-size=${BLOCKSIZE} --human-readable ${ROOT_PATH}`
-
-CYLINDERS=${CYLINDERS%${ROOT_PATH}}
-BYTE_SIZE=${BYTE_SIZE%${ROOT_PATH}}
-
-CYLINDERS=`expr ${CYLINDERS} "*" 2`
-
-echo "Now I will create an ext3 image file"
-echo "using ${CYLINDERS} cylinders, with ${BLOCKSIZE} bytes per block"
-echo "in other words, ${BYTE_SIZE}bytes..." 
-
-	dd if=/dev/zero of=${IMAGE} bs=${BLOCKSIZE}c count=${CYLINDERS} 
-
-# Create file partition and filesystem
-
-    # STEP 1. create partition
-    /sbin/losetup /dev/loop3 ${IMAGE}
-	# probably should figure out how to use GNU parted to do this non-interactively
-    /sbin/fdisk -u -C${CYLINDERS} -S63 -H16 /dev/loop3
-    /sbin/losetup -d /dev/loop3
-
-    # STEP 2. make file system (ext3)
-    /sbin/losetup -o 32256 /dev/loop3 ${IMAGE}
-    /sbin/mkfs.ext3 /dev/loop3
-    /sbin/losetup -d /dev/loop3 
-
-# Install Software to the image
-	mkdir -p ${IMAGE_PATH}/temp
-    mount -o offset=32256,loop ${IMAGE} ${IMAGE_PATH}/temp
-    tar -xvf ${ROOT_PATH} --directory ${IMAGE_PATH}/temp
-    # make sure to unmount the image
-    umount ${IMAGE_PATH}/temp
-	rm -rf ${IMAGE_PATH}/temp
-
-# Create a VMware .vmx file
-cat > ${IMAGE_PATH}/buildroot.vmx <<EOF
-config.version = "8"
-virtualHW.version = "3"
-
-uuid.location = "56 4d 5c cc 3d 4a 43 29-55 89 5c 28 1e 7e 06 58"
-uuid.bios = "56 4d 5c cc 3d 4a 43 29-55 89 5c 28 1e 7e 06 58"
-
-uuid.action = "create"
-checkpoint.vmState = ""
-
-displayName = "Buildroot"
-annotation = ""
-guestinfo.vmware.product.long = ""
-guestinfo.vmware.product.url = "http://dcgrendel.be/vmbuilder/"
-
-guestOS = "linux"
-numvcpus = "1"
-memsize = "256"
-paevm = "FALSE"
-sched.mem.pshare.enable = "TRUE"
-MemAllowAutoScaleDown = "FALSE"
-
-MemTrimRate = "-1"
-
-nvram = "nvram"
-
-mks.enable3d = "FALSE"
-vmmouse.present = "TRUE"
-
-tools.syncTime = "TRUE"
-tools.remindinstall = "FALSE"
-
-isolation.tools.hgfs.disable = "FALSE"
-isolation.tools.dnd.disable = "FALSE"
-isolation.tools.copy.enable = "TRUE"
-isolation.tools.paste.enabled = "TRUE"
-gui.restricted = "FALSE"
-
-ethernet0.present = "TRUE"
-ethernet0.connectionType = "bridged"
-ethernet0.addressType = "generated"
-ethernet0.generatedAddress = "00:0c:29:7e:06:58"
-ethernet0.generatedAddressOffset = "0"
-
-usb.present = "TRUE"
-usb.generic.autoconnect = "FALSE"
-
-sound.present = "TRUE"
-sound.virtualdev = "es1371"
-
-ide0:0.present = "TRUE"
-ide0:0.fileName = "buildroot.vmdk"
-ide0:0.deviceType = "disk"
-ide0:0.mode = ""
-ide0:0.redo = ""
-ide0:0.writeThrough = "FALSE"
-ide0:0.startConnected = "TRUE"
-
-ide1:0.present = "FALSE"
-ide1:0.fileName = ""
-ide1:0.deviceType = "disk"
-ide1:0.mode = ""
-ide1:0.redo = ""
-ide1:0.writeThrough = "FALSE"
-ide1:0.startConnected = "FALSE"
-
-floppy0.present = "FALSE"
-
-serial0.present = "FALSE"
-
-serial1.present = "FALSE"
-
-parallel0.present = "FALSE"
-
-EOF
-
-# Install GRUB
-     /sbin/grub --no-floppy --batch <<EOT 
-     device (hd0) ${IMAGE}
-     geometry (hd0) ${CYLINDERS} 16 63
-     root (hd0,0)
-     setup (hd0)
-     quit
-     EOT
