Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA986CE7B11
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:03:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9634584821;
	Fri,  6 Sep 2024 20:03:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RVAR2KZejFbM; Fri,  6 Sep 2024 20:03:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 44E6D84823
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 44E6D84823;
	Fri,  6 Sep 2024 20:03:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 1FFFB1BF20B
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BE17240B9F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aIu-_kzukwF for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1C44C409E3
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1C44C409E3
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 199C9869F2; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:20:57 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e0ed05cc007eed630dd44b7f129903a76fab6981
X-Git-Newrev: 2245396b20db0c658323e16886a65ba2215dc9a7
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.199C9869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/radxa/rock5b: use gpt partition
 table instead of hybrid
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
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
