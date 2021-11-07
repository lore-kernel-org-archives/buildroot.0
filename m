Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 556D2C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:34 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1B49761884
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1B49761884
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBAA84023B;
	Sun,  7 Nov 2021 02:50:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lg6ch19R4Zsv; Sun,  7 Nov 2021 02:50:32 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id F24344023A;
	Sun,  7 Nov 2021 02:50:31 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 88A3C1BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 774094022C
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id v36bSPZd3zLB for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:20 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 82081400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:20 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBMmR7sG; Sun, 07 Nov 2021 03:45:20 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253120; bh=IGvGvO1zs47+RdoeVTMr2xCitxEpe+po8UYY23w5074=;
 h=From:To:Subject:Date:MIME-Version;
 b=A4lzIYVMFTdu1iCZpXHZz4ZWCY/w2HpOlgpzoYPhpWNq0RAsBGtkXqFuk7l7dM2gc
 4C2k8RDsfTfuWl6DYwczjyBsFW43Pu/s1yB48yqiZOJ7NRU8ODKI8aQguUXSwUpY3M
 PEG9fnohUmmqW5UxneFKuYKGaAFSHu7/W4rA08WZdRXtknZsr+pbsbey/9Az455soR
 BY1XLUqsZaN/nD1Z2kIgY7tq0qg4HTYCbjtMRrPt4Ys96B/Zr8bDjp/jYcYZHZj5MQ
 K718+vKGSFoyrM16Zq6AZHhhR/0gvyUJojb/NkkvRWEprA7nzJUZSZph8sL9eyW3Vr
 6yqFC4QoJeQgg==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:18 +0100
Message-Id: <20211107024330.3061378-31-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfKOJ8n5UWJOcwNUjc8pWzRqIAmDvklrQHa0f7sE0cscttl3vnYmMuHk/C8gwxejT5XUTNq3p5zenS3dKwHVaaifh9C7IxZhpusa048Oa/qAbhZg8G4O2
 teiIqOdjxEQXHihI6g50v5W9w5VQv7TEYrY/H9K+azutNjGWM7doJnIOslo0jmm6aYdt88egmLmEovSPoFULQIomXHkAMPDQKVeYtaIJsPF1saA1rj3Do8hK
 T/RcH6JdfY4Ue1TIv7670IWIN4XYNzctQkGeMLheb4w=
Subject: [Buildroot] [PATCH 090/102]
 board/raspberrypi/genimage-raspberrypicm4io.cfg: beautify file
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
 .../raspberrypi/genimage-raspberrypicm4io.cfg | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypicm4io.cfg b/board/raspberrypi/genimage-raspberrypicm4io.cfg
index 3ee9bf551a..4d09b03556 100644
--- a/board/raspberrypi/genimage-raspberrypicm4io.cfg
+++ b/board/raspberrypi/genimage-raspberrypicm4io.cfg
@@ -1,30 +1,31 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2711-rpi-cm4.dtb",
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
+			"bcm2711-rpi-cm4.dtb",
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
