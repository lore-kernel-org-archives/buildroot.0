Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E32CC433EF
	for <buildroot@archiver.kernel.org>; Sat, 22 Jan 2022 14:08:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CF0284019B;
	Sat, 22 Jan 2022 14:08:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r6YcMNiRi7hP; Sat, 22 Jan 2022 14:08:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9D422400D6;
	Sat, 22 Jan 2022 14:08:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 90AE41BF390
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:08:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8BDEC606F9
 for <buildroot@lists.busybox.net>; Sat, 22 Jan 2022 14:08:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8x-c1S8bRdhd for <buildroot@lists.busybox.net>;
 Sat, 22 Jan 2022 14:08:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C02CF605E9
 for <buildroot@buildroot.org>; Sat, 22 Jan 2022 14:08:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id DAA0482926; Sat, 22 Jan 2022 14:01:43 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 22 Jan 2022 15:07:23 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c8bf60c50c91e23db2944d32d9a2e9db921cfcc3
X-Git-Newrev: ed380f62e0260cdf91e60bfb3706f17a96fddabf
X-Patchwork-Hint: ignore
Message-Id: <20220122140143.DAA0482926@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/kontron/pitx-imx8m: use extlinux
 instead of U-Boot boot script
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

commit: https://git.buildroot.net/buildroot/commit/?id=ed380f62e0260cdf91e60bfb3706f17a96fddabf
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Signed-off-by: Heiko Thiery <heiko.thiery@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/kontron/pitx-imx8m/boot.cmd      | 8 --------
 board/kontron/pitx-imx8m/extlinux.conf | 4 ++++
 board/kontron/pitx-imx8m/genimage.cfg  | 5 +++--
 board/kontron/pitx-imx8m/post-build.sh | 7 +++++--
 board/kontron/pitx-imx8m/post-image.sh | 2 +-
 configs/kontron_pitx_imx8m_defconfig   | 3 +--
 6 files changed, 14 insertions(+), 15 deletions(-)

diff --git a/board/kontron/pitx-imx8m/boot.cmd b/board/kontron/pitx-imx8m/boot.cmd
deleted file mode 100644
index 4d89235392..0000000000
--- a/board/kontron/pitx-imx8m/boot.cmd
+++ /dev/null
@@ -1,8 +0,0 @@
-echo "Root File Sytem on MMC${devnum}"
-setenv rootfs /dev/mmcblk${devnum}p1
-setenv bootargs root=${rootfs} rootwait rw ${extrabootargs}
-
-load ${devtype} ${devnum} ${kernel_addr_r} boot/Image
-load ${devtype} ${devnum} ${fdt_addr_r} boot/imx8mq-kontron-pitx-imx8m.dtb
-
-booti ${kernel_addr_r} - ${fdt_addr_r}
diff --git a/board/kontron/pitx-imx8m/extlinux.conf b/board/kontron/pitx-imx8m/extlinux.conf
new file mode 100644
index 0000000000..2911acec59
--- /dev/null
+++ b/board/kontron/pitx-imx8m/extlinux.conf
@@ -0,0 +1,4 @@
+label buildroot
+  kernel /boot/Image
+  devicetree /boot/freescale/imx8mq-kontron-pitx-imx8m.dtb
+  append root=PARTUUID=%PARTUUID% rootwait rw
diff --git a/board/kontron/pitx-imx8m/genimage.cfg b/board/kontron/pitx-imx8m/genimage.cfg
index c78ef0f910..4a0aa117fb 100644
--- a/board/kontron/pitx-imx8m/genimage.cfg
+++ b/board/kontron/pitx-imx8m/genimage.cfg
@@ -1,5 +1,6 @@
 image sdcard.img {
 	hdimage {
+		partition-table-type = "gpt"
 	}
 
 	partition imx-boot {
@@ -9,8 +10,8 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
 		offset = 8M
+		image = "rootfs.ext4"
+		partition-uuid = %PARTUUID%
 	}
 }
diff --git a/board/kontron/pitx-imx8m/post-build.sh b/board/kontron/pitx-imx8m/post-build.sh
index 4574221fe5..bf8861f6a9 100755
--- a/board/kontron/pitx-imx8m/post-build.sh
+++ b/board/kontron/pitx-imx8m/post-build.sh
@@ -1,4 +1,7 @@
 #!/bin/sh
+BOARD_DIR="$(dirname $0)"
+PARTUUID="$($HOST_DIR/bin/uuidgen)"
 
-mkdir -p $TARGET_DIR/boot/
-cp $BINARIES_DIR/boot.scr $TARGET_DIR/boot/boot.scr
+install -d "$TARGET_DIR/boot/extlinux/"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/extlinux.conf" > "$TARGET_DIR/boot/extlinux/extlinux.conf"
+sed "s/%PARTUUID%/$PARTUUID/g" "$BOARD_DIR/genimage.cfg" > "$BINARIES_DIR/genimage.cfg"
diff --git a/board/kontron/pitx-imx8m/post-image.sh b/board/kontron/pitx-imx8m/post-image.sh
index 564211c829..3452fd4501 100755
--- a/board/kontron/pitx-imx8m/post-image.sh
+++ b/board/kontron/pitx-imx8m/post-image.sh
@@ -1,3 +1,3 @@
 #!/bin/sh
 
-support/scripts/genimage.sh -c $(dirname $0)/genimage.cfg
+support/scripts/genimage.sh -c ${BINARIES_DIR}/genimage.cfg
diff --git a/configs/kontron_pitx_imx8m_defconfig b/configs/kontron_pitx_imx8m_defconfig
index 0e3868b583..2a4aa1a0ab 100644
--- a/configs/kontron_pitx_imx8m_defconfig
+++ b/configs/kontron_pitx_imx8m_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.13"
 BR2_LINUX_KERNEL_USE_ARCH_DEFAULT_CONFIG=y
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="freescale/imx8mq-kontron-pitx-imx8m"
+BR2_LINUX_KERNEL_DTB_KEEP_DIRNAME=y
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
@@ -49,5 +50,3 @@ BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_IMX_MKIMAGE=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/kontron/pitx-imx8m/boot.cmd"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
