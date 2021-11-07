Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D22BFC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id A12EF61881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org A12EF61881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 554B980D71;
	Sun,  7 Nov 2021 02:45:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 88qWrY5hmKun; Sun,  7 Nov 2021 02:45:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A6780823FF;
	Sun,  7 Nov 2021 02:45:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 189011BF976
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 15E1A401D0
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sTuhOX0bdgE5 for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4E8B2402A9
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:37 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9gmR7GZ; Sun, 07 Nov 2021 03:43:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253017; bh=FQoqUzzh909tWahOdAioI7oCEfP0c3DGbg4uiJsJ8CA=;
 h=From:To:Subject:Date:MIME-Version;
 b=WtxqIzRM0zyL1leVg4xQzrCNmdUZE7lPPzKopbg+w5YYIZwO6Bn6eBTmxPVhkKQAt
 up3q7aoRPMwBsVBfWUdbslJHrn+GhMx39mNtaxOrxXW1WqTHxbvdS3QJVi42PB+9BP
 iSS4JkCEEmd+LArx0kyKwZQ0TftPlUIdBBmxG2ALPYhuCpzYyqNB8tkyWjwMBZ9wTC
 dGsEeU63BNTz5V511O0H7MzGiGmXmJcAe12Z5zqmajmQQhreyDSI8QyOFDzvhEioYc
 FSJxyfL2O8ZBgd92tzp409GsbXfBgruo2e2I6ticgO6VdmDx4CQvNAZZhalPrXnwhc
 Oh1hZueljos/Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:54 +0100
Message-Id: <20211107024330.3061378-7-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBt8lb02ADCOHjpe+oRO1tCXTcGnXzy2myyhe/GuJuBsdiF7SjJX5Ixb6LQtPFDOFxAlPFHl7gwV4lX2BfSudWUzEiRGiYt0vcntElFZVSOXUnKTG4/F
 vAmu/CcCfvprTLSqMtL3bbpdfx5kEF3b+SbcTwZJ9eS86DZKui90i4QKiwfThllSNPbfmD+gJQ6f6EUSGlmOq2kOnGtxRi49B3oXLj5LhxfovHon+NPTCPFB
 3jotbQt8tHZtjWimP4Lvh9/laWdpAqXGnhDMYdrCDug=
Subject: [Buildroot] [PATCH 066/102]
 board/orangepi/orangepi-win/genimage.cfg: beautify file
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
 board/orangepi/orangepi-win/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-win/genimage.cfg b/board/orangepi/orangepi-win/genimage.cfg
index db025d55ca..3e691b436d 100644
--- a/board/orangepi/orangepi-win/genimage.cfg
+++ b/board/orangepi/orangepi-win/genimage.cfg
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
