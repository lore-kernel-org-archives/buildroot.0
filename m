Return-Path: <SRS0=jXvl=M2=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,DATE_IN_PAST_96_XX,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DE8EC4338F
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:52:39 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA45060724
	for <buildroot@archiver.kernel.org>; Tue,  3 Aug 2021 21:52:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA45060724
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id BBEE7400C3;
	Tue,  3 Aug 2021 21:52:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Oixhe05h5ySW; Tue,  3 Aug 2021 21:52:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B969440135;
	Tue,  3 Aug 2021 21:52:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DC8281BF349
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9350D83AC0
 for <buildroot@lists.busybox.net>; Tue,  3 Aug 2021 21:10:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gNcg5iOFGZx1 for <buildroot@lists.busybox.net>;
 Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id E8D7283AC3
 for <buildroot@buildroot.org>; Tue,  3 Aug 2021 21:10:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id 4CC9987F55; Tue,  3 Aug 2021 21:10:01 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 13 Jul 2021 21:57:15 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 18d78a8985083b575d54dba3b292621b6fa6211e
X-Git-Newrev: 81175e558090ce986ab1ba5f4c309ca89743899f
X-Patchwork-Hint: ignore
Message-Id: <20210803211001.4CC9987F55@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] board/orangepi-pc-plus: switch
 to GPT partitions for PARTLABEL support
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

commit: https://git.buildroot.net/buildroot/commit/?id=81175e558090ce986ab1ba5f4c309ca89743899f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

In new kernels sunxi-mmc driver has been switched to asynchronous probe.
As a result, mmc (SD/eMMC) indexes can be shuffled breaking board boot.
Switch to GPT partitions to use partition labels instead of explicit
mmcblk device names. Note that the default GPT partition table location
conflicts with the SPL location, so move GPT table after bootloaders.

Signed-off-by: Sergey Matyukevich <geomatsi@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 board/orangepi/orangepi-pc-plus/boot.cmd     | 2 +-
 board/orangepi/orangepi-pc-plus/genimage.cfg | 8 +++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/board/orangepi/orangepi-pc-plus/boot.cmd b/board/orangepi/orangepi-pc-plus/boot.cmd
index 0c75c862e0..c91f77942f 100644
--- a/board/orangepi/orangepi-pc-plus/boot.cmd
+++ b/board/orangepi/orangepi-pc-plus/boot.cmd
@@ -1,6 +1,6 @@
 setenv fdt_high ffffffff
 
-setenv bootargs console=ttyS0,115200 earlyprintk root=/dev/mmcblk0p2 rootwait
+setenv bootargs console=ttyS0,115200 earlyprintk root=PARTLABEL=rootfs rootwait
 
 fatload mmc 0 $kernel_addr_r zImage
 fatload mmc 0 $fdt_addr_r sun8i-h3-orangepi-pc-plus.dtb
diff --git a/board/orangepi/orangepi-pc-plus/genimage.cfg b/board/orangepi/orangepi-pc-plus/genimage.cfg
index 9ffa1a21ae..b4fcc827ec 100644
--- a/board/orangepi/orangepi-pc-plus/genimage.cfg
+++ b/board/orangepi/orangepi-pc-plus/genimage.cfg
@@ -13,13 +13,17 @@ image boot.vfat {
 
 image sdcard.img {
 	hdimage {
+		# for root=PARTLABEL support
+		gpt = true
+		# default GPT location conflicts with bootloaders, move it after
+		gpt-location = 1M
 	}
 
 	partition u-boot {
 		in-partition-table = "no"
 		image = "u-boot-sunxi-with-spl.bin"
 		offset = 8192
-		size = 1040384 # 1MB - 8192
+		size = 1056768 # 1MB - 8K + 16K(GPT)
 	}
 
 	partition boot {
@@ -28,6 +32,8 @@ image sdcard.img {
 		image = "boot.vfat"
 	}
 
+	# 'rootfs' will be used as the partition label, used
+	# with root=PARTLABEL=rootfs kernel command line
 	partition rootfs {
 		partition-type = 0x83
 		image = "rootfs.ext4"
_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
