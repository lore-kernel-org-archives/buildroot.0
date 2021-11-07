Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8498C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 824F461884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 824F461884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5F462402C2;
	Sun,  7 Nov 2021 02:45:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZHGqp_ymwoPu; Sun,  7 Nov 2021 02:45:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BABD3402C6;
	Sun,  7 Nov 2021 02:45:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 99D881BF976
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 97268402A9
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Hb-N_WW5HIeD for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:43:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1808401D0
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:43:35 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljY9fmR7G4; Sun, 07 Nov 2021 03:43:35 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253015; bh=BNPwJWtc6tZpoACMrpYh0ZTOUcEcqORteecLbufEX7c=;
 h=From:To:Subject:Date:MIME-Version;
 b=e20eOloNWvGzcTcpHG/Dkjso5DrvzJcTo2/fWwnQ/j+zw5kN4/eEsxQ5gBwAcBOMC
 q6srA89PTLUFansZbcJOdVa4Lk+6f+4KifZmssUEHBHUi/g6XzQKypCk/Jdd5slj0q
 laH0wA4ffew8p4nejJ8AmJPpTobSw5K2h2YPkk/1v6Uf27Et3gRb6W8o6gNQVnZiSo
 a0nLCznMv492vFM8mB0GW1+QRQ+Qw47IkD5kG8Ndoe5iww7DNlsPFHNkcxXv3QPa9D
 Aeq6SKDcmOKLDrKIbVIVXalX9xctzkwdlk6yX9ZINLpaczYYQjWcMdakmLarg1w4o4
 +4zPReFhf9FSg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:42:52 +0100
Message-Id: <20211107024330.3061378-5-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfMtFKL/AeYrCrJ12Hr3xhJlBSSvXSraMn/M2zR27dODuq4/xy1IwrgnSLaCCA8SNUGuknsCekTGNCcIl1Sg/mFds3tqsCq2lXsPWgUU+2iUVTGKKPXKF
 KpSR/kR7ksbpdUxBPr3DmarrvKEIWsym3XownQH/ixTLZj0BGqaXfTrV1IwIj8dQ8fPYt9FrZLKCCes4PSFXuCoR107GESh9xTCalU4szzT4QZyhlkGyBjA+
 ZnkdsthlnzAzoxxbJgyCUgx/FF82TKWDOA/id8lfr38=
Subject: [Buildroot] [PATCH 064/102]
 board/orangepi/orangepi-r1/genimage.cfg: beautify file
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
 board/orangepi/orangepi-r1/genimage.cfg | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-r1/genimage.cfg b/board/orangepi/orangepi-r1/genimage.cfg
index edda03b3ef..a2ad618557 100644
--- a/board/orangepi/orangepi-r1/genimage.cfg
+++ b/board/orangepi/orangepi-r1/genimage.cfg
@@ -8,6 +8,7 @@ image boot.vfat {
 			"boot.scr"
 		}
 	}
+
 	size = 10M
 }
 
@@ -22,8 +23,8 @@ image sdcard.img {
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
-		offset = 8192
-		size = 1056768 # 1MB - 8192 + 16384 (GPT)
+		offset = 8K
+		size = 1032K # 1MB - 8KB + 16KB(GPT)
 	}
 
 	partition boot {
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
