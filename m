Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DCFDC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0944861440
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:07:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0944861440
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CD05F400DB;
	Sun,  7 Nov 2021 02:07:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id HCYws9Lcp4TU; Sun,  7 Nov 2021 02:07:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F3A184022C;
	Sun,  7 Nov 2021 02:07:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E04B31BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D046981AC1
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:05:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RYxNuY7mO23t for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:05:22 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp1.osuosl.org (Postfix) with ESMTP id 06C448102A
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:05:21 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXYemuSreFf01jXYemqLnI; Sun, 07 Nov 2021 03:05:21 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250721; bh=mPEihuBZ+3GN0meTpQxNeSo9FS6J/WqilpT2YZgXHu4=;
 h=From:To:Subject:Date:MIME-Version;
 b=enMhd5Il7VTWA3s2v1+TPx5SjvmK6z6btYFCy2BBQd2JDNhjZdPbleuuRqfrpJn7Z
 VFXHkyZhFnQqkI8y9/oFRxQNbQ7VUWd0c9ia7IjArNi5qT2ncaYUgVMlzQ2sZx+QL8
 oofZEYiwFDnWywor0Cb83cnnbr80Wr7B2m3DePzUoyPDzyebKAs/4B+UbsnAb4dUoF
 KfZDeO1knaBS/AqozYfPJA102b269gR7qKrJEPAkBbxaVQTfWglxoyMJtFss5xn+q3
 vbbW0sYKk4Wc2PwPCdBlMfv6ehn79JEPCv/mEW7B6+48eX7Nbl3IR27GFEYAJIRg3q
 Z6FyKSVBUHxzg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:05:19 +0100
Message-Id: <20211107020519.3057454-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfGJTDAYiSFYK+nMTldSOCXEsQI/XbYFXr88nGWLuMvvMne0tLYr8A/dHBJNMfduiC4Kh3bF4GzhMdRqWKQp2hqpm+IfO1sT0hbbfodUM7MByVjJIFunl
 ItdHlQuijqXOay29j++oB6PAFX433k666KpvTf6VsulsCwsRkdVg0KeHQfDRp9amQeavt5JR669Vem1G5V5luF2oQQyU5/QKELbRQ0FGuhoFTsSjYIgf0xc8
 ESAFMPTbrA1VQTvyYW2KSWaCeM1hOnGADsu9sjmHqwhUX5We3DgtZyLLG3uqdbA2+RKfgxwfdKBVOVPRtjRt3RiDel6RnyDS/ip3bFdydTFegH2Q4wXmlONt
 WK0Bj5NH0riBvtroDSwaf3+uCP3EvkGy4SFa5IcBL1URlJsS+aHDDC16OH8svr8gyt3vHSAYEkyPKxw1eC0lIsQ0LT10R2Vl06/pWrW7uTQGSlkUfNWiYOuB
 j0Jbvl6rgtKkjpM2MDmD1umW3KGzU7vcaePh/54NKDJlaqL3oUosXKTeJTs7qqDwh+H94SNHkJQvdPmd5BUZY0l1BLJCy4kTRd10DWrHtb75X292Nwv5QoCM
 wtYexPBVwnPVGW9+/gXViDr8H+foWxeO9BhldjOVf8i1fd/MhUsQnxLS5+zsBZzHVJimFYyIK9R0gP7rR10UbhzKWZxn/QP2NDiNcUjJ83uFB1NZmwmxsDfm
 nf92WmyN/ZdG1aUSm8w9Jl9dy144H7SiTtBlmJbuuDDB352lz8REN2U744TyLKIkMQe1seC501KUAyeR/1T7VbtSVWH4k0y0wHIr6+k2KOpuXJMv9tZbaoUQ
 1+m02Oq+VUxjnHYo+wIqWDvKMeNIRRAEx/W2wtXaqoSKnkSscXqi25IZncpI2n8yClSDBXukZu2UTHSzNlMuC1078tNEHZZ5rSZpr72K1KlEOkjhKi5mHuGu
 6qQ9ELexO9jTVw5+AcWXemGwMJaDmRXKBkdWULdqvZYKxzxD/qGotQx/DDg2Qrszk/mEGlO0xydwJXq5WmaNUs3OSIZJJiyuayklXrfVaOOVm/myWlrL+Vdv
 ok/1mr3oPfXnR7AtnLkAv+TfasV1ZOdgkiEvz36QFvh93RPPrvkVrEiHHERW29tPbW2KFO8QlbPnVW41A/mHp9OxbvD0ONfbtk8yysrsrHw6t9H991OYPtHr
 BArdGGceVUG0L7pxtcpuhouwqbTJ5+8LiedZCPpH34x3iyrWy5VeMPA73Z3x4nrS51LLQopPPq7TsGFrYpXEfkFAyZeojD0QHGQq7RRNAaZfKRTNdmV323Wy
 b41HHtg4nX7V5CfIOkLv3Wt3lYWOqoyNwX5sZUp7X3oThGqx9imXU1G9pFIlgX0rLB9s7aN7l1sneR02b3/MusFdM4dTq2iFWbpJBfQJrChAPx2PwTqy9bqf
 eJF5061rPiXU4X2aOh3M55fCgbPRi/fjgWSwpYl+IXAIbsur90EvqrCuEwfSj7QcUN2wk/JJz4qK3NyGxzoKTKt5wMkwkW6ccEWg1pbC2AlflEwdaLglFgah
 4D3ndsGi90kliSdz32C1KD8ObG0BHXUAVw612iFnDGkYpRClEBvXLXL1yy+KPwB24tZAW/HUvXiZrFibfozJudaMWRlEAOvEMkHsyTg07ZFtMod+AYW0wRhk
 ggymx2nkXA6CLcNAmxPsycC6EHIoCEpDlm2iTZERaPMJ55Bt4ttuU023h7y7TmAQVr8+6MypxU/+ICZgOHvzTKlRxNaBQslEbGkPKaZz3c/yaSRdN1rOdg==
Subject: [Buildroot] [PATCH 023/102]
 board/cubietech/cubieboard2/genimage.cfg: beautify file
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
 board/cubietech/cubieboard2/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/cubietech/cubieboard2/genimage.cfg b/board/cubietech/cubieboard2/genimage.cfg
index b082ab0da1..5ef10ef135 100644
--- a/board/cubietech/cubieboard2/genimage.cfg
+++ b/board/cubietech/cubieboard2/genimage.cfg
@@ -9,6 +9,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -19,8 +20,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1040384 # 1MB - 8192
+		offset = 8K
+		size = 1016 # 1MB - 8KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
