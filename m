Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60E45EB64DD
	for <buildroot@archiver.kernel.org>; Sun, 13 Aug 2023 21:55:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EC00D40488;
	Sun, 13 Aug 2023 21:55:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org EC00D40488
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8uI3ofObVf-W; Sun, 13 Aug 2023 21:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 375644048B;
	Sun, 13 Aug 2023 21:55:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 375644048B
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9A31D1BF86B
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 21:55:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 72F6360F04
 for <buildroot@lists.busybox.net>; Sun, 13 Aug 2023 21:55:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 72F6360F04
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RlPTq46qdH4m for <buildroot@lists.busybox.net>;
 Sun, 13 Aug 2023 21:55:13 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 6D8E760F01
 for <buildroot@buildroot.org>; Sun, 13 Aug 2023 21:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D8E760F01
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3D97185C9B; Sun, 13 Aug 2023 21:55:13 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 12 Aug 2023 23:12:31 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 530e6e97b106bb1f14333388f760992cf44bedaa
X-Git-Newrev: 595939e31fa936d1c969329746d03af02c46da5f
X-Patchwork-Hint: ignore
Message-Id: <20230813215513.3D97185C9B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/sifive/hifive-unleashed:
 update rootfs offset to create a 64 MB image
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

commit: https://git.buildroot.net/buildroot/commit/?id=595939e31fa936d1c969329746d03af02c46da5f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

As the rootfs size is set to 60M, let's put it right on the 4M offset
in the SD card, so that the generated sdcard.img can be exactly
64M. This will allow sdcard.img to be accepted as an image by Qemu,
which requires power of two sizes for the disk images.

Signed-off-by: Bin Meng <bmeng@tinylab.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/sifive/hifive-unleashed/genimage_sdcard.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/sifive/hifive-unleashed/genimage_sdcard.cfg b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
index 079ac5ed26..99e3525a8c 100644
--- a/board/sifive/hifive-unleashed/genimage_sdcard.cfg
+++ b/board/sifive/hifive-unleashed/genimage_sdcard.cfg
@@ -17,6 +17,7 @@ image sdcard.img {
 
 	partition rootfs {
 		image = "rootfs.ext4"
+		offset = 4076K
 		partition-type-uuid = 0fc63daf-8483-4772-8e79-3d69d8477de4
 		bootable = true
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
