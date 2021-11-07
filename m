Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD628C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A10EF615A2
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A10EF615A2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 739B340235;
	Sun,  7 Nov 2021 02:09:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IIJq5cmm0JK3; Sun,  7 Nov 2021 02:09:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7F76B4024F;
	Sun,  7 Nov 2021 02:09:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 273DA1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 167104029E
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZC60d7OtFntB for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp4.osuosl.org (Postfix) with ESMTP id 469CB40295
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:35 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXSymqLUsrIRljXT1mQtxk; Sun, 07 Nov 2021 02:59:32 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250372; bh=js9+Pk2CjF/neUlgp+PKsPPB6XF6IR+HVPchgqLhhJQ=;
 h=From:To:Subject:Date:MIME-Version;
 b=MR2nLGRtr3fcu6U3lFlZLO+UItjAW/TL20Eoo/hGkFizKQOPacJ90EHgjt9QGGdjk
 QLVJeVy876vOTgevgeWAdBijy7CUTJ2Bu4Ov1eUN68q9jd96TWY5xAK55oJXBAEYVd
 k8owarcTeLDa2u72A0cygLn8j6/SBwwLMeTK6EHLkDN3VKzBe886uJSndKIESE8LWi
 p5LGAngzH/vIEMa0UqkN2Jp/zDpcKI+h1+8TYsrOWpVq0BOjWqjPnucDWxdpA9intL
 tt0ucykDWCfBK+hqr/3kon6mGRfZzphon9DZ6DvJMBJX+5C2QBXkg4b5ELgJkRcv2d
 OI+ZntDOCjoKA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 02:59:17 +0100
Message-Id: <20211107015927.3056054-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107015927.3056054-1-giulio.benetti@benettiengineering.com>
References: <20211107015927.3056054-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDKUIXrWW/oGr5Y14pABlQkwSL+p/Fbj4wz4K5AslHOph8x1qRUId7U/xe9GvBEXDJrzYdc11PNOB+2hBzqCA9eDlXWygxknJue6lZfMe7lFpEedUMl1
 ikt+DXFx8fQ+rEAaX7SJh9CMv8q6MW7cX2ebohiPMvi7Gesb8jbLQDMfI0oNIpTGWevgRVJnbwvUUoZyngR6YiOtii9Uo4al58zKG8SRSTPq6pOjGB6kMHQ0
 72PYaqP9EzcbUogcK3WPa64hLs88Xhef2NeD85i4HC4mN5Yi0QDE7GA3K+MmwLZKZMYQTWP0PAKOlRQJfWKEgMdNBE+8xFf42Zai9hcG9P5i1rRboiMrbBWK
 Y912EPoCjtEvwR9L0gPi4HQtvjTnlPQUiKxPn6dwYjYVJ8Mo+EkGAZOyKBYbHhGpuclmR97pzh8AFqSFzlcl+0ZJBYBTaKsnFjlfzD2cjoKzfridsEKvQP8o
 9geM5GgSU2SgsosYsmis/vnWKlMKsUitBwW9aAX+tl6G/cG2JubrS4KhiHC9Yicg3lTGfaEimWwgcX5/OUtkKXkKJP7CYlx0edy8/Q8aw3/zwNmyTQc8FWPs
 IPbbZTDRqUuqJByUqawukmciJrNRUpSd9CMQzQsTPSlnDEA72++2nulEAhaJeMGmMQHEXTjFQ7sXxvcQlLik0BMXs41baRTTurRnN0/an7Oea3kAKLWR8i8f
 /GVcfWjkQC8t8IHUvVYgPeV3n4OPW3uhz0qbN+0F5Qn6eK5IvMI0Gp0d3OZHVp3kYdW23o2MwRs0JTE/uCGwvRBrCryYfdigmF55tcAPk34Fv2bk6Ji7QOl8
 8DpXpA9DvRdgRFbSfSsvPcAyAD2v8CGtP36+ZUydR/c4i7Yk27v867kYpxUGhvFtu3e1WcYaoO8Z1EYR0jzVSfp3OXAbCzaIJ3eOdj8EYEMCTpOnXoOWLVXd
 G/qmoWVqtwYvvHwD2qRicRiOD2iGTFRaKqmY2v5dKN/dOrYihr3hD89AL/UUHHh9ycSb5HSxQbdZDWFwEp6TpCptcIDejWDENXKC9o5etmfNPocluYWUOF+A
 3EbIkifSiPm8PlinXdp8OEggc5j1VUv7r0QJ5CEy+Mo21TokhC0li8YXiybaiPEONvBCu74W+9Jn5vievMZFX/jj3VTfsFwFbgCqZ47Tj7nDfEnCntGn56jm
 +avxQ8E+MrmUSN6i6fyEwVrIjHfqsap2c3D9J/YZttTvgWAxcOSI4Y7Hyy7bDisXFwdYRLcc/fN6W/4Fu0IGpd/8oiSVOQJtdmEv/Euxll9oq8GYdtS/nJ9W
 GHWQd28M7au8cP4vB4gtbfePSaAUDYmZAa9Cf8EKD8hPa1DCr4Y9HTS5EKCd6w8imjXn9lAQohlFR01chkiFgbzKYvo3MkYDYxxgdsziVemtTVvTP60E9xyh
 5a/l4ISPDuvaadh2yvP6f+WIAiooLd0OMw/t4z6Dck2C5U1ZJJBnBsYyoCgikR2Dzc2Jrc/haP7twVZEWdg5B/HP+RT4vPUyiiEeraJjlF9Ylln4EhT9T75i
 m6+ZNhe58ICbyEOvHUMiX5CIM7jHUYUxef0/HrrHtot2OgF9HI4m7ES7z2m/4nYMYecW16WX440bgh2DhGaiqJN6Cmq2Ek5+swuE56Xwsv3NezWzgKLfqg3z
 7PElX/tWB0nhBIiPU5qVO5ZHpa+1vGuARiZJ6nYcvbWrl64heub7CaE9wkMn66HxSYXsO+8z4e16oB1nKKoaCPk6AfH3MczLprAc45ivYGE/UUQwz0ROWA==
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
