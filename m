Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00860C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 94B4361440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 94B4361440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 68F9381BE3;
	Sun,  7 Nov 2021 02:04:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L841CVoC4GZ9; Sun,  7 Nov 2021 02:04:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C969D81AC1;
	Sun,  7 Nov 2021 02:04:33 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3C5401BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2A59D40251
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 3R9WdjY6PB9l for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3E54F40249
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:19 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXUjmuR0CFf01jXUjmqL2e; Sun, 07 Nov 2021 03:01:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250478; bh=iPlaLDDlREKV7LlR4GsQIhCavLyCdi0wt1hF4T9QoTs=;
 h=From:To:Subject:Date:MIME-Version;
 b=c0F3DNPQTLkzme9retekUiTmb4WANLyaAOhTa4QImtVawDCCDcAd/Q0fiIgMxWtmB
 fJrwQJpnoZFkqhjCe6VsGbShQ7Lnz3OS2i89AQVzPKm+QlpDFjRxcIN4vAdyagYHwa
 B3HU98ZMs3h8BJLd5dNfZEdM2iwE74u/vRtjdbx5syu4SniUvrah8pMjjPaMyrko0L
 ksPmKmnBulT7BVN4WaICfJOk16MAtZ1UCVPGUp/pdhrMUbrutZva0xrQZvrSmtQ6gi
 DG3dpAWAGpk576FA14jD3z/R/hd7RTOEZSeJKVguBLk+/DcbzqDbsWbR+sIp0FiFdg
 ZyoLfr4D9SAww==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:01:16 +0100
Message-Id: <20211107020116.3056286-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfIKgXT1Ywgv+R4EApHIg4knv2tv9bqNCykK9aWTz1Ob02vWS6HVzZW51YlZRi5Kpz0KssPVHCAQU0hCVilPUJ6w6pBgQElkbwgCBgJxg5pDnTtLrZoLO
 jskk+Uc0/P/WVb1+dkjrJT1WJYo372a8W2XvfEbjjYd4d4MLYDKKgWmeeTc+T39orB3u7EW1VAL2ur65FMw8PI68RuLHL9SJkXpI7C642hVRNeBwIs1WRt+u
 r0HyI0CyKnv/bIqXsTSJOwllE6/Ax3W6MDwxItdsz4NYOSTpBTOsRJBanUhASIpMwpba/8ZcXW66UX2TCuUPyu9VQlNmq2ZYM3A2931fVM8VTgZR0/Dnd+yS
 feT3N4SFXLVmEwJfQOPvGlIkRJwEWPZjr13lhwNwRr3LbjejI2nngm+tSIXT+f6dPtaDcDOtBN/UZ47YwCyeVtArr9LQ4my7BKr8j+UHUNgeuK3ht8zSW3D+
 1/uKHchi2m4PykwZS3zgCvXmduN3X/2z40W4rU+azagAk5HhDJ+4hGPVtrvPmM9NNs9/rLodFKTTkUkfoXZVxeWX58NSMP4F6/VgFhiTSEaEnd+JmxgUA+8i
 hyQzG1qW3MZwaUjujwrWV8MJMtzovRSP5xg9Vtl1MBfp/LrBJC0yuNkCjCb/y8N9cx4XOu8CFMLLfa8rYumcWoY6MYwxI13hoQLYARu8UNBXvvVA5Mrgdzyl
 ctJQVgWiI0gYTzXtjFcNAO5XexpgKl4+H8Re67WStiqvCbu8NoTOefV/SnADGFV10jM3rdtdofwmwx1C3z6wyYtLebffqbGCDPCscJHohnLUvXnl+HbKVR3V
 1Bhod0VS1fikEQwKrCwOPlvPpSo2growuAjifIPvKcA7vD1IdssDU+uexPUFNl7BLSrxM6HgQBobmKMUr2y9jzXQvGv2WSNrEqTsxjzlfEMK2sdLX5ZyK2f/
 qfrTUVp9+ovzCkrG4+ULq/f2mZXmtNnM3DFaA2IyW1pwYmAO+QEONIFGqRtby6Ny4HsADLsW4A1Kr966K+sB1aO7G7TOTroVY+eSgUMMuAGOFwO/Mvt8rx5E
 rDIUbkH+hZcamLxdJJRtj0D9QfffeIAm0la0gsnxmlYdmOsKFVH0OI3HI3hPNA+lTnmFLK+AhmKWFbKwA1AjD6QM0nGNNAsTk8tTi7bViBIuUxsK+0Kr1v+M
 JJL9iiiL7KR+sQrS71ey1gMAoH/xgLNTFmxYPp4Nsv+kTGY/bM+7iv8ar+i7KW5dHV2x+Jy/SaAuK9JZPlDmma67eEfqr8Q82Bkv9+MmmnKyuTyTiN4QFcjn
 dddbILo97bjnBLEcsNOXo+R4/yt89udX4ImMCWJUTtOc6/j+2+ycqOQQvhSoE9rFOiFef8jBDIOUO8pz+7alSzQF+M8O2vhgxqnJXaFPa/d+denhNoQpcUtP
 SrqyEI7fFDGdS2SZ13V30xhdJ/tRzo0JgkrVEdKkT5a4zJ+XwH4kr8jJa0l9beyIg0d/lyShW3X3z+QZncsgtiAVaPoX/1pvS/f/uMNBYuK1qKbhPGR6LBBs
 wJCmjResVcIVby1i7Q+vbD92ew/8MLs61aWuVR95ydDO6Rt9fjmvONlGUCRazL+2LosnQEAhR94NZDx4NZbHeK07qLwnKvvdyE4Ec+0tGpvPgDFN+9NiAsAS
 7O+jmEwxE4T6tN4D1LPWQVR5w0KDLsTmTJiWK/DWzKnm2FR+uMMMuhv+TmhE6V+MCk3hynflqgWPMkeQUcl0qylwmfcsdXeWjhFB899L11fFRkRSvUMP9Q==
Subject: [Buildroot] [PATCH 006/102] board/amarula/a64-relic/genimage.cfg:
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
 board/amarula/a64-relic/genimage.cfg | 1 +
 1 file changed, 1 insertion(+)

diff --git a/board/amarula/a64-relic/genimage.cfg b/board/amarula/a64-relic/genimage.cfg
index 002b6bb4d1..58b607f5fb 100644
--- a/board/amarula/a64-relic/genimage.cfg
+++ b/board/amarula/a64-relic/genimage.cfg
@@ -6,5 +6,6 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
