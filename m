Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC386C54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 18:49:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 76E82409FA;
	Thu, 14 Mar 2024 18:49:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id aO15OVOf3dw1; Thu, 14 Mar 2024 18:49:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3DC3C41575
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3DC3C41575;
	Thu, 14 Mar 2024 18:49:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2A1941BF422
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 38F0840849
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 18:49:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Y5NmVljuM4Xo for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 18:49:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DBE2B410C0
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id DBE2B410C0
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id D10D5811FC; Thu, 14 Mar 2024 18:49:19 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 19:38:03 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dedb7dc6d6543d5ce16ac73f927e0a33806075e1
X-Git-Newrev: a3629797616433b0cd5b876aa3ae0996ff90b696
X-Patchwork-Hint: ignore
Message-Id: <20240314184919.D10D5811FC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] configs/ci20_defconfig: configure eth0
 through BR2_SYSTEM_DHCP rather than kernel cmdline
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3629797616433b0cd5b876aa3ae0996ff90b696
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Passing ip=dhcp to the kernel will cause it to try to configure the network
interface using DHCP and wait up to 120s for the interface to detect a link,
slowing down boots without a network cable a lot.

Instead use the "normal" BR2_SYSTEM_DHCP, E.G.  trigger ifup to run the DHCP
client in the background.

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/ci20/uboot-env.txt | 2 +-
 configs/ci20_defconfig   | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/board/ci20/uboot-env.txt b/board/ci20/uboot-env.txt
index 3093496cc9..2d693af7b7 100644
--- a/board/ci20/uboot-env.txt
+++ b/board/ci20/uboot-env.txt
@@ -1,6 +1,6 @@
 baudrate=115200
 board_mfr=NP
-bootargs=console=ttyS4,115200 console=tty0 mem=256M@0x0 mem=768M@0x30000000 rootwait root=/dev/mmcblk0p1 devtmpfs.mount=1 ip=dhcp
+bootargs=console=ttyS4,115200 console=tty0 mem=256M@0x0 mem=768M@0x30000000 rootwait root=/dev/mmcblk0p1 devtmpfs.mount=1
 bootcmd=run ethargs; ext4load mmc 0:1 0x88000000 /boot/uImage; bootm 0x88000000
 bootdelay=1
 ethargs=env set bootargs ${bootargs}
diff --git a/configs/ci20_defconfig b/configs/ci20_defconfig
index 31019aeae2..4b3c742173 100644
--- a/configs/ci20_defconfig
+++ b/configs/ci20_defconfig
@@ -7,6 +7,7 @@ BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttyS4"
+BR2_SYSTEM_DHCP="eth0"
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
