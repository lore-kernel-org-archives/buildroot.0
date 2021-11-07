Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C5BAC433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DBD3261884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DBD3261884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A663D400DB;
	Sun,  7 Nov 2021 02:49:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qwKEY04hYjOs; Sun,  7 Nov 2021 02:49:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B977740235;
	Sun,  7 Nov 2021 02:49:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 99B471BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 899AE80CE8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Qh4Uu9ZH6DGt for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:15 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id C062D80CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:14 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBGmR7of; Sun, 07 Nov 2021 03:45:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253114; bh=cTnUW6TEtIe+hZYzYapBuL4dnSUHFt169NXZG8xPxug=;
 h=From:To:Subject:Date:MIME-Version;
 b=BEvW+07ablm8bsGSnCyAJO7kOKJfCJ4mLLW6n0itELPVzAHJ09To+MZows4jYxmTQ
 fT7YcgvQo8FCJOPM34EqLqpqNyTFaYu1yCGodPPU+yh5yv5c+rZvojaULLQMgOZatb
 gywcJXlZSTjmWje5Cm86AriSO7nu08VpqReekkgecB8wqQzldldsvOhzIuQ6PGfhVJ
 oXAB9q6RqUAQA0Gqx973X1t+kHdMqhwDo1i1NtoclxB3HQXvJYk2t7sRrXwRZB5Fyl
 0mfFrByTMNCvg1iscMOYy2akn2ji8QXz4uFwwt+QSlkw1reoDmKCdp4XfiiWEX3JXB
 GKQ207NHFklZw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:13 +0100
Message-Id: <20211107024330.3061378-26-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfJ2+qk7pMvODXBUKCh9Kt2Ikj48VZF1pb4DsegUbE+xReDAHBdhJa130n+cKjCwc0PRSP0duWgB61K/NhZOr4dKXnpOLGoHNSnoB/qv25zYbu/IaIS8q
 mA9PeDVUDwHSYZbF83anykNGfiO1nchUFU3axWeZ7jJQFTNVqK2MURtGzb8ZIko0Oq/PC6lMW62p5nN/CSdafuRWfa3molk1IG6xWfUSyAuVsvwGu9A83Bs9
 ndNfMU1UYb3BsIwTqzedrL44ZTMkrjmMBVd18gZC8cs=
Subject: [Buildroot] [PATCH 085/102]
 board/raspberrypi/genimage-raspberrypi3-64.cfg: beautify file
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
 .../raspberrypi/genimage-raspberrypi3-64.cfg  | 53 ++++++++++---------
 1 file changed, 27 insertions(+), 26 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
index af1d17cde7..8cbcd91638 100644
--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypi3-64.cfg
@@ -1,33 +1,34 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2710-rpi-3-b.dtb",
-      "bcm2710-rpi-3-b-plus.dtb",
-      "bcm2837-rpi-3-b.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "rpi-firmware/overlays",
-      "Image"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2710-rpi-3-b.dtb",
+			"bcm2710-rpi-3-b-plus.dtb",
+			"bcm2837-rpi-3-b.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
+			"rpi-firmware/overlays",
+			"Image"
+		}
+	}
+
+	size = 32M
 }
 
 image sdcard.img {
-  hdimage {
-  }
+	hdimage {
+	}
 
-  partition boot {
-    partition-type = 0xC
-    bootable = "true"
-    image = "boot.vfat"
-  }
+	partition boot {
+		partition-type = 0xC
+		bootable = "true"
+		image = "boot.vfat"
+	}
 
-  partition rootfs {
-    partition-type = 0x83
-    image = "rootfs.ext4"
-  }
+	partition rootfs {
+		partition-type = 0x83
+		image = "rootfs.ext4"
+	}
 }
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
