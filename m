Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C10EC433F5
	for <buildroot@archiver.kernel.org>; Sun, 13 Feb 2022 22:53:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D9DE94029F;
	Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoqT3qRKutd3; Sun, 13 Feb 2022 22:53:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2A2104028F;
	Sun, 13 Feb 2022 22:53:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 80DCD1BF834
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 747B640424
 for <buildroot@lists.busybox.net>; Sun, 13 Feb 2022 22:53:55 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FTdzUozqkJxz for <buildroot@lists.busybox.net>;
 Sun, 13 Feb 2022 22:53:54 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpweb146.aruba.it (smtpweb146.aruba.it [62.149.158.146])
 by smtp2.osuosl.org (Postfix) with ESMTP id 51B8E400F3
 for <buildroot@buildroot.org>; Sun, 13 Feb 2022 22:53:54 +0000 (UTC)
Received: from localhost.localdomain ([146.241.179.156])
 by Aruba Outgoing Smtp  with ESMTPSA
 id JNkdniVFUXmFAJNkenv7xr; Sun, 13 Feb 2022 23:53:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1644792833; bh=rUgsUZ/1n41Bkm+HlER9BrqVygC6qVdRlRzlhIdK634=;
 h=From:To:Subject:Date:MIME-Version;
 b=TWM8KZpr/YC+xumtz1j4omh4nxBzzZffSum1UDpG61OY4E9C5kBR6DxzGoWf9AZaA
 5yHjNzPfeVxaJhIfxnOYCcnqAgfq6pc+042oTefohazWXoG1GjMeuzXp55Sn8yMxgA
 E/v3sv9Xh0af8C6ucCHsVF3U0UqUeCDnOw2g8QdlrwBpTdccRlMiNKVOXzM7Lt/ylR
 d3i64VJHVmGTbzHhIIjSbRNSsVHfLSAgrA8Ap5BM2ExkyB2bnwXqiupLRIkf75RXIs
 jaff9TuET4Mr1BnSXSTBuAjktnRv+Z/28Zu37NGaEDP3HhYOZmjsziGPS8LZi7b4nS
 ixtha17BdgRhQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun, 13 Feb 2022 23:53:35 +0100
Message-Id: <20220213225350.3466696-2-giulio.benetti@benettiengineering.com>
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
Subject: [Buildroot] [PATCH v2 01/16] board/aarch64-efi/genimage-efi:
 convert partition-type-uuid to single letter notation
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

Note that rootfs doesn't need partition-type-uuid = L since L(rootfs) is
the default value. So let's remove it.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/aarch64-efi/genimage-efi.cfg | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/aarch64-efi/genimage-efi.cfg b/board/aarch64-efi/genimage-efi.cfg
index 87e85816bc..3708727c18 100644
--- a/board/aarch64-efi/genimage-efi.cfg
+++ b/board/aarch64-efi/genimage-efi.cfg
@@ -18,13 +18,12 @@ image disk.img {
 
 	partition boot {
 		image = "efi-part.vfat"
-		partition-type-uuid = c12a7328-f81f-11d2-ba4b-00a0c93ec93b
+		partition-type-uuid = U
 		offset = 32K
 		bootable = true
 	}
 
 	partition root {
-		partition-type-uuid = b921b045-1df0-41c3-af44-4c6f280d3fae
 		image = "rootfs.ext2"
 	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
