Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE1C5C636D6
	for <buildroot@archiver.kernel.org>; Tue, 21 Feb 2023 01:53:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 977DF701A4;
	Tue, 21 Feb 2023 01:53:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 977DF701A4
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Udsgat9vmAna; Tue, 21 Feb 2023 01:53:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id A711D701A8;
	Tue, 21 Feb 2023 01:53:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A711D701A8
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF0621BF2B1
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 21:05:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8C2887001E
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C2887001E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id AYzSwUeR2c33 for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id B73A57000A
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B73A57000A
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B530A828C8; Mon, 20 Feb 2023 20:52:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 10 Feb 2023 23:29:10 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f661c00342befb21c0032e593c758dfb2d336007
X-Git-Newrev: e738d5b7251918a62922f3f3b6491b642f9ec182
X-Patchwork-Hint: ignore
Message-Id: <20230220205257.B530A828C8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] configs/asus_tinker_rk3288:
 fix boot by prepending tpl to spl+u-boot
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e738d5b7251918a62922f3f3b6491b642f9ec182
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

During the last U-boot version bump it's not been noted that the TPL
was not prepended to SPL anymore preventing the board to boot, so
let's copy TPL to the image folder, prepend it to u-boot-spl-dtb.bin
and place it at offset 32KB, where RK3288 bootrom expects to find
it. Let's also place u-boot-dtb separated from SPL at offset 8M, where
the SPL expects it to find it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/asus/tinker/genimage.cfg       | 11 +++++++++--
 board/asus/tinker/post-build.sh      |  4 ++--
 configs/asus_tinker_rk3288_defconfig |  3 +--
 3 files changed, 12 insertions(+), 6 deletions(-)

diff --git a/board/asus/tinker/genimage.cfg b/board/asus/tinker/genimage.cfg
index a4b1e8d608..fa7fd734f2 100644
--- a/board/asus/tinker/genimage.cfg
+++ b/board/asus/tinker/genimage.cfg
@@ -2,12 +2,19 @@ image sdcard.img {
 	hdimage {
 	}
 
-	partition u-boot-spl-dtb {
+	partition u-boot-tpl-spl-dtb {
 		in-partition-table = "no"
-		image = "u-boot-spl-dtb.img"
+		image = "u-boot-tpl-spl-dtb.img"
 		offset = 32K
 	}
 
+	partition u-boot-dtb {
+		in-partition-table = "no"
+		image = "u-boot-dtb.img"
+		offset = 8M
+		size = 30M
+	}
+
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
diff --git a/board/asus/tinker/post-build.sh b/board/asus/tinker/post-build.sh
index 8108ed83ff..ffbbcdeb58 100755
--- a/board/asus/tinker/post-build.sh
+++ b/board/asus/tinker/post-build.sh
@@ -3,7 +3,7 @@
 MKIMAGE=$HOST_DIR/bin/mkimage
 BOARD_DIR="$(dirname $0)"
 
-$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-spl-dtb.bin $BINARIES_DIR/u-boot-spl-dtb.img
-cat $BINARIES_DIR/u-boot-dtb.bin >> $BINARIES_DIR/u-boot-spl-dtb.img
+$MKIMAGE -n rk3288 -T rksd -d $BINARIES_DIR/u-boot-tpl.bin $BINARIES_DIR/u-boot-tpl.img
+cat $BINARIES_DIR/u-boot-tpl.img $BINARIES_DIR/u-boot-spl-dtb.bin > $BINARIES_DIR/u-boot-tpl-spl-dtb.img
 
 install -m 0644 -D $BOARD_DIR/extlinux.conf $TARGET_DIR/boot/extlinux/extlinux.conf
diff --git a/configs/asus_tinker_rk3288_defconfig b/configs/asus_tinker_rk3288_defconfig
index 6963fa939f..02b340a7f1 100644
--- a/configs/asus_tinker_rk3288_defconfig
+++ b/configs/asus_tinker_rk3288_defconfig
@@ -17,9 +17,8 @@ BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_DTB_IMG=y
-BR2_TARGET_UBOOT_FORMAT_DTB_BIN=y
 BR2_TARGET_UBOOT_SPL=y
-BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin"
+BR2_TARGET_UBOOT_SPL_NAME="spl/u-boot-spl-dtb.bin tpl/u-boot-tpl.bin"
 
 # Kernel
 BR2_LINUX_KERNEL=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
