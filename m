From: Robert J. Heywood <robert.heywood@codethink.co.uk>
Date: Tue, 29 Jan 2019 13:23:02 +0000
Subject: [Buildroot] [PATCH 1/8] board/raspberrypi: Unify the genimage
 config files
In-Reply-To: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
References: <20190129132309.3455-1-robert.heywood@codethink.co.uk>
Message-ID: <20190129132309.3455-2-robert.heywood@codethink.co.uk>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a new genimage config file containing all the common elements.
The config file contains a marker which post-image.sh replaces with
files defined in the board-specific .conf files.

Since I've substantially edited the way the post-image script works,
I've added myself to the developers file for board/raspberrypi

Signed-off-by: Robert J. Heywood <robert.heywood@codethink.co.uk>
---
 DEVELOPERS                                         |  3 ++
 ...rrypi2.cfg => genimage-raspberrypi-generic.cfg} |  3 +-
 board/raspberrypi/genimage-raspberrypi.cfg         | 32 ---------------------
 board/raspberrypi/genimage-raspberrypi0.cfg        | 30 --------------------
 board/raspberrypi/genimage-raspberrypi0w.cfg       | 31 --------------------
 board/raspberrypi/genimage-raspberrypi3-64.cfg     | 32 ---------------------
 board/raspberrypi/genimage-raspberrypi3.cfg        | 33 ----------------------
 board/raspberrypi/post-image.sh                    | 17 +++++++++--
 board/raspberrypi/raspberrypi.conf                 |  6 ++++
 board/raspberrypi/raspberrypi0.conf                |  4 +++
 board/raspberrypi/raspberrypi0w.conf               |  5 ++++
 board/raspberrypi/raspberrypi2.conf                |  4 +++
 board/raspberrypi/raspberrypi3-64.conf             |  6 ++++
 board/raspberrypi/raspberrypi3.conf                |  7 +++++
 14 files changed, 51 insertions(+), 162 deletions(-)
 rename board/raspberrypi/{genimage-raspberrypi2.cfg => genimage-raspberrypi-generic.cfg} (90%)
 delete mode 100644 board/raspberrypi/genimage-raspberrypi.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi3.cfg
 create mode 100644 board/raspberrypi/raspberrypi.conf
 create mode 100644 board/raspberrypi/raspberrypi0.conf
 create mode 100644 board/raspberrypi/raspberrypi0w.conf
 create mode 100644 board/raspberrypi/raspberrypi2.conf
 create mode 100644 board/raspberrypi/raspberrypi3-64.conf
 create mode 100644 board/raspberrypi/raspberrypi3.conf

diff --git a/DEVELOPERS b/DEVELOPERS
index c1950bb0f4..833adf8747 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -1820,6 +1820,9 @@ F:	package/subversion/
 N:	RJ Ascani <rj.ascani@gmail.com>
 F:	package/azmq/
 
+N:	Robert Heywood <robert.heywood@codethink.co.uk>
+F:	board/raspberrypi/
+
 N:	Robert Rose <robertroyrose@gmail.com>
 F:	package/grpc/
 
diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi-generic.cfg
similarity index 90%
rename from board/raspberrypi/genimage-raspberrypi2.cfg
rename to board/raspberrypi/genimage-raspberrypi-generic.cfg
index a3be2a3442..8bdd553a34 100644
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ b/board/raspberrypi/genimage-raspberrypi-generic.cfg
@@ -1,13 +1,12 @@
 image boot.vfat {
   vfat {
     files = {
-      "bcm2709-rpi-2-b.dtb",
       "rpi-firmware/bootcode.bin",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
       "rpi-firmware/fixup.dat",
       "rpi-firmware/start.elf",
-      "zImage"
+      {BOOT_FILES}
     }
   }
   size = 32M
diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
deleted file mode 100644
index bd5166a0f3..0000000000
--- a/board/raspberrypi/genimage-raspberrypi.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-  vfat {
-    files = {
-      "bcm2708-rpi-b.dtb",
-      "bcm2708-rpi-b-plus.dtb",
-      "bcm2708-rpi-cm.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "zImage"
-    }
-  }
-  size = 32M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
deleted file mode 100644
index a9d4c4501f..0000000000
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ /dev/null
@@ -1,30 +0,0 @@
-image boot.vfat {
-  vfat {
-    files = {
-      "bcm2708-rpi-b-plus.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "zImage"
-    }
-  }
-  size = 32M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
deleted file mode 100644
index 3aafd9b6fc..0000000000
--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-  vfat {
-    files = {
-      "bcm2708-rpi-0-w.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "rpi-firmware/overlays",
-      "zImage"
-    }
-  }
-  size = 32M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
deleted file mode 100644
index 0d0ca750a7..0000000000
--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-  vfat {
-    files = {
-      "bcm2710-rpi-3-b.dtb",
-      "bcm2710-rpi-3-b-plus.dtb",
-      "bcm2837-rpi-3-b.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "Image"
-    }
-  }
-  size = 32M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
deleted file mode 100644
index 0a547241f4..0000000000
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ /dev/null
@@ -1,33 +0,0 @@
-image boot.vfat {
-  vfat {
-    files = {
-      "bcm2710-rpi-3-b.dtb",
-      "bcm2710-rpi-3-b-plus.dtb",
-      "bcm2710-rpi-cm3.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "rpi-firmware/overlays",
-      "zImage"
-    }
-  }
-  size = 32M
-}
-
-image sdcard.img {
-  hdimage {
-  }
-
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
-
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
-}
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index 70447cd48b..4042c5e9ac 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -4,9 +4,14 @@ set -e
 
 BOARD_DIR="$(dirname $0)"
 BOARD_NAME="$(basename ${BOARD_DIR})"
-GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
+GENIMAGE_CFG="${BOARD_DIR}/genimage-raspberrypi-generic.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
+if [ -e ${BOARD_DIR}/${BOARD_NAME}.conf ]
+then
+	. ${BOARD_DIR}/${BOARD_NAME}.conf
+fi
+
 for arg in "$@"
 do
 	case "${arg}" in
@@ -49,6 +54,14 @@ __EOF__
 
 done
 
+for i in ${!FILES[*]}
+do
+	FILES[$i]="\"${FILES[$i]}\","
+done
+SEDCMD_BOOTFILES=" -e 's/{BOOT_FILES}/${FILES[*]}/' "
+
+eval "sed ${SEDCMD_BOOTFILES} ${GENIMAGE_CFG}" > ${BUILD_DIR}/genimage.cfg
+
 rm -rf "${GENIMAGE_TMP}"
 
 genimage                           \
@@ -56,6 +69,6 @@ genimage                           \
 	--tmppath "${GENIMAGE_TMP}"    \
 	--inputpath "${BINARIES_DIR}"  \
 	--outputpath "${BINARIES_DIR}" \
-	--config "${GENIMAGE_CFG}"
+	--config "${BUILD_DIR}/genimage.cfg"
 
 exit $?
diff --git a/board/raspberrypi/raspberrypi.conf b/board/raspberrypi/raspberrypi.conf
new file mode 100644
index 0000000000..962cf726e2
--- /dev/null
+++ b/board/raspberrypi/raspberrypi.conf
@@ -0,0 +1,6 @@
+FILES=(
+	"bcm2708-rpi-b.dtb"
+	"bcm2708-rpi-b-plus.dtb"
+	"bcm2708-rpi-cm.dtb"
+	"zImage"
+)
diff --git a/board/raspberrypi/raspberrypi0.conf b/board/raspberrypi/raspberrypi0.conf
new file mode 100644
index 0000000000..132540b543
--- /dev/null
+++ b/board/raspberrypi/raspberrypi0.conf
@@ -0,0 +1,4 @@
+FILES=(
+	"bcm2708-rpi-b-plus.dtb"
+	"zImage"
+)
diff --git a/board/raspberrypi/raspberrypi0w.conf b/board/raspberrypi/raspberrypi0w.conf
new file mode 100644
index 0000000000..1ae60ed8fb
--- /dev/null
+++ b/board/raspberrypi/raspberrypi0w.conf
@@ -0,0 +1,5 @@
+FILES=(
+	"bcm2708-rpi-0-w.dtb"
+	"rpi-firmware/overlays"
+	"zImage"
+)
diff --git a/board/raspberrypi/raspberrypi2.conf b/board/raspberrypi/raspberrypi2.conf
new file mode 100644
index 0000000000..ea7d2402a6
--- /dev/null
+++ b/board/raspberrypi/raspberrypi2.conf
@@ -0,0 +1,4 @@
+FILES=(
+	"bcm2709-rpi-2-b.dtb"
+	"zImage"
+)
diff --git a/board/raspberrypi/raspberrypi3-64.conf b/board/raspberrypi/raspberrypi3-64.conf
new file mode 100644
index 0000000000..11cb88e191
--- /dev/null
+++ b/board/raspberrypi/raspberrypi3-64.conf
@@ -0,0 +1,6 @@
+FILES=(
+	"bcm2710-rpi-3-b.dtb"
+	"bcm2710-rpi-3-b-plus.dtb"
+	"bcm2837-rpi-3-b.dtb"
+	"Image"
+)
diff --git a/board/raspberrypi/raspberrypi3.conf b/board/raspberrypi/raspberrypi3.conf
new file mode 100644
index 0000000000..b3c5466fc2
--- /dev/null
+++ b/board/raspberrypi/raspberrypi3.conf
@@ -0,0 +1,7 @@
+FILES=(
+	"bcm2710-rpi-3-b.dtb"
+	"bcm2710-rpi-3-b-plus.dtb"
+	"bcm2710-rpi-cm3.dtb"
+	"rpi-firmware/overlays"
+	"zImage"
+)
-- 
2.11.0
