Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D36CFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 9C0C5610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 9C0C5610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2468C40236;
	Sun,  7 Nov 2021 02:04:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id TyTLcj44bvdK; Sun,  7 Nov 2021 02:04:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3C19F40232;
	Sun,  7 Nov 2021 02:04:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 21C8A1BF578
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:03:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1CD7880F94
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:03:57 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbH9-GXcRiP2 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:03:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BD8480DC9
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:03:56 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXULmuQl0Ff01jXULmqKyH; Sun, 07 Nov 2021 03:00:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250455; bh=js9+Pk2CjF/neUlgp+PKsPPB6XF6IR+HVPchgqLhhJQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=bbvhymHDUFt2ZrlQWmSDa+mnzUZLmkepVR7jgQBDREUKQtDsFrp+NjzojYwQzl+qP
 59RU8juUVo2mTPNGcT0LyxifviLHKAcncf6c4IoAzMsFZMIDWyN1v3ls9+q7BdoRM0
 hxYUy/KniysBnVUWJUqHnsmqAnKMbs0r/pE/PPP7L8Okaubtx3S17cA1K27BYPBE6H
 dWm9OO8PPZ2QE+N/wnQ3mgkgnAenvFTl/MictseFOjU3E3VgBoeRLw0xjVP8bpojLp
 nVcBtngvCfxZ601fuxn2DPAsE+EgCM9l9kE2opazlNSFQD0A/ojpeLa58tMl+Cnfor
 pDUJjJpcNzKLg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:00:52 +0100
Message-Id: <20211107020052.3056168-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDATurusixpb2QLsZFmFhOjd9aVQBSj9BlNpIOR2Wiy1JkDASm5znyayBo1acvx6I8hTdjyAI3wJPLHKoSZLK4WvsImLrqhamBgy3dY1ovnsY7eHlz8i
 68KH4OyNebyubXHgkSlw8PTvIVkQP58jTKlDCHkIJVnTozNrFyr5OzyZ/eR95i80JuG4PMKrsBbjqevh4zbeiFYiCjTRpFNYk2TQ9LEqz3Cvs6bX69q3p6oE
 rexDz3szAycqOq4eNrpvHxf54AsBtehbJxMte6gH5V3qgJ4b9AAsvdnKufBTAPx3ii6QOkuRToEHMi/ndBdnxkoHJxrsLdM8lTV3/vvauD9AaCBFn22sz4TL
 rUThsoDZ8YS8x1JAlztvBmf3lTMYeav0BvkFauCF686mWxbpbWjlleYwfUKvrilKCEeZrc9C8Vd7Me+crkDxrMUN/itINVfrMuWmxspnbrXHtnFHtOCsB7ox
 5uXHVAiQxuL8yj6HZpVdSoFFcFbv4MHg37BQfNvVQuZUYuu1ICZTq9VqjMebSxh8cVktHliLIA7WCxp3LXQ/11Cip7GnHgVkpjTecKx+mT8uYgvbc2tCYqSu
 PdSEkVyyASRxoKR4ysVkV0HIivmqmu2L0q2UhDlOF4ZzwJ4lj1HSxa9c9ttRmq4KrvMBikJL9r5KmlwcWdXqCGcram69FtcNPjojHCeA0ULjkcsJLwru1Nl+
 w/6rWiHD86XF1Av2PAo39q9Cxb2e2CfOalRs+BryU7Ws2li47bUzMV8fgDWYCOOqZEyspYtyVtQ9j9PxigxlwGSqhjONuMx9zwCXJZdEwNDoUmV92Ea17QVH
 AC8B/nMGqXfgLhy2PEwWOjHlRxnqblDUUKJEwq+IvAGj7QBz7x/Fmn7B3pNwVeGGZjD2o+17+NWcqm3+5cRDmbrtNKoptiyW2q4uWLjvU3sxjLFzyOhZurqw
 dYOc+Uhcm81CsM5oDDxaF97uT/xAQPqT0P14Z8WFvr+O3SRL3fasvEt+m8EDdQKc5DiWS9HS2CGQUk0NoREzAvsqeCE5k51hVElsMv7OH45qa3VcoPf9Dq6j
 8UrmgwtPaQkysYB2GCt+8cJ6DPEf3R98GdtPw9CoOzxc31neNkW3qO3OuE+vYx/xYoY0q6qNb3057v7USbWm6SFJFwycOuOgX/Rr4sKsiyfRApR/AV6zJj6F
 LK8ou2xt2jIfiRhWlh29a8w86rPS3HaWQtI/QDwYscLpXuAbWTbTgxiNB9OtkXHutMhluwyzyUBpEPaWfnGoqYdLAxU0YkjK8p8P26bdP/urQ6q+E3rx7E2w
 ZfUuMZxatinpmRVPOw/ygV755w2bFXrpyuh1x4CTaWW2BdjxCE5zZiYqCZXylJEgHBhXf64LoNmAeCF7wBW0NKt15MkvbvwQntTkN0+sN1agTRwVKIzt7C8h
 iV68+3Om3h5UcyOflF9VLdAScusm3RIuKNiRW8HAFBsqISfdm6VCEkIBBPoHGkNO4neGSvrN7fhZVKvP8EuaG1fymz5Ehig7U450cVzxsLYn9ufKrJxrHYZq
 0WbmBErxhiYT9P/ZclSCb8K79duiLS/TBWrDc5IlvfFtaWGbWczdH0pu5G/DEZxyLPAFSS/33mQPNYFOk0gWSibUgMlcmu1rUfcEnF5QupzKZfjz//wKA6N0
 OjlSAK6Fa7dzqK1LAUeD3nagzn/kVWeQmd7/bYeJmSv2l6k1ANwKN5BOCK0cnQfhFzVjzMvTDceBzaWHTJVgCAFR8wejFvyAx10dFEvJDA9ZJsgPti/r5w==
Subject: [Buildroot] [PATCH 004/102]
 board/acmesystems/arietta-g25/genimage.cfg: beautify file
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
 board/acmesystems/arietta-g25/genimage.cfg | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/board/acmesystems/arietta-g25/genimage.cfg b/board/acmesystems/arietta-g25/genimage.cfg
index 9ab8a6aff5..3b67a474cd 100644
--- a/board/acmesystems/arietta-g25/genimage.cfg
+++ b/board/acmesystems/arietta-g25/genimage.cfg
@@ -5,15 +5,16 @@ image boot.vfat {
 		file zImage {
 			image = "zImage"
 		}
-		
+
 		file acme-arietta.dtb {
 			image = "at91-ariettag25.dtb"
 		}
-		
+
 		file boot.bin {
 			image = "at91sam9x5_arietta-sdcardboot-linux-zimage-dt-3.10.3.bin"
-		} 
+		}
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
