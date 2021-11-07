Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C8ACC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:27 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D0E3F615E1
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:09:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D0E3F615E1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AB6D580F86;
	Sun,  7 Nov 2021 02:09:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ctb78WbklUBg; Sun,  7 Nov 2021 02:09:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2149080F4A;
	Sun,  7 Nov 2021 02:09:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9946C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 87F4C6066C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:06:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eKNdr5cFJn_B for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:06:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14166.aruba.it (smtpcmd14166.aruba.it [62.149.156.166])
 by smtp3.osuosl.org (Postfix) with ESMTP id B864D60628
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:06:35 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXZpmqRjXrIRljXZpmQx6d; Sun, 07 Nov 2021 03:06:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250794; bh=zxH8F9pFu4f4+UeARfFQaMqDY1JPRJ8FI64I8QRqzn4=;
 h=From:To:Subject:Date:MIME-Version;
 b=EMYR7UvSvYgBM8TFChu1qKjBGhPhNvKhBEx9tUQEIv0HUUWUXuyDpIuEwRjZSMC29
 jndODgJELG6oEa9+kog1ncP1LQd3ga/56O6u1egMOEAFVZioisIA6i8W2ciiPS5bh1
 5vptK5RiFZN8pwjB8uZfZZqh1G1lpLDr5KT8JhnQTXiATFOkIx5kfWhCoqbGdYjfJa
 TDlhAUFpS/MmwlkrN1+bqmPfWexUdZ9iF7mJYaUAFx51oZuiBMrQ1WjdPhyUlk2cpD
 DWgZcblI5BTJyLrJ4YBBnhthFZswToNzgxcqomBjsbQ27kIIfvfgiHfOnQauhVwviM
 4ftfdGwWFlgpw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:06:32 +0100
Message-Id: <20211107020632.3057858-1-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfO23FiXP0Eez98RsTVL/fqesd1Z3CTu+CpZyc6bc/qMFsV2dV5X5jcC7OVtUlVmsuTdIpaPcsAhDlq2C2Lucgz/+roZW+bKHgIUdk6GBdhuotQT7LlCl
 LdL5sBu44n0iBjuDS2mh9GHJwCY6scOyHV3fa6m7I6TekhAZFUamo/kbGmx8IWKiJw9ilGn/kRDL5WfiE1nzurkxacOGAnZNvke/O3Hwbooxy5X8iVk0FOHs
 ozj+6EYjz4DfhQ6jV99uXTjHp0GXzECzAGxVp15HxJSN5inRvcmzMwSf5OVPo3JuyJrOykgmSd8V3K4YWEvK920nRWkU5Bqamz5sUe069o9b38mFkKtnmqE2
 g69txxY5AaR6lFvJ9SalcdyyED2OnXrjlE39WCs6Kn/vx5LuhumfvCuNfm7/QMBPLlRHyflPt0/l5gJfin4XPEBplgVH2DH5q61gz3dg1mN6M72MWE8FYsnh
 EzpahCNNkE6bovnm2Rk8vxgw0904UzQBlDV/T7/5d8BQu5OlU42zvxd8ey3Npzgd+G6hlXtEwaqgebDeeIsz69djttzPio9oAduSIMazPo/2t9bPAE/t+2fx
 nfz7JgVFpkvtt9ZmExCT+JlFT/03R2CQ89hB+Ns4lgVJYLxIsKGK+9/P8fHCGnU0wJwPUE2A1SK9bc9IkLVtA0cSrIln6v7soJKQ399HhUe47PUgoovW89yj
 XOiAkE9hItJ7Xny96M9L/6oLVxo+YGEJ+gycAfAnfkX7vvDPg44GyykxFKh2pI31zGxCZg+mZgcgulLRYH4k9ZzuhPbU1FYzHx7KcpAMc+wc3ENcuB0H1MdK
 kK35Y2ynFHqevGRgzT5wLzu6xW3vbuysoOP+R//AD44ltJvSkqqXe/ePRRVmbYokjosHlE3mQGUvbtGPrEDM1y5SzSZL48OwUmUr1oaQ9tBpo7TBzrKi3SHR
 xORP0X5QIYO1XVVlzyigmy2FiiBATLmuh7S7Sldfr1kFxwNo5S6RWttIulO42AW6RUDg/FZb7RLk/S+LCm7aDabRKdhbI/XktAqXa/ZpUhS8fld10cHOdvkk
 EXWLG0O/XYNINiSeoLE2hakReXr8cQEygf1Hv7gPZ/sezmxYvPSlhO5Rk/aC4dNgMx/gXDwHeEAR4jP0XLuhRjqupgrBq3vMrq26kB+IPkFxNUpNcMHutRW5
 uOMIm5EWpkfUlt2wo9O89Qre20AtHNtyBloUOZ/66KYPWgHl6firkLhv/rwdWvO+RJeb6HUZZfJC6dsR/c1JJYpwxc16Mo87SLd801fyPBwr4/AyONY4cdHq
 sDt4taCldo46pRTawEtrQCOzK1nc9WCFStZWelvK6bWp6S/5WVg4ISm0eDx6bVW3cTen93g4zAv53wJXxvvvkpAb+2uu1xG9JEl4AmBgp+TOAzQ6bl16x0fu
 v/6JIxnmET0ShOlRgGgHGryTmp6/Bomp1OyNBqemf1MEL8zyp4kB0iVtKqT1AvuCqL+vd7asKjTgZDM7Ve2a4DUjMG+ejDRfvCvh0yNZHgIJFytLpoDOhgOG
 0AQsZ3K5ZJW9b7xkjPwlQcOvhpf+Mn77qZsSGmryZIwKG/mfnMV0VIghG20nKYhChNA3DukR4VOwlaqrhtTo1y6ocRfjNtkqN7BLDupV+D53zp39vT+Y4SLP
 4cC2oKcY2H5XzRR/Xvef4h4ATYBmoysDWjDzz3yMRnhSv+1I3co0fgkUniLjY7oWJ0dGgfogSoiIvD8Zr3np7hTWbkNXvMAUzKbLNJ7YSJYg5Q78W0WkYQ==
Subject: [Buildroot] [PATCH 030/102]
 board/friendlyarm/nanopi-a64/genimage.cfg: beautify file
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
 board/friendlyarm/nanopi-a64/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/friendlyarm/nanopi-a64/genimage.cfg b/board/friendlyarm/nanopi-a64/genimage.cfg
index 66b6c5f461..68f7e3e63b 100644
--- a/board/friendlyarm/nanopi-a64/genimage.cfg
+++ b/board/friendlyarm/nanopi-a64/genimage.cfg
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
