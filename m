Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05DA1C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Dec 2021 14:43:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AAE41410B6;
	Mon, 27 Dec 2021 14:43:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mEv0PWoqlq1H; Mon, 27 Dec 2021 14:43:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F08E5409BA;
	Mon, 27 Dec 2021 14:43:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id AC0571BF3ED
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A957B60E62
 for <buildroot@lists.busybox.net>; Mon, 27 Dec 2021 14:43:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id As6QYOwdUGoq for <buildroot@lists.busybox.net>;
 Mon, 27 Dec 2021 14:43:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id CBB6860586
 for <buildroot@buildroot.org>; Mon, 27 Dec 2021 14:43:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 8C19782B94; Mon, 27 Dec 2021 14:37:40 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 27 Dec 2021 15:43:18 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b59f938302f3db638a61ddf04aac7c986096467e
X-Git-Newrev: 5ba36c687b5980848e3a7209d7c4ad26713a9c9e
X-Patchwork-Hint: ignore
Message-Id: <20211227143740.8C19782B94@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/kontron_smarc_sal28: move gpt
 between rcw and bootloader
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

commit: https://git.buildroot.net/buildroot/commit/?id=5ba36c687b5980848e3a7209d7c4ad26713a9c9e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

genimage v15 complains about the GPT overlapping with the RCW. Move it
to offset 16k which is between the rcw (which isn't expected to grow
much more) and the bootloader.

This will fix the following error:
ERROR: hdimage(sdcard-emmc.img): partition [GPT array] (offset 0x400, size 0x4000) overlaps previous partition rcw (offset 0x1000, size 0x580)
ERROR: hdimage(sdcard-emmc.img): bootloaders, etc. that overlap with the partition table must declare the overlapping area as a hole.

Signed-off-by: Michael Walle <michael@walle.cc>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/kontron/smarc-sal28/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/kontron/smarc-sal28/genimage.cfg b/board/kontron/smarc-sal28/genimage.cfg
index 0ad020b347..c885cd51a6 100644
--- a/board/kontron/smarc-sal28/genimage.cfg
+++ b/board/kontron/smarc-sal28/genimage.cfg
@@ -1,6 +1,7 @@
 image sdcard-emmc.img {
 	hdimage {
 		partition-table-type = "gpt"
+		gpt-location = 16K
 	}
 
 	partition rcw {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
