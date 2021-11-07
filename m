Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42464C433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:25 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0136361279
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:47:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0136361279
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D0E8D6066B;
	Sun,  7 Nov 2021 02:47:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mBScadQTn7Ye; Sun,  7 Nov 2021 02:47:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 50B3460672;
	Sun,  7 Nov 2021 02:47:23 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 907DC1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8DA3B402F6
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:29 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DFECgnPBrdsw for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:29 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp4.osuosl.org (Postfix) with ESMTP id B2478402AC
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:28 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAWmR7XR; Sun, 07 Nov 2021 03:44:28 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253068; bh=TISRs+6VDOJcaDdVoNMA3zrIwKHue7IUdyBwVkUgr54=;
 h=From:To:Subject:Date:MIME-Version;
 b=RSo2zeMCKCwqM3ssflWE57KZaUuZMTu7lTCPaInluoY0vvacJrUwbIoJateTbqCTc
 RsxlZQVwRsELH9dKOacSkpwAJ8l0Juyi3/qahPttwNncerYZfz/w6sMC/qJCMMitHX
 gZllNNvN09Hhjyynw7YsSia8jF/AnOeYj2/I0etXFdtLCCIuF2abqmtOIKBmFxDLLi
 gMP/HAk3tL14lfubLrhlJp6tcEQ2EKV8SAXgnYnl5dahAQkiI0qA0H4PANytOSK7uK
 uEbcvsxRGEpaphEDn8fcsR2KVx7HthPB2iwvMKG3zTZm93/ulN7dTNS5wPsc/WywXy
 VGg3cZrjTWfCg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:02 +0100
Message-Id: <20211107024330.3061378-15-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfNzwLsRmpH4ydWWukLvy0Hm5swFpK44MIzpjYqL/ak5rERIK3qmNEwG1Rzdld+L1eVMWWsKN7wr/NLSzlnSkODslGlYTb5I+3VG0P+poXJMK9qnjHz9o
 2wSsSLPU2uoKtPEnzMXW8nGrUpuRTjZfngU120pT8xuKsJKBrFpmp4ARJdK24uhTYvK2IrlJ6CxIZ+EKEd2APYk5My8xLUnd501Q5aGXgrLUSRdoQshtdVcX
 ktgvjfnaNJBsWEflKdZDVPe+3b88po7ddaFkLSkmcyw=
Subject: [Buildroot] [PATCH 074/102] board/pine64/rock64/genimage.cfg:
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
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Beatify this genimage .cfg file to have consistency with all genimage .cfg
files in Buildroot.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
---
 board/pine64/rock64/genimage.cfg | 36 ++++++++++++++++----------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/board/pine64/rock64/genimage.cfg b/board/pine64/rock64/genimage.cfg
index 0b5a0d8804..7b749d1dd6 100644
--- a/board/pine64/rock64/genimage.cfg
+++ b/board/pine64/rock64/genimage.cfg
@@ -1,23 +1,23 @@
 image sdcard.img {
-    hdimage {
-    }
+	hdimage {
+	}
 
-    partition uboot-spl {
-        in-partition-table = "no"
-        image = "u-boot-tpl-spl.img"
-        offset = 32768 # 512 * 0x40 from start of sd card
-    }
+	partition uboot-spl {
+		in-partition-table = "no"
+		image = "u-boot-tpl-spl.img"
+		offset = 32K # 512 * 0x40 from start of sd card
+	}
 
-    partition uboot {
-        in-partition-table = "no"
-        image = "u-boot.itb"
-        offset = 262144 # 512 * 0x200 from start of sd card
-    }
+	partition uboot {
+		in-partition-table = "no"
+		image = "u-boot.itb"
+		offset = 256K # 512 * 0x200 from start of sd card
+	}
 
-    partition rootfs {
-        partition-type = 0x83
-        bootable = "yes"
-        image = "rootfs.ext2"
-        size = 500M
-    }
+	partition rootfs {
+		partition-type = 0x83
+		bootable = "yes"
+		image = "rootfs.ext2"
+		size = 500M
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
