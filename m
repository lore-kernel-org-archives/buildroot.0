From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  6 Mar 2008 09:52:39 -0800 (PST)
Subject: [Buildroot] svn commit: trunk/buildroot:  scripts
Message-ID: <20080306175239.45593120159@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-03-06 09:52:37 -0800 (Thu, 06 Mar 2008)
New Revision: 21176

Log:
some buildroot helper scripts

Added:
   trunk/buildroot/scripts/
   trunk/buildroot/scripts/add_new_package.wizard
   trunk/buildroot/scripts/build-ext3-img
   trunk/buildroot/scripts/create_ipkgs


Changeset:
Added: trunk/buildroot/scripts/add_new_package.wizard
===================================================================
--- trunk/buildroot/scripts/add_new_package.wizard	                        (rev 0)
+++ trunk/buildroot/scripts/add_new_package.wizard	2008-03-06 17:52:37 UTC (rev 21176)
@@ -0,0 +1,94 @@
+#!/bin/sh
+
+echo "**** Autotools Add New Package Wizard ****"
+echo " This script will generate files to add a"
+echo " new package to buildroot."
+echo
+
+echo "What is the name of the package?"
+read PACKAGE_NAME
+
+echo "What is the version number?"
+read VERSION_NUM
+
+echo "What is the web address of the tarball?"
+read DOWNLOAD_LOC
+
+echo "Enter any known dependencies, separated"
+echo "by spaces, or just press enter."
+read EXTRA_DEPS
+
+echo "Enter a description of the package."
+read DESCRIPTION
+
+echo "Does autoreconf need to be run first? (y/n)"
+read ANSWER
+
+if [ "$ANSWER" = "y" ]; then
+	RECONF="YES"
+else
+	RECONF="NO"
+fi
+
+echo "Does it need to be installed to the staging dir?"
+echo "Say yes, if other packages depend on it."
+echo "(If not sure, just say yes. It will only use more"
+echo "space on your hard drive.)"
+read ANSWER
+
+if [ "$ANSWER" = "y" ]; then
+	STAGING="YES"
+else
+	STAGING="NO"
+fi
+
+echo "Enter any configure script options."
+read CONFIG_OPTIONS
+
+URL=${DOWNLOAD_LOC%/*}
+TARBALL=${DOWNLOAD_LOC##*/}
+EXTENSION=${TARBALL##*.tar.}
+NAME_UPPER=`echo ${PACKAGE_NAME} | tr [a-z] [A-Z]`
+NAME_UPPER=${NAME_UPPER//-/_}
+
+mkdir ../package/${PACKAGE_NAME}
+
+cat > ../package/${PACKAGE_NAME}/${PACKAGE_NAME}.mk <<EOF
+#############################################################
+#
+# ${PACKAGE_NAME}
+#
+#############################################################
+${NAME_UPPER}_VERSION = ${VERSION_NUM}
+${NAME_UPPER}_SOURCE = ${PACKAGE_NAME}-\$(${NAME_UPPER}_VERSION).tar.${EXTENSION}
+${NAME_UPPER}_SITE = ${URL}
+${NAME_UPPER}_AUTORECONF = ${RECONF}
+${NAME_UPPER}_INSTALL_STAGING = ${STAGING}
+${NAME_UPPER}_INSTALL_TARGET = YES
+
+${NAME_UPPER}_CONF_OPT = ${CONFIG_OPTIONS}
+
+${NAME_UPPER}_DEPENDENCIES = uclibc ${EXTRA_DEPS}
+
+\$(eval \$(call AUTOTARGETS,package,${PACKAGE_NAME}))
+
+EOF
+
+cat > ../package/${PACKAGE_NAME}/Config.in <<EOF
+config BR2_PACKAGE_${NAME_UPPER}
+	bool "${PACKAGE_NAME}"
+	default n
+	help
+	  ${DESCRIPTION}
+
+	  ${URL}
+EOF
+
+echo "Just add: source \"package/${PACKAGE_NAME}/Config.in\""
+echo "to the file package/Config.in in an appropriate"
+echo "location."
+echo
+echo "You are now ready to build ${PACKAGE_NAME}"
+echo "Just run make menuconfig and select your new"
+echo "package, then run make."
+ 


Property changes on: trunk/buildroot/scripts/add_new_package.wizard
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/scripts/build-ext3-img
===================================================================
--- trunk/buildroot/scripts/build-ext3-img	                        (rev 0)
+++ trunk/buildroot/scripts/build-ext3-img	2008-03-06 17:52:37 UTC (rev 21176)
@@ -0,0 +1,152 @@
+#!/bin/sh
+
+BLOCKSIZE=516096
+WORKING_DIR=`pwd`
+
+echo "This script will create a bootable ext3 image from buildroot."
+
+echo "Enter the path to the image (${WORKING_DIR})"
+read IMG_PATH
+
+if [ "${IMAGE_PATH}" = "" ]; then
+	IMAGE_PATH=${WORKING_DIR}
+fi
+
+echo "Enter the name of the image file (buildroot.img)"
+read IMG_NAME
+
+if [ "${IMAGE_NAME}" = "" ]; then
+	IMAGE_NAME="buildroot.img"
+fi
+
+IMAGE=${IMAGE_PATH}/${IMAGE_NAME}
+
+echo "Enter the path to the root filesystem that you want"
+echo "to install to the image"
+read ROOT_PATH
+
+if [ "${ROOT_PATH}" = "" ]; then
+	echo "Error: you must specify a path."
+	exit 1
+fi
+
+CYLINDERS=`du --summarize --block-size=${BLOCKSIZE} ${ROOT_PATH}`
+BYTE_SIZE=`du --summarize --block-size=${BLOCKSIZE} --human-readable ${ROOT_PATH}`
+
+CYLINDERS=${CYLINDERS%${ROOT_PATH}}
+BYTE_SIZE=${BYTE_SIZE%${ROOT_PATH}}
+
+CYLINDERS=`expr ${CYLINDERS} "+" 2`
+
+echo "Now I will create an ext3 image file"
+echo "using ${CYLINDERS} cylinders, with ${BLOCKSIZE} bytes per block"
+echo "in other words, ${BYTE_SIZE}bytes..." 
+
+	dd if=/dev/zero of=${IMAGE} bs=${BLOCKSIZE}c count=${CYLINDERS} 
+
+# Create file partition and filesystem
+
+    # STEP 1. create partition
+    /sbin/losetup /dev/loop3 ${IMAGE}
+	# probably should figure out how to use GNU parted to do this non-interactively
+    /sbin/fdisk -u -C${CYLINDERS} -S63 -H16 /dev/loop3
+    /sbin/losetup -d /dev/loop3
+
+    # STEP 2. make file system (ext3)
+    /sbin/losetup -o 32256 /dev/loop3 ${IMAGE}
+    /sbin/mkfs.ext3 /dev/loop3
+    /sbin/losetup -d /dev/loop3 
+
+# Install Software to the image
+	mkdir -p ${IMAGE_PATH}/temp
+    mount -o offset=32256,loop ${IMAGE} ${IMAGE_PATH}/temp
+    cp -a ${ROOT_PATH}/* ${IMAGE_PATH}/temp
+    # make sure to unmount the image
+    umount ${IMAGE_PATH}/temp
+	rm -rf ${IMAGE_PATH}/temp
+
+# Create a VMware .vmx file
+cat > ${IMAGE_PATH}/buildroot.vmx <<EOF
+config.version = "8"
+virtualHW.version = "3"
+
+uuid.location = "56 4d 5c cc 3d 4a 43 29-55 89 5c 28 1e 7e 06 58"
+uuid.bios = "56 4d 5c cc 3d 4a 43 29-55 89 5c 28 1e 7e 06 58"
+
+uuid.action = "create"
+checkpoint.vmState = ""
+
+displayName = "Buildroot"
+annotation = ""
+guestinfo.vmware.product.long = ""
+guestinfo.vmware.product.url = "http://dcgrendel.be/vmbuilder/"
+
+guestOS = "linux"
+numvcpus = "1"
+memsize = "256"
+paevm = "FALSE"
+sched.mem.pshare.enable = "TRUE"
+MemAllowAutoScaleDown = "FALSE"
+
+MemTrimRate = "-1"
+
+nvram = "nvram"
+
+mks.enable3d = "FALSE"
+vmmouse.present = "TRUE"
+
+tools.syncTime = "TRUE"
+tools.remindinstall = "FALSE"
+
+isolation.tools.hgfs.disable = "FALSE"
+isolation.tools.dnd.disable = "FALSE"
+isolation.tools.copy.enable = "TRUE"
+isolation.tools.paste.enabled = "TRUE"
+gui.restricted = "FALSE"
+
+ethernet0.present = "TRUE"
+ethernet0.connectionType = "bridged"
+ethernet0.addressType = "generated"
+ethernet0.generatedAddress = "00:0c:29:7e:06:58"
+ethernet0.generatedAddressOffset = "0"
+
+usb.present = "TRUE"
+usb.generic.autoconnect = "FALSE"
+
+sound.present = "TRUE"
+sound.virtualdev = "es1371"
+
+ide0:0.present = "TRUE"
+ide0:0.fileName = "buildroot.vmdk"
+ide0:0.deviceType = "disk"
+ide0:0.mode = ""
+ide0:0.redo = ""
+ide0:0.writeThrough = "FALSE"
+ide0:0.startConnected = "TRUE"
+
+ide1:0.present = "TRUE"
+ide1:0.fileName = ""
+ide1:0.deviceType = "disk"
+ide1:0.mode = ""
+ide1:0.redo = ""
+ide1:0.writeThrough = "FALSE"
+ide1:0.startConnected = "FALSE"
+
+floppy0.present = "FALSE"
+
+serial0.present = "FALSE"
+
+serial1.present = "FALSE"
+
+parallel0.present = "FALSE"
+
+EOF
+
+# Install GRUB
+     /sbin/grub --no-floppy --batch <<EOT 
+     device (hd0) ${IMAGE}
+     geometry (hd0) ${CYLINDERS} 16 63
+     root (hd0,0)
+     setup (hd0)
+     quit
+     EOT


Property changes on: trunk/buildroot/scripts/build-ext3-img
___________________________________________________________________
Name: svn:executable
   + *

Added: trunk/buildroot/scripts/create_ipkgs
===================================================================
--- trunk/buildroot/scripts/create_ipkgs	                        (rev 0)
+++ trunk/buildroot/scripts/create_ipkgs	2008-03-06 17:52:37 UTC (rev 21176)
@@ -0,0 +1,82 @@
+#!/bin/sh
+
+# this script is very *alpha* so be gentle...
+
+# change these lines to your arch and maintainer name
+ARCH="avr32"
+PACK_MAINTAINER="John Voltz <john.voltz@gmail.com>"
+
+BUILDROOT_DIR=`pwd`
+
+echo "Creating ipkgs from your build directory..."
+echo "Please be patient, as this can take a long time.
+			"
+
+# create the ipkg directories
+mkdir -p ${BUILDROOT_DIR}/ipkg-temp
+mkdir -p ${BUILDROOT_DIR}/ipkg-out
+
+for PACKAGE in `ls -d ./build_*/*`; do
+	
+	# extract some info
+	NAME_WITHOUT_VER=${PACKAGE%-*}
+	VERSION=${PACKAGE#${NAME_WITHOUT_VER}-}
+	NAME_WITHOUT_DIR=${NAME_WITHOUT_VER#*/*/}
+	CLEAN_NAME=${NAME_WITHOUT_DIR//_/-}
+
+	# clean out the temp directory
+	rm -rf ${BUILDROOT_DIR}/ipkg-temp/*
+
+	# install the package to temp directory
+	cd ${PACKAGE}
+	echo "Installing ${NAME_WITHOUT_DIR} to ./ipkg-temp"
+	make DESTDIR=${BUILDROOT_DIR}/ipkg-temp DSTROOT=${BUILDROOT_DIR}/ipkg-temp install &> /dev/null 
+
+	# create the control file
+	cd ${BUILDROOT_DIR}
+	mkdir ${BUILDROOT_DIR}/ipkg-temp/CONTROL
+
+	# find it's corresponding buildroot package directory 
+	PACK_NAME=`find ./package -path './package/config' -prune -o -name ${NAME_WITHOUT_DIR}`
+	PACK_NAME=${PACK_NAME%./package/config}
+	PACK_NAME=${PACK_NAME#./package/config}
+	PACK_NAME=`echo -n ${PACK_NAME}`
+
+	# there must be an better way to extract the description and 
+	# dependencies from the Config.in and *.mk file. 
+	# Haven't figured it out just yet.
+	CONF_FILE=`cat ${PACK_NAME}/Config.in`
+	#MAKE_FILE=`cat ${PACK_NAME}/*.mk`
+	HELP_STR=${CONF_FILE#*help}
+	HELP_STR=${HELP_STR%%comment*}
+	HELP_STR=${HELP_STR%%choice*}
+	HELP_STR=${HELP_STR%%depends*}
+	HELP_STR=${HELP_STR%%http*}
+	HELP_STR=`echo -n ${HELP_STR}`
+
+	echo ${HELP_STR}
+
+	if [ "${PACK_NAME}" != "" ]; then
+		echo "Creating ipkg of: ${PACKAGE}"
+
+cat > ${BUILDROOT_DIR}/ipkg-temp/CONTROL/control <<EOF
+Package: ${CLEAN_NAME}
+Priority: optional
+Version: ${VERSION}
+Architecture: ${ARCH}
+Maintainer: ${PACK_MAINTAINER}
+Depends: uclibc
+Description: ${HELP_STR}
+EOF
+
+		# build the package
+		package/ipkg/ipkg-build ${BUILDROOT_DIR}/ipkg-temp ${BUILDROOT_DIR}/ipkg-out
+
+	fi
+
+	echo "Complete.
+					"
+
+done
+
+echo "ipkg builds are finished."


Property changes on: trunk/buildroot/scripts/create_ipkgs
___________________________________________________________________
Name: svn:executable
   + *
