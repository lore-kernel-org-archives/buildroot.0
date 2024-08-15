Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D729EC52D7C
	for <buildroot@archiver.kernel.org>; Thu, 15 Aug 2024 18:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76D1B40714;
	Thu, 15 Aug 2024 18:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FYbhhKKQqeYP; Thu, 15 Aug 2024 18:18:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3A18140743
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3A18140743;
	Thu, 15 Aug 2024 18:18:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E7BB41BF573
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:18:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id E1D8240EFD
 for <buildroot@lists.busybox.net>; Thu, 15 Aug 2024 18:18:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWEuYviP3x9L for <buildroot@lists.busybox.net>;
 Thu, 15 Aug 2024 18:18:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DBDF740243
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id DBDF740243
 for <buildroot@buildroot.org>; Thu, 15 Aug 2024 18:18:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id CEEE385ED0; Thu, 15 Aug 2024 18:18:14 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 15 Aug 2024 20:17:28 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 6eff762f5f57b945db394e11bee829779fa413ea
X-Git-Newrev: 62041c338618457ea14ab7c7a2c1c82ef0f0340b
X-Patchwork-Hint: ignore
Message-Id: <20240815181814.CEEE385ED0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/friendlyarm/nanopi-neo:
 fix uboot partition size
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

commit: https://git.buildroot.net/buildroot/commit/?id=62041c338618457ea14ab7c7a2c1c82ef0f0340b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This patch fixes the wrongly calculated uboot partition size in
genimage.cfg. The size should be 1016K, which is
1MB (typical partition start) - 8K(offset dictated by the bootrom).

Signed-off-by: Dong Wang <wangdong115@foxmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 board/friendlyarm/nanopi-neo/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index ec78fd0e56..8d6bdd3295 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -7,7 +7,7 @@ image sdcard.img {
 		in-partition-table = false
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8K
-		size = 1000K # 1MB - 8KB(offset) - 16KB(GPT)
+		size = 1016K # 1MB - 8KB(offset)
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
