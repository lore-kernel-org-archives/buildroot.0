Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 485A5C433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 10:47:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0382140340;
	Sun,  6 Feb 2022 10:47:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id SEwtqofOyey9; Sun,  6 Feb 2022 10:47:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18BCC403CC;
	Sun,  6 Feb 2022 10:47:06 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6D1891BF83B
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:46:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68F6960BE4
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 10:46:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I90maCX8OS1O for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 10:46:52 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E97B60B6A
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 10:46:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id F242A82B9A; Sun,  6 Feb 2022 10:39:34 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 11:46:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 755116460b8de88cb833ab4bf37649a7fb26728d
X-Git-Newrev: 0f72e01e055f79e84e876dd01c03f29abdbd531b
X-Patchwork-Hint: ignore
Message-Id: <20220206103934.F242A82B9A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-zero-plus2: fix
 build after genimage update
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f72e01e055f79e84e876dd01c03f29abdbd531b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

To fix the first genimage error report, change 'partition-type' entries
to the appropriate 'partition-type-uuid'. Then genimage starts to
complain about overlaps:

ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)
ERROR: hdimage(sdcard.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

To fix the second genimage error report, update the size of bootloader
file. Do not reserve additional space for GPT partition table since
new genimage is able to keep track of it.

Fixes:

  https://gitlab.com/buildroot.org/buildroot/-/jobs/2021478371

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-zero-plus2/genimage.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-zero-plus2/genimage.cfg b/board/orangepi/orangepi-zero-plus2/genimage.cfg
index aee9719ae4..5a7ee7707a 100644
--- a/board/orangepi/orangepi-zero-plus2/genimage.cfg
+++ b/board/orangepi/orangepi-zero-plus2/genimage.cfg
@@ -22,11 +22,11 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1032K # 1MB - 8KB + 16KB(GPT)
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = "F"
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -34,7 +34,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = "L"
 		image = "rootfs.ext4"
 		size = 256M
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
