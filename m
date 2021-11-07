Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59B7DC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 211006187C
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 211006187C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E3BFE80E62;
	Sun,  7 Nov 2021 02:45:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Saqu-0wFva0Z; Sun,  7 Nov 2021 02:45:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4830C80D71;
	Sun,  7 Nov 2021 02:45:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EC41F1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id E95AD402AC
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id s1GpqzdYxDlt for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:37 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id 32FE6401D0
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9gmR7GF; Sun, 07 Nov 2021 03:43:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253016; bh=8+ASOycSoBihxVd8LLtcTw0kOaX4qj5G4VAmzXC25lM=;
 h=From:To:Subject:Date:MIME-Version;
 b=T/1YHTEWZucx/9h8+DodhyP5ZO8UMjcZcZSqw6Nf5rXtgDlDvpI/934/8MjqV3Gsw
 yShgUAHopuniE/1Afrvjnr6wUXd3S7IKRwN9tcNpfPgVvXxuCUGz7J74qNdbv8aXMY
 SQRBxwASClcmnvf2vYoaHTw0zvl/4F6uryDxJCspPt3Hs2yH7KeDOaWfvvtcbkctcK
 YbrFtOzZeg1z4LNrvbbr7k2rKI6c/QMiPrXgRJNXBqVj0BKyReSrcUwVq1jpLhSbj0
 mtK0NUND4oJy1ms8sDQGI/BVdAMhk2En+imMhN8O/MDMHa21auhKdXfi8Y3fyP3LtF
 T+eUjG4a24ByQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:53 +0100
Message-Id: <20211107024330.3061378-6-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfBt8lb02ADCOHjpe+oRO1tCXTcGnXzy2myyhe/GuJuBsdiF7SjJX5Ixb6LQtPFDOFxAlPFHl7gwV4lX2BfSudWUzEiRGiYt0vcntElFZVSOXUnKTG4/F
 vAmu/CcCfvprTLSqMtL3bbpdfx5kEF3b+SbcTwZJ9eS86DZKui90i4QKiwfThllSNPbfmD+gJQ6f6EUSGlmOq2kOnGtxRi49B3oXLj5LhxfovHon+NPTCPFB
 3jotbQt8tHZtjWimP4Lvh9/laWdpAqXGnhDMYdrCDug=
Subject: [Buildroot] [PATCH 065/102]
 board/orangepi/orangepi-rk3399/genimage.cfg: beautify file
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
 board/orangepi/orangepi-rk3399/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-rk3399/genimage.cfg b/board/orangepi/orangepi-rk3399/genimage.cfg
index 21272c28f6..ceab37963d 100644
--- a/board/orangepi/orangepi-rk3399/genimage.cfg
+++ b/board/orangepi/orangepi-rk3399/genimage.cfg
@@ -6,11 +6,11 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 64M
 }
 
 image sdcard.img {
-
 	hdimage {
 		gpt = true
 	}
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
