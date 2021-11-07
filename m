Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39D28C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 013F3610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:05:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 013F3610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D604A60666;
	Sun,  7 Nov 2021 02:05:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id e7lMbkPRRWhq; Sun,  7 Nov 2021 02:05:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 463DD6070D;
	Sun,  7 Nov 2021 02:05:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D8EA91BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C89F640251
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id up6UqqemYgyL for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:40 +0000 (UTC)
X-Greylist: delayed 00:05:05 by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id BA1F340249
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:39 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXXymqQBirIRljXXymQwJT; Sun, 07 Nov 2021 03:04:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250679; bh=PCVEVh0jGn+pluT0R1cN5GiszjgfG4GLHHdEhXhUIC4=;
 h=From:To:Subject:Date:MIME-Version;
 b=KWtMsjbFVREw9+0jWJF+f6TYaCay/UHGadxwuuzEP0uab4ZGjZqpmE6D7iSnzQGhL
 d32shPUGL/5WHwF7jpN3EuOtqWGivxkDYxpigHIoOKaqs3mCkjSqHU/jsub5068qdy
 qfDskLhXCuNSv5lRjHaw8PIvZ8JE2CZrGCe2nuZkBvl30h1YX06l6Qkmr1bdoGb3b7
 Fh2yzx7u3sC6Hrbrnki36cfI/W//pzpt27kuBZ/l7wBexelO2DdUSeqYA8AZTGB0CZ
 ID9PEn0GJrHJLAN1XGQbFZDyDf7VC1xi8Lsb8rkhRDGb6s96RtPmy8kdFAom99Lo0d
 pFaA+7BZQ3WAQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:04:37 +0100
Message-Id: <20211107020437.3057177-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfPzEqahIb1jrGflAgRmSzWRMUvCsKo2tIYKhANOVmdoCkuQ9yAQ7sZDaaWPTBlMjMD5pPOSQxBKF2a7fTxiSPL9UkPGxS5mJ2lKEBjUmRwIHGxIaDggA
 w1EMKxbyfT9SdF6VRbDfnQpzKm0qpl7Dotbk6mEPkvY3cQpIg/i8AYdJsFwUbH8G0/yYCjPVu3FhPi7KbJhdjBguXiNkiaoZ8kxtXRidSyv7dkx0yE3EuhN6
 J0sS+U4HCWA+KJObrBXsIcfaiqYcbTHtIUJyDZoDSWPKUQDqPDPE6Ln+iVXKwIbYcRxyb5WyuiB5CdIeUat37veLJXvwouBEZXG/2mMEPkMwQ1FPakIcXN8P
 W96+1I5B5iDR5eF+ZVsCeLSRSbhQroHmGTl/875PEnzH1bKMQ6OpWnIVyVKXHWhuJJGq6ML1LCnxQ2SellG9fYmHtpJH5xZFveIP3w+FyCGvEQTYF3Get0Ia
 yTnrsi4uszOXbX4ypM8e+FDaPh0Udn6lDM4adNGWr2r8z5v3/4hR8E8HKiv3yDiG11IF3dF70OAblbb4P2q0uXLc1ciLPmIn64QSqgcC/6oQcj64aH+jgCFx
 CMS+jF8z9g2zaoWHSZQb7yBArgsPk19uctqjd/6xTZA1JcTXyU56bfVgqtY8Im5qimCpnkWwddC99ZWVLEDJ5xeczvk9Y1lTHu/yEs3vDoK5O99DSw7gxYDi
 obyte3LIm6yEJ0hvwPz7oSaUJsRZpHrfa0pO7Vj1rCq9MURn0g/RbQ4YOCF6L3Oga+2zGH3G+2Zj5VTP8KOYB/xbMfiXJYtdHCVeyKXNjgCuu8Su7VMhW5O3
 Ap1sM/JMW9OBfaE1RmUNSeV6TPs6dg3bEHbTedaNPpiOg+AQUduRuMlw0mckW37Rdypl9HLGl0LB39zXcuz7mSUkHhkkrt9xVk9FHdWAJGkwLUjHY1RxI70Z
 QchsANbmhoIqBHCIYDy7Bsc/hY+13DyBOaMnpNwXtSmgd/5YY3AR0n3K6luaNZg/d8B5YhTYtVsEPvVFJlVAdxnNLERkFaTCb0fZj7Riusu9fXMoUtIR/yNG
 GJti/hdxdR21FbCLA9yNYJHLnBBbl0AUqwtumGaM84v6ACH1HDv4rF4xSVwTaSaGs3A1Gq8JlkLxrzpoT8UAcwjyH6fINQYq2g0Zi818b9G6lMEJQ/TnvCrs
 bBPcGh6mYHpQPCefsyKscMaNJhHGJPeoYlCMWVXcnYBOghbBZ2CPgZwPMLtZgjnYg24WFz8xgoR4FdBAmraXp0sFq8nENDjKtpBfehhLPaNQ6OgU6m9+BXnE
 YrjVOvgtc19UqDDNnII4ZGU50zypLeB+pXPoZI1hE8c/KPvs85JU5jv9aWc8j6EEbk/xhQkBiEJfqBJPct6uhK9Nygze/UWc0nhKJA6YzkGFm25VfLQk2qPC
 A3RePYWzHoNuhU1oN/+jgmoQVd1N0SxNJLM9F0y50v9xXoS2o2PHeIx9AMD0ovxDx7D+VkudtkoXIjfzajSTiZXYsSMRPHQt/CBteJ+9GaNyVLyv+sS1r/i/
 fruEDaU+4UKWz4QnbUFaX8YjJG1t4Qyuj+xB43/N1l9pwT9xmbd7mzTfDFm5CUMr/mRul4xz8jUcC5f4he9HQubuJxPnFMh2BJhuViB8XgznoShYvxjv5yyK
 Zip0OgVQul0nYdW+U6u0F7q5Vg6D/YWajVbfVXQtV2ZeNIBwZh1XKC8wTYlOrCJaKIg/nPB8ST2yi1bth/htstQUnHkfDByLXgdXhvKTiPXkbiDWQ501sg==
Subject: [Buildroot] [PATCH 019/102] board/beagleboneai/genimage.cfg:
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Theo Debrouwere <t.debrouwere@televic.com>,
 Nicholas Sielicki <sielicki@yandex.com>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Alexey Brodkin <alexey.brodkin@synopsys.com>,
 Mike Harmony <mike.harmony@snapav.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Michel Stempin <michel.stempin@wanadoo.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Dagg Stompler <daggs@gmx.com>,
 Biagio Montaruli <biagio.hkr@gmail.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 =?UTF-8?q?J=C3=B6rg=20Krause?= <joerg.krause@embedded.rocks>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 =?UTF-8?q?Vincent=20Stehl=C3=A9?= <vincent.stehle@laposte.net>,
 Jan Kraval <jan.kraval@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Peter Seiderer <ps.report@gmx.net>,
 =?UTF-8?q?Cl=C3=A9ment=20P=C3=A9ron?= <peron.clem@gmail.com>,
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Filip Skoneczny <fskoneczny@gmail.com>,
 Sergio Prado <sergio.prado@e-labworks.com>,
 David Lechner <david@lechnology.com>, Davide Viti <zinosat@gmail.com>,
 Nikolay Dimitrov <nikolay.dimitrov@retrohub.org>,
 =?UTF-8?q?Micha=C5=82=20=C5=81yszczek?= <michal.lyszczek@bofc.pl>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>,
 ARC Maintainers <arc-buildroot@synopsys.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Pierre Crokaert <pct@crookies.net>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Lothar Felten <lothar.felten@gmail.com>, Luca Ceresoli <luca@lucaceresoli.net>,
 Romain Naour <romain.naour@gmail.com>, Martin Bark <martin@barkynet.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/beagleboneai/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/beagleboneai/genimage.cfg b/board/beagleboneai/genimage.cfg
index 0bdfa64d38..8aefd76ef8 100644
--- a/board/beagleboneai/genimage.cfg
+++ b/board/beagleboneai/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"uEnv.txt"
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
