Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0FACC433EF
	for <buildroot@archiver.kernel.org>; Sat,  8 Jan 2022 20:57:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 60F1060888;
	Sat,  8 Jan 2022 20:57:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ONMXfhk8kIVx; Sat,  8 Jan 2022 20:57:08 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id BC10F607A1;
	Sat,  8 Jan 2022 20:57:07 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id EE4AA1BF847
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:57:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id EA5AB812BB
 for <buildroot@lists.busybox.net>; Sat,  8 Jan 2022 20:57:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XzHknniQVRLr for <buildroot@lists.busybox.net>;
 Sat,  8 Jan 2022 20:57:05 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4D0C981281
 for <buildroot@buildroot.org>; Sat,  8 Jan 2022 20:57:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4509883456; Sat,  8 Jan 2022 20:50:52 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jan 2022 21:56:55 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 65da7755d9266f245b711a19dd97499594415bde
X-Git-Newrev: 220716ab67736311209e3b7a4c7d1c12f569dc95
X-Patchwork-Hint: ignore
Message-Id: <20220108205052.4509883456@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/olimex_a20_olinuxino: fix mali not
 working because Linux version >= 4.20
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

commit: https://git.buildroot.net/buildroot/commit/?id=220716ab67736311209e3b7a4c7d1c12f569dc95
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since on olinuxino_lime/lime2 we have a Linux version >= 4.20 we need to
pass drm_kms_helper.drm_leak_fbdev_smem=1 to kernel command-line that
really enables DRM_FBDEV_LEAK_PHYS_SMEM. CONFIG_DRM_FBDEV_LEAK_PHYS_SMEM
only adds the code for this, but drm_leak_fbdev_smem is 0 by default, so we
need to override it with 1. Same goes for drm_fbdev_overalloc that
must be at least 200 for having a double buffer that is required by
Mali. This fixes both olimex_a20_olinuxino_lime and lime2 that use
extlinux.conf.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
index f754da3623..358bda056b 100644
--- a/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
+++ b/board/olimex/a20_olinuxino/rootfs_overlay/boot/extlinux/extlinux.conf
@@ -1,4 +1,4 @@
 label Olinuxino
     kernel /boot/zImage
     fdtdir /boot
-    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 ${extra}
+    append console=ttyS0,115200 root=/dev/mmcblk0p1 rootwait panic=10 drm_kms_helper.drm_leak_fbdev_smem=1 drm_kms_helper.drm_fbdev_overalloc=200 ${extra}
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
