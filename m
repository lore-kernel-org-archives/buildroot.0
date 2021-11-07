Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B34C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0838761881
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:49:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0838761881
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CCBC040235;
	Sun,  7 Nov 2021 02:49:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vRmfV8OUA3K8; Sun,  7 Nov 2021 02:49:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 083CF40236;
	Sun,  7 Nov 2021 02:49:09 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C20771BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 96FE14022F
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:44:37 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id NiKavgqg3sSy for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:44:36 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92408400EA
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:44:36 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYAemR7Zg; Sun, 07 Nov 2021 03:44:36 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253076; bh=KbEZfk/oOkpZTJj3+vkAfOxNN9GkarRr/KsbPpENiRc=;
 h=From:To:Subject:Date:MIME-Version;
 b=QaIBtB4Y/719UyC1vGmCLn/HcxDAF2ywqZ+OdA/Z547BHLBv/3jurBrKHnHrzFqIZ
 hdzXWolh2HaF12mYK8eFZFnEcX8MJySzAfx7I/fFnW7aZipVDqiYyz+u1RGQc7wXVr
 VJvMR5/Rv45RTWT7bYElgyQEzx+P30xF0jlL0xEt7iLcI+Tsyp1LjDkzOYJBz3tB23
 2e8vfTSREZqz0kM+zOuknAO6L+aIZvZ79/1iBN/ZFRjC8Ny1fM0Zj4f3KwcLHqeSB0
 ShntrQcchqKM14n99JwLpzi9PvylTRUtpI4+VlwEOauK0LByrBf7qyZyXhbQ/8yc61
 dgNOmBx+1/BvQ==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:11 +0100
Message-Id: <20211107024330.3061378-24-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfDPmCS404M7pQ0asAF01dqbilmiegH40W5hU+ksbcbnGZ2VoGZsMDP+By8t+GmCVoBzS2Tbv7HkzNhVZ6QzxNwzXjzxX6St7Z75l81pQORj5JLDVFF8j
 kdrEGmprnX9GZJrwuJjqnQlRl/vEpncR3bOLWHuqBgYibw6a8UzeE3ARkSn+K5votysLjkEej5Ho1LKhF4p7iqX2Nagot7ta7eHJMywvZsP7E1TWFFec2nbt
 /4HsXX5uTWcUKugTMQ1gI9Vh4LIWoXhGV/VcX6ara+Y=
Subject: [Buildroot] [PATCH 083/102]
 board/raspberrypi/genimage-raspberrypi0w.cfg: beautify file
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
 board/raspberrypi/genimage-raspberrypi0w.cfg | 49 ++++++++++----------
 1 file changed, 25 insertions(+), 24 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
index f76256ef8a..de7652f99e 100644
--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0w.cfg
@@ -1,31 +1,32 @@
 image boot.vfat {
-  vfat {
-    files = {
-      "bcm2708-rpi-zero-w.dtb",
-      "rpi-firmware/bootcode.bin",
-      "rpi-firmware/cmdline.txt",
-      "rpi-firmware/config.txt",
-      "rpi-firmware/fixup.dat",
-      "rpi-firmware/start.elf",
-      "rpi-firmware/overlays",
-      "zImage"
-    }
-  }
-  size = 32M
+	vfat {
+		files = {
+			"bcm2708-rpi-zero-w.dtb",
+			"rpi-firmware/bootcode.bin",
+			"rpi-firmware/cmdline.txt",
+			"rpi-firmware/config.txt",
+			"rpi-firmware/fixup.dat",
+			"rpi-firmware/start.elf",
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
