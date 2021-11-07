Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DF42C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:03:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9A89B610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:03:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9A89B610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C4E380DED;
	Sun,  7 Nov 2021 02:03:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lz8Gxcy5HXs8; Sun,  7 Nov 2021 02:03:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B49DF80DC9;
	Sun,  7 Nov 2021 02:03:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 6C3CB1BF578
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:03:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 558FF60666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:03:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id KzPjRMc1tW5m for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:03:46 +0000 (UTC)
X-Greylist: delayed 00:05:02 by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5086660628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:03:46 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXW9muRgJFf01jXW9mqLNv; Sun, 07 Nov 2021 03:02:46 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250566; bh=yUsVnkzRCmSzhcimlK5AmFIpt/6wBntP+7eGr1rlOWA=;
 h=From:To:Subject:Date:MIME-Version;
 b=NOBr4tyal8r9AEobDNXgYBaclqW0y0CfUYUBZeCEbu+qX85+w9WRQGS2ZejsVq9Oq
 WxQ0RTN+nMz9SjWusFfiO/Hg9oIOvk4Yf1AO6/LJnfQjywkxo3GPcrDuK3GaZt/SFe
 wowpY+WEtS/y4xAPztwzrO02k5huLI4bXPOrCZ1LHUVubcZILWCTiEW5EDx6hE40JY
 25cs66kbj5EWswL0W569JXmVdnehg1q36F5/WwXVfP5p08Uf6YtOxVe1XGA9Ni4Dna
 rlExhYUOGuDELipH4RP2Y90Fp+iG5STWr2uj/7CzG+uzwrQsR0d4AO8xhGYkLwdp5Q
 xGeNfwAb3c9fg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:02:44 +0100
Message-Id: <20211107020244.3056646-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNN5a/SVeqztkj6zydVqLjnJGURkxrV5n4ghffKrIIPxvVoMoDptaQ8iCFEd4Gm/QrNTdscqhCBG8Bv/yutQeUVz/qBlVIz75OmEb5BwS+GKm5Quu/y3
 7Bi5WxR6yZUZPxk/aLuOgdrA6ZJBAFH3dapvbeMEttOEUc9t6m5t9smgXQqIxDfouqilTvOV8rCAjSLbjJ/NV2VAT/2IUXJmT+gvDE8B59Gm1QSnn5h/trGi
 ebQxodvVvPy8pecE5nXvZUhYR/MCa0zocuI0iIj4hOt9IPshMft1HLuQ+BHHVbsj8oorZqIdmhzTqt6NLyFKp4ldg4RFHoXTXgIjkfr7MJWPFyJirQRLItyE
 a6Wk8cufR8WAhg0TBq5CVRB+M0MUSH65RXRCPC+L4m4GT9cTEUUKn1b0knImgstGHhUwYppb85ZSI2c0RxaPpwkpVZARg5JxSIf62SdE/FtBDSwruEr7l0ze
 KesVxek9npOVNw8cMc2A5Q56xxVbLkhst6NmaMeGvRd3NwoJt/QoxIZToqYmoegwwVQPgUogQ0fN1KszblCa5fA3osOO8KmsjAzETsT3r5VLM2oNYMcgCQa5
 vmCr6NuqauYEzpE+zdDq9OjrIXusxNRSOwhkHyGibedAzfnz+cMCXdXgkTnHCDWhyTXIk8uN5Zdi8JVgJF9NWklWTrg981z0aQrZkxxJxCHao3uIr58JlzTA
 Ikmcv7Qyy94hYrVPggnanEipDFWthKuzJUfMK3oYvgcO+oJi6SCSC97dded2xuNzXd7HxdcfzN8r5MOq7lrIUDdtDU72GaD7bhbDiW4sBb976SYUStpBSBsr
 ZR3NJphvp2BERgKEEIStui3V5j/mHTyXUwVwjDg5QQtrbNwWRisa8/hp+0WnrzvnoPk7DT2XmEI6F9pVLa+3I5/zt9GZnN0rWFT7DFNli9LzC9LNoEvyFslv
 Xa+nZfKfPaWWGtLbG9lraR1LqaVKFpisbY9o5gVUSxlzpe0a/pz5ai0jytiU7EAEavXSJqW1gVhLLzqEY+95hXYsvCUmwUhD5Fz0ocpiOkIseo63OyIgppnw
 LXO7FrBwN17VmM6lp2EEeZRP9fCYRct+uL9zpVaoOZa0Ogh/PErlDC/g4CnpHl9/12ZZsNeGlNa5WPgSpvfC9Ss6oKhb7IHpudD+wMMNZHgskbR6iFZjNTBH
 nZBomey/qXskIZtMd6+IC+QKYMgPukHkGewVp7Fk77vOU94rhy7IOJle/cTc0Di0xD+aByo4nWZ3L6V6JSZc6lHQPkoHg3YxKZH0d3+xLrmrE2bWEqY0+Xd6
 Z3fYF5R/pFSBH2mZIeI6vTcU6me+Bi5Rpgr7Tc/AsCX5/Bg0yRinirDtuTF4rMaJyLwKgqiI/LVJHKGXqIf/UTtBpx0x94tEDLCOpJ3/VqpbrFdiN3w6tXO+
 ylVPbFigX4cwMgj62lbm6Ig/dlXr3OkOtUSBXLJV8BlMoEy+hkKkuvh+w5dezxInQTClaqqdVeVmqtwSBknZfP1zog41Gk/xgUw5yntTxtDls9nQKIj2MbhP
 nJTSApHbXZLuDPZfDBOnrRkuLMQXAESOUOJcrB/KAilZi+g1r0BcRrdTjbIfeopviXZqluMYu/fWbjbAnUqDC88r+/OIi9sQv4qvdBK+r326SxsqvicYTSl3
 y5CQ0/N6BNgqRzHcbaNu4oziKqvqlghL7ZTyn5xTA2TUcYNdUACstGFbD6BOW+jBI3h5hOj/j3WjFNIAESt1dn+HVF6g1GBImhtrVj3YeIT0yce7S/FpJA==
Subject: [Buildroot] [PATCH 012/102]
 board/atmel/sama5d4_xplained_mmc/genimage.cfg: beautify file
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
 board/atmel/sama5d4_xplained_mmc/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/atmel/sama5d4_xplained_mmc/genimage.cfg b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
index 004f2fddb3..bd929ffab4 100644
--- a/board/atmel/sama5d4_xplained_mmc/genimage.cfg
+++ b/board/atmel/sama5d4_xplained_mmc/genimage.cfg
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
