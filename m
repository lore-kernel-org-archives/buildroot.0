Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB1EC25B10
	for <buildroot@archiver.kernel.org>; Mon,  6 May 2024 20:09:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id EE08180E73;
	Mon,  6 May 2024 20:09:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PU4vNmnkWd3A; Mon,  6 May 2024 20:09:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 041558125D
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 041558125D;
	Mon,  6 May 2024 20:09:15 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A3D191BF33C
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8577480C98
 for <buildroot@lists.busybox.net>; Mon,  6 May 2024 20:09:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ASy-D9MvIVZV for <buildroot@lists.busybox.net>;
 Mon,  6 May 2024 20:09:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::22d; helo=mail-lj1-x22d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4190780E91
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4190780E91
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4190780E91
 for <buildroot@busybox.net>; Mon,  6 May 2024 20:09:12 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2e38a7ebdb6so12827361fa.2
 for <buildroot@busybox.net>; Mon, 06 May 2024 13:09:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715026150; x=1715630950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/1xgvYX3ezvgp+FYlAIutodNU3EBeXvf3OF83qLqnmQ=;
 b=bkV87SY3Wmi//SITdQjOQykaHTFtTwCpEkGd9+nhkxoDfrhA7qFa0L5ea/RJosLYHK
 IFfDXQmDv1E9egPaCcFein3xgYWfRnnVQaMtIwTWhxcHcfKwz3BIl2rYmeCeqALsbLRp
 gmyk2b6Qr/vI5bhtYHvtzFWwbuBiQd+fT91TPK7B3vL3JxRiV3eC0lbXnThmmKkdtOeI
 SGpMzCFnJ9+iujo/UZPy6mBaEWIDTIxXDKf9tqyytwlsvwRBs0j3HLu3EV/pGjVxPajw
 vj6S2MU76vAd2wgvSLy12kydmMdr/wWLbKhaykSmh9taE7N+haxdsffybHGEVV9L3wO+
 +BOg==
X-Gm-Message-State: AOJu0YziBnhSrG25eM/9qniM4MNwNOVjHYGlIYZWezfAle0OUxev0kh4
 vIjeYMEJrl6PcWv/3F6blecpkb5qNXxwsz6biG2ye3ffvRDTzBzO4uDR4Lf3IGDj9rEC+4Xu/bI
 YTw==
X-Google-Smtp-Source: AGHT+IFxCOqWnyARteVVEcEtb/j41wKCFXwFXINOcG4uklflV43kC4cOHgsisu1kGXlFVCq6w0PMsw==
X-Received: by 2002:a2e:97cb:0:b0:2e0:3831:7a5d with SMTP id
 m11-20020a2e97cb000000b002e038317a5dmr7110995ljj.48.1715026149779; 
 Mon, 06 May 2024 13:09:09 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 e7-20020a5d5007000000b0034e78c6ed43sm8878791wrt.110.2024.05.06.13.09.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 06 May 2024 13:09:09 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Mon,  6 May 2024 22:08:56 +0200
Message-Id: <20240506200858.30197-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1715026150; x=1715630950; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/1xgvYX3ezvgp+FYlAIutodNU3EBeXvf3OF83qLqnmQ=;
 b=NZYcR9ej5Z2P0KykZWH8l9AcheWyD6W2GZKX8kfomMXUI56jgP1XCk17llR68HIusF
 7lOwE9+C0YpE0wz1FwEmtmFMUBFbVcbdI0GrCtQ/O/sFr0vvxC1TKsVSNmo5gpejfAaU
 4Qc4Mu4iwUY8gqYBb1Hu8a6ImxjQH5ihBkmygtsucDG91mJGEBFjq/HFMHbdZlJ46C2R
 DFZAcGNeCwgLxjZH4SZ0US6XiqQyAqkLNKp+xJ5kUGiR9ydRZSnnj4t/o2tlu/IkShcE
 BcwJF2gK9TOI69HHizx0sEywDMOAaUoKPc4bHGdnSyiHAv6kTbWbRpeEpQFR8Y/xlNvz
 h1Hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=NZYcR9ej
Subject: [Buildroot] [PATCH v2 1/3] configs/olimex_imx233_olinuxino: bump
 Linux and U-Boot
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 configs/olimex_imx233_olinuxino_defconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_imx233_olinuxino_defconfig b/configs/olimex_imx233_olinuxino_defconfig
index 275dd98af..647292899 100644
--- a/configs/olimex_imx233_olinuxino_defconfig
+++ b/configs/olimex_imx233_olinuxino_defconfig
@@ -2,8 +2,8 @@
 BR2_arm=y
 BR2_arm926t=y
 
-# Linux headers same as kernel, a 5.4 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_4=y
+# Linux headers same as kernel, a 6.1 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # System
 BR2_TARGET_GENERIC_GETTY_PORT="ttyAMA0"
@@ -14,7 +14,7 @@ BR2_ROOTFS_DEVICE_CREATION_DYNAMIC_MDEV=y
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.4.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.83"
 BR2_LINUX_KERNEL_DEFCONFIG="mxs"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/imx233_olinuxino/linux-wifi.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -40,7 +40,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2017.11"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="mx23_olinuxino"
 BR2_TARGET_UBOOT_FORMAT_SD=y
  
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
