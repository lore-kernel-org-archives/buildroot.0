Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B9632C433FE
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:55 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 84D1A61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:43:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 84D1A61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B90402C6;
	Sun,  7 Nov 2021 02:43:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vv3rp9UJ10Zd; Sun,  7 Nov 2021 02:43:54 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BB772402C5;
	Sun,  7 Nov 2021 02:43:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 196FC1BF977
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 14E16400EA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DxnCwNl8bfDr for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:42:59 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd0872.aruba.it (smtpcmd0872.aruba.it [62.149.156.72])
 by smtp2.osuosl.org (Postfix) with ESMTP id 26C8B400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:42:58 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY8ymuoy4Ff01jY94mqU6L; Sun, 07 Nov 2021 03:42:58 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636252978; bh=TlV1DoHSqLgLqPWGPTipEPGpRmgwQdMp2DCR9ik86s0=;
 h=From:To:Subject:Date:MIME-Version;
 b=TaCsLBoD+VIBC5TjvSJE+fBAW0KqUMOy2TTwJ51RjjFfG+Qt6gLRGvJZVdZSFbQZD
 eGQi2jmAuMMhrM01Wp/oy9gyIJ1Hww50xKh4SzsrWAx1kaYhe0FwTbGUof1e1dyCjN
 mz4LFmkjIBSonP7BwrKGG9s7qJy/dY1WjdOFcXuy9WsBsq7xRTDzUDUrEus058RWoD
 Nx9c8IwU5N6yT26u2wrgUpJ1gXuzNcGZa28iO/FB89djjz/H3XC/SHpeb6T2Fu1hfv
 YxPVR8i9JHWHuRqkwyv7w7HHwRATYllQ+eLFjoFuXwZUtBrXgvrO/bllT2f0ePmfEa
 xbzB4Vq1xHlmQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:47 +0100
Message-Id: <20211107024250.3061287-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
References: <20211107024250.3061287-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfABDZqh2z+/lqHi46z8hyPSQmt2L4yQTISCRK+OT/q//4/6zsur/PSDUUh9G533gTOi8gzD7AFQTaGS1XAnme7t9p5Mo3ZYLwljST6Kx2j4/3Vz8vc5l
 FvqPgSknS3T10Sg1iGps46qhKzvJr5dShgw+IkpYo3ho/NQOEyEvUlr7T6e/ge3uTbtmofC8cDyUA96GQrBf1hn5TEUYZwqxqVnP+4QIb/zLNHoaiXGYUn9F
 N1G/JspVjOVRvUmK3UCDMaHD6OhY0wwmoAR2xCYlDoc=
Subject: [Buildroot] [PATCH 056/102]
 board/orangepi/orangepi-lite2/genimage.cfg: beautify file
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/orangepi/orangepi-lite2/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-lite2/genimage.cfg b/board/orangepi/orangepi-lite2/genimage.cfg
index 97251b483f..bc981eed51 100644
--- a/board/orangepi/orangepi-lite2/genimage.cfg
+++ b/board/orangepi/orangepi-lite2/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
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
