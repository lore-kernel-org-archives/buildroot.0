Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3503CE6FE46
	for <buildroot@archiver.kernel.org>; Fri,  6 Sep 2024 20:03:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F250984896;
	Fri,  6 Sep 2024 20:03:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cwkov5gHztYY; Fri,  6 Sep 2024 20:03:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8EC2848A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8EC2848A9;
	Fri,  6 Sep 2024 20:03:53 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id ED3B81BF37F
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 43C38409AE
 for <buildroot@lists.busybox.net>; Fri,  6 Sep 2024 19:59:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TLcOJ6Dfh9WU for <buildroot@lists.busybox.net>;
 Fri,  6 Sep 2024 19:58:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6141D409F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6141D409F2
 for <buildroot@buildroot.org>; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 5D463869F2; Fri,  6 Sep 2024 19:58:58 +0000 (UTC)
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 21:55:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a584f8355569daa8f5794c70fa6e5eadbbe5a537
X-Git-Newrev: 848d2614bf46999358b941c261d5c429e6471820
X-Patchwork-Hint: ignore
Message-Id: <20240906195858.5D463869F2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/friendlyarm/nanopi-neo: refine
 genimage.cfg
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

commit: https://git.buildroot.net/buildroot/commit/?id=848d2614bf46999358b941c261d5c429e6471820
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This patch adds the offset argument for rootfs partiton so that it's
aligned to a 1MiB boundary, instead of using the size of the previous
u-boot partition to achieve this.

Genimage will make sure no partitions overlap. So we don't need a size
argument to limit the size of the u-boot image.

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index 8d6bdd3295..6d57dd9088 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -7,11 +7,11 @@ image sdcard.img {
 		in-partition-table = false
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1016K # 1MB - 8KB(offset)
 	}
 
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
+		offset = 1M
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
