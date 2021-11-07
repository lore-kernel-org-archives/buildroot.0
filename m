Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F34AC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 39A60611C0
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 39A60611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0132B6066F;
	Sun,  7 Nov 2021 02:49:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id knaFLYGJKocF; Sun,  7 Nov 2021 02:49:23 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6417860620;
	Sun,  7 Nov 2021 02:49:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E542C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id CB47D40242
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=aruba.it
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tJzDTkcKkVXQ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:39 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id C04764023E
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:38 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAgmR7aF; Sun, 07 Nov 2021 03:44:38 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253078; bh=FL1DJmP+WSISs0B0Me6sNSFhSFwnwjBvwELeG2sZjfo=;
 h=From:To:Subject:Date:MIME-Version;
 b=e/QPv7EVwDKea1E4hM3u7sTz6fAvRRdo2CHbwDvEab89MZCbABEI175VNPls02u9Y
 eHCEvd6+4YULuTFmYhVWxIlwr6E/GxUzO13ENPZQG5GDhHrSZZ+jlzwREfBQ8QsSxJ
 tsPkDW830D350yx+PaPmY/fbrRoQzL/V5aI2cEQSJ/YYjBJP9uC8XnEV/u93BgQqvO
 M+1OKxTgj7mGwMQ2iui0yKWbPrWcYcrKYbQcFCSSxtzSaDhGARKhGAvvMj+kDsuVkw
 VJxP8JesJMLaDA+89KeK6XwJwAGmPcbw0dkZDTLe/AVrdLj5gBe9YNvcDStG/sUgPM
 ou6s+cExMJ49Q==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:12 +0100
Message-Id: <20211107024330.3061378-25-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfA7oRYu68YYR5t+upG+adjd6i+8/K2dUEvgV8/v87JMvSBc6Mdfl9OyXDW88aPlkdYNwwaX3d3vf/22g6Z2sat+FPo8ydnX93+3K0sGIv93UysYccEz3
 xHv1YmD+iCe0zc9iCV/1Ox9KYmnuzB5XTL14xvlJNyzC9Qw0BPhVAR6UH83wCS0B9juyMn0k7x+6/sjJnixUbVrjFNxOCBemkRWglYe23joNpwm2wht7svFR
 MAxJuqLo7x0U3sNr6mewU/WuqyAXpMn4QIMAEhEicpw=
Subject: [Buildroot] [PATCH 084/102]
 board/raspberrypi/genimage-raspberrypi2.cfg: beautify file
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
 board/raspberrypi/genimage-raspberrypi2.cfg | 47 +++++++++++----------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
index a3be2a3442..acd23e7ca8 100644
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ b/board/raspberrypi/genimage-raspberrypi2.cfg
@@ -1,30 +1,31 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2709-rpi-2-b.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "zImage"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2709-rpi-2-b.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
+			"zImage"
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
