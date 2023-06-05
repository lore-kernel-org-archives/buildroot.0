Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40A6EC77B73
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 20:11:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DE4F782207;
	Mon,  5 Jun 2023 20:11:14 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DE4F782207
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WLKRtguxiCuN; Mon,  5 Jun 2023 20:11:14 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0A16D82181;
	Mon,  5 Jun 2023 20:11:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0A16D82181
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 428261BF95D
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:10:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1C9E282181
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 20:10:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1C9E282181
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gI93rkqETwMl for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 20:10:58 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4352D82169
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 20:10:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4352D82169
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3013086C8D; Mon,  5 Jun 2023 20:10:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 5 Jun 2023 22:07:43 +0200
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: 9e9280fea5ec5c0d7878a6f12ff185013db50a45
X-Git-Newrev: ff7de79f729ec54629db7c7e46ed620884995cb1
X-Patchwork-Hint: ignore
Message-Id: <20230605201058.3013086C8D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x]
 configs/stm32f429_disco_xip_defconfig: fix runtime error due to low ram
 space and bump to linux version 6.1.27
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff7de79f729ec54629db7c7e46ed620884995cb1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

After booting Linux the userspace is unusable since every command issued,
that is a symlink to busybox, fails because of no free ram. So let's
disable IIO in linux.config to give some more ram to userspace.

Signed-off-by: Giulio Benetti <giulio.benetti@benettiengineering.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 65ff3e10ed14fe2e42eeacf6037981730b63177d)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 board/stmicroelectronics/stm32f429-disco/linux.config | 4 ----
 configs/stm32f429_disco_xip_defconfig                 | 2 +-
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/board/stmicroelectronics/stm32f429-disco/linux.config b/board/stmicroelectronics/stm32f429-disco/linux.config
index 7b5c60f180..02d9c2d1e0 100644
--- a/board/stmicroelectronics/stm32f429-disco/linux.config
+++ b/board/stmicroelectronics/stm32f429-disco/linux.config
@@ -95,10 +95,6 @@ CONFIG_STM32_MDMA=y
 CONFIG_SYNC_FILE=y
 # CONFIG_VIRTIO_MENU is not set
 # CONFIG_VHOST_MENU is not set
-CONFIG_IIO=y
-CONFIG_IIO_BUFFER=y
-CONFIG_IIO_TRIGGERED_BUFFER=y
-CONFIG_IIO_STM32_TIMER_TRIGGER=y
 # CONFIG_FILE_LOCKING is not set
 # CONFIG_DNOTIFY is not set
 # CONFIG_INOTIFY_USER is not set
diff --git a/configs/stm32f429_disco_xip_defconfig b/configs/stm32f429_disco_xip_defconfig
index 9edbbab387..5640d9dc4d 100644
--- a/configs/stm32f429_disco_xip_defconfig
+++ b/configs/stm32f429_disco_xip_defconfig
@@ -6,7 +6,7 @@ BR2_ENABLE_LTO=y
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/stmicroelectronics/common/stm32f4xx/stm32-post-build.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.27"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/stmicroelectronics/stm32f429-disco/linux.config"
 BR2_LINUX_KERNEL_IMAGE_TARGET_CUSTOM=y
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
