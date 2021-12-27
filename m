Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FA64C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:43:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3291440153;
	Mon, 27 Dec 2021 14:43:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WhjtWCIlzFNj; Mon, 27 Dec 2021 14:43:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 49F8240933;
	Mon, 27 Dec 2021 14:43:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id C41F31BF983
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B3411410A8
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qpkeBe_uWREU for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:43:26 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id C941B409A8
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 7A5BC82B44; Mon, 27 Dec 2021 14:37:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:41:29 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5df540d3a599a7ef7ae12b117ed2419316e4ee9b
X-Git-Newrev: 50963f8f2f28dd8abcc800ccbaca1f93c7a82de5
X-Patchwork-Hint: ignore
Message-Id: <20211227143740.7A5BC82B44@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-r1/genimage.cfg:
 fix build after move to genimage 15
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

commit: https://git.buildroot.net/buildroot/commit/?id=50963f8f2f28dd8abcc800ccbaca1f93c7a82de5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://gitlab.com/buildroot.org/buildroot/-/jobs/1865935239

ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid for mbr and hybrid partition-table-type

So change to partition-type-uuid instead.  With that fixed, genimage-15 then
also complains about the overlap between the u-boot partition and the GPT:

ERROR: hdimage(sdcard.img): partition [GPT array] (offset 0x100000, size 0x4000) overlaps previous partition u-boot (offset 0x2000, size 0x102000)

So adjust the u-boot partition to end just before the GPT.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-r1/genimage.cfg | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index a2ad618557..e42c37d5fd 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -24,11 +24,11 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1032K # 1MB - 8KB + 16KB(GPT)
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = "U"
 		bootable = "true"
 		image = "boot.vfat"
 	}
@@ -36,7 +36,7 @@ image sdcard.img {
 	# 'rootfs' will be used as the partition label, used
 	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = "L"
 		image = "rootfs.ext4"
 		size = 512M
 	}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
