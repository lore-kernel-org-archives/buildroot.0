Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01938C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B0445610A8
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:04:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B0445610A8
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B5F26068A;
	Sun,  7 Nov 2021 02:04:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tYeWQ4rY3S69; Sun,  7 Nov 2021 02:04:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id D18A56066C;
	Sun,  7 Nov 2021 02:04:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6158D1BF573
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DE0040236
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:04:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1KtPkKLEKG1S for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:04:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3F1B3400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:04:39 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXWzmuS46Ff01jXWzmqLW6; Sun, 07 Nov 2021 03:03:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250618; bh=bcKI8DJ9In6Xjx+UdnaimOzyR8L0+Au9W9UV5mx5JQ4=;
 h=From:To:Subject:Date:MIME-Version;
 b=Ck/6eGVN2z56wSg+60oAcSPIRI4n+ZncUlUHrUgWLPx+cZ5BNmNA8hV0tgLaXAxBy
 oFZcue/jBSTyREYpJx5Q/+D/MR37tdzg52iHd5m0RYYLhhsC49gfmDXTmYsXW9X1Py
 0YOyPKsrzLGsEwGn6y01xG83NOi4Kcsk/NtdVW/BfT4laE1pMQm7l5LgDvoP500Vqi
 pEfKOlMHXTPbdE9mmNojNmj+d0OPeVrngFQGV3k0dobeNwiuT8NdI3aNTFk84/E7/N
 jel73bwVGmL/UdHwUWZXc90Kw4X/yOH/tzjSSk6u2hArZAcpTln2l28Gi0LmCBE2gZ
 H7LRdtbNvPJsA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:03:36 +0100
Message-Id: <20211107020336.3056910-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfH34V2ivOD3vkPYr+yxBy+pwKFQ7MxB2+MUfUBefUKecZ+SYW63omew5j31aDScur87T+YbtsIK2g+Na9OkPsGklRCzDs89b79HjUV0pO6vZ+lzHC+N2
 bsOdQ2e+QfnHWNNxzWcyCEQFSFf4/tHbVdqdoD1WnFgumGlBWMz8sM9BHHHviSWXueaAi7iK6IQTpD51507o5XCn14V73/xJZ77XVpqma2076l561ePxTatd
 xV7T9Po+4MyNxn5qeZwh0xay1jXSJZan1MoVFwF26XKvaNYR1ZcjA0p4xfJCbDztZ1yBB0VvblX88NfcGniw7+EnRuir3Z4ahNbNbvAx7kf/YRY3TvjnfIjy
 ytinxszieSQO/Ujls4fuMX6us0Zhp9OSm6xoA/n1+XwA0rjPeJkUO5e7oOcD59FseZ8TUnoUuM/3AE+Umo9szFJ7biJ7BvQlzTyec+KqyOYyvbygTwLXFvPC
 GYERuk13MFUtNS8xhEhZ7l9otsvdTU/PiBQZPShyPUcn17HkJTe4b1oBzgfujuAVON9yj9ml+smErTJJaQ8IWKviRpSIgmphGLO+/GKJLmOFWsK9gS0x4GRq
 o7VCGFOUXCwf9RDJw2ZrTgQCTnEij8nyoPITiKn3zfEpSXtSY81L5QiX7fhqDx7VgtdyzOsKgPq/SRI7w6wcEOkUI87KAN92Ij4uEjKFBjNiNhcfyLgceJet
 Cd6ctNAMLFon9Q5wD2OZixCzug973+5wiO3k6iZ1bujmh7TYOIWDy+gnen/MiTTxUfsylpdIoFAeUmNHDLc/IQTeYwkUsLMPio1hnp0FMfl1T0Yk1bWBclFp
 2rJSu/79RQDr0up1zy1M22mSBxc1fNka2Ajn/e1A4elqW3yyvj//v2mC23qSasFKQWtt+ONVlefb3UAmp8rVkL058mE0q7qHzJBo95pDC0iFwxK62T36Bm5t
 DfCyG+RiptKe1gHFdKV+quN2r/kB/6Htl7x5Mn1Y+Q/d2YAzKdtwfWGXcTiHitky52sWsGYVkkL5qHD4rE983zwKdvnS8rxizuRvKY3TY34yhQjVmi6Dca/F
 aQXVcLK/eHqjRtTKnu9ifnD2nnDoepT1y9eLAKS9wb1DXA1XxbQmt3vxvjwBGiWr8qTB46h/JdcdIPD/zKNGdv75MzOSjAKyPiid9noo6XTaS+09YwCCxtWB
 cvFe8w/KSnJ8QKHZ77GYuwzh5KfX0nVULj4P6/foxsz+9LBHlkRVqf6HMPYdFsKCt7Q4T0oUgaGzFhUWYzuUDR5tflUxJ9cP3rV5u3lPQbNrxmosa+W6bMUW
 9abxd7BGi8NtTyynOGga9fczXWSfiCsBqeoan4/4npB2tOuMHCI+WNWmC9ey1Od8Bet7Cx+Pv/BSZvOM5IM3dmHqOvA6ODRsuNZoTlIS2G0hTFS3E0Ti/G7D
 mAjs+oYEblZlSVjNfwZHZosZfOTUbXbnCOXHb0kTr/RwKazgGGsgpMFOBglpLGHCeNxFTr0zCUMu1yco5wKJGMXIKIAY/QN13UBawMY586lbhsHSl/qBzgGU
 YJHRvo0KKt0WjgienVYW9o10EY282rk8Zj6ABJjwBjXMItz2PVjlwn/mOv/ho8sOnNlsPTYasRXUzSPPRcyAcoRwHAxJVKAAKpvYHJBjHsTlu8LPp1ZzgAGh
 RO3DvE8YgVS9JtT4eOJOAyG2lNYtcxEUyPcNNH6Y6B16hes8Rr6irKz07i/mW4AcIxfYSucplBhDFYJhtc2uQjeVqLL5J2Ut7KsrE2xhA2CJrTByrbcsNA==
Subject: [Buildroot] [PATCH 016/102]
 board/bananapi/bananapi-m64/genimage.cfg: beautify file
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
 board/bananapi/bananapi-m64/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/bananapi/bananapi-m64/genimage.cfg b/board/bananapi/bananapi-m64/genimage.cfg
index 9730d8faac..52127167ce 100644
--- a/board/bananapi/bananapi-m64/genimage.cfg
+++ b/board/bananapi/bananapi-m64/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 64M
 }
 
@@ -16,14 +17,14 @@ image sdcard.img {
 	partition spl {
 		in-partition-table = "no"
 		image = "sunxi-spl.bin"
-		offset = 8192
+		offset = 8K
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot.itb"
 		offset = 40K
-		size = 1M # 1MB - 40K
+		size = 984K # 1MB - 40KB
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
