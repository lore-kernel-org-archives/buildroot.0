Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAB2CC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:58:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7680961411
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 01:58:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7680961411
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E2211402A6;
	Sun,  7 Nov 2021 01:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nhalrW1AUMeF; Sun,  7 Nov 2021 01:58:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 574A84029E;
	Sun,  7 Nov 2021 01:58:47 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 531521BF578
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:58:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 33C496066B
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 01:58:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eL9H1rHvUPQj for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 01:58:44 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0871.aruba.it (smtpcmd0871.aruba.it [62.149.156.71])
 by smtp3.osuosl.org (Postfix) with ESMTP id C3A5C60666
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 01:58:43 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jXS8muPGjFf01jXSDmqK8X; Sun, 07 Nov 2021 02:58:42 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636250322; bh=N/nwiHbaGYFCxGzHfhPamQifjLtjCCtAMb4HbPA6Rb0=;
 h=From:To:Subject:Date:MIME-Version;
 b=OY/CprC1TZaR9YEXcgCL/d21KV9M1kda4DLtxIAt/pVxfwTulsDFM4AP42oaPBQ2C
 6HNkiG03ZrScJNhGszBCCZ9ppUx7SwnmlHgRnrLfhnkN0RuvpdLwLjF8zrGiN1qPF3
 bgUliS6tb4LPPM5PX/4wJa7vx/YmuEWY3DNiayjKKet0Q0/j2sdnM17ytXb8BEadDO
 5Q5HmomSQD9KgqwnIUKu8fglKgRvGjiSgmrGhnaGsSTIAi0nMJ9BVMSkZZ+f9o028U
 nyqYfCNbEoBFOUb8DJbnOCuw0CfM8rNca6+ZpKidbHl7hHK6pMjKXH9nFCpQ7qVTfz
 dJ9tF6FnpWw1A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 02:58:22 +0100
Message-Id: <20211107015835.3055951-2-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
References: <20211107015835.3055951-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfHlA1ujVWDP2Q6WX1h9/DYw6POR3Q1izZNmUsCcP2NEgTNK48olfcbbnZDHNHieWpzk4YQe8bqf0LsgRQww9pOIYuSZ45yEeB1Y9kUTf9h8Pnqbi6xdG
 8xwZbA9a+fhSeTZfNomnoXY1CwuslvRHLo0oGyZOm/ME8pPk+dKMQRxHf4SgH0W0X1zG4cklrFod6zHAFcfuNHSSDyen/UEhp4fDIdzgxAS2psR8c97l3ux6
 fj9e930LWv1AFTn+4RG+yCcAvEPY+J0lyA1kCll8gWxE7EBhvWgTFXc+SZQn8+6qj4sbCBzQQKYxSw2B4DewtJxAxlhTX8v09FfbPBl+QEsbAW/rT+D7mg+C
 Ui8gE84ShTHeELTREH1Z2PjGaC4BSSy0zVnLDxAihFPpMecdM62HordL46hgWsYxuzz2/ZSkYb1rASIZDrS+Xlcp+bqkwf8O8mJJRg/mK1XrUXXwFUI/5ww/
 Xb20auBbnG2il/rmInekC4vime2DLwf9jdMb3wx6IHWzULsZ2Hu5CXQHKdgXNM21iIygvcgR/sVGF1/KqqvlnXT9pEBPAkpzk9ArUyiKYtCDCL3n1SSpOh+8
 CPDhKqLmWNMJ0mJuo7U9Rt+KMX/rpgl90Urz2DXzUn1H2zBJPajYkDAs+HNWKU4y8CRYwVgSwWghDpDfgpQbQAfkjA3dMEazCNrc3b+OQfLMXhs8zOZf6ynz
 J2hN5f0p4omrlYviRDvAWLrvK8F83o3Tvu3LqBZuFZe3BETpRMDtWL63fAmKgKdBY947f5BFU9v0196gqRvnCmmuG2BsSWOZaEy789b1466A5DRYnU+qZ4NY
 i6mXT1bOZjO59ay2rfQKUAFEHtDtJecJFvqvUSCcQVYXOUERytHX+4dRJhr92wH/WkXo2NId8heFVZZ4VnkOL2vAUHSBpYfVsdTuK3TuF6OsAcw4G5Cc1cRd
 JB7xAQIMeQOos+5Y67xbrQ+e4jZPBeWGXgXVbtfQQf1N1nvhRKt7N3ZtYN9zSYMIngxEVkEZaC9mPDmH2NerAWjZRGTRghLaAmkody8YyG3ENJwIk+rUzKZw
 /hhPNG4S1rLCMoC4H5bIp51z/nHiBszgw5DVp4UaLy7sZRMNcZjIynUH8PXqI6ZYMrfy+CfgxefyJq2CxqUS/hwbmrz1jeL+6g9Xb0BOggFkVeDrOL/w065F
 D5Xe1MTiM82GvvqjqrMKMlkei6S0mPWLquCUcphcNK4AFVipj7ZXAN+xylEMvxi2P9hE3N6U/z3Pkwu8TvdH6gWoIBgEgsUEIicn/0xkKAFit2ySKs95Wxm1
 Iw4Vm8E4zb6I1uUQ8Gjm75nImG4IdPq1zPM7z0ckFo/xG44zUidmPVwNU3kN3Lv1LpzkskfPR+qqCF+ICAZSW1nIdxvA3GoR7oKgGp4qQoH4T/7h0upK5RAQ
 gVRBqqr0KuBplLzAa6tMOFq9p432vcJTSB+nYnNjZ3hS+ykl+vkJZ/X1DoI/2Ao/bK1ziR9TUTwZSE7pTPBEVDrFetwg02pn/q9YOe9fOSkBylIxFERoTtCl
 IjvECB0I9GK90z43s1ivPd1qxVJCs/3ZS73ZIMW/pW9OdcQSgx2VZgf88FN/Byl3zbztnKeXfjUStT3RZrgUwZxlgGGLBx1FKlGdnZFaZy9N8yGp7vAHhwIW
 0O4Fyz34vEhmO35OI2tMB3igR2gioUQnqNfVghxg7tSUfhfMrHtUjM8ZQh9M2inXhn1TRdSsoKjFuHXjeYMUk/wIICo9Q0KbEDS5DWtigMusLAf3icpfqw==
Subject: [Buildroot] [PATCH 001/102] board/aarch64-efi/genimage.cfg:
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
 board/aarch64-efi/genimage-efi.cfg | 45 +++++++++++++++---------------
 1 file changed, 23 insertions(+), 22 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 2daa70c361..8ec1f10fd8 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -1,29 +1,30 @@
 image efi-part.vfat {
-  vfat {
-    file EFI {
-      image = "efi-part/EFI"
-    }
-    file Image {
-      image = "Image"
-    }
-  }
-  size = 32M
+	vfat {
+		file EFI {
+			image = "efi-part/EFI"
+		}
+		file Image {
+			image = "Image"
+		}
+	}
+
+	size = 32M
 }
 
 image disk.img {
-  hdimage {
-    gpt = true
-  }
+	hdimage {
+		gpt = true
+	}
 
-  partition boot {
-    image = "efi-part.vfat"
-    partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
-    offset = 32768
-    bootable = true
-  }
+	partition boot {
+		image = "efi-part.vfat"
+		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		offset = 32K
+		bootable = true
+	}
 
-  partition root {
-    partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
-    image = "rootfs.ext2"
-  }
+	partition root {
+		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
+		image = "rootfs.ext2"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
