Return-Path: <SRS0=D8Yb=P4=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92695C433F5
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3E7D6610A0
	for <buildroot@archiver.kernel.org>; Tue,  9 Nov 2021 10:19:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3E7D6610A0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A94B80D8D;
	Tue,  9 Nov 2021 10:19:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id N9As0jT-8A5E; Tue,  9 Nov 2021 10:19:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5772C80D77;
	Tue,  9 Nov 2021 10:19:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9A4461BF2C0
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9643A80D77
 for <buildroot@lists.busybox.net>; Tue,  9 Nov 2021 10:19:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id qbafpCWHg8PI for <buildroot@lists.busybox.net>;
 Tue,  9 Nov 2021 10:19:05 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0641.aruba.it (smtpcmd0641.aruba.it [62.149.156.41])
 by smtp1.osuosl.org (Postfix) with ESMTP id A9B2B80D82
 for <buildroot@buildroot.org>; Tue,  9 Nov 2021 10:19:04 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kODFmziIdyoivkODUmOZsG; Tue, 09 Nov 2021 11:19:03 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636453144; bh=CPWdfdIuZb4wbobXqrAuYwI3R6uLddtwKQhoxj2tsGA=;
 h=From:To:Subject:Date:MIME-Version;
 b=SQwmWwW2YNGcAGfoFkoBDODXDf8e5OgZBUnNMbQ7k5dk0D52FhWhUNElp2qfJzFbY
 n/MvuGQna1Z6AsO6Q0bKJQo79mObbzc0UDGIKt3xUliZiElgjwbM2Tjt7t6WziBQ28
 avv7C6WBu9b6nI/ZoZuB6YmLN2BNuHuknCCBH8m9whUm1wXOShjurcNkNFHmSlnNgf
 RK9xZ/p/OpBZhkNBQUoSj5X2WChbp9HYi/A5J1ESbPjAEiLLV1onGNSNPt5+Z6Nnps
 NLgynfutNEtkgC5lrJlX/o7QWsSTlrhXMyTV272p0GTNgDowE3/7PZphLKPHQrlBrM
 ExUscaxMtf6lA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 11:18:39 +0100
Message-Id: <20211109101844.1132067-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
References: <20211109101844.1132067-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJChIP9wt8VFIREf/WY2UpGI0eUK5u5njpcx6DWeI0gVsm9cwYOKxHg7bUmzfVIASpbePUs3TB6L3YK7xKmgmB/XRZXalVY6cdTRxwwtngSrZPIEb7da
 6c5cBmVuI/7MdAGG41/9JH/vMa4MB/ku2toxf3jG8D9G5xaudFvU2mbeWL25jjbrB1emw8dDbLFO0cUaTyNK2TsrEtdeWmGpq2/BLwkcAetIktxHGx5T6YT3
 NJAKrgtZ2j6kQgG3hgNvqbGIkAfkEhnCgJzCLrjeRQcTOzLeoD6T5YBZd/ujn4/S8QFWJvuT4YSqrBXi38BUYTcxI+AnF9bj887ITtRLFKmgvNW7BD/R22uo
 d0lJzAwexN0LS7j19S6L5Khzl7QoBv4v6fCGriEJSYIoiXnSB0+8aI/xdIUL2gHTdFKD/VNZ6C56J3gPor/ovAGGLc1KXFjSW+YVoJvXGhHkT9DAKFNBtwdt
 zef8ovzxy5tyBUMk4nn45KsD/E0EecA0gBkOSLaVt4aaEUi+WpFvrj5KZARNgCMgMfw1d1wJjrulIY8CuutC+3ValwHIH4W0x46m9TAIscBKDRhMnq6oqvzV
 d78=
Subject: [Buildroot] [PATCH v2 4/9]
 board/orangepi/orangepi-pc2/genimage.cfg: fix comment
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>, Heiko Thiery <heiko.thiery@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Thomas De Schampheleire <thomas.de_schampheleire@nokia.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency comment '# 1MB - 40K' must be '# 1MB - 40KB'.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-pc2/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-pc2/genimage.cfg b/board/orangepi/orangepi-pc2/genimage.cfg
index 72adc47518..cc8695c9f1 100644
--- a/board/orangepi/orangepi-pc2/genimage.cfg
+++ b/board/orangepi/orangepi-pc2/genimage.cfg
@@ -24,7 +24,7 @@ image sdcard.img {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 1M # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
