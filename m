Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96300C433EF
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:15:59 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3309960FDC
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 20:15:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3309960FDC
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=free.fr
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 044A240160;
	Sun, 17 Oct 2021 20:15:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WloMJT2b3XCM; Sun, 17 Oct 2021 20:15:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2563D4017C;
	Sun, 17 Oct 2021 20:15:56 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 5F3ED1BF976
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5C223606DA
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 20:15:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id INKNlkx0s8uh for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 20:15:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7A15F605D6
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 20:15:18 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 7218D8251A; Sun, 17 Oct 2021 20:12:16 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 22:11:41 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e11c3cbe26a945497524aba7dade42bd1efbadd0
X-Git-Newrev: 689b9ac439ab7b507c8982b6102bddf59d03efbf
X-Patchwork-Hint: ignore
Message-Id: <20211017201216.7218D8251A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rpi-firmware: rework boot/config
 file handling
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=689b9ac439ab7b507c8982b6102bddf59d03efbf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Try to be less smart (focused on the one target/one use-case),
instead reduce the rpi-firmware package to a selectable list
of (verbatim) installed firmware files.

- change rpi-firmware config handling from rpi-variant/rpi-flavour
  choices to bootcode.bin, pi-default/-extended/-cut-down and
  pi4-/default/-extended/-cut-down selection

- add BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE option to select installable
  config.txt file

- remove config.txt modify code/handling from raspberry post-image.sh
  script

- add different customized config.txt files to the raspberry board
  section

- change dtoverlay krnbt from 'dtoverlay=miniuart-bt,krnbt=on' to extra line
  with explanation comment

- change raspberry defconfigs to select appropiate rpi-firmware
  and config.txt files

- change genimage-raspberrypi4.cfg/genimage-raspberrypi4-64.cfg to
  use start4.elf and fixup4.dat

- update board/raspberrypi/readme.txt (add optional files fixup4.dat,
  start4.elf and zImage)

With this changes a better support for custom use-cases should
be possible, specially multi-target SD cards as suggested by
Stefan Agner ([1]).

[1] http://lists.busybox.net/pipermail/buildroot/2021-February/303318.html

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
[yann.morin.1998@free.fr: fix case of no config.txt provided]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 .../config.txt => board/raspberrypi/config_0w.txt  | 10 ++-
 .../config.txt => board/raspberrypi/config_3.txt   | 10 ++-
 .../raspberrypi/config_3_64bit.txt                 | 15 +++--
 .../raspberrypi/config_3_qt5we.txt                 |  9 +--
 .../config.txt => board/raspberrypi/config_4.txt   | 14 ++--
 .../raspberrypi/config_4_64bit.txt                 | 23 +++++--
 .../raspberrypi/config_cm4io.txt                   | 11 +--
 .../raspberrypi/config_cm4io_64bit.txt             | 17 +++--
 .../raspberrypi/config_default.txt                 |  4 +-
 board/raspberrypi/genimage-raspberrypi4-64.cfg     |  4 +-
 board/raspberrypi/genimage-raspberrypi4.cfg        |  4 +-
 board/raspberrypi/genimage-raspberrypicm4io-64.cfg |  4 +-
 board/raspberrypi/genimage-raspberrypicm4io.cfg    |  4 +-
 board/raspberrypi/post-image.sh                    | 33 ---------
 board/raspberrypi/readme.txt                       |  9 ++-
 configs/raspberrypi0_defconfig                     |  3 +
 configs/raspberrypi0w_defconfig                    |  4 +-
 configs/raspberrypi2_defconfig                     |  3 +
 configs/raspberrypi3_64_defconfig                  |  4 +-
 configs/raspberrypi3_defconfig                     |  4 +-
 configs/raspberrypi3_qt5we_defconfig               |  4 +-
 configs/raspberrypi4_64_defconfig                  |  2 +-
 configs/raspberrypi4_defconfig                     |  2 +-
 configs/raspberrypi_defconfig                      |  3 +
 configs/raspberrypicm4io_64_defconfig              |  2 +-
 configs/raspberrypicm4io_defconfig                 |  2 +-
 package/rpi-firmware/Config.in                     | 78 ++++++++++------------
 package/rpi-firmware/rpi-firmware.mk               | 36 +++++++---
 28 files changed, 172 insertions(+), 146 deletions(-)

diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_0w.txt
similarity index 71%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_0w.txt
index 4a92a4dd95..195bad449e 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_0w.txt
@@ -1,11 +1,9 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
@@ -23,3 +21,9 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_3.txt
similarity index 71%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_3.txt
index 4a92a4dd95..195bad449e 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_3.txt
@@ -1,11 +1,9 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
@@ -23,3 +21,9 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_3_64bit.txt
similarity index 67%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_3_64bit.txt
index 4a92a4dd95..34412fa9e8 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_3_64bit.txt
@@ -1,15 +1,13 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
-kernel=zImage
+kernel=Image
 
 # To use an external initramfs file
 #initramfs rootfs.cpio.gz
@@ -23,3 +21,12 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
+
+# enable 64bits support
+arm_64bit=1
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_3_qt5we.txt
similarity index 76%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_3_qt5we.txt
index 4a92a4dd95..752310b179 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_3_qt5we.txt
@@ -1,11 +1,9 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
@@ -22,4 +20,7 @@ disable_overscan=1
 # 256, 512 or 1024 MB total memory
 gpu_mem_256=100
 gpu_mem_512=100
-gpu_mem_1024=100
+gpu_mem_1024=200
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_4.txt
similarity index 67%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_4.txt
index 4a92a4dd95..ea02d3f071 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_4.txt
@@ -1,13 +1,11 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
-start_file=start.elf
-fixup_file=fixup.dat
+start_file=start4.elf
+fixup_file=fixup4.dat
 
 kernel=zImage
 
@@ -23,3 +21,9 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_4_64bit.txt
similarity index 59%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_4_64bit.txt
index 4a92a4dd95..41c7e97e99 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_4_64bit.txt
@@ -1,15 +1,13 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
-start_file=start.elf
-fixup_file=fixup.dat
+start_file=start4.elf
+fixup_file=fixup4.dat
 
-kernel=zImage
+kernel=Image
 
 # To use an external initramfs file
 #initramfs rootfs.cpio.gz
@@ -23,3 +21,16 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable autoprobing of Bluetooth driver without need of hciattach/btattach
+dtoverlay=krnbt=on
+
+dtoverlay=vc4-kms-v3d-pi4
+dtoverlay=imx219
+#dtoverlay=ov5647
+
+# enable 64bits support
+arm_64bit=1
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_cm4io.txt
similarity index 74%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_cm4io.txt
index 4a92a4dd95..01f60395b3 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_cm4io.txt
@@ -1,13 +1,11 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
-start_file=start.elf
-fixup_file=fixup.dat
+start_file=start4.elf
+fixup_file=fixup4.dat
 
 kernel=zImage
 
@@ -23,3 +21,6 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_cm4io_64bit.txt
similarity index 70%
copy from package/rpi-firmware/config.txt
copy to board/raspberrypi/config_cm4io_64bit.txt
index 4a92a4dd95..6cd8a729cd 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_cm4io_64bit.txt
@@ -1,15 +1,13 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
-start_file=start.elf
-fixup_file=fixup.dat
+start_file=start4.elf
+fixup_file=fixup4.dat
 
-kernel=zImage
+kernel=Image
 
 # To use an external initramfs file
 #initramfs rootfs.cpio.gz
@@ -23,3 +21,10 @@ disable_overscan=1
 gpu_mem_256=100
 gpu_mem_512=100
 gpu_mem_1024=100
+
+# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
+dtoverlay=miniuart-bt
+
+# enable 64bits support
+arm_64bit=1
+
diff --git a/package/rpi-firmware/config.txt b/board/raspberrypi/config_default.txt
similarity index 79%
rename from package/rpi-firmware/config.txt
rename to board/raspberrypi/config_default.txt
index 4a92a4dd95..c09ecca1a9 100644
--- a/package/rpi-firmware/config.txt
+++ b/board/raspberrypi/config_default.txt
@@ -1,11 +1,9 @@
 # Please note that this is only a sample, we recommend you to change it to fit
 # your needs.
-# You should override this file using a post-build script.
+# You should override this file using BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE.
 # See http://buildroot.org/manual.html#rootfs-custom
 # and http://elinux.org/RPiconfig for a description of config.txt syntax
 
-# We always use the same names, the real used variant is selected by
-# BR2_PACKAGE_RPI_FIRMWARE_{DEFAULT,X,CD} choice
 start_file=start.elf
 fixup_file=fixup.dat
 
diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
index 854e0c7e31..3c480e98f0 100644
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4-64.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "Image"
     }
diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
index 60e1f23bcc..4e4742f3ef 100644
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-4-b.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "zImage"
     }
diff --git a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
index 32a7ca897d..63806d0c31 100644
--- a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-cm4.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "Image"
     }
diff --git a/board/raspberrypi/genimage-raspberrypicm4io.cfg b/board/raspberrypi/genimage-raspberrypicm4io.cfg
index 5a42bcfbb4..3ee9bf551a 100644
--- a/board/raspberrypi/genimage-raspberrypicm4io.cfg
+++ b/board/raspberrypi/genimage-raspberrypicm4io.cfg
@@ -4,8 +4,8 @@ image boot.vfat {
       "bcm2711-rpi-cm4.dtb",
       "rpi-firmware/cmdline.txt",
       "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
+      "rpi-firmware/fixup4.dat",
+      "rpi-firmware/start4.elf",
       "rpi-firmware/overlays",
       "zImage"
     }
diff --git a/board/raspberrypi/post-image.sh b/board/raspberrypi/post-image.sh
index a6728c686e..6cad20fb9e 100755
--- a/board/raspberrypi/post-image.sh
+++ b/board/raspberrypi/post-image.sh
@@ -7,39 +7,6 @@ BOARD_NAME="$(basename ${BOARD_DIR})"
 GENIMAGE_CFG="${BOARD_DIR}/genimage-${BOARD_NAME}.cfg"
 GENIMAGE_TMP="${BUILD_DIR}/genimage.tmp"
 
-for arg in "$@"
-do
-	case "${arg}" in
-		--add-miniuart-bt-overlay)
-		if ! grep -qE '^dtoverlay=' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			echo "Adding 'dtoverlay=miniuart-bt' to config.txt (fixes ttyAMA0 serial console)."
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# fixes rpi (3B, 3B+, 3A+, 4B and Zero W) ttyAMA0 serial console
-dtoverlay=miniuart-bt,krnbt=on
-__EOF__
-		fi
-		;;
-		--aarch64)
-		# Run a 64bits kernel (armv8)
-		sed -e '/^kernel=/s,=.*,=Image,' -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		if ! grep -qE '^arm_64bit=1' "${BINARIES_DIR}/rpi-firmware/config.txt"; then
-			cat << __EOF__ >> "${BINARIES_DIR}/rpi-firmware/config.txt"
-
-# enable 64bits support
-arm_64bit=1
-__EOF__
-		fi
-		;;
-		--gpu_mem_256=*|--gpu_mem_512=*|--gpu_mem_1024=*)
-		# Set GPU memory
-		gpu_mem="${arg:2}"
-		sed -e "/^${gpu_mem%=*}=/s,=.*,=${gpu_mem##*=}," -i "${BINARIES_DIR}/rpi-firmware/config.txt"
-		;;
-	esac
-
-done
-
 # Pass an empty rootpath. genimage makes a full copy of the given rootpath to
 # ${GENIMAGE_TMP}/root so passing TARGET_DIR would be a waste of time and disk
 # space. We don't rely on genimage to build the rootfs image, just to insert a
diff --git a/board/raspberrypi/readme.txt b/board/raspberrypi/readme.txt
index 62cb248633..98c44d80a1 100644
--- a/board/raspberrypi/readme.txt
+++ b/board/raspberrypi/readme.txt
@@ -87,11 +87,14 @@ After building, you should obtain this tree:
     |   +-- bootcode.bin
     |   +-- cmdline.txt
     |   +-- config.txt
-    |   +-- fixup.dat
-    |   +-- start.elf
+    |   +-- fixup.dat               [1]
+    |   +-- fixup4.dat              [1]
+    |   +-- start.elf               [1]
+    |   +-- start4.elf              [1]
     |   `-- overlays/               [2]
     +-- sdcard.img
-    `-- zImage
+    +-- Image                       [1]
+    `-- zImage                      [1]
 
 [1] Not all of them will be present, depending on the RaspberryPi
     model you are using.
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index ffe4037db0..d309ae75e8 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -20,6 +20,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi0/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index 1413c275b1..caa663d233 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -16,6 +16,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-zero-w"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi0w/config_0w.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -29,4 +32,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 180dc84c41..29ff2f793c 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -22,6 +22,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2709-rpi-2-b"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index da43f2416e..61cc2346cb 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3-64/config_3_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,4 +37,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--aarch64 --add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 48db2e4941..e6fcc067d0 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2710-rpi-3-b bcm2710-rpi-3-b-plus bcm2710-r
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -34,4 +37,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 051b384314..4858203e6a 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -31,6 +31,9 @@ BR2_PACKAGE_QT5BASE_PNG=y
 BR2_PACKAGE_QT5WEBENGINE=y
 BR2_PACKAGE_QT5WEBENGINE_PROPRIETARY_CODECS=y
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi3/config_3_qt5we.txt"
 BR2_PACKAGE_RPI_USERLAND=y
 BR2_PACKAGE_CA_CERTIFICATES=y
 BR2_PACKAGE_NTP=y
@@ -48,4 +51,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="400M"
 BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_EUDEV=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --gpu_mem_1024=200"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index d8d330ac25..53ba3e6486 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4-64/config_4_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -35,4 +36,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 04d13ef7db..424e3193fb 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi4/config_4.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -35,4 +36,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index dd51758912..31543afa4f 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -21,6 +21,9 @@ BR2_LINUX_KERNEL_INTREE_DTS_NAME="bcm2708-rpi-b bcm2708-rpi-b-plus bcm2708-rpi-c
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
+BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN=y
+BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypi/config_default.txt"
 # BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTB_OVERLAYS is not set
 
 # Required tools to create the SD image
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 7b21bd1294..c098099ee2 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io_64bit.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -38,4 +39,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay --aarch64"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index 0480462f41..11dc4cdfdb 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -22,6 +22,7 @@ BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 BR2_PACKAGE_RPI_FIRMWARE=y
 BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4=y
+BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE="board/raspberrypicm4io-64/config_cm4io.txt"
 
 # Required tools to create the SD image
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
@@ -38,4 +39,3 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 # BR2_TARGET_ROOTFS_TAR is not set
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
-BR2_ROOTFS_POST_SCRIPT_ARGS="--add-miniuart-bt-overlay"
diff --git a/package/rpi-firmware/Config.in b/package/rpi-firmware/Config.in
index f5a25c5680..9e401829c6 100644
--- a/package/rpi-firmware/Config.in
+++ b/package/rpi-firmware/Config.in
@@ -11,63 +11,53 @@ config BR2_PACKAGE_RPI_FIRMWARE
 
 if BR2_PACKAGE_RPI_FIRMWARE
 
-choice
-	bool "rpi variant"
+config BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN
+	bool "rpi 0/1/2/3 bootcode.bin"
 	help
-	  The Raspberry Pi 4 introduced a slightly different naming
-	  convention and set of boot files. This option controls which
-	  format to use.
+	  The bootcode.bin for versions Zero/1/2/3 (not needed on rpi4,
+	  because it has been replaced by boot code in the onboard
+	  EEPROM).
 
 config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	bool "rpi 0/1/2/3"
+	bool "rpi 0/1/2/3 (default)"
 	help
-	  The default set of files, for versions pre-4
+	  The default set of files for versions Zero/1/2/3.
 
-config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	bool "rpi 4"
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X
+	bool "rpi 0/1/2/3 (extended)"
 	help
-	  The Raspberry Pi 4 files
-endchoice
+	  The extended set of files for versions Zero/1/2/3 (additional
+	  GPU features, eg. more audio/video codecs).
 
-choice
-	bool "Firmware to boot"
-	default BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD
+	bool "rpi 0/1/2/3 (cut-down)"
 	help
-	  There are three different firmware files:
-	    - the default firmware, that enables standard GPU
-	      features;
-	    - the extended firmware, that enables additional GPU
-	      features (eg. more audio/video codecs);
-	    - the cut-down firmware, for emergency situations, with
-	      only features required to boot a Linux kernel.
-
-config BR2_PACKAGE_RPI_FIRMWARE_DEFAULT
-	bool "default"
+	  The cut-down set of files for versions Zero/1/2/3 (only
+	  features required to boot a Linux kernel).
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	bool "rpi 4 (default)"
+	help
+	  The default set of files for versions 4 (standard GPU
+	  features).
+
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X
+	bool "rpi 4 (extended)"
 	help
-	  The default firmware, that enables standard GPU features.
+	  The extended set of files for versions 4 (additional GPU
+	  features, eg. more audio/video codecs).
 
-config BR2_PACKAGE_RPI_FIRMWARE_X
-	bool "extended ('x', more codecs)"
+config BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD
+	bool "rpi 4 (cut-down)"
 	help
-	  The extended firmware, that enables additional GPU features
-	  (eg. more audio/video codecs).
+	  The cut-down set of files for versions 4 (only features
+	  required to boot a Linux kernel).
 
-config BR2_PACKAGE_RPI_FIRMWARE_CD
-	bool "cut-down ('cd', emergency)"
+config BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE
+	string "Path to a file stored as boot/config.txt"
 	help
-	  The cut-down firmware, for emergency situations, with only
-	  features required to boot a Linux kernel.
-
-endchoice
-
-config BR2_PACKAGE_RPI_FIRMWARE_BOOT
-	string
-	default ""      if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4"     if BR2_PACKAGE_RPI_FIRMWARE_DEFAULT && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	default "_x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4x"    if BR2_PACKAGE_RPI_FIRMWARE_X && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
-	default "_cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI
-	default "4cd"   if BR2_PACKAGE_RPI_FIRMWARE_CD && BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4
+	  Path to a file stored as config.txt in the boot partiton
+	  of the generated SD card image.
 
 config BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS
 	bool "Install Device Tree Blobs (DTBs)"
diff --git a/package/rpi-firmware/rpi-firmware.mk b/package/rpi-firmware/rpi-firmware.mk
index d74f7155c7..84b8cd735a 100644
--- a/package/rpi-firmware/rpi-firmware.mk
+++ b/package/rpi-firmware/rpi-firmware.mk
@@ -10,6 +10,29 @@ RPI_FIRMWARE_LICENSE = BSD-3-Clause
 RPI_FIRMWARE_LICENSE_FILES = boot/LICENCE.broadcom
 RPI_FIRMWARE_INSTALL_IMAGES = YES
 
+RPI_FIRMWARE_FILES = \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_BOOTCODE_BIN), bootcode.bin) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI), start.elf fixup.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_X), startx.elf fixupx.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI_CD), start_cd.elf fixup_cd.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4), start4.elf fixup4.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_X), start4x.elf fixup4x.dat) \
+	$(if $(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI4_CD), start4cd.elf fixup4cd.dat)
+
+define RPI_FIRMWARE_INSTALL_BIN
+	$(foreach f,$(RPI_FIRMWARE_FILES), \
+		$(INSTALL) -D -m 0644 $(@D)/boot/$(f) $(BINARIES_DIR)/rpi-firmware/$(f)
+	)
+endef
+
+RPI_FIRMWARE_CONFIG_FILE = $(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CONFIG_FILE))
+ifneq ($(PACKAGE_RPI_FIRMWARE_CONFIG_FILE),)
+define RPI_FIRMWARE_INSTALL_CONFIG
+	$(INSTALL) -D -m 0644 $(PACKAGE_RPI_FIRMWARE_CONFIG_FILE) \
+		$(BINARIES_DIR)/rpi-firmware/config.txt
+endef
+endif
+
 ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_INSTALL_DTBS),y)
 define RPI_FIRMWARE_INSTALL_DTB
 	$(foreach dtb,$(wildcard $(@D)/boot/*.dtb), \
@@ -41,19 +64,10 @@ define RPI_FIRMWARE_INSTALL_TARGET_CMDS
 endef
 endif # INSTALL_VCDBG
 
-ifeq ($(BR2_PACKAGE_RPI_FIRMWARE_VARIANT_PI),y)
-# bootcode.bin is not used on rpi4, because it has been replaced by boot code in the onboard EEPROM
-define RPI_FIRMWARE_INSTALL_BOOTCODE_BIN
-	$(INSTALL) -D -m 0644 $(@D)/boot/bootcode.bin $(BINARIES_DIR)/rpi-firmware/bootcode.bin
-endef
-endif
-
 define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
-	$(INSTALL) -D -m 0644 package/rpi-firmware/config.txt $(BINARIES_DIR)/rpi-firmware/config.txt
 	$(INSTALL) -D -m 0644 package/rpi-firmware/cmdline.txt $(BINARIES_DIR)/rpi-firmware/cmdline.txt
-	$(INSTALL) -D -m 0644 $(@D)/boot/start$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).elf $(BINARIES_DIR)/rpi-firmware/start.elf
-	$(INSTALL) -D -m 0644 $(@D)/boot/fixup$(BR2_PACKAGE_RPI_FIRMWARE_BOOT).dat $(BINARIES_DIR)/rpi-firmware/fixup.dat
-	$(RPI_FIRMWARE_INSTALL_BOOTCODE_BIN)
+	$(RPI_FIRMWARE_INSTALL_BIN)
+	$(RPI_FIRMWARE_INSTALL_CONFIG)
 	$(RPI_FIRMWARE_INSTALL_DTB)
 	$(RPI_FIRMWARE_INSTALL_DTB_OVERLAYS)
 endef
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
