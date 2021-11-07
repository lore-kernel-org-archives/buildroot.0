Return-Path: <SRS0=xRR2=P2=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D279C433F5
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2FF5E611C0
	for <buildroot@archiver.kernel.org>; Sun,  7 Nov 2021 02:50:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2FF5E611C0
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=benettiengineering.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C03A81CDC;
	Sun,  7 Nov 2021 02:50:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9WnfwVYN-VOl; Sun,  7 Nov 2021 02:50:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6AC86823FF;
	Sun,  7 Nov 2021 02:50:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 7DE891BF4DB
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6E37180CE8
 for <buildroot@lists.busybox.net>; Sun,  7 Nov 2021 02:45:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id knXNUxJtI2tz for <buildroot@lists.busybox.net>;
 Sun,  7 Nov 2021 02:45:19 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from smtpcmd14162.aruba.it (smtpcmd14162.aruba.it [62.149.156.162])
 by smtp1.osuosl.org (Postfix) with ESMTP id A878880CDF
 for <buildroot@buildroot.org>; Sun,  7 Nov 2021 02:45:18 +0000 (UTC)
Received: from ubuntu.localdomain ([146.241.216.221])
 by Aruba Outgoing Smtp  with ESMTPSA
 id jY9bmqwt8rIRljYBKmR7rT; Sun, 07 Nov 2021 03:45:18 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aruba.it; s=a1;
 t=1636253118; bh=rGemGjsYwf4cwrnR6JN6AjEMhlaTx0LrzyTM7kmzAX0=;
 h=From:To:Subject:Date:MIME-Version;
 b=Zgsnntq5r70gywQODXPIYXUBSBpjv6CwsOD8DvQV9sTm7GKDkBTirgx+b70oM6sDk
 DG1Cpf7Em+EQn0DiUMiHD563j7VvWR6V7QlBAo1G1U1kLe1vPmbxSGLtSjUv37O7dp
 81zEc2R0qy+f/THGDzP4aHBTSQbaD8gL3PNRYdNhwgh7Ra2Hprv0m5be/q3ByhBCTV
 QOgkrrDEshL4MuXVjhiz4cxGQBlzRb+XJsen3Hqt6jC/dx3+C4eZ0CrNCBvYfVcAj6
 j5fRaYqvZumMDASr4EGZHva/4gZx1HlVF323yb7loT49PoPJIPu3uBpNPVwO/CfM24
 dOaVzbsmoaqQw==
From: Giulio Benetti <giulio.benetti@benettiengineering.com>
To: buildroot@buildroot.org
Date: Sun,  7 Nov 2021 03:43:17 +0100
Message-Id: <20211107024330.3061378-30-giulio.benetti@benettiengineering.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
References: <20211107024330.3061378-1-giulio.benetti@benettiengineering.com>
MIME-Version: 1.0
X-CMAE-Envelope: MS4wfId4OXf2VJzOATKtmOuxAjlE6fqTLhhDSxbFj5NUeR/1M9TBGIDKlgi8XqKnaW5D6UpTQeiDiQA53iotMSmyNAJts+Fw3M/9LlKhMhw9ShHh4VwQHjI5
 lctQ8K2nfilO5kOveu/fAzSEl5CLWAMQUsMHLMbWu/pUqAnRL/2+CTXHp1JEw0PvHS2a0K0RhsPsBBqm80n+/PzlO85pEhPGF8wgpqX6c/fzkSc6shQM/rqy
 7ItavedgjhKNvRA8q9a8Sx6lHNUoluDjiF2JqIIzthE=
Subject: [Buildroot] [PATCH 089/102]
 board/raspberrypi/genimage-raspberrypicm4io-64.cfg: beautify file
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
 .../genimage-raspberrypicm4io-64.cfg          | 47 ++++++++++---------
 1 file changed, 24 insertions(+), 23 deletions(-)

diff --git a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
index 63806d0c31..73d31a57ba 100644
--- a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
+++ b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
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
-      "Image"
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
