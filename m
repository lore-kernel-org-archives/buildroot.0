From: ninevoltz at uclibc.org <ninevoltz@uclibc.org>
Date: Thu,  1 May 2008 08:21:47 -0700 (PDT)
Subject: [Buildroot] svn commit: trunk/buildroot/scripts
Message-ID: <20080501152147.5E3C73C667@busybox.net>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Author: ninevoltz
Date: 2008-05-01 08:21:47 -0700 (Thu, 01 May 2008)
New Revision: 21908

Log:
some enhancements to the build-ext3-img script

Modified:
   trunk/buildroot/scripts/build-ext3-img


Changeset:
Modified: trunk/buildroot/scripts/build-ext3-img
===================================================================
--- trunk/buildroot/scripts/build-ext3-img	2008-05-01 14:11:30 UTC (rev 21907)
+++ trunk/buildroot/scripts/build-ext3-img	2008-05-01 15:21:47 UTC (rev 21908)
@@ -21,8 +21,8 @@
 
 IMAGE=${IMAGE_PATH}/${IMAGE_NAME}
 
-echo "Enter the path to the root filesystem that you want"
-echo "to install to the image"
+echo "Enter the path and filename for the root filesystem"
+echo "tarball that you want to install into the image"
 read ROOT_PATH
 
 if [ "${ROOT_PATH}" = "" ]; then
@@ -36,7 +36,7 @@
 CYLINDERS=${CYLINDERS%${ROOT_PATH}}
 BYTE_SIZE=${BYTE_SIZE%${ROOT_PATH}}
 
-CYLINDERS=`expr ${CYLINDERS} "+" 2`
+CYLINDERS=`expr ${CYLINDERS} "*" 2`
 
 echo "Now I will create an ext3 image file"
 echo "using ${CYLINDERS} cylinders, with ${BLOCKSIZE} bytes per block"
@@ -60,7 +60,7 @@
 # Install Software to the image
 	mkdir -p ${IMAGE_PATH}/temp
     mount -o offset=32256,loop ${IMAGE} ${IMAGE_PATH}/temp
-    cp -a ${ROOT_PATH}/* ${IMAGE_PATH}/temp
+    tar -xvf ${ROOT_PATH} --directory ${IMAGE_PATH}/temp
     # make sure to unmount the image
     umount ${IMAGE_PATH}/temp
 	rm -rf ${IMAGE_PATH}/temp
@@ -124,7 +124,7 @@
 ide0:0.writeThrough = "FALSE"
 ide0:0.startConnected = "TRUE"
 
-ide1:0.present = "TRUE"
+ide1:0.present = "FALSE"
 ide1:0.fileName = ""
 ide1:0.deviceType = "disk"
 ide1:0.mode = ""
