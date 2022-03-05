Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AA5AC433F5
	for <buildroot@archiver.kernel.org>; Sat,  5 Mar 2022 15:02:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BECF6408B2;
	Sat,  5 Mar 2022 15:02:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y7ibgbwsxs5z; Sat,  5 Mar 2022 15:02:39 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D10DC40347;
	Sat,  5 Mar 2022 15:02:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3BDBE1BF616
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 15:02:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A31740147
 for <buildroot@lists.busybox.net>; Sat,  5 Mar 2022 15:02:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id f4bH91WBqgPZ for <buildroot@lists.busybox.net>;
 Sat,  5 Mar 2022 15:02:36 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3257A400D1
 for <buildroot@buildroot.org>; Sat,  5 Mar 2022 15:02:36 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 7A75181761; Sat,  5 Mar 2022 14:54:17 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 5 Mar 2022 16:01:27 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ad25ca1c1f7a61a6cfaa1ef32c19f219fce82ff5
X-Git-Newrev: b677a7bedb1a4c862944beeda53b104bd91cb2c2
X-Patchwork-Hint: ignore
Message-Id: <20220305145417.7A75181761@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-rk3399/genimage:
 fix partition types for gpt
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

commit: https://git.buildroot.net/buildroot/commit/?id=b677a7bedb1a4c862944beeda53b104bd91cb2c2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes the following error during image generation:
  ERROR: hdimage(sdcard.img): part boot: 'partition-type' is only valid
  for mbr and hybrid partition-table-type

Fixes: https://gitlab.com/buildroot.org/buildroot/-/jobs/2103784375

Signed-off-by: Marcus Hoffmann <marcus.hoffmann@othermo.de>
Reviewed-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/orangepi/orangepi-rk3399/genimage.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
index c94e0bc7cc..a02166172f 100644
--- a/board/orangepi/orangepi-rk3399/genimage.cfg
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
@@ -26,14 +26,13 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type = 0xC
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type = 0x83
 		image = "rootfs.ext4"
 	}
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
