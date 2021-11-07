Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0FE1EC433EF
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:11 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id C468861881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org C468861881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A08E180EB8;
	Sun,  7 Nov 2021 02:50:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 0FXJaME0DkWD; Sun,  7 Nov 2021 02:50:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0BBA280CDD;
	Sun,  7 Nov 2021 02:50:09 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 802CE1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 70C7780CE8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOok5zezagbZ for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:18 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id A009380CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:17 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBJmR7qk; Sun, 07 Nov 2021 03:45:17 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253117; bh=avU2IaQEFCz7oUapegBklEz5v+Q4/D9+wncHND5ejC0=;
 h=From:To:Subject:Date:MIME-Version;
 b=XSQQ1m/uBC+49jMO1/EXALhe7eeM3HRr8P8GK3khhZ4yV9O95LYmz0hXItdmlECLo
 vVUu7VYr1YPaca9i7lGgXMGXxiD02NQXjl9XdDctaA85leou4T3Wd30yXUUvoX68gR
 Jy57384n0h3r7h6ea5CEfyDBMMbdITVqDlkaI8Ld3cdN+OmNKgbVB3j92R4q0ns8Cy
 Qst0iiyTi1Ybc1ZzODLmncZ+7vK159CVUleygVyeSU6ZSM6+uslRsxxR67KBiGLzcq
 MR6mkB2s5+kXWsftDKNn3h2jWLZAXKIPD/+0DYOYEJbXwG1hNmndxhv1EMtKjobkDd
 Qdn+V4cPKNX1w==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:16 +0100
Message-Id: <20211107024330.3061378-29-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfFB+UXtamXV/YPJmQrInXTLY3A0obPMvnbbfAX7dg719jd25FQQzM7eClqOOv8U6G1AXeSCq9s8Bul748zVCfl0s3BDzZtiEsRvNqWEKYXG/a3gEy46M
 iLfbZPoCMO6oOFhOwGg8ngjO3sUROiBPajLVNHwjPxxklS+UdnXLGUsUS1oQMkObMIt9UmhOC+rovv5+FVZCORsUMVjZwUgrzwKbR/4MtnbO+1PSzjEeH61h
 2sVQK8+ui2tPbTOQAv0iuU1CYntzvDDNsOT3DzwU0Xs=
Subject: [Buildroot] [PATCH 088/102]
 board/raspberrypi/genimage-raspberrypi4.cfg: beautify file
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
 board/raspberrypi/genimage-raspberrypi4.cfg | 47 +++++++++++----------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
index 4e4742f3ef..2e578ad556 100644
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ b/board/raspberrypi/genimage-raspberrypi4.cfg
@@ -1,30 +1,31 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2711-rpi-4-b.dtb",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup4.dat",
-      "rpi-firmware/start4.elf",
-      "rpi-firmware/overlays",
-      "zImage"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2711-rpi-4-b.dtb",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup4.dat",
+			"rpi-firmware/start4.elf",
+			"rpi-firmware/overlays",
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
