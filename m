Return-Path: <SRS0=+oVz=QB=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 585BDC433F5
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:15:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 25B7761104
	for <buildroot@archiver.kernel.org>; Sun, 14 Nov 2021 14:15:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 25B7761104
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=bootlin.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E3C7A400DA;
	Sun, 14 Nov 2021 14:15:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Vg_vBTVRQAdQ; Sun, 14 Nov 2021 14:15:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0081740248;
	Sun, 14 Nov 2021 14:15:44 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id DF1CF1BF3D9
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:15:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id DA48B40248
 for <buildroot@lists.busybox.net>; Sun, 14 Nov 2021 14:15:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id czCGFcDC86uQ for <buildroot@lists.busybox.net>;
 Sun, 14 Nov 2021 14:15:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 34028400DA
 for <buildroot@buildroot.org>; Sun, 14 Nov 2021 14:15:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id C18A78D21E; Sun, 14 Nov 2021 14:11:36 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Sun, 14 Nov 2021 15:15:14 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 056e84b7131e32a96b2b4655cac59eb94c8502aa
X-Git-Newrev: 0351a60b95cfa775215d64646c81fbed1de4f341
X-Patchwork-Hint: ignore
Message-Id: <20211114141136.C18A78D21E@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/freescale/common/imx: place rootfs
 at proper offset when BR2_LINUX_KERNEL_INSTALL_TARGET=y
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

commit: https://git.buildroot.net/buildroot/commit/?id=0351a60b95cfa775215d64646c81fbed1de4f341
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Currently, when BR2_LINUX_KERNEL_INSTALL_TARGET=y is selected, issuing
a "saveenv" command in the U-Boot prompt may lead to rootfs corruption.

When BR2_LINUX_KERNEL_INSTALL_TARGET is not selected, then
board/freescale/common/imx/genimage.cfg.template is used as per the logic
inside board/freescale/common/imx/post-image.sh.

board/freescale/common/imx/genimage.cfg.template correctly puts the
rootfs at a safe offset.

With BR2_LINUX_KERNEL_INSTALL_TARGET=y, then
board/freescale/common/imx/genimage.cfg.template_no_boot_part or
board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
are used and no offset to the rootfs is given, which may cause U-Boot
environment area to write into the rootfs area, causing the rootfs
corruption.

Avoid this problem by placing the rootfs at an 8MB offset, just like
it is done in board/freescale/common/imx/genimage.cfg.

Tested on a imx6qp-wandboard and also on a custom imx6ull based board.

"saveenv" does not corrupt the rootfs anymore after this change.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/freescale/common/imx/genimage.cfg.template_no_boot_part     | 1 +
 board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl | 1 +
 2 files changed, 2 insertions(+)

diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
index edc34d0fcd..b8fa43210b 100644
--- a/board/freescale/common/imx/genimage.cfg.template_no_boot_part
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part
@@ -11,5 +11,6 @@ image sdcard.img {
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext2"
+    offset = 8M
   }
 }
diff --git a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
index c29032572a..ef015918a5 100644
--- a/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
+++ b/board/freescale/common/imx/genimage.cfg.template_no_boot_part_spl
@@ -26,5 +26,6 @@ image sdcard.img {
   partition rootfs {
     partition-type = 0x83
     image = "rootfs.ext2"
+    offset = 8M
   }
 }
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
