Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45EA0C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 12BDF61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 12BDF61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D4B796066C;
	Sun,  7 Nov 2021 02:45:17 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id eEmXhC64bntv; Sun,  7 Nov 2021 02:45:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 54696605F5;
	Sun,  7 Nov 2021 02:45:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 885221BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 858AA80EC5
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id YV9TFcV_E8C0 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6AEE80D29
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:35 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9emR7Fs; Sun, 07 Nov 2021 03:43:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253014; bh=8rnizFN4oiXpoRSP2AoYvusynZyMuWi69qr3gCadAkU=;
 h=From:To:Subject:Date:MIME-Version;
 b=naNoO/1P/BcwgWrVPv227Yr24+l81/A4h3UakHEE6stJgQ22CIne5KeTYuoxFEw32
 ZXCVwH+0n7rZoT677odjQ2OdFm1It0NdseqF8FlaIkD1bXmeHIWye837B26TbbwGWX
 /2NhUt6KkmTINw0PWuGJskEkJVPziJa6YbIuEXHjo07yGOyf1rc67GvKbzz9oVykH2
 0HCN7Pcyf3sEn7qLk4LVy1LHkRWZEq1vUEfy1+GhQZc9F1bFxMUoIXjWq0NFYvd5t8
 7a+kZPBtwaNw/o9MN886eg+9LsJZcz/T+NrS4VEeZJC4/38yCboXXcyIoEOkRui/Ia
 JBbXHdasxCPFQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:51 +0100
Message-Id: <20211107024330.3061378-4-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKh7CvuVryxw2uCG2AK0NW6omme4PDIjZIOeuII9qeCuzzGuswrZ++BDQAReb9TIhXFXtxG2rI8+x2SIWYq5mIGyWFk87zmDeblarkjq09OMuIG2aiVE
 TZOLBLvtxDJ/TGlajeIPVuhJAXvo3xP7KNnorxC7FAi74ol8a2CdDNZ7gFQ+AXGKGsnr4eLD9xOJy/SLczd/L24yru0TL3MuJH9n+ATfYh3V61hc+Ds8H2Ly
 xkdm17oyf3S5U1cgnblnqJgLl20rBZaDP981kNfUrME=
Subject: [Buildroot] [PATCH 063/102]
 board/orangepi/orangepi-prime/genimage.cfg: beautify file
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
 board/orangepi/orangepi-prime/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-prime/genimage.cfg b/board/orangepi/orangepi-prime/genimage.cfg
index bb01ed9f10..8a3aa14fdd 100644
--- a/board/orangepi/orangepi-prime/genimage.cfg
+++ b/board/orangepi/orangepi-prime/genimage.cfg
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
