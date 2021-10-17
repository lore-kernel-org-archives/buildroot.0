Return-Path: <SRS0=OlWD=PF=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72A0C433F5
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:38:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2D33B60E08
	for <buildroot@archiver.kernel.org>; Sun, 17 Oct 2021 16:38:05 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 2D33B60E08
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=buildroot.org
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0534D81971;
	Sun, 17 Oct 2021 16:38:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Zykl_Q0wjBvC; Sun, 17 Oct 2021 16:38:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A1B6819F6;
	Sun, 17 Oct 2021 16:38:03 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 26F8E1BF404
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 23A6F605DE
 for <buildroot@lists.busybox.net>; Sun, 17 Oct 2021 16:37:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=libero.it
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id tvnoL4yQ5QQN for <buildroot@lists.busybox.net>;
 Sun, 17 Oct 2021 16:37:46 +0000 (UTC)
X-Greylist: from auto-whitelisted by SQLgrey-1.8.0
Received: from libero.it (smtp-32.italiaonline.it [213.209.10.32])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C3263605E2
 for <buildroot@buildroot.org>; Sun, 17 Oct 2021 16:37:45 +0000 (UTC)
Received: from passgat-Modern-14-A10M.homenet.telecomitalia.it
 ([79.24.103.190]) by smtp-32.iol.local with ESMTPA
 id c92DmY5ZpPvRTc92RmEzYd; Sun, 17 Oct 2021 18:29:31 +0200
x-libjamoibt: 1601
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=libero.it; s=s2021;
 t=1634488171; bh=Ft8LJyIL4kQCCyEsz0ax/5cwVHo3u7Tf6icgBojGDjI=;
 h=From;
 b=ztm0kTuoCdpQVpTBBfNvxvcqJN0UuB6/5VNASP+JZRCOiVS/nzQ7UMH/vIdLCljxa
 lpXZAlwAeEJFtz3DCi8+BAzEYtp5iiw94rGUG+qEg+kBMuyA7u/g455WQljod6HAx0
 ce9EQmc6NYdXF9ph3+uQZSHoQbn36gb1sx9oLkvWql/44KchqvUz2YB4ElaKYe2Fnf
 xOrr1TBaNaHZoGSfyvAyzBzA/3PEcQsR3two0sSI5XsWCbvC/d/s9lecIFhkyDtnjK
 YSwyQXSTWR5I9NAW5paS5uE6yVhxqv0IdTZZLKKJWfzDQtPXY8IR9fPIYFFVEnjZdG
 1/bqxjhI87tgw==
X-CNFS-Analysis: v=2.4 cv=NqgUz+RJ c=1 sm=1 tr=0 ts=616c4f6b cx=a_exe
 a=YGFxGp/Nwp6jLtVyvvsm7Q==:117 a=YGFxGp/Nwp6jLtVyvvsm7Q==:17
 a=ebg_UmrbKguA3I-y1BgA:9
To: buildroot@buildroot.org
Date: Sun, 17 Oct 2021 18:28:39 +0200
Message-Id: <20211017162839.20278-3-dariobin@libero.it>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20211017162839.20278-1-dariobin@libero.it>
References: <20211017162839.20278-1-dariobin@libero.it>
X-CMAE-Envelope: MS4xfHmrInGLXimijs0uw8mRS5eTEbmyCFv8flCokkFHAHXjUvXMaU8hJorFrjkMs7L6+Tv2gj+E1lrNb4BW1nRHUSBt+VWZe/kmZybtcWP8rXcrPpASDo0m
 pNDU9a05x1ChwS+Kqy2PA+gd195IN988gSDrhCxgRUC8ELtzOcscrHAScSRPLKyr89T6RrnUaXKrEEar+H1TEnoVd0Xp1zmWLh2ncEOSUf8LJcpshw4nEhvI
 ChK7cvTOM5Bpik+1C9IqyWZk8fb9ZGqjWxWRUWTFUklXA3hQU+MiO/rUJCQ12LDJVFkEDucqdcxPW3Zjj8iiY55DK4z/4ZGX7aVTxSqsEZg=
Subject: [Buildroot] [PATCH 2/2] configs/stm32f469_disco: add framebuffer
 test application
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
From: Dario Binacchi via buildroot <buildroot@buildroot.org>
Reply-To: Dario Binacchi <dariobin@libero.it>
Cc: Christophe Priouzeau <christophe.priouzeau@foss.st.com>,
 Dario Binacchi <dariobin@libero.it>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

It's a test suite for Linux framebuffer. You can run, for example,
fb-test-rect that displays random rectangles on the screen. But first,
you need to enable the framebuffer:

~ # echo 0 0 > /sys/class/graphics/fb0/pan
~ # fb-test-rect

Signed-off-by: Dario Binacchi <dariobin@libero.it>
---
 configs/stm32f469_disco_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/configs/stm32f469_disco_defconfig b/configs/stm32f469_disco_defconfig
index 438d32150c..47dbc108a7 100644
--- a/configs/stm32f469_disco_defconfig
+++ b/configs/stm32f469_disco_defconfig
@@ -14,6 +14,7 @@ BR2_LINUX_KERNEL_IMAGE_TARGET_NAME="zImage"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="stm32f469-disco"
 BR2_PACKAGE_BUSYBOX_CONFIG="package/busybox/busybox-minimal.config"
+BR2_PACKAGE_FB_TEST_APP=y
 BR2_TARGET_ROOTFS_EXT2=y
 BR2_TARGET_ROOTFS_EXT2_SIZE="32M"
 # BR2_TARGET_ROOTFS_TAR is not set
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
