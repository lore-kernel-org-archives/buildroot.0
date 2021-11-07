Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 832D9C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:41 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 48AFD61440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:06:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 48AFD61440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C1044023F;
	Sun,  7 Nov 2021 02:06:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id inw0k_0VKArQ; Sun,  7 Nov 2021 02:06:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3963C4022C;
	Sun,  7 Nov 2021 02:06:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 0FA931BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0C1014029E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZEnNs3xyHpsm for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:17 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3EA8840295
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:17 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXVemuRTRFf01jXVfmqLKP; Sun, 07 Nov 2021 03:02:16 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250536; bh=BHvQ9z2FW0agVdJbMqumsk0PZ4iZEWxl4JJBxSLWy74=;
 h=From:To:Subject:Date:MIME-Version;
 b=IrAJWuCzTsOvERGnGzqYedjvZDwJBN4vvVSfc1p37wtzv8S1uNnYJvo90QDJbVlnb
 MoNwjHR80HZHUxGQV5nj7D1kXvZbKl8QCllyz1wFwI9Ilnz7DD75919uTzG57yYhG7
 dQy4xQUb/riSwsEbzHf3PDDj/1NWRF4hyp5YbVMSzGynb/kMTSJirRSMJUMYti9k3H
 xSKG4J9RXKuOerswKEMXcqPe/Rj8cCT9+eUs6TnR5jtZ72BnDbX5RFFLmm1aEKT8iO
 nlzrcmx794OBPOvQl8iJjxSy1Yrhhz6Bxrj9kO32TPqkBKgQi5Gb6kcNpd0d2fa25q
 Fyvg93CFCtRaA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:02:14 +0100
Message-Id: <20211107020214.3056530-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFyqMlemh1TUKrLRVkH5myLJ/Y9S0/8ycXXsmJ6Fv9938rn+AoUzVyze+itQ4JYuVFUEJz4VKJ4WzweeT1eBUHcRGSci7/1WsVanrA3ORgfywAB4ZCUV
 vzUZImgEYlhKOAANY6Wl0v/4+iYHw6ncpEP6hlwJEPYclw7ZMoP8sf+LoPF2zadUEreAh80H3tje5PagpB0FUoa4NMd00T/7O99fkRxFZZR+aavwHalqjOj8
 f601eddfl6ZIB9w03bmP2ugq2TUUWOxNzlEX6Y54JWdL+hZ5asJMWFnTYWD58FD3rjVjUGpyIbEwmedADNMhqIJHr3+48P/cNBNMOo4hKvB3BjCm+xrEIHl4
 dndIpxHC6Rlv6wcF1P+ttYZDd5Ee1icfNAXwLlBPg0QvxfLUdBjfI8/b1WxM7WODVGiT39sY4cOATAEpI0MoFl2drIwsxygjmUtxkzdc85/5T/GCDCIIjl31
 pLgwskQzCxjLOpQmYQnPbYvW8VrK8EJeCtZv7zY8QJzOoPnqMqHpH67Hj463ZQMgR+alu+IeV9cLswACz9e/dwIbATEuGmOuioOEbTRAT/6briJgZpU+sLQE
 Gg2prGXQhq0b7hHxEPRR/0SHdQAdkotXQmZDX2pNWPC6dm8YcPTdMjKR54GJJXgbo0f5cm4k6hb1/ubF9J1XsVJQC7LgF1ibdg4IBXIODGyHYPlsrT1iBdjq
 vqpz6FN9B5OysBMxeeF2X56KYNWRthxEBkc4P2l2uq+SQew16xFFzSTnvayebtC607lhZeALO5EZws0829K2fP3O2A44xymA2toUHmCLLAvBxgM/SY0vxs3N
 jjXKq2ZY7eNUrRJbX/jF330ZVPOKJLGBZ812frJpLh8dGEYf8GyGja0flVBeUAkFxlacbd4UvQ0MdDjBIPkeGiB94gVN9jUy8o/268dtYLexvY34aNB/KDxK
 aGRIxmqzZL8hTIURtPliOqNe6YYFWGo6r4VShO76C3coj4j7odARYaJMVTOa49lvCjsg2HOfvYsT9/vACq4eQS12rP1ahL0Y5OChunymjN8JFcMxcxuTqcW7
 dUOK1gIdcpiAQxVgFRT0J0OyolZMG17GRJDKgfB9319tWXo8je4RxBOtM9mWY0NU4Ph9UPVRtxhK0KWbkfZD2tmFF1rHxsM6lh9+xEZ2XHB2MIw+ZfKcNoHu
 QJ4QjFWt4jvp2jX8A0qee7ilef04eWituHlO0fDt+NbiWuXffLr76+7fOjEeBPeXR+O5Hb41Y/3xwwsPIaYLov+NCXpOERVcxitXkQ1ex2WHuxMVbHqdntrr
 0aBHo1iXlv5R1owk7vZpIhcTtfZfM1g0ylLd9Ep+iks4FbWe0HcWPawms3b9Oo2LtLtBY+3VxP1LPnSt3UqYj2Sb3EJOg7yW7b2wtrNHySzXgp3yr+jEaH2+
 ozB0ApltZMJbL0IxdriTDhNLQ9hATNvwjKtRxLD38rvrjuhdJWgtVM23YYXYg2ZcGTFPkb+XiaU3SZIaeG29lBVbdAH6qxip/PwJU0GzvDfPKxBVKLJJIh/E
 aPlsS3dl1v6tol4yg8iwi4holxF6TLD28hrAR45wKZylwcG+1lo/nbKtyjzht5Mi0IkHWcH8jVIAQTziK7XWiwRRAqtwXiw+24q7L1BJv0NlFwdGfB9X9DFG
 Mxe/juXNRGsm5otHV+PQTiXzg8zVUTh4CADOE+knfL9rKs9mK1KXCR0ZNFLUoQ6yaGtAKe89u9iD59ruzCq2N3rW9HVsNjScqTGbzLvSogAyc7B9ta2k8A==
Subject: [Buildroot] [PATCH 010/102]
 board/atmel/sama5d2_xplained_mmc/genimage.cfg: beautify file
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
 board/atmel/sama5d2_xplained_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/sama5d2_xplained_mmc/genimage.cfg b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
index 3cc8ae2f8c..2c5a0f6dce 100644
--- a/board/atmel/sama5d2_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d2_xplained_mmc/genimage.cfg
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
