Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FF26EB64DA
	for <buildroot@archiver.kernel.org>; Wed,  5 Jul 2023 16:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C41A5417A3;
	Wed,  5 Jul 2023 16:46:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C41A5417A3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aJD0TSOK-9ma; Wed,  5 Jul 2023 16:46:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 86C5C417B2;
	Wed,  5 Jul 2023 16:46:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 86C5C417B2
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 206311BF59F
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:46:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ECB8941799
 for <buildroot@lists.busybox.net>; Wed,  5 Jul 2023 16:46:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ECB8941799
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PUjUB2z5WlqX for <buildroot@lists.busybox.net>;
 Wed,  5 Jul 2023 16:46:25 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9EE6B41798
Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net
 [217.70.183.201])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9EE6B41798
 for <buildroot@buildroot.org>; Wed,  5 Jul 2023 16:46:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id 035A61BF207;
 Wed,  5 Jul 2023 16:46:21 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.94.2)
 (envelope-from <peko@48ers.dk>)
 id 1qH5e0-002of8-Q8; Wed, 05 Jul 2023 18:46:20 +0200
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Wed,  5 Jul 2023 18:46:14 +0200
Message-Id: <20230705164616.671351-1-peter@korsgaard.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/3] board/raspberry: handle dtb overlays for
 all variants
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
Cc: Martin Bark <martin@barkynet.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Most rpi defconfigs use dtb overlays, but not rpi0 / rpi2 - Making it harder
to use overlays on those boards as the genimage files have to be tweaked.

To fix this, create the rpi-firmware/overlays directory in the post-build
script if needed and unconditionally include it in the genimage files so
rpi0/rpi2 works consistently with the other variants.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/raspberrypi/genimage-raspberrypi0.cfg | 1 +
 board/raspberrypi/genimage-raspberrypi2.cfg | 1 +
 board/raspberrypi/post-build.sh             | 3 +++
 3 files changed, 5 insertions(+)

diff --git a/board/raspberrypi/genimage-raspberrypi0.cfg b/board/raspberrypi/genimage-raspberrypi0.cfg
index 1fa3f5096f..313f85f651 100644
--- a/board/raspberrypi/genimage-raspberrypi0.cfg
+++ b/board/raspberrypi/genimage-raspberrypi0.cfg
@@ -7,6 +7,7 @@ image boot.vfat {
 			"rpi-firmware/config.txt",
 			"rpi-firmware/fixup.dat",
 			"rpi-firmware/start.elf",
+			"rpi-firmware/overlays",
 			"zImage"
 		}
 	}
diff --git a/board/raspberrypi/genimage-raspberrypi2.cfg b/board/raspberrypi/genimage-raspberrypi2.cfg
index acd23e7ca8..dad9275537 100644
--- a/board/raspberrypi/genimage-raspberrypi2.cfg
+++ b/board/raspberrypi/genimage-raspberrypi2.cfg
@@ -7,6 +7,7 @@ image boot.vfat {
 			"rpi-firmware/config.txt",
 			"rpi-firmware/fixup.dat",
 			"rpi-firmware/start.elf",
+			"rpi-firmware/overlays",
 			"zImage"
 		}
 	}
diff --git a/board/raspberrypi/post-build.sh b/board/raspberrypi/post-build.sh
index 5e5eb71100..b24256fcea 100755
--- a/board/raspberrypi/post-build.sh
+++ b/board/raspberrypi/post-build.sh
@@ -9,3 +9,6 @@ if [ -e ${TARGET_DIR}/etc/inittab ]; then
 	sed -i '/GENERIC_SERIAL/a\
 tty1::respawn:/sbin/getty -L  tty1 0 vt100 # HDMI console' ${TARGET_DIR}/etc/inittab
 fi
+
+# exnsure overlays exists for genimage
+mkdir -p "${BINARIES_DIR}/rpi-firmware/overlays"
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
