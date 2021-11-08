Return-Path: <SRS0=Mf7g=P3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D7BC433F5
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:05:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 133BB619BB
	for <buildroot@archiver.kernel.org>; Mon,  8 Nov 2021 23:05:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 133BB619BB
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0CE0607B0;
	Mon,  8 Nov 2021 23:05:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Uc10Sft6sTQF; Mon,  8 Nov 2021 23:05:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 46AB16061E;
	Mon,  8 Nov 2021 23:05:41 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 003A01BF97E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F0DDF6061E
 for <buildroot@lists.busybox.net>; Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JzEzNGfX6qqq for <buildroot@lists.busybox.net>;
 Mon,  8 Nov 2021 23:05:26 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0987.aruba.it (smtpcmd0987.aruba.it [62.149.156.87])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3A378605CC
 for <buildroot@buildroot.org>; Mon,  8 Nov 2021 23:05:25 +0000 (UTC)
Received: from localhost.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id kDhZmJJDJNGRPkDhbmjCBD; Tue, 09 Nov 2021 00:05:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636412724; bh=kjHdXl7nrCqM17+a9UNTbE4sN1hbN0lP+9vteI5qwb0=;
 h=From:To:Subject:Date:MIME-Version;
 b=CbUaUew9TCVOX08wwwX4rtQwzn3S6UjQ2kR4j7pQ3fdxZzGMlk7btB4d3NJEiU0jM
 dxBkSiCYSIDjVZgjOxGpiEGOR4+y92/VYT8WBkca2cjUjKq8bj4HLQNzPKljNs3VWk
 9NEoBhyub/+R2pNtdKiqpMMf1dlCCPebf6eynMKta6wkg8hfckIw0nbgyr+6/Am7eH
 Ngq9GILyrsrA83WnZx6iR3F3aLP3ZUG2MARm5Vd35X+vR+T8m6L66D3yL/NMRsa6ZX
 ZxfWPUMODZj8p/oIfFP6Kepa2OJillADcPrG2wDvqiPIiZcpxsoOyFkIt+POlxxW9r
 qLb5Ph8mMDhGQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Tue,  9 Nov 2021 00:05:15 +0100
Message-Id: <20211108230520.4007148-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
References: <20211108230520.4007148-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKfc6RR90umNsgrS9qD90Vxy+TQs6LQT7RIGP04Di7kfFjE0YFVpofLhiK63Qyn6ocQ6kclxVv2IJYRPpSQqoST3gIhOm0cmGFpvE9CpGXP2f0CmGXct
 DVXlnOHyjfdBH/soszJ43tRQd+Luo3zzM4CAJdszTmnxWOrtc4e4GkbxEWeTlH/sQzjV8pSW1MjtVPgvXV0DBU6UWkyhCDg9LfJq3VieXvRP2tErbjqM6Ego
 Wk0RFAM1zeUHw5D1c04D9PsVO2NwkNQXl8TFA1yLVmj1JDfnJ70DkyTDNsuMPBXunXbadzXdnKM8tAErfyIYEPBxdh2rEIhGAetFtK1iPXIl5PJP5sCUZ+lf
 YeDNQfI+5V28UM8RG0WiiPx+YGbameEq/HEpVwREmh4W9bqJK4e6HG1Hv7CY5cizmjMNy3NzhCSYUD2niwXcNSU+hIt531/znxnttGD87xHKvAMaMCp17PYn
 h9uXA3TAtGQeV7ZxAUOTXir5uBlUYHib3fT/uMzf76fSmbdFyQB2x7CjPfrDT/EpHYhEx8Ku3NUsZCqziD09y9wqK77qgfrvWGFBGA==
Subject: [Buildroot] [PATCH 2/7]
 board/altera/socrates_cyclone5/genimage.cfg: fix offset suffix
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
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>,
 Michael Walle <michael@walle.cc>, Jagan Teki <jagan@amarulasolutions.com>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Luca Ceresoli <luca@lucaceresoli.net>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Heiko Thiery <heiko.thiery@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

For consistency 'offset = 256k' must be 'offset = 256K'

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/altera/socrates_cyclone5/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/altera/socrates_cyclone5/genimage.cfg b/board/altera/socrates_cyclone5/genimage.cfg
index 0af3f2ec60..d31c3838be 100644
--- a/board/altera/socrates_cyclone5/genimage.cfg
+++ b/board/altera/socrates_cyclone5/genimage.cfg
@@ -24,7 +24,7 @@ image uboot.img {
 	partition uboot-full {
 		in-partition-table = "no"
 		image = "u-boot.img"
-		offset = 256k
+		offset = 256K
 	}
 
 	size = 1M
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
