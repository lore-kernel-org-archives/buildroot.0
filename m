Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BD5CD711A3
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 20:11:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E23B083E7A;
	Thu, 18 Dec 2025 20:11:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5T-cfUd9AxXV; Thu, 18 Dec 2025 20:11:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0EFB83E1C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766088716;
	bh=RGyyxWcNNLWhxnKp2sGjf5IwKUhTYM56yKM3ZsQ0OKA=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=SsUdnmi1oAqzB8lJUy3fwrBdfYDYQ/cjQnGhD7ptR6ZixMTFuybBkVE6Q5fJhsUV2
	 DSIMTmJgOsfaT6ujaMU5lGVBH9RnJ6pvk+K+l790uuaXVeBwnZj5B3isvtAEhHdoKE
	 1dTVAh3RSxBl+djvVAlUMrebpAuJkkmDYsyBvyfYXxGCBCFfkjvle3yEgf5gvr93IU
	 esb01xRkqQRzCNPiBgpq2YDnQhmRluc0PPAhBhJV1LK/cHIPiH4hDEE+BLwREjL6ZM
	 L4r88S0nP6VH+Flikn7MZOYtg9K7iuSTMgr+ubUmdpJ4HCXkVdxTg+ofSXoxJn0RNL
	 MBwKZWrUNfZyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B0EFB83E1C;
	Thu, 18 Dec 2025 20:11:56 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2ABBC1A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:11:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1143240C66
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:11:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rVZLZqmZTMrV for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 20:11:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=212.227.17.20;
 helo=mout.gmx.net; envelope-from=ps.report@gmx.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A9D6C40C42
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A9D6C40C42
Received: from mout.gmx.net (mout.gmx.net [212.227.17.20])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A9D6C40C42
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 20:11:52 +0000 (UTC)
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from pc-1.fritz.box ([82.135.81.46]) by mail.gmx.net (mrgmx104
 [212.227.17.168]) with ESMTPSA (Nemesis) id 1MbRjt-1w89D33BQf-00bKPB; Thu, 18
 Dec 2025 21:11:48 +0100
To: buildroot@buildroot.org
Cc: =?UTF-8?q?Ga=C3=ABl=20PORTAY?= <gael.portay+rtone@gmail.com>,
 Julien Grossholtz <julien.grossholtz@openest.io>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Martin Bark <martin@barkynet.com>, Peter Seiderer <ps.report@gmx.net>
Date: Thu, 18 Dec 2025 21:11:46 +0100
Message-ID: <20251218201147.2617551-1-ps.report@gmx.net>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-Provags-ID: V03:K1:c3WXWPbKLuJe35xaK6RUBqt1YQYjPsFmhkqm7WXDTY8uVZSZXzs
 MCQNbjzJWBdwbIUS/ntYurIGoNqiZcGl1qBGRz90SB3t1yGNZPIRufB76eObD1t9MtS4ynv
 nxDSwDXlRf8wffvM38RRb3G7ybpXu2MpV4Cqv1ez3WfRP6ovDDeRKehAsuSvIMjF81muXQc
 9IS5iTvOoZSHp4I9hE6bQ==
UI-OutboundReport: notjunk:1;M01:P0:y6wr/13E5Rk=;kQjqaBR1RT/wm+NMrLT9lHP87tR
 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
 k8uWFOLryzf9DrTB5Tw2UfNSXnE6m
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmx.net; 
 s=s31663417; t=1766088708; x=1766693508; i=ps.report@gmx.net;
 bh=wR5kAhtlTomxQ2+hLJNBSZjHfmJXzTMA8UMRwOSS5C8=;
 h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-ID:
 MIME-Version:Content-Transfer-Encoding:cc:
 content-transfer-encoding:content-type:date:from:message-id:
 mime-version:reply-to:subject:to;
 b=RMwzC/uxBx5W+2jmMjOIlFT3RKmecMCtPubC+monLX06CYZaVaIPvVC1fpWoat4T
 6vKiDbubQHWIwbjGSqSBya/mN5+dqRBbwC8J2MtW+3SlYnxb6wvKFf7BbP+kYKEzm
 H87vTfQhKTbBgtKspLIWNGOMiyi3y7LTVv7tSRqiplUCZyYq2JOoPpE0dDn9qqITh
 RX+DkGPssZjNd+6bvdXJnHdnJ7zd0yqln/fkYzvI6LGl2pvpmLjBNJQdcKRjI3RZW
 WS+JqCirk79Nc2JJkLsQVpWQq8O/ikViyc3X3F/jMktbOvhn5bAsxU5dmjmpIm7gU
 WvuHo5ZQQJ0cMsNmuw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=gmx.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmx.net header.i=ps.report@gmx.net
 header.a=rsa-sha256 header.s=s31663417 header.b=RMwzC/ux
Subject: [Buildroot] [PATCH v1 1/2] configs/raspberrypi*: bump kernel
 version to 21b4101 (6.12.61)
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Peter Seiderer via buildroot <buildroot@buildroot.org>
Reply-To: Peter Seiderer <ps.report@gmx.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Now based on 6.12.61 (from 6.12.41)

Signed-off-by: Peter Seiderer <ps.report@gmx.net>
---
 board/raspberrypi/patches/linux/linux.hash | 2 +-
 configs/raspberrypi0_defconfig             | 2 +-
 configs/raspberrypi0w_defconfig            | 2 +-
 configs/raspberrypi2_64_defconfig          | 2 +-
 configs/raspberrypi2_defconfig             | 2 +-
 configs/raspberrypi3_64_defconfig          | 2 +-
 configs/raspberrypi3_defconfig             | 2 +-
 configs/raspberrypi3_qt5we_defconfig       | 2 +-
 configs/raspberrypi4_64_defconfig          | 2 +-
 configs/raspberrypi4_defconfig             | 2 +-
 configs/raspberrypi5_defconfig             | 2 +-
 configs/raspberrypi_defconfig              | 2 +-
 configs/raspberrypicm4io_64_defconfig      | 2 +-
 configs/raspberrypicm4io_defconfig         | 2 +-
 configs/raspberrypicm5io_defconfig         | 2 +-
 configs/raspberrypizero2w_64_defconfig     | 2 +-
 configs/raspberrypizero2w_defconfig        | 2 +-
 17 files changed, 17 insertions(+), 17 deletions(-)

diff --git a/board/raspberrypi/patches/linux/linux.hash b/board/raspberrypi/patches/linux/linux.hash
index 51b0684b20..fedfd9d4c9 100644
--- a/board/raspberrypi/patches/linux/linux.hash
+++ b/board/raspberrypi/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  afc44e2899a3c32a1b968272a5816e5c90bea346341153807553396621e65dde  linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz
+sha256  7c31df8061aae748a6e72417bfe743a54198fb5bdc96e229ecc605dc621d32ef  linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz
diff --git a/configs/raspberrypi0_defconfig b/configs/raspberrypi0_defconfig
index 1be48c32dc..9c000dc39d 100644
--- a/configs/raspberrypi0_defconfig
+++ b/configs/raspberrypi0_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero"
diff --git a/configs/raspberrypi0w_defconfig b/configs/raspberrypi0w_defconfig
index c7803c5af6..a2392faf0b 100644
--- a/configs/raspberrypi0w_defconfig
+++ b/configs/raspberrypi0w_defconfig
@@ -8,7 +8,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi0w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi0w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-zero-w"
diff --git a/configs/raspberrypi2_64_defconfig b/configs/raspberrypi2_64_defconfig
index 57f98c7396..f8cadcb731 100644
--- a/configs/raspberrypi2_64_defconfig
+++ b/configs/raspberrypi2_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi2_defconfig b/configs/raspberrypi2_defconfig
index 60eb62b473..5e3af7864b 100644
--- a/configs/raspberrypi2_defconfig
+++ b/configs/raspberrypi2_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi2/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi2/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2709-rpi-2-b broadcom/bcm2710-rpi-2-b"
diff --git a/configs/raspberrypi3_64_defconfig b/configs/raspberrypi3_64_defconfig
index 59b8b3fc6f..31568129ac 100644
--- a/configs/raspberrypi3_64_defconfig
+++ b/configs/raspberrypi3_64_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_defconfig b/configs/raspberrypi3_defconfig
index 3f7fdeb3ab..4cc73708e8 100644
--- a/configs/raspberrypi3_defconfig
+++ b/configs/raspberrypi3_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi3_qt5we_defconfig b/configs/raspberrypi3_qt5we_defconfig
index 8cbb8b0d41..48284513dd 100644
--- a/configs/raspberrypi3_qt5we_defconfig
+++ b/configs/raspberrypi3_qt5we_defconfig
@@ -12,7 +12,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi3/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi3/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-3-b broadcom/bcm2710-rpi-3-b-plus broadcom/bcm2710-rpi-cm3"
diff --git a/configs/raspberrypi4_64_defconfig b/configs/raspberrypi4_64_defconfig
index c0a33c3eb5..ce79952ff7 100644
--- a/configs/raspberrypi4_64_defconfig
+++ b/configs/raspberrypi4_64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi4_defconfig b/configs/raspberrypi4_defconfig
index 75078a3c2c..a6df6fd923 100644
--- a/configs/raspberrypi4_defconfig
+++ b/configs/raspberrypi4_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi4/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi4/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-4-b broadcom/bcm2711-rpi-400 broadcom/bcm2711-rpi-cm4 broadcom/bcm2711-rpi-cm4s"
diff --git a/configs/raspberrypi5_defconfig b/configs/raspberrypi5_defconfig
index 6928e2ba0f..63432f45d5 100644
--- a/configs/raspberrypi5_defconfig
+++ b/configs/raspberrypi5_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi5/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi5/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypi_defconfig b/configs/raspberrypi_defconfig
index 00525e050e..fd8508661c 100644
--- a/configs/raspberrypi_defconfig
+++ b/configs/raspberrypi_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypi/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypi/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcmrpi"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2708-rpi-b-rev1 broadcom/bcm2708-rpi-b broadcom/bcm2708-rpi-b-plus broadcom/bcm2708-rpi-cm"
diff --git a/configs/raspberrypicm4io_64_defconfig b/configs/raspberrypicm4io_64_defconfig
index 648740c273..53f5193db4 100644
--- a/configs/raspberrypicm4io_64_defconfig
+++ b/configs/raspberrypicm4io_64_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm4io_defconfig b/configs/raspberrypicm4io_defconfig
index e5bbff76c1..01e02fd300 100644
--- a/configs/raspberrypicm4io_defconfig
+++ b/configs/raspberrypicm4io_defconfig
@@ -11,7 +11,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm4io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm4io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2711-rpi-cm4"
diff --git a/configs/raspberrypicm5io_defconfig b/configs/raspberrypicm5io_defconfig
index 122a25ed92..706f759832 100644
--- a/configs/raspberrypicm5io_defconfig
+++ b/configs/raspberrypicm5io_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypicm5io/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypicm5io/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2712"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/raspberrypi/linux-4k-page-size.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
diff --git a/configs/raspberrypizero2w_64_defconfig b/configs/raspberrypizero2w_64_defconfig
index 7a00fa14ac..e926f6f23d 100644
--- a/configs/raspberrypizero2w_64_defconfig
+++ b/configs/raspberrypizero2w_64_defconfig
@@ -9,7 +9,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w-64/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w-64/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2711"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
diff --git a/configs/raspberrypizero2w_defconfig b/configs/raspberrypizero2w_defconfig
index 36e66676fa..eb23324e11 100644
--- a/configs/raspberrypizero2w_defconfig
+++ b/configs/raspberrypizero2w_defconfig
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/raspberrypizero2w/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/raspberrypizero2w/post-image.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_TARBALL=y
-BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,ac69f097e1fba94502cbd36278db204120a37943)/linux-ac69f097e1fba94502cbd36278db204120a37943.tar.gz"
+BR2_LINUX_KERNEL_CUSTOM_TARBALL_LOCATION="$(call github,raspberrypi,linux,21b410140c47ffab5668399f6f143c7d7b935c8b)/linux-21b410140c47ffab5668399f6f143c7d7b935c8b.tar.gz"
 BR2_LINUX_KERNEL_DEFCONFIG="bcm2709"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="broadcom/bcm2710-rpi-zero-2-w"
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
