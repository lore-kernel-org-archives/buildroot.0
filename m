Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1B51EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 16:58:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7610940080;
	Wed,  5 Jul 2023 16:58:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7610940080
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 70pMIWjiteFY; Wed,  5 Jul 2023 16:58:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D8A6A402DE;
	Wed,  5 Jul 2023 16:58:53 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D8A6A402DE
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 6D9431BF95D
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:58:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 478FA404C9
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:58:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 478FA404C9
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id HOZyGB5Xj4JR for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 16:58:51 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E383840102
Received: from mslow1.mail.gandi.net (mslow1.mail.gandi.net [217.70.178.240])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E383840102
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:58:50 +0000 (UTC)
Received: from relay8-d.mail.gandi.net (unknown [IPv6:2001:4b98:dc4:8::228])
 by mslow1.mail.gandi.net (Postfix) with ESMTP id 8954CD1677
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:46:28 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 8C0A91BF210;
 Wed,  5 Jul 2023 16:46:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qH5e1-002ofH-M8; Wed, 05 Jul 2023 18:46:21 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 18:46:16 +0200
Message-Id: <20230705164616.671351-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230705164616.671351-1-peter@korsgaard.com>
References: <20230705164616.671351-1-peter@korsgaard.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 3/3] board/raspberrypi: drop variant-specific
 genimage files
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now that we have a template generating an equivalent genimage configuration.

The generated genimage is identical to these +/- file ordering and a
trailing comma / newline that is ignored by genimage, E.G. for rpi3-64:

@@ -8,9 +8,10 @@
                        "rpi-firmware/cmdline.txt",
                        "rpi-firmware/config.txt",
                        "rpi-firmware/fixup.dat",
-                       "rpi-firmware/start.elf",
                        "rpi-firmware/overlays",
-                       "Image"
+                       "rpi-firmware/start.elf",
+                       "Image",
+
                }

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi.cfg    | 33 ------------------
 board/raspberrypi/genimage-raspberrypi0.cfg   | 32 -----------------
 board/raspberrypi/genimage-raspberrypi0w.cfg  | 32 -----------------
 board/raspberrypi/genimage-raspberrypi2.cfg   | 32 -----------------
 .../raspberrypi/genimage-raspberrypi3-64.cfg  | 34 -------------------
 board/raspberrypi/genimage-raspberrypi3.cfg   | 34 -------------------
 .../raspberrypi/genimage-raspberrypi4-64.cfg  | 31 -----------------
 board/raspberrypi/genimage-raspberrypi4.cfg   | 31 -----------------
 .../genimage-raspberrypicm4io-64.cfg          | 31 -----------------
 .../raspberrypi/genimage-raspberrypicm4io.cfg | 31 -----------------
 .../genimage-raspberrypizero2w.cfg            | 32 -----------------
 11 files changed, 353 deletions(-)
 delete mode 100644 board/raspberrypi/genimage-raspberrypi.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi0.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi0w.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi2.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi3-64.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi3.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi4-64.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypi4.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypicm4io-64.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypicm4io.cfg
 delete mode 100644 board/raspberrypi/genimage-raspberrypizero2w.cfg

diff --git a/board/raspberrypi/genimage-raspberrypi.cfg b/board/raspberrypi/genimage-raspberrypi.cfg
deleted file mode 100644
index 04be16cce6..0000000000
--- a/board/raspberrypi/genimage-raspberrypi.cfg
+++ /dev/null
@@ -1,33 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2708-rpi-b.dtb",
-			"bcm2708-rpi-b-plus.dtb",
-			"bcm2708-rpi-cm.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
deleted file mode 100644
index 313f85f651..0000000000
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2708-rpi-zero.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi0w.cfg b/board/raspberrypi/genimage-raspberrypi0w.cfg
deleted file mode 100644
index de7652f99e..0000000000
--- a/board/raspberrypi/genimage-raspberrypi0w.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2708-rpi-zero-w.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
deleted file mode 100644
index dad9275537..0000000000
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2709-rpi-2-b.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi3-64.cfg b/board/raspberrypi/genimage-raspberrypi3-64.cfg
deleted file mode 100644
index 8cbcd91638..0000000000
--- a/board/raspberrypi/genimage-raspberrypi3-64.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2710-rpi-3-b.dtb",
-			"bcm2710-rpi-3-b-plus.dtb",
-			"bcm2837-rpi-3-b.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"Image"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi3.cfg b/board/raspberrypi/genimage-raspberrypi3.cfg
deleted file mode 100644
index a617823379..0000000000
--- a/board/raspberrypi/genimage-raspberrypi3.cfg
+++ /dev/null
@@ -1,34 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2710-rpi-3-b.dtb",
-			"bcm2710-rpi-3-b-plus.dtb",
-			"bcm2710-rpi-cm3.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi4-64.cfg b/board/raspberrypi/genimage-raspberrypi4-64.cfg
deleted file mode 100644
index 3ae938db20..0000000000
--- a/board/raspberrypi/genimage-raspberrypi4-64.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-4-b.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"Image"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypi4.cfg b/board/raspberrypi/genimage-raspberrypi4.cfg
deleted file mode 100644
index 2e578ad556..0000000000
--- a/board/raspberrypi/genimage-raspberrypi4.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-4-b.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg b/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
deleted file mode 100644
index 73d31a57ba..0000000000
--- a/board/raspberrypi/genimage-raspberrypicm4io-64.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-cm4.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"Image"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypicm4io.cfg b/board/raspberrypi/genimage-raspberrypicm4io.cfg
deleted file mode 100644
index 4d09b03556..0000000000
--- a/board/raspberrypi/genimage-raspberrypicm4io.cfg
+++ /dev/null
@@ -1,31 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2711-rpi-cm4.dtb",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup4.dat",
-			"rpi-firmware/start4.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
diff --git a/board/raspberrypi/genimage-raspberrypizero2w.cfg b/board/raspberrypi/genimage-raspberrypizero2w.cfg
deleted file mode 100644
index b510fea563..0000000000
--- a/board/raspberrypi/genimage-raspberrypizero2w.cfg
+++ /dev/null
@@ -1,32 +0,0 @@
-image boot.vfat {
-	vfat {
-		files = {
-			"bcm2710-rpi-zero-2-w.dtb",
-			"rpi-firmware/bootcode.bin",
-			"rpi-firmware/cmdline.txt",
-			"rpi-firmware/config.txt",
-			"rpi-firmware/fixup.dat",
-			"rpi-firmware/start.elf",
-			"rpi-firmware/overlays",
-			"zImage"
-		}
-	}
-
-	size = 32M
-}
-
-image sdcard.img {
-	hdimage {
-	}
-
-	partition boot {
-		partition-type = 0xC
-		bootable = "true"
-		image = "boot.vfat"
-	}
-
-	partition rootfs {
-		partition-type = 0x83
-		image = "rootfs.ext4"
-	}
-}
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
