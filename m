From: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
Date: Tue, 17 Mar 2015 18:51:56 -0400
Subject: [Buildroot] [PATCH 2/5] board/raspberrypi: install Device Tree
In-Reply-To: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
References: <1426632719-4807-1-git-send-email-vivien.didelot@savoirfairelinux.com>
Message-ID: <1426632719-4807-3-git-send-email-vivien.didelot@savoirfairelinux.com>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

Add a post-image script to Raspberry Pi configs with a Device Tree
(raspberrypi_dt and raspberrypi2), which calls the mkknlimg tool on the
resulting zImage kernel, in order to install the Device Tree as
described in the board readme file.

Signed-off-by: Vivien Didelot <vivien.didelot@savoirfairelinux.com>
---
 board/raspberrypi/post-image.sh  | 7 +++++++
 configs/raspberrypi2_defconfig   | 1 +
 configs/raspberrypi_dt_defconfig | 1 +
 3 files changed, 9 insertions(+)
 create mode 100755 board/raspberrypi/post-image.sh

diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
new file mode 100755
index 0000000..0d6f265
--- /dev/null
+++ b/board/raspberrypi/post-image.sh
@@ -0,0 +1,7 @@
+#!/bin/bash
+
+set -e
+
+# Call mkknlimg to install the Device Tree
+"${HOST_DIR}/usr/bin/mkknlimg" "${BINARIES_DIR}/zImage" "${BINARIES_DIR}/zImage-dt"
+mv "${BINARIES_DIR}/zImage-dt" "${BINARIES_DIR}/zImage"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index b523a4a..3543307 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -23,3 +23,4 @@ BR2_LINUX_KERNEL_ZIMAGE=y
 # Install the DTB files, as the RPi2 uses the Device Tree
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
diff --git a/configs/raspberrypi_dt_defconfig b/configs/raspberrypi_dt_defconfig
index ca62084..0c203bf 100644
--- a/configs/raspberrypi_dt_defconfig
+++ b/configs/raspberrypi_dt_defconfig
@@ -20,3 +20,4 @@ BR2_LINUX_KERNEL_ZIMAGE=y
 # Install the DTB files
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS=y
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
-- 
2.3.3
