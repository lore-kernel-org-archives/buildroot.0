Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 061DAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 09:32:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9B7CC40457;
	Sun,  6 Feb 2022 09:32:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QZPFZMhHVmKV; Sun,  6 Feb 2022 09:32:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF05B4043A;
	Sun,  6 Feb 2022 09:32:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4471E1BF83C
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:32:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 400D9818B5
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 09:32:07 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kE9iNPsR-jOf for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 09:32:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5843C818C4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 09:32:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 414B582B8E; Sun,  6 Feb 2022 09:24:48 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 6 Feb 2022 10:31:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c71c93aa76e803043a5c7cdd0315897540e0a647
X-Git-Newrev: 93532fb711f537f77a2cfe0a23e085444c5747b5
X-Patchwork-Hint: ignore
Message-Id: <20220206092448.414B582B8E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/radxa/rockpi-n10: use
 partition-type-uuid in genimage.cfg
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

commit: https://git.buildroot.net/buildroot/commit/?id=93532fb711f537f77a2cfe0a23e085444c5747b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Genimage 15 restricted the partition-type option to mbr and hybrid
partition-table-type and now prints a warning when it is used [1]:

ERROR: hdimage(disk.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

[1] https://github.com/pengutronix/genimage/commit/1d72d8091f83790a0a35a1ea7dc25d46adba8876

So let's use for EFI System partition:
'partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b'
and for Root partition (64-bit ARM/AArch64):
'partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae'

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1929717241

FTR, the magic UUID are from:
    https://en.wikipedia.org/wiki/GUID_Partition_Table#Partition_type_GUIDs

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rockpi-n10/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rockpi-n10/genimage.cfg b/board/radxa/rockpi-n10/genimage.cfg
index 652e75db11..7f4b639bbc 100644
--- a/board/radxa/rockpi-n10/genimage.cfg
+++ b/board/radxa/rockpi-n10/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext4"
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
