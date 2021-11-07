Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D7B4C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:50 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C5293615E1
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:08:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C5293615E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F6BD4022C;
	Sun,  7 Nov 2021 02:08:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id D3uxxo7TQ_DA; Sun,  7 Nov 2021 02:08:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B5AC94022E;
	Sun,  7 Nov 2021 02:08:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5AA1F1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4A6A081BC2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QwpyNeaT1plx for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 73F4E81BB2
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:22 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXZcmuTMvFf01jXZdmqLz6; Sun, 07 Nov 2021 03:06:22 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250782; bh=Wqr0K4v1ABU4N5jzadu52Nt5FKxSw1DfAXfZMX/K4Tc=;
 h=From:To:Subject:Date:MIME-Version;
 b=TUnc/sEGj/GS4VROR5zgZfts1+HutGW47zXJbl1kcQQK6ED8s+bWV8ReLa2PBs4n2
 ZykhW1L1g7Aar+Lj7fYZPZ/llBJvzF4JnR66fl7AMmB6hDQXK2go2Sie0Q+8rVIBjn
 wn2cTzDumrqoqj4cNElpoujlHy9UlTTHCGOyqtGbtrgKvyn1qmVV2zJnn410osAWzU
 mQuKxpLtxDHcWvNEPyMXfT67Uxe5pyO8iGaMXSW5nTrr/T0csv5bQqoJxlt284urYr
 v7YqyyE+Hpy3dleIOvvJYb3HAlMQGclu/wDMr4OXu9VS9sQT1saFm2QSIJa1GJ/H89
 FGL0wsqfjLKgg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:06:20 +0100
Message-Id: <20211107020620.3057799-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA/4tTUXB6m8yM5H/hpTYTteTKrpJbhmKTfI8u45p13R25WiMNtlmTGx5mBX456GZa5jAKKCUVgw3cT2Z0wZuBgGbdEztBPIxtRu9lgyetDeUQ224Pjw
 /PrTRxiyMTz3QIIzataTYrlzBHePoIWpCChuS4V8L5P6ze4h/TZeZ/rfyLqMXt1SPhHT5BRuTyP/v2X6rvKRINFTcB5mKKWdKE6jbWCwhyomBe328aDCvTch
 gHClplI9TZAV/wE94AiCxmzWXtx8vu3vG/C6bimtom3Ef+jMTlt1xbzUVYzN3AyM/ZHvx5mSHhWlkpxn7XGGRAWfZW/UY+F+pN/YrUOESuz9o0UPqgaJPwLF
 T5Q0TPXdM3aEtya+1AYNtUTunIGYn8c/B4TjA2M0ABQ40JqGeUuSSwYkm6OTycsEB/bOVApj+oQ3Fc0LlbgTW4AycN0/A2Pk14LTRmk4yKwz2KtStVe0F3HQ
 fk5OmiOFC1IR3HAILBYcS5MTYIFdBE1CAJca9WoefUZ02Gtj43WfmiXNWEcaXq2MI7FWpEXbIE/d5gFaWtNRp2foPfTr7R5310DZGAOlh5asjNNdafReCHtL
 0iKGbFCQfPVaKuP3LUMQaBGe1HB2gGMhaxc7Rn0e3rWrUJ5txR1W9nnn24MuZISGcWqQFzb8b9uODoWFpxIpvErk740jTjUywk0vnr4s3P4l9V6eBfQwloKP
 m3e4ku1Cmrm34JLtTeaKHhBUabiNbwWizJFkH/Cqjy1qxUWp4nzhFqggU0WaYa7SkhBV1tDwy6ELSZe0JqjlkDCK5+KLmG4g4IP/rZ6lVFzjAOGD8zVmAJeC
 uX6zlqvRmspS1ow0ZVJ2opOVi6NIn1juSe0iZHBA5PnZZjyC5EPrgXoO94zlLfNC0+N83jX7gptDdbqOBy/CDVFP0v9XI40JeXm0znSXbRQxTAJsPHi6F/NP
 DoWN/x5npLFNooFBjXqIM6cebBOlIxrsIbdIdnK8XKF8qlPNSSg6KTcaWuUrKGSViFqAuWO4rJu44KhZSnR7s93Y0XgOLVTfQywuTMDYaUXnushym37stUte
 Wy9GwkOJp//tl2wPQzCnDY2hG6Xu+1U0KQja6Fhb4/pQrrc7TYTF+GZHQ29G0TWEfvUyPAdlX/mi6Jx0SR/QVbJ+cSPbOYTjIA2NmDVarMROhtKBXvgXDqCZ
 N3brdK92mN0ns1bPHDg/THyHHMwuY2A4RYrXcfCAXDm9XJ8szMJiPJrKEvPHvGJLAUAA0qEMttoET0Q5DIlwUAMilASx5Q39RmN/ZMv/F41qVzJk4KNw0Pek
 LO6Z6X8LyXIh/huGUOqCdYcT9x10Xu084ZtCOIjz+dF11TSwqOyQ2Ohe386LPOQgj5Q/2jyihU0WDCt3EP5gdVjKSoFiNDAXTJC0RBQbWB3ZpWgcIJ0sCLHW
 V5YM7IiJZ7rk+Mdngl8oKcaY5L2sFp+tKfzdXVV9Qa3MyuNs1tcPTX/ARRNSCxI+Upv1M7Cd/mFoFpJ57/5bSlcSLP3v8TateXaIByjzz0MwsXqvIodTmU0U
 9v2m309MFbH/LoCDwSK+yQHSz0w+N9H+YrBltYHl+z3WWH8SsPcRnuiKTO2pYmB5hsjy+nNxZiauLKMK5xc2HMz27z/uDT7Smuyc4Jm8Dh9hfJfI3Fcc/VNo
 mujWqJ2tfmgYqbIPZtPZAcYGSwgEeOQt+1nfSx2jf87Xh4ppjo3qUtcj9+KpMzVLMWjeYpHc46Zrd/5bYk4BoAxeDgTbiUyiVILdtuY8wA8CF2jkFOQpKQ==
Subject: [Buildroot] [PATCH 029/102]
 board/friendlyarm/nanopc-t4/genimage.cfg: beautify file
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
 board/friendlyarm/nanopc-t4/genimage.cfg | 60 ++++++++++++------------
 1 file changed, 30 insertions(+), 30 deletions(-)

diff --git a/board/friendlyarm/nanopc-t4/genimage.cfg b/board/friendlyarm/nanopc-t4/genimage.cfg
index b3202f75d4..e616be6349 100644
--- a/board/friendlyarm/nanopc-t4/genimage.cfg
+++ b/board/friendlyarm/nanopc-t4/genimage.cfg
@@ -1,39 +1,39 @@
 image boot.vfat {
-        vfat {
-                files = {
-                        "Image",
-                        "rk3399-nanopc-t4.dtb",
-                        "extlinux"
-                }
-        }
-        size = 64M
+	vfat {
+		files = {
+			"Image",
+			"rk3399-nanopc-t4.dtb",
+			"extlinux"
+		}
+	}
+
+	size = 64M
 }
 
 image sdcard.img {
+	hdimage {
+		gpt = true
+	}
 
-        hdimage {
-                gpt = true
-        }
-
-        partition loader1 {
-                image = "idbloader.img"
-                offset = 32K
-        }
+	partition loader1 {
+		image = "idbloader.img"
+		offset = 32K
+	}
 
-        partition loader2 {
-                image = "u-boot.itb"
-                offset = 8M
-        }
+	partition loader2 {
+		image = "u-boot.itb"
+		offset = 8M
+	}
 
-        partition boot {
-                partition-type = 0xC
-                bootable = "true"
-                image = "boot.vfat"
-                offset = 16M
-        }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+		offset = 16M
+	}
 
-        partition rootfs {
-                partition-type = 0x83
-                image = "rootfs.ext4"
-        }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
