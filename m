Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BFFDC54E49
	for <buildroot@archiver.kernel.org>; Sun, 10 Mar 2024 19:26:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDE4560788;
	Sun, 10 Mar 2024 19:26:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id zmIWaWEIRQdH; Sun, 10 Mar 2024 19:26:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B112C60799
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id B112C60799;
	Sun, 10 Mar 2024 19:26:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DE3061BF865
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 19:26:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D826260647
 for <buildroot@lists.busybox.net>; Sun, 10 Mar 2024 19:26:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id EFDK8Kr8MOOs for <buildroot@lists.busybox.net>;
 Sun, 10 Mar 2024 19:26:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=217.70.183.197;
 helo=relay5-d.mail.gandi.net; envelope-from=peko@48ers.dk; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 69B6D60611
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 69B6D60611
Received: from relay5-d.mail.gandi.net (relay5-d.mail.gandi.net
 [217.70.183.197])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 69B6D60611
 for <buildroot@buildroot.org>; Sun, 10 Mar 2024 19:26:25 +0000 (UTC)
Received: by mail.gandi.net (Postfix) with ESMTPSA id B44CD1C0003;
 Sun, 10 Mar 2024 19:26:22 +0000 (UTC)
Received: from peko by dell.be.48ers.dk with local (Exim 4.96)
 (envelope-from <peko@48ers.dk>) id 1rjOoP-0089fh-34;
 Sun, 10 Mar 2024 20:26:21 +0100
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Mar 2024 20:26:19 +0100
Message-Id: <20240310192619.1943776-3-peter@korsgaard.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240310192619.1943776-1-peter@korsgaard.com>
References: <20240310192619.1943776-1-peter@korsgaard.com>
MIME-Version: 1.0
X-GND-Sasl: peter@korsgaard.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=none (p=none dis=none)
 header.from=korsgaard.com
Subject: [Buildroot] [PATCH 3/3] configs/ci20_defconfig: configure eth0
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
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

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
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
