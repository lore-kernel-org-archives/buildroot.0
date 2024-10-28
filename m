Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2961D5B154
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 21:45:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A747A40603;
	Mon, 28 Oct 2024 21:45:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JFJVqjbjbJ6g; Mon, 28 Oct 2024 21:45:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 705A840613
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 705A840613;
	Mon, 28 Oct 2024 21:45:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D2DC4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:44:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 194F8400D6
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:44:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uJwhR28_ucWv for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 21:44:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 114D940015
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 114D940015
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 21:44:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0A54384607; Mon, 28 Oct 2024 21:44:57 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 28 Oct 2024 22:44:39 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 51948983aaad8b430aa817a4d66b62062158c4de
X-Git-Newrev: 1acb0e5fec2a1d953cbbeb1f9aaeaac3ce65e9c8
X-Patchwork-Hint: ignore
Message-Id: <20241028214457.0A54384607@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/pine64/pine64: use offset to specify
 boot partition alignment
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
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

commit: https://git.buildroot.net/buildroot/commit/?id=1acb0e5fec2a1d953cbbeb1f9aaeaac3ce65e9c8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Use the 'offset' property in genimage.cfg to align the boot partition on
1 MiB boundary. It is clearer than fixing the size of the previous
u-boot partition.

Suggested-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Mattia Narducci <mattianarducci1@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/pine64/pine64/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/pine64/pine64/genimage.cfg b/board/pine64/pine64/genimage.cfg
index 3555869036..bd026c33c6 100644
--- a/board/pine64/pine64/genimage.cfg
+++ b/board/pine64/pine64/genimage.cfg
@@ -18,13 +18,13 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
 		partition-type = 0xC
 		bootable = "true"
 		image = "boot.vfat"
+		offset = 1M
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
