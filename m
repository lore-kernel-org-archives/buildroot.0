Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611C3EB64D9
	for <buildroot@archiver.kernel.org>; Thu,  6 Jul 2023 11:57:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0C3224047D;
	Thu,  6 Jul 2023 11:57:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0C3224047D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id up6jKoA0f_nd; Thu,  6 Jul 2023 11:57:40 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 15E2D41581;
	Thu,  6 Jul 2023 11:57:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 15E2D41581
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D560C1BF345
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:57:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id AF63081F42
 for <buildroot@lists.busybox.net>; Thu,  6 Jul 2023 11:57:35 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF63081F42
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id TDUkSTh1OBbV for <buildroot@lists.busybox.net>;
 Thu,  6 Jul 2023 11:57:35 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E991E813A3
 for <buildroot@buildroot.org>; Thu,  6 Jul 2023 11:57:34 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E991E813A3
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D38C886906; Thu,  6 Jul 2023 11:57:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 6 Jul 2023 13:56:49 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 006badd9b61ec281d656e23009ddc326a94ae39e
X-Git-Newrev: 6021f3678b44d43da7057e3135da842cde1ffa05
X-Patchwork-Hint: ignore
Message-Id: <20230706115734.D38C886906@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/raspberrypi: handle dtb overlays for
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=6021f3678b44d43da7057e3135da842cde1ffa05
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
