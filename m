Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C44B4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 903C5611C0
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 903C5611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6800A82496;
	Sun,  7 Nov 2021 02:50:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eilTnM1rvXcZ; Sun,  7 Nov 2021 02:50:56 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C2ECC823F9;
	Sun,  7 Nov 2021 02:50:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 4B3751BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 476B14022C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wEXPZZxsm77v for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 5C1CA400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:22 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBNmR7sz; Sun, 07 Nov 2021 03:45:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253122; bh=llMWaKRZU+E6UfK+qbltv2Ihm/5pW59NPU1zXBqLaRY=;
 h=From:To:Subject:Date:MIME-Version;
 b=hqRtLtEHlyfRmb/Yl3AftZXzZHre8RW4T9B2620B+ke+tist6Q6cF9PFPPhtY3ylL
 OhrYw+OKJUy4T5uYSIMyHD2WpYO4EONgaoTygM5c7gWrbhrfpNOCJTbmZVwLIe/uHp
 q9Cd+/jmaW2J0wHcvoOxCSmG1//NM+P02Dh6uVuE28uIqjkHu9IDWcnQmUXbrUK9y3
 uLX8ksjCW2tBAz143iTRx4XzNDcCgCG5NC8HidF5drdpjC32aDvCPT9AlR924p+uO/
 JMFdoT5z7PVkyn6Z47ST02enSu0s0t9fIt1c+P2w6CgaW2Ac7JCbjbwNa+FRX4cdEJ
 Gc+ef8HBawNcg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:20 +0100
Message-Id: <20211107024330.3061378-33-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfELdYXAV/bKXZKRej6jGC/A39RbQ/BjZrZR65idNbwG2UV2GVNRd/49QlVGP6EGXqNyufFavqxh6zS6fMqRPJQJzvPoZKKpLyczN3c+RkeMpUXUYhaRC
 j7d+ejwX4F1vu5em7DG13wV6EFu7VrPRKnT42LUzVFKFLiasPpLlSkHSKyNMpxqrhQJmsbuYYBKco4OfFaZRo+sypgCcko/G7cJqmZyhytcFORE0QQqaCGwp
 ZyjUFvm7S6cMjjTk9nUig5jTfNwRpSzd/rMT4pJZ8d4=
Subject: [Buildroot] [PATCH 092/102] board/sinovoip/m1-plus/genimage.cfg:
 beautify file
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
 board/sinovoip/m1-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/sinovoip/m1-plus/genimage.cfg b/board/sinovoip/m1-plus/genimage.cfg
index 3cba774c6f..18a549e631 100644
--- a/board/sinovoip/m1-plus/genimage.cfg
+++ b/board/sinovoip/m1-plus/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -19,8 +20,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016K # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
