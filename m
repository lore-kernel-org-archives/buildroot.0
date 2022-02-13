Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 56DE0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1909D40330;
	Sun, 13 Feb 2022 22:55:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 3rIFxxC5K4sv; Sun, 13 Feb 2022 22:55:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67DF0402FA;
	Sun, 13 Feb 2022 22:55:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id B9E151BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A8992812CF
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id iLvVVDjISHBD for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:56 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp1.osuosl.org (Postfix) with ESMTP id E37C6812CD
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkfnv7y8; Sun, 13 Feb 2022 23:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792833; bh=ZNvSJCaPgLzMtWDPS6u7k/bG100IUlP08fr9UBn3Nvc=;
 h=From:To:Subject:Date:MIME-Version;
 b=dmBndK19N6nZ+0KQpWYaf9vBUKGnoy8O5z5fiJCx5WEjSM0Wy9WYcYBgU+G/ASVna
 Op04FfB1QFmsV4udnMkH+LqADMJyp7lCYceHQQao9fF68uuEp3D3uLLV5IYPV47tG+
 K6VsQY0tvRpWIUHpTno6/6odEYJhdsdX9LylvCzounsl6K6MizoVMUAtHAQroWT9i8
 U4oHUD1NA/1aYpcNiwmr/9HJgChkuGMI0Spa+fyzREH+XzILiQ4DqwCCDZMGsDj/U5
 UmRRFYx37GyXAkSNx9te2Rmg8PkG6fcBNThtC6ge3nzKfWlfjyjSjtJknn+C2/vU+g
 7PuWBNrnB432A==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:36 +0100
Message-Id: <20220213225350.3466696-3-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
References: <49133c66-0a53-7607-1c52-5e1ad9e8fc7b@benettiengineering.com>
 <20220213225350.3466696-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfCWcr4GTOIYDdpkm1zM6wgg7Y6CZo01YK6pUoOQupJ98ZdM/RSNfe4bL46wVkzvIfEDFQogeiceI1ZCNp9zqyFeYoRXfpLRcWNbC2OouqzBN5lyPT5Mb
 ndG8bR2Iantac99amsn3OdmAfih9iUe4fMDgmlX5R/WI82NqSb4ayV1snjHpxUvr9T2PrAUvyfazbkJOKXtv0WEALGkXSKfPRsaRNlFibH975Tj6EcBLmEOA
 FRsjKPQ5pi0kY5c3Bi1h+iV720Bm5Knwdjc0gVPq8UKWsESWb+Sm3TWQqcFVpSf02mFWhSk49yRbUiUQHoNKwsFHdBFCA30SfErLFUnmm4HuGrwxGt1Gz74b
 qrtAz9SZQdP+H5a/SEGEsg94faQUMKhG2PlElgfgQhT1psWHvyuWGX61VLfp9NK+QKv4wdT+/apS3cO9vDLm6q1YzTnVk6ODyfQUQT2QdTJcmrBvT9gJaMoZ
 8DceuwkheCNDUmGk0pjl1fVya6ANF8HKbw1igxaWVarqgL6CUYehjwj9FRp1RA5Qr1RAo9yPysEu0fVgL83xoy/Unqod8Vq7aegI/uNqKPxBrTffWNXZcI1n
 G4noG0m+7Al/6+l56BGdS7VWg7Lnwfw8tPie6MSJTXL8ZB0nt6jaGk785rcByHCqQiEUAPXlQwIGzKu0aLQCdkJu
Subject: [Buildroot] [PATCH v2 02/16] board/beaglev/genimage-efi: remove
 partition-type-uuid since its default value is L(rootfs)
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
Cc: Alistair Francis <alistair@alistair23.me>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Sergey Matyukevich <geomatsi@gmail.com>,
 Gerome Burlats <gerome.burlats@smile.fr>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Suniel Mahesh <sunil@amarulasolutions.com>,
 Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/beaglev/genimage.cfg | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/beaglev/genimage.cfg b/board/beaglev/genimage.cfg
index deefdbc110..54f9118ea9 100644
--- a/board/beaglev/genimage.cfg
+++ b/board/beaglev/genimage.cfg
@@ -4,7 +4,7 @@ image sdcard.img {
 	}
 
 	partition rootfs {
-		partition-type-uuid = 72ec70a6-cf74-40e6-bd49-4bda08e8f224
+		partition-type-uuid = L
 		partition-uuid = 0fef845a-c6e1-45bc-82f7-002fa720f958
 		bootable = "true"
 		image = "rootfs.ext4"
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
