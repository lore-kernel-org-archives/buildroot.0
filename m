Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69C1BC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:41:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2B55C617E5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:41:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2B55C617E5
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0334B402A3;
	Sun,  7 Nov 2021 02:41:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 2k9FR7pJzAyq; Sun,  7 Nov 2021 02:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 77BAA4028B;
	Sun,  7 Nov 2021 02:41:17 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id D51891BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:41:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id C3BE2400DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:41:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rw4f7KDCBKf4 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:41:10 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id ABCA64022C
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:41:09 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY7Jmuo9DFf01jY7JmqTc1; Sun, 07 Nov 2021 03:41:09 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252869; bh=QCQUuUQJVfYpnqHC76BzFRYCSSZl1IxwPSFuAfXotOg=;
 h=From:To:Subject:Date:MIME-Version;
 b=gRqz/k1Pczd9KTRcvdN/ZGrIZ69gr2STyiYq27GKwqzHlbFlktmOM/mS/Ql7Yt2tR
 6sVFLgTYpkVumkHeiA+mm3qU0j7LX6wfdkUlj6HVu44XPeFxQITedoLCH06+tMfvJn
 8SXoq+9t7BLoJqU57Ogjnm9iYfifyrPdJfhh1rfXXvF1Igmw2igIEUqsu8wX/M4zzL
 jnSbhagnsPBPvm+1sdqxfsavd7ryOVV1+T3g82Gm2qGb9WTThwYisIV98CWyxA48vT
 74P3tcctPQMZL8mT/TeP1/ifJI1MumdVa3ZmsxRXB1smph8uAVn4379p4Rj4UwM3Xb
 Qrc71+qibVEQw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:41:08 +0100
Message-Id: <20211107024108.3061022-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfF2mxnRk870iJdEx+Oqcon3MLn45cHU3DEzBR560rnvzESEPlCcgkPHCv9dkCCo6RgC+hE66G2ndAl9V0FvaI4Ho/GXNB3sQqj6SgP0g9BxrTnEqfh9R
 oRYIHb/n9GFyJfuSCOOAOXoP+HiMo/EvOJ/0Tlf9vtIyrE2Y/u3f8gFPqYB6/ErkwWhKoJoYq4lW1AFPCCTAXmJqkdZt/qlEyJd5ceAIudU9fERrpIz5to1f
 /OQJrI0aps3JxXPRmbilS50Uct+hZq2RGnKZiTv2hzU=
Subject: [Buildroot] [PATCH 047/102]
 board/microchip/sam9x60ek_mmc/genimage.cfg: beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/microchip/sam9x60ek_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/microchip/sam9x60ek_mmc/genimage.cfg b/board/microchip/sam9x60ek_mmc/genimage.cfg
index c41581091e..629caf3ef7 100644
--- a/board/microchip/sam9x60ek_mmc/genimage.cfg
+++ b/board/microchip/sam9x60ek_mmc/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"u-boot.bin"
 		}
 	}
+
 	size = 16M
 }
 
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
