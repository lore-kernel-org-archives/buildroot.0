Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DAED4C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 92F4861884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 92F4861884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6ABB5402C0;
	Sun,  7 Nov 2021 02:45:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id U853ekyS9oQV; Sun,  7 Nov 2021 02:45:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0A0240315;
	Sun,  7 Nov 2021 02:45:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 08D821BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EBF12400EA
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HrYhsdK-NtIK for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:35 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0A02B400DB
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:34 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9dmR7Fh; Sun, 07 Nov 2021 03:43:34 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253014; bh=JPDJOLLz9+Agv8WsTwWQ5wi//ddGBRFtn74emqA/q5E=;
 h=From:To:Subject:Date:MIME-Version;
 b=UhxJ3SijyntTdJj7pWREUF/b/MIj3oR5cZkN6pgRD+tSX/yNFZqwZQZ+O7FBeAHb5
 Eh9qGSvx57ZEAXWz0SvZEiZJ91pcwgt+0gvcL3VzceN7RCKIgX3Y0z+tu3XwJQp3u5
 ZQxVjkihLyyR+ijwMkBoDCSw1PSE/JnDeM6lLHWkFEFKB4YVjPMBDgMQ93VAE9bULl
 05sCE3Lmcqdx4Kh93aPlODtQwFMlslvnFixV2D/4mGE86QhNedaxMP6G+u/fXF9qgr
 XWpF4oN34NGI3VULmSxpV4E4G466gw27IroSISsK566LMc+8bza/5GGeVRaZZBhYya
 hw4Ugm30thmTQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:50 +0100
Message-Id: <20211107024330.3061378-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKh7CvuVryxw2uCG2AK0NW6omme4PDIjZIOeuII9qeCuzzGuswrZ++BDQAReb9TIhXFXtxG2rI8+x2SIWYq5mIGyWFk87zmDeblarkjq09OMuIG2aiVE
 TZOLBLvtxDJ/TGlajeIPVuhJAXvo3xP7KNnorxC7FAi74ol8a2CdDNZ7gFQ+AXGKGsnr4eLD9xOJy/SLczd/L24yru0TL3MuJH9n+ATfYh3V61hc+Ds8H2Ly
 xkdm17oyf3S5U1cgnblnqJgLl20rBZaDP981kNfUrME=
Subject: [Buildroot] [PATCH 062/102]
 board/orangepi/orangepi-plus/genimage.cfg: beautify file
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
 board/orangepi/orangepi-plus/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-plus/genimage.cfg b/board/orangepi/orangepi-plus/genimage.cfg
index 391678b73a..1ca30258dc 100644
--- a/board/orangepi/orangepi-plus/genimage.cfg
+++ b/board/orangepi/orangepi-plus/genimage.cfg
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
