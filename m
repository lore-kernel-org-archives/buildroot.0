Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02E6DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B1D7F6187C
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:44:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B1D7F6187C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7BAAC400DB;
	Sun,  7 Nov 2021 02:44:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id otqV3OKa6Q1I; Sun,  7 Nov 2021 02:44:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AEE89400EA;
	Sun,  7 Nov 2021 02:44:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E68971BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D57A481C2F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nl7lCELFfChQ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:02 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp1.osuosl.org (Postfix) with ESMTP id 12BD081B48
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:01 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY97mqU6u; Sun, 07 Nov 2021 03:43:01 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252981; bh=c8EGam94Efg+LKkRCQSVarwL/wTk+ZB3ppdmUPFFKg4=;
 h=From:To:Subject:Date:MIME-Version;
 b=RV9uqJjTIx/E6wAEDzUsutfbatfquHhaMz2VTgVamKcetbmg/rOWmZxtyrdFlu3ti
 zWTyTT94um2lS6d8ytGF2dWmA9ySZdB2JSEediZyvAbV0K8sZgbGXp8jIWXdx0D7fR
 Q4w4bUHEroMffnnL8x+t0GprckrlhR8OXs8H0sC3ejoQwZ+txQ0EXR5OubPr4KIqnG
 BSpewLEv+AYWzT85N9XeRm6Lw7rtfucWy1jEy8gEewAw0WuxRBtv/lVgHfF5MGgGzw
 6Bi1lzgO8QI7OwW+5dkWWd2ydbaCDuC4HpHplpx1C9Y/4SNjK2/Gx0hSHryOL/ETge
 ClyxZGvQC57Ww==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:50 +0100
Message-Id: <20211107024250.3061287-9-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBEI7IBPToFW+57wTVL3VbWfs+JsDoltbTZF4Rm2aZQPlg9UNM2EL7QSbSbBENnzIA0iLk5bwurXpCV/oOFmw+WvKZRLbhoZhhdT6sv9KPKjWZ+SsKSz
 g2X1/C+TCQRg7bazMus65WmxYycw7W9Zx0Do9pnDcbkZPeReYb9U9tadz5bRsWcX6lpzhYWb1k0Pm1bMvJnzZ716ibBdU6xLZ7UKPafgZRo/4LeTBhnI+zzD
 2ME+kHRpAM/wqjGgphQD/PrDsNGSBp7aOyvzgGeHeps=
Subject: [Buildroot] [PATCH 059/102]
 board/orangepi/orangepi-pc-plus/genimage.cfg: beautify file
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
 board/orangepi/orangepi-pc-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index b4fcc827ec..7c3b4cd746 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -22,8 +23,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1056768 # 1MB - 8K + 16K(GPT)
+		offset = 8K
+		size = 1032K # 1MB - 8KB + 16KB(GPT)
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
