From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Sat, 08 Aug 2015 10:57:34 -0000
Subject: [Buildroot] [git commit branch/next] configs: add
	altera_socdk_defconfig for Altera Cyclone 5 Development Board
Message-ID: <20150808105629.641067FC31@busybox.osuosl.org>
List-Id: <buildroot.busybox.net>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: buildroot@busybox.net

commit: http://git.buildroot.net/buildroot/commit/?id=e4f787ec999834116089d79f6bd65c70403cd689
branch: http://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This is largely the same as altera_sockit_defconfig.

It uses a fresher Linux and u-boot than SocKit. It also speeds the
serial port up to 115200.

The post-image script is generalized by adding
BR2_ROOTFS_POST_SCRIPT_ARGS and moving it up the altera directory.
Similarly, the readme is moved up and made more generic.

Signed-off-by: Charles Manning <cdhmanning@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
---
 board/altera/{sockit => }/post-image.sh            |    5 +++--
 board/altera/{sockit => }/readme.txt               |    9 +++++++--
 ...era_sockit_defconfig => altera_socdk_defconfig} |   11 +++++------
 configs/altera_sockit_defconfig                    |    3 ++-
 4 files changed, 17 insertions(+), 11 deletions(-)

diff --git a/board/altera/sockit/post-image.sh b/board/altera/post-image.sh
similarity index 58%
rename from board/altera/sockit/post-image.sh
rename to board/altera/post-image.sh
index 9040808..03e7819 100755
--- a/board/altera/sockit/post-image.sh
+++ b/board/altera/post-image.sh
@@ -1,7 +1,8 @@
 #!/bin/sh
-# post-image.sh for SoCkit
+# post-image.sh for SoCkit/SoCDK
 # 2014, "Roman Diouskine" <roman.diouskine@savoirfairelinux.com>
 # 2014, "Sebastien Bourdelin" <sebastien.bourdelin@savoirfairelinux.com>
 
 # create a DTB file copy with the name expected by the u-boot config
-cp -af $BINARIES_DIR/socfpga_cyclone5_sockit.dtb  $BINARIES_DIR/socfpga.dtb
+# Name of the DTB is passed as the second argument to the script.
+cp -af $BINARIES_DIR/${2}.dtb  $BINARIES_DIR/socfpga.dtb
diff --git a/board/altera/sockit/readme.txt b/board/altera/readme.txt
similarity index 95%
rename from board/altera/sockit/readme.txt
rename to board/altera/readme.txt
index b6da489..8d5b891 100644
--- a/board/altera/sockit/readme.txt
+++ b/board/altera/readme.txt
@@ -3,7 +3,8 @@ SoCkit
 Intro
 =====
 
-This is the buildroot board support for the Arrow SoCkit Evaluation Board.
+This is the buildroot board support for the Arrow SoCkit Evaluation Board
+and the Altera Cyclone 5 Development Board.
 
 A good source of information is :
 http://www.rocketboards.org/foswiki/Documentation/ArrowSoCKitEvaluationBoard
@@ -46,6 +47,10 @@ all that is required to bring the SoCkit :
 
   $ make altera_sockit_defconfig
 
+and for the SoC Development Board :
+
+  $ make altera_sockdk_defconfig
+
 Build everything
 ----------------
 
@@ -63,7 +68,7 @@ After building, you should obtain this tree:
     ????????? rootfs.ext2
     ????????? rootfs.ext3 -> rootfs.ext2
     ????????? rootfs.tar
-    ????????? socfpga_cyclone5_sockit.dtb
+    ????????? socfpga_cyclone5_sockit.dtb or socfpga_cyclone5_socdk.dtb
     ????????? socfpga.dtb
     ????????? u-boot.img
     ????????? u-boot-spl.bin
diff --git a/configs/altera_sockit_defconfig b/configs/altera_socdk_defconfig
similarity index 73%
copy from configs/altera_sockit_defconfig
copy to configs/altera_socdk_defconfig
index 888fccf..5a27a74 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_socdk_defconfig
@@ -11,17 +11,17 @@ BR2_KERNEL_HEADERS_VERSION=y
 BR2_DEFAULT_KERNEL_VERSION="3.13.5"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
-BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/sockit/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
 BR2_LINUX_KERNEL_CUSTOM_REPO_URL="git://git.rocketboards.org/linux-socfpga.git"
 BR2_LINUX_KERNEL_CUSTOM_REPO_VERSION="rel_socfpga-3.13_14.02.02"
 BR2_LINUX_KERNEL_DEFCONFIG="socfpga"
-BR2_LINUX_KERNEL_UIMAGE_LOADADDR="0x8000"
+BR2_LINUX_KERNEL_ZIMAGE=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_sockit"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="socfpga_cyclone5_socdk"
 
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_3=y
@@ -30,8 +30,7 @@ BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="socfpga_cyclone5"
 BR2_TARGET_UBOOT_CUSTOM_GIT=y
 BR2_TARGET_UBOOT_CUSTOM_REPO_URL="git://git.rocketboards.org/u-boot-socfpga.git"
-BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_acds13.0sp1"
-BR2_TARGET_UBOOT_PATCH="board/altera/sockit"
+BR2_TARGET_UBOOT_CUSTOM_REPO_VERSION="rel_socfpga_v2013.01.01_14.02.02"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
 BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl.bin"
diff --git a/configs/altera_sockit_defconfig b/configs/altera_sockit_defconfig
index 888fccf..dfb895e 100644
--- a/configs/altera_sockit_defconfig
+++ b/configs/altera_sockit_defconfig
@@ -12,7 +12,8 @@ BR2_DEFAULT_KERNEL_VERSION="3.13.5"
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_3_13=y
 
 BR2_TARGET_GENERIC_GETTY_BAUDRATE_57600=y
-BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/sockit/post-image.sh"
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/altera/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_LINUX_KERNEL_INTREE_DTS_NAME)"
 
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_GIT=y
