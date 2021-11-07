Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FA53C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:38 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3B594615A2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3B594615A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F8E5402C4;
	Sun,  7 Nov 2021 02:09:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IPWKRL34B4l8; Sun,  7 Nov 2021 02:09:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6C35F402A8;
	Sun,  7 Nov 2021 02:09:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3055C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1F6A160666
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id nQR2dlCWcARI for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4821E60628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:54 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXa8muTb1Ff01jXa8mqM2m; Sun, 07 Nov 2021 03:06:54 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250814; bh=4MM1iCzuvO3oaO3KOncmrE5JdGhQfVfi2PwmEH+pB0k=;
 h=From:To:Subject:Date:MIME-Version;
 b=jsMoqEenBW3s3TCFtWy+tI7vjFWvcPerTC2gLTEPlPMFIQSyxQ8Ge5l1d435NDSNo
 JbrR651sOq2BvB65lCNkQEfJaJj8Vr5cAn33hCbxycH9CB7B11VNSMDub3yLSgO4kf
 EsEXpS22QV2Fmsum4wwkMGyFNiCvHuvjGCVzdwAy72a/eSzhgulUFUy+3uP8zIWFQW
 n4zdPbSmP63n5w3BS0EhD8ZUtmtnG+mb9MyHUhmOvZ0Xe6tIS8c0YSM3c68r4UVcc9
 RmxtndA9MAOwNkS3jXOCmb6rut6gQP3bNQBT54nAXjR0pwOl4sLUotZgDweAkyENVI
 AtLjdlC8/pL9g==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:06:51 +0100
Message-Id: <20211107020651.3057917-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfArAdU/saqloOUOuCtxF43IYzpT+XCGmOXCRB1RV/fhRcWhMb0zw5GZmRxevHbp8s4KWaFI19Z0LUHrX+bXghrgYIB6PymJ2iz8l4Cw/PTb7+4zyQaas
 GX4JpH0uBMobDjgexnzIHzdbfx8qB72oZIHiKMNcA9NYaV3R4VYz5vgGOQEMT8nTziM9qt8oQeIbqpFPSrCpr+597hrqPhuiUKeedy4BZEGkggQ1sL5NdxFx
 PmFvHMIMYjiZhudroxvjcM4Rsv4r7Xit3tHoudD3DxRYWoBZjGQ+AMt0w11Xdbpkbj34C2HLCVLAl4n9u0nHaDNpsonXDXD+0WiB4uUj4m26Cr2d6C2V8Ymy
 tRxbBe+JHaHZUT5p6tkdsl5vhS/mSrvH7WpZfnXH0VbbdFrY0KSev/xEY7ObqEagkjNoFIxt3PDVXg4BAf2f3OX+erYZDfoLOEStimiMxMcn8hWn/EnTlCrB
 3FgdVKrvApWTGi+CLJ2BRWcquZn4eK4IIgn7y5mbEgNRp8lsCfNBdi5yc1SOSrOTbTSato7S7wnK4s7ubdgeEJuFIZZ71P8kmWug4geX195EUvG+fNFErGAj
 /vU3Ph/4vna64YWbOVB13qyYtSy0/ENhPEKbObnzbtow0N/dXZh3rjkY03r/xp10i8i9r5ESxOe4O2idBS4wgZ+yCUWk474OiP/yT8TD3bQSm47w99x3v0qM
 7A7Bkgy36z4T7oc5jFM5hQ2gUIDIUlkE8Beb5fOomdat7eri1EIlkCyoV6bgTn5sp74+z5OoicwU+h480qrPB7ZKi/FVRKLG/1I//kJ5Qq1uUGWAEf0xm1ra
 Pv6j15zKFqFu11t0xpJVmgHnFfSxYjeim4OS/IISsBCraAUyvG+IfANNQtwgH/XXZHLmnEag/iSJqKVDd64+xfb3U2IsWi6IbLDwmLWcsbCFcoXaZxJgpxLP
 //R2pIMHNVrNexh1UKjqnOyzTLa91Ju3mp6FDGFXihvjyq0rAQR91kYJf7EvPYs55ZF1Ig5qvrK22Xxf3GsAIf4IHUKii+nCIVPxQvYjoiREOMX9Oh/JX0Vo
 HfwgX4FW3av2lhxqejANBrZRcxT4vUjXXJ+jGbHqosF1D21Eh2y70PCKYOJ0QpNs40ZCef296deaQYK9lNhZviWy37NwRCnQbeh/02+7en2SSyAJFch7F4SF
 80FSF0WM9vWFD+X80rIxWA0zfOr9tGUERyqG0dLqGW1PBfL0dQsd5IQWjDjNKoaj0NBbt1Uy2Sh1q2tQ2XsLvjaFUpwpRxXl9zdvF+rnYdpcPDAticTukPjX
 2nqSeMFXkoOB6RwmEGulFd6Xsqq7M+PSyXMOHzHjqStmkG46HHbN02SDCNhuoMWp8gq/zo1fL+t4a5ZdmiPjHsfkm7sFKhFSMZ+Q+ZXbv34EZtupmoOhO0vd
 vkLoNgOnRchZ72/o3zqoZmCB3Eg267g6N8sL2xnS8g0FqQV6926wZG/81FVft41+dny8wxp+lyOGsrxxVyvJKGtr4PYuxgTRM0i051WM5zLVNJetcasa9d9N
 lqmjL5L/meK+Si9lxmrOEIBlT8cM3Mvkiu8W4nWvu4mm2AJX5n2vTumj3dlz/+Y/VNvElc9mdUGEH/hV7ZTG8Rt9fUncdk4O4/xNNox9O2+ee7tfowaPJhHy
 zpbZzVccz7bFjIIQ3m6MxRnF/OWCN//pgjTo/IF2LJAh8v5TrHsh9E+4Ry/sy26AX7P/kklwp6XhlFHZx1OtlAaTD/sjBUGgy09u/MkyyyezEVx1X36blg==
Subject: [Buildroot] [PATCH 031/102]
 board/friendlyarm/nanopi-m1-plus/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-m1-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-m1-plus/genimage.cfg b/board/friendlyarm/nanopi-m1-plus/genimage.cfg
index fdb3b90673..5257cf89c7 100644
--- a/board/friendlyarm/nanopi-m1-plus/genimage.cfg
+++ b/board/friendlyarm/nanopi-m1-plus/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -18,8 +19,8 @@ image sdcard.img {
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
