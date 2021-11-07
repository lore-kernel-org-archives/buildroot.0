Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6D1C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D3FA615A2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D3FA615A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 05C3060628;
	Sun,  7 Nov 2021 02:08:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id sSbeh45EbO5Z; Sun,  7 Nov 2021 02:08:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5B577605A9;
	Sun,  7 Nov 2021 02:08:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7DCEA1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6582D40249
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id x27v0XIoHXQR for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp2.osuosl.org (Postfix) with ESMTP id 405814023D
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:15 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXZVmqRRurIRljXZVmQwzk; Sun, 07 Nov 2021 03:06:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250774; bh=/1v9jHiHJYUtJFkkBI3eraRFOzBg5wWjjQ2qHb8RU90=;
 h=From:To:Subject:Date:MIME-Version;
 b=jL8dnUcQo7DdGBQNrobZ4vlFfAVlvmY6nzqCcLZhD+skGgLqZwZ9aKNKVKbeK0+P2
 GCqm9GVpuSc8jsZt/3zFYNbH1N8FP6WScIGOxeJgBxjsapWUih5fsnRnFs7wpPsH9P
 ItPJUvalstqDqtZbvWjO6oq+6q18y+QlwEdF2m7ydTjFOmS2h4NZGvIH9FEA3zmqZx
 sxMAz60sdb5N+zR/DAPN+UjGMFIvAGkn12OoSRVzzrRAitzzDOrHtT9NXFvSXHZkgW
 U2OigaaejEjYJtxXdq44Ji5DIHXTYBzD3+3yCTX0CRCqimvjmuThXg9mWWi3PK/Wqy
 IxnnC00ugp8rg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:06:13 +0100
Message-Id: <20211107020613.3057742-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ6rCvzm+Xp2mrJRoYUCicbX1wLpMWR2uXeLxREhWBy1+JDtLxTzxKRK4Zzbi8z32b+Phbbemx0P/K/PViFQ9VeBNruNPQiEW9swlKoRGfvuuslQxJCF
 p6XsJIX2y2zP8+BNr1/XNuxh+LtntbSW6Vs2l9bnp/z8JcHA0EngYjNyeMQRhYh5CpILhGai+SDj8wHQ5VKUftADTtMLWeSEaHSqQiU4bAuLh/WdRFk2e909
 ypUXR6saHTDlnFOnSVUfqFczoPbX+uT7vkCmQeOFpzchWU1bvG2h0+YqkY34vkzP2dTVC/VMlV56sTW4GrFpakTfueLiOqo26zhHyREOIQXjaXQASrGAWOrk
 kvtTdmqlNi86czM8mt09IJHYiEG0a2gwNTFi+MRI1wpscZmrmlhse/ubXDAgkYJbgJ23WgDK+tl+DP86crO4HRuu+Cm5vU+hgFuUMrno8LmmnZ1fGYW++rTm
 WFG4qFcKlAtjYaH9xIk5Drj42umUJKqhRW3+DnGfjX9etD7ERbRE4PygGsyg789+abDy5Gnqpv1XgMlQ9cg4mtKtTrfY2iF3h0xnFq/3zNSzv/pNr9taRxOO
 7V8iE5aSY9hRpryM+kIa/gYuszOYjzwbgg1s9ssF9QI1125aFBTQe6laOFK80A5aI/IvP5u8wHcsGBSaPGW7K84dXxStMsQQVDBRoMsnZU6kqghgRtLzNB66
 4Vl00a4ZIJa9o7ZceE5/oh5Q+8S5c4bWtwYS5aupDmOqsyTWyTsh3l9H0B/yuvfmyYhTAnw1QQjLRtWQ/IMcVfNMliAgrHthw1Rtxti1rIjBF8wJelQ+W+gV
 RoO5wHKfbBMzSf5AaAK6KU0ipXy6q9tTIR21WpRk/RzQIS5rB4KesonVTLqUuWo1/Re6J6bMjPogpGLyHl7sNUcoffx1szgLyroOpOCngNZGyvEnXEsBJji5
 Yo+HoSw9ciwUNgtIeh90LypWq25iKR3AwW34lp7wcy9smxOpX0I2T34Ol+tFcRcDRrJ/BBtBwTBhaoD42BUBplaf26TJBBjW/X/37BvP6bNmbH0MDaviTMJo
 omiLcqtvVM/xpZ91Saz13GXwnf8zWbAjAbzq7j++Lg2rRqbjlxvnPYqR39dH5Gx/QZH/2ZrZc3gZFfbtAYRJAoLiZWJgbAGUai7UXyaxVeEiHm+/e7dHXAqK
 RyYKyTiTJrbOHdh8dUKlJU0elsnorEi5SQnZY1pZx+L1VC/qlHpC6W7Z/cQ4e/eHdFY5863cFumTCmDDxedD46mgapwLUasOjg1TukKE1y2oOBKtRS2zr2aJ
 WN74EQaKskpjdCNkdJr9c5ilIhA3LhWSYyjbUEtOU6HjCQUSTRfHqkaePYOl1FH318qB+9S9rH8PSMhl6MYVDnQ8oJ43tolxqDsMYK2Vs7X7n6Rh9KoXcm2Y
 xEEiAr9W5UW+AaNPZahQ+c/dlQUrbqz8GPdpQPSNWIwfuWGg9bwu1H9s7VFJRasaCYtETzUyTiKfdrSRiGuOtZX2dno7Vni7+6StYuACXjy4qYFyLNhX6/VY
 3+2AbpWroruTvfkAf6sWhbmR3YR4i7J4zp2wY5Kb7pLEZuvA2nGMY8q7m0kwdTS6kQECm6zJ75R5DJqyd2vSoV6vxl+q/AdoyYgnt+pJRplvYoGS3Nu/8+ep
 +LqCmBAphUI3TIT75SEKXdFbxWxoz6Cmo3pIn+9yLoygnG12RVt/5Nea2wiSmxFlH7rrxrnFrJVJ7FsOZcKWQ7ZptQR2sKKHdmhudj+lsJcyHWzbY3Wctg==
Subject: [Buildroot] [PATCH 028/102] board/engicam/isiot/genimage.cfg:
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
 board/engicam/isiot/genimage.cfg | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/engicam/isiot/genimage.cfg b/board/engicam/isiot/genimage.cfg
index dc8c20db5f..4e65a70110 100644
--- a/board/engicam/isiot/genimage.cfg
+++ b/board/engicam/isiot/genimage.cfg
@@ -5,6 +5,7 @@ image boot.vfat {
 			"imx6ul-isiot-emmc.dtb"
 		}
 	}
+
 	size = 64M
 }
 
@@ -15,7 +16,7 @@ image sdcard.img {
 	partition SPL {
 		in-partition-table = "no"
 		image = "SPL"
-		offset = 1024
+		offset = 1K
 	}
 
 	partition u-boot-dtb {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
