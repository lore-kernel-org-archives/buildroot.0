Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01C34C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id B897060FC1
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:10:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org B897060FC1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8E7AA60683;
	Sun,  7 Nov 2021 02:10:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id R_OAVmgcoK-s; Sun,  7 Nov 2021 02:10:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id F393D60666;
	Sun,  7 Nov 2021 02:10:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 498221BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 36C6740230
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:07:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rRaGG03jyVVT for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:07:27 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0876.aruba.it (smtpcmd0876.aruba.it [62.149.156.76])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2A13E4022C
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:07:26 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXafmuTpsFf01jXafmqM7k; Sun, 07 Nov 2021 03:07:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250846; bh=GmM6ktc+TqST2O3H2NdpMW5m6hoRXFDf1pa4KK7clwo=;
 h=From:To:Subject:Date:MIME-Version;
 b=Hxr7aQa83W/85VazfGDIdL7xLL4jEqYLbhQfONIzbA/y1bc331EPbxUjMxfpTeNBf
 eWSulmdJhquhaaPjBr9PuVPg+dGdJh582qyJWdwz3fW4yRUnUk7mGrKU9kj/dwuvdz
 HVGgLIPKvZ8Xzu6coxd4cRQgscf96p9B1tIP8Ua1d5F+nteUgNKqWHU5tfUQawlrVh
 iS1mPz89C/UxoZM4mftNeMUTffXalj+t1aj1L5ZNEeeDZAa7DAL3Zt1ird2IKVAU3H
 7f8pkwkYjEYqq2WPgGDQedDo79RCnNC2GdhYNZ44M0eeFgsRGyTvjjyPu85lw8zDvD
 SmJ0InofEN0aA==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:07:25 +0100
Message-Id: <20211107020725.3058148-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfAoj2YmmDL2M5cPkFScZVEHzkf5Kn4sn16A+rTwWU0o0eu4zK/L40X7KL7PgKEi39XWo+VPl2TMGhmNzBHlud23x6o7jXPFxEFP8p4tfqVOzuJS+NyyV
 Ew2yM1PFSgf0no5VgoDQhAqBZeuUyhjO2scBQ1x2YignW/tz2xcf/pxw6Y/7acW99GAT0KlwukRh0zozhdGxtCXlum+4UvuY2nbEoomyuWyOU/IurVx74JDr
 jXaBCboWpluBiiaLDCfSZYAyxxYNfdJB7snCwy9lKGYQw02JDt87R3QcRRggZl6nIEMMvPrtcV6wKoAS5wHTfS/o0rFPpkUVjIrwjACRS3B78SMg240Bna2T
 UB1qgTthsUJ1n+Ys/wpCaKZ300AAPJMENSP5y7SRUVpKi1lzbKuBfz2uRG4clqcTjz3WJFNEq3O54bFTR+QKIfRFd/JQmhGlxRYeJKLJ3O2zAWIEOpREhDjy
 4b4yrfskIy3j+1OJXx+CNL1YgGAKSLe8QDhm6y5FHrKMvfIIu6xGHGK4EX9QTyRVZTFx0AXZPShD/741Yoj9z1fp8NfPVOi93323mf0Q8JpxXZ0zMpT7m5V0
 ELNRO+RD/7dDRV99VJxt0Mrbc97ZHCq6sNo2GTjAhODYArbjTmaOsWIcQt88MmQrhvYNp4L4RqbUwYZFf2D8RHQicqRyprWtXG86quSI1SbUDyZegWm0iHwe
 U3ZMFkkzqQD0f29WB1dmzXxFbqRB9WdX6+9tJ6IiEtj6ZUGu/HIkzBDyTvCPhRKY7j8RwZF5MRj269mOhWWx3OygU6DYqIB5V/KGYaQSNmCvoT6Uzb/5mgd8
 sSveY/iofaxeSZoc1Fk0pljpvTpE68pSGPu634Etl7JfB7ZP1UaDd5dDHBxXNkX9GpEvsrGInlloZmI4Q96k/bCROaaJswWqhgvWDh7TIjTtX7pkRIB7QWsR
 KIyH1TwHhcZitpa71dEPyglzR1f532uLS6c4nvtbwFbGkGPcbt1YYcooaiVwXOy5nLOLKUKYZ7SEHargL7Oo6DdlPlHC728Hp7esJtHRf9esaUTJuf8k8u8U
 qpko7JcKy1Y85qCw45Fpag7IWHKW8GHekwHEcBzJh2n1urYW6mjo/snEAoTfhmPBmjr6ieOfQnZ8hWL3qghXm5+t9yDJGkh6qvgedk+l/51eL64vDX/VwP1q
 PazLRAt0UfDiqjVjyHTsAagOvpsK/Pik9MIEMf6XZTiy+F0D4+qUN+s+lzA413dBSNtLHqjPM50W4sm3D3qYe32MFSW7Xp3jb/1CaWrv8sjznFd6OK8CIxx0
 Npg9XGf2KPUwYa23v/2oKNnyWz/VQkbmB54JYFJYK3Kd7xhGDyJA8XpJv+sYPg+daujJFoxWV1BkZCvMRooBe1w5VT1x5PQq1IZHuYAYoYR6ieIxgd/lZ0uy
 opnXLouxVkEQaSNaDmbpZpb07SbBfKCuRSmQhE8LEXk/K7ZHhd/zjogcS6OoPDVJ4v4gmRuF0A7/pxDXA+IvAOvn2HeCMsunVEQWMDqmuQd+6KLgYzKDVWh7
 pKthzfajzqyhghxKzJuFUzFSzC+Ha7oCiT3cfJhpIweYFdDXbnCYXOWJRyW0sndih9GWpwORm+n8kw4M0mIh0sqtzTvlOAyHT5XjANctRxTD+WObcUieXLXv
 l+HXAmWdEjfl7cqiAUspUbzPyQDkN5fzbd26xDIif/it+2fYg/yYmKsRHF6iw4Li0aLq7NMIBkN2M5kYsXDk0NPNPxG2bh2NIj8aJA/YBJJCIgZQE45aTQ==
Subject: [Buildroot] [PATCH 035/102]
 board/friendlyarm/nanopi-neo/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-neo/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-neo/genimage.cfg b/board/friendlyarm/nanopi-neo/genimage.cfg
index f6adc4af3e..92af667552 100644
--- a/board/friendlyarm/nanopi-neo/genimage.cfg
+++ b/board/friendlyarm/nanopi-neo/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -16,8 +17,8 @@ image sdcard.img {
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
