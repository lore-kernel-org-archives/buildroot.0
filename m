Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A45BC433EF
	for <buildroot@archiver.kernel.org>; Sun,  6 Feb 2022 20:12:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A848A818A1;
	Sun,  6 Feb 2022 20:12:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id S7Vpqlj7_FNm; Sun,  6 Feb 2022 20:12:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id D163A814B6;
	Sun,  6 Feb 2022 20:12:54 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 513321BF976
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3E7B5814B6
 for <buildroot@lists.busybox.net>; Sun,  6 Feb 2022 20:12:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 7hpZVR6JwB6R for <buildroot@lists.busybox.net>;
 Sun,  6 Feb 2022 20:12:40 +0000 (UTC)
X-Greylist: delayed 00:07:01 by SQLgrey-1.8.0
Received: from smtpcmd04135.aruba.it (smtpcmd04135.aruba.it [62.149.158.135])
 by smtp1.osuosl.org (Postfix) with ESMTP id 45111813F4
 for <buildroot@buildroot.org>; Sun,  6 Feb 2022 20:12:40 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id GnmvnnlBAkz4hGnn0nXO9Z; Sun, 06 Feb 2022 21:05:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644177939; bh=0d1Di1JatVkJbq8ZuNwrc52TuYAMPHiHDqL1TEshdoY=;
 h=From:To:Subject:Date:MIME-Version;
 b=O4SsEp1A+M2rMuMg2vU35SyZ7NR9YGuUMzmJAadK9Ts2iMO8C4de+FIXJt6sWuMkl
 krh2J4hN0DiJa5M6eXdVK6mAyqW3slsdeUyfonoUrXIULgi/9spNSNmJqdrJcBJq7T
 rPhAkwSSck7dqxMzzLQu/Nlef9hKZS8cfQAne+/G21X4CF0dnzjsJhPJuEE/1rc5Dl
 A9ETN0WYFT5RlTGkb2+u95feCaVjCEgbDxfNeP9kwRzOtlnweoKmAyXFMdGbZZxAaR
 DGgR8H5WzviM+nXm8bKaz0S+V/+2m2vHc0ZQO7n9c8E8EwrptClQieDFs5qAb8eSYq
 f4I45F1ps5RMA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  6 Feb 2022 21:05:25 +0100
Message-Id: <20220206200532.2758493-10-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
References: <20220206200532.2758493-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfOMFAeP/6r4YMoph//JpOD0vr4YIHpIZPI2NPS1vTCDC3M2/tsbYOhSG3io+NUcfv332xDNtQZS4xYAsZzItgjuEUjDREZyowfCr3eoie/Q+zwSQK1tJ
 73zK8hLarKaSZaXx94xx1/nY1NSdgyZVVF+STOyCcFpnOlGjwjn/6H0keVmsEASi51tW5Ib3NyGsukrThwJ5c82WcNpNUulqrIraEfNQ71z4dLcvquYUIB0n
 O8jph+EIi/eZfjRYFrQyaYqJ80wymzp4/zVwly1CmOKeJVzNhmAcKKowXcefUksIsPfJehdtJD8C2qTPrzA2ZbO8n89J3XcumCjctvC7yzuUjR3CjTGUqoKq
 20TKbZ/e24OUgqhiynj1aRiLv9ooQDajKZAVCSifuvT6rYp7CZCpPg/IA0csvammrEN+OW2GL1o2YktXlu+vHEqc/tj5mw6TzOx/D3R6jvyjKxZJS9GqnSnw
 w5/+dzTYiVpPl9oGwlWlyayS2Sfd1ejtj8tnpJkYJA9eF52Uw4T5DvxfACFyIZlxNGIGc5I/BW5sd2CNouUNnM2/NAYZHZVPO/UCga5+LuqD3EH7cYHXIwEO
 rNz3IkIje6E8sPCI8MRaZY7I
Subject: [Buildroot] [PATCH 09/16] board/pine64/rockpro64/genimage: convert
 partition-type-uuid to single letter notation
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
Cc: Sergey Matyukevich <geomatsi@gmail.com>,
 Alistair Francis <alistair@alistair23.me>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Romain Naour <romain.naour@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pine64/rockpro64/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/pine64/rockpro64/genimage.cfg b/board/pine64/rockpro64/genimage.cfg
index d3926f2df6..4b96a3447d 100644
--- a/board/pine64/rockpro64/genimage.cfg
+++ b/board/pine64/rockpro64/genimage.cfg
@@ -26,14 +26,14 @@ image sdcard.img {
 	}
 
 	partition boot {
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = F
 		bootable = "true"
 		image = "boot.vfat"
 		offset = 16M
 	}
 
 	partition rootfs {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		partition-type-uuid = L
 		image = "rootfs.ext4"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
