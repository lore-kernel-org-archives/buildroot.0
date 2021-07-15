Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1729CC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:28:58 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id CD98B60E78
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 23:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org CD98B60E78
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AAC2283DDB;
	Tue,  3 Aug 2021 23:28:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UOuymjgkrWua; Tue,  3 Aug 2021 23:28:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7DAD83DFF;
	Tue,  3 Aug 2021 23:28:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 622071BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:15:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D5A3340EA4
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yE53Ezbn-w2M for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:14 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E271240E58
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 3D0548827E; Tue,  3 Aug 2021 21:10:02 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 15 Jul 2021 21:59:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: a9e405b07976815a5b7202a5fe50c8797e754178
X-Git-Newrev: 3e70251d3615c8b76e80cd29afef852b721070e8
X-Patchwork-Hint: ignore
Message-Id: <20210803211002.3D0548827E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next]
 board/stmicroelectronics/common/stm32mp157: fix U-Boot corruption on the
 first boot
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=3e70251d3615c8b76e80cd29afef852b721070e8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

The stm32mp157 images successfully boot only once. Subsequent boot
attempts fail to reach U-Boot. The root cause turns out to be in U-Boot
corruption during the first boot. The stm32mp1 U-Boot stores its
environment at the end of GPT partition named 'ssbl' since v2020.10-rc2.
However Buildroot genimage template for stm32mp157 boards creates 'ssbl'
partition w/o extra space for U-Boot primary and redundant environments.
This patch explicitly specifies 'ssbl' partition size that should be
enough for both u-boot.stm32 image (~1M) and both environments (16K).

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Tested-by: Pierre-Jean Texier <texier.pj2@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/stmicroelectronics/common/stm32mp157/genimage.cfg.template | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
index f341c19f2f..03fba8daf0 100644
--- a/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
+++ b/board/stmicroelectronics/common/stm32mp157/genimage.cfg.template
@@ -13,6 +13,7 @@ image sdcard.img {
 
 	partition ssbl {
 		image = "u-boot.stm32"
+		size = 2M
 	}
 
 	partition rootfs {
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
