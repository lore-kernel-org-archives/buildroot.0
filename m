Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 26C24C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E29C661881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:51:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E29C661881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C0366402CE;
	Sun,  7 Nov 2021 02:51:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id y_iq6JQI6HCv; Sun,  7 Nov 2021 02:51:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3135C402A9;
	Sun,  7 Nov 2021 02:51:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 387141BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 28BF8402C2
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Tx4k6-Jy8VlS for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:24 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id 56122402C6
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:24 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBPmR7th; Sun, 07 Nov 2021 03:45:24 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253124; bh=lNnD9rbziWCYJaKaDGWW1tNSpB8o/9KznslGYt5GQMo=;
 h=From:To:Subject:Date:MIME-Version;
 b=EZgudVFHmpwG/LbhAC57aqsWaclNUWJbIqUDHlSeP5781WfnT6mWZVIPT8Upzo/s/
 Aj0M1H7mbfa5pumGPTc1TO/GK1C2vwnsjVSXMSKDSK3KmERY7H8eE2fHVvPGtL/eVz
 nwUKJeD/gv+NsvQaw0taBlukZJol8I51IYiAMyoeujwj8W1vA8mSa1aXcRcXAs5nuT
 projig5oepcq6PHvn9he/qHejNCVIYzeL2xxxM+anXjuIj6Km9F2jcIdVPucgcjCm0
 j95lMoHPn6yBEmZBs3uxe2wXujCYEne5heN8mACHmkDPmY6pP7RYL/dnchKGh6jYt+
 WZgqk00Nhtqyg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:23 +0100
Message-Id: <20211107024330.3061378-36-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ4LgeG2AZRlbmlEyEjveNIPPS5emfZxNH7jNpRK4tGLQmKYQSh35RS9IeADJzazM4cZtjjkunM56uIdvDCRwc+6/EOP19cy9lTUUqWfLnJ3fohL6tyS
 hRPdH5bpEmGcXIN+iCEbOHwH5e9el7u1SPgmjY3enKpUdnaXz3lAalA8DA9rsntdyZHP5Ew4t5i9rYq2X/xUqby6gRwl59AtFZERP4KzSPdGFmpUpOFH0ijP
 xq9LhDepQPaPibKxvN8gI8286CnwLDOzkkP8vpDcm74=
Subject: [Buildroot] [PATCH 095/102]
 board/stmicroelectronics/stm32f469-disco/genimage.cfg: beautify file
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
 board/stmicroelectronics/stm32f469-disco/genimage.cfg | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/board/stmicroelectronics/stm32f469-disco/genimage.cfg b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
index bc945955fa..517ead7751 100644
--- a/board/stmicroelectronics/stm32f469-disco/genimage.cfg
+++ b/board/stmicroelectronics/stm32f469-disco/genimage.cfg
@@ -6,6 +6,7 @@ image boot.vfat {
 			"extlinux"
 		}
 	}
+
 	size = 16M
 }
 
@@ -15,7 +16,7 @@ image sdcard.img {
 
 	partition u-boot {
 		partition-type = 0xC
-                image = "boot.vfat"
+		image = "boot.vfat"
 	}
 
 	partition rootfs {
@@ -24,4 +25,3 @@ image sdcard.img {
 		size = 32M
 	}
 }
-
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
