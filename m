Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F194ACD37AA
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 19:23:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A2A5F404C8;
	Tue,  3 Sep 2024 19:23:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NJ_iHI7-w-qB; Tue,  3 Sep 2024 19:23:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7EBE440A02
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7EBE440A02;
	Tue,  3 Sep 2024 19:23:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7C8821BF344
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:23:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7565680F30
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 19:23:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DvHIjyO6Gcu5 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 19:23:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0D1480F09
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0D1480F09
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 19:23:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A77AB86B43; Tue,  3 Sep 2024 19:23:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:20:57 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: e0ed05cc007eed630dd44b7f129903a76fab6981
X-Git-Newrev: 2245396b20db0c658323e16886a65ba2215dc9a7
X-Patchwork-Hint: ignore
Message-Id: <20240903192326.A77AB86B43@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/radxa/rock5b: use gpt
 partition table instead of hybrid
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

commit: https://git.buildroot.net/buildroot/commit/?id=2245396b20db0c658323e16886a65ba2215dc9a7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Partition table hybrid means GPT + MBR.
There is no need to keep the MBR when using GPT, so migrate to GPT only.

This change also requires us to migrate from partition-type to
partition-type-uuid, otherwise genimage won't generate an image.

Note that GPT itself always writes a "protective MBR" at LBA 0.

Signed-off-by: Niklas Cassel <cassel@kernel.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/radxa/rock5b/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/radxa/rock5b/genimage.cfg b/board/radxa/rock5b/genimage.cfg
index 138ec26e3a..43bb65bdd9 100644
--- a/board/radxa/rock5b/genimage.cfg
+++ b/board/radxa/rock5b/genimage.cfg
@@ -2,7 +2,7 @@
 
 image sdcard.img {
 	hdimage {
-		partition-table-type = "hybrid"
+		partition-table-type = "gpt"
 	}
 
 	partition uboot {
@@ -12,7 +12,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type = 0x83
+		partition-type-uuid = L
 		image = "rootfs.ext2"
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
