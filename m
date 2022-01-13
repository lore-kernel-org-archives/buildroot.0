Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3969C433EF
	for <buildroot@archiver.kernel.org>; Thu, 13 Jan 2022 21:10:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 935B66FC6E;
	Thu, 13 Jan 2022 21:10:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5RXf-bHP_QP; Thu, 13 Jan 2022 21:10:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF18E6FC6C;
	Thu, 13 Jan 2022 21:10:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 41F6B1BF487
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:10:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3CD64404DD
 for <buildroot@lists.busybox.net>; Thu, 13 Jan 2022 21:10:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id R2SR5FOobbt4 for <buildroot@lists.busybox.net>;
 Thu, 13 Jan 2022 21:10:38 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 75BAD40222
 for <buildroot@buildroot.org>; Thu, 13 Jan 2022 21:10:38 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 1B8FA83493; Thu, 13 Jan 2022 21:04:14 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Thu, 13 Jan 2022 22:09:54 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fa3e7a63b93620b8227d66c6a973cd6140432cf3
X-Git-Newrev: 6e68ec6de08f0ae9488a4df62ea15eb7e2bdf7b8
X-Patchwork-Hint: ignore
Message-Id: <20220113210414.1B8FA83493@busybox.osuosl.org>
Subject: [Buildroot] [git commit] board/orangepi/orangepi-zero: using
 PARTUUID to identify root filesystem
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

commit: https://git.buildroot.net/buildroot/commit/?id=6e68ec6de08f0ae9488a4df62ea15eb7e2bdf7b8
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The mmc block device number can vary, so passing a mmc block device to
specify the location of the rootfs is not a reliable
approach. Instead, use the root=PARTUUID=<uuid> mechanism, where the
uuid is found by U-Boot.

Signed-off-by: Sergey Kuzminov <kuzminov.sergey81@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 board/orangepi/orangepi-zero/boot.cmd | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/orangepi/orangepi-zero/boot.cmd b/board/orangepi/orangepi-zero/boot.cmd
index 44f0885ff4..d094a64fe5 100644
--- a/board/orangepi/orangepi-zero/boot.cmd
+++ b/board/orangepi/orangepi-zero/boot.cmd
@@ -1,6 +1,7 @@
 setenv fdt_high ffffffff
 
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+part uuid mmc 0:2 uuid
+setenv bootargs console=ttyS0,115200 root=PARTUUID=${uuid} rootwait
 
 fatload mmc 0 $kernel_addr_r zImage
 fatload mmc 0 $fdt_addr_r sun8i-h2-plus-orangepi-zero.dtb
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
