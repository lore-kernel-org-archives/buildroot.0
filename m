Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45B99C64EC7
	for <buildroot@archiver.kernel.org>; Tue, 28 Feb 2023 20:37:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id F2E4A60E45;
	Tue, 28 Feb 2023 20:37:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F2E4A60E45
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id pX0Uz-wbuv0B; Tue, 28 Feb 2023 20:37:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2A2E961190;
	Tue, 28 Feb 2023 20:37:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A2E961190
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CCF3E1BF870
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A6B3F81839
 for <buildroot@lists.busybox.net>; Tue, 28 Feb 2023 20:36:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A6B3F81839
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id OeiHapf9vV95 for <buildroot@lists.busybox.net>;
 Tue, 28 Feb 2023 20:36:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B817981776
 for <buildroot@buildroot.org>; Tue, 28 Feb 2023 20:36:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B817981776
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A60C086DB9; Tue, 28 Feb 2023 20:36:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 28 Feb 2023 21:15:03 +0100
X-Git-Refname: refs/heads/2022.11.x
X-Git-Oldrev: d80c54ba7bfad405a472d47330b91ebe417b5af9
X-Git-Newrev: a31551e52ac74366786d943541b889bf33eba14f
X-Patchwork-Hint: ignore
Message-Id: <20230228203626.A60C086DB9@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.11.x]
 configs/asus_tinker_rk3288: fix boot by prepending tpl to spl+u-boot
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

commit: https://git.buildroot.net/buildroot/commit/?id=a31551e52ac74366786d943541b889bf33eba14f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.11.x

During the last U-boot version bump it's not been noted that the TPL
was not prepended to SPL anymore preventing the board to boot, so
let's copy TPL to the image folder, prepend it to u-boot-spl-dtb.bin
and place it at offset 32KB, where RK3288 bootrom expects to find
it. Let's also place u-boot-dtb separated from SPL at offset 8M, where
the SPL expects it to find it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit e738d5b7251918a62922f3f3b6491b642f9ec182)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
