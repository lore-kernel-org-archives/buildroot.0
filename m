Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E147CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 12:28:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C122D844C7;
	Fri, 10 Oct 2025 12:28:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6YKbobDw9NxS; Fri, 10 Oct 2025 12:28:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C09488447E
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id C09488447E;
	Fri, 10 Oct 2025 12:28:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8D023119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:28:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D7D18447E
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 12:28:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fXt3aY01il_a for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 12:28:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 750748447D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 750748447D
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 750748447D
 for <buildroot@busybox.net>; Fri, 10 Oct 2025 12:28:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-3ee130237a8so1669084f8f.0
 for <buildroot@busybox.net>; Fri, 10 Oct 2025 05:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760099326; x=1760704126;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dWqsrNnxBL+SyBx3dK3rsJnIy8NCg4nv7uVsx2l03U0=;
 b=AH38jq6+ZMK2VNHDw78cF/qsIhzidya+PjEcb/+3SaFibsAzwCUvTWBOaCrjupcIqi
 /G+Wq1tFGDQKZ3lA5J8ZdrvmQ60MUHU+B5vpPoj8JsMoyDNGYJ1Z++mDiyJdrf/MQ39P
 owPTeCxsYOWRCOUdbSwN53PDfr/bNvUK0qjlNXzwgBf+YmD8SiXbSNUZQwOdgFlYBi5N
 8lCb04TI5qK1MqBIOcvSNHwA/5pTwQbHcXhFDmtvOK023QoQXAky1+2WGkcu+bTFaiPi
 Aeyval7/FtDnm/daZ2OOk87eFvYIfRjD13qc5IjjoPPOFe7x8HQfUOlwyW/NzsIXC12C
 IdZQ==
X-Gm-Message-State: AOJu0YwMtSQrpskSjrbMlAYwWnGSF/+RgCM/Gbz3HDO5DvDyPZbNNpfW
 HRRvJQb9ijhQ15H/2tpaZoAdTWo6WkQ1jnGk5Pm69iAz1bEW7iP2jHB9eHMPpq/ypDho2rXyGkR
 3LFIPtg==
X-Gm-Gg: ASbGncuC6W4tdqXer/Yb69FZXo6l32DP7+GsifC/+vouoN/uOA7UJjoY53drPagzZ1P
 h7sJJ5J3AxqXoeWeGxcz6amBqFVkU/jDDJzm7voEHl6Xy8C+6HE3CPbFmScCfvn24rhGXb2nYpu
 +n0050CpFNAyc9vZ4p6oI2hw/WMVicHDW1yyw/bua5TxdZHWC/Q9UEoXkvQcy8UkWvN7nBRsNJz
 g+4wG3iCih8eYCCI7dnXbCb3eamr/jqVimwqIyvAoxiMz0Y81bmVLYaA/3LZ/ob9X3+zSUvADUz
 vrJbGxIvwvGcwrOWCyhUB/IN075yFXiN36sQlkoMgIXccLRTg5CR/iyXd4SgnxIITwSojXQ4N80
 MUKgxuw/aDdV+wQwo2bZPS1iKy+ax+mpmBqfgXcxUv/jSdiESk9alrfUS7Z0isbTuUnygHgOHCT
 0eg+05comI2A==
X-Google-Smtp-Source: AGHT+IEhluiMisoJnDOd+dgdhupSsB3epsNdMEkYHu77d+2jnhiCMeX4urJzC+LMuaMvH0ZKXmrdRw==
X-Received: by 2002:a05:6000:3105:b0:425:7f10:6629 with SMTP id
 ffacd0b85a97d-4266e7df9e7mr7474544f8f.49.1760099325712; 
 Fri, 10 Oct 2025 05:28:45 -0700 (PDT)
Received: from vm-2404.. (10.187.66.37.rev.sfr.net. [37.66.187.10])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-426ce50d70esm4155379f8f.0.2025.10.10.05.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Oct 2025 05:28:45 -0700 (PDT)
To: buildroot@busybox.net
Date: Fri, 10 Oct 2025 14:28:11 +0200
Message-ID: <20251010122812.356563-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1760099326; x=1760704126; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dWqsrNnxBL+SyBx3dK3rsJnIy8NCg4nv7uVsx2l03U0=;
 b=hVH1A3cqiGL7fPXFN2VVZ1jJbKPfhMZoq96alg4D1pWRhVQHn3ZYBuKcWF1Ms+yTc2
 TR4vQt3oV3lIOkYPSXcsIxZWzBAi6ATjxdnw1WUCTbVcrnfLEZ15Qf1+NdJAXAPBKpf3
 Fl0B4ZxX7prTkqL8Yo/85117Wyc4REswM7kgQWo8KCbG9KTpLQp9HzA0fsGsBW8CfZiy
 oIT8KgLPszsVfvN2Q1K5A6x+ZtMo8SEgiruvkPgkSu75+iiaCeg/CsZw9SK0LEF+wqnK
 L4CB0qLMCaJHkowLzOgZYE2Zc2esx14CcnliCNCoC4Yg2KCPHd7GZEdhE1qN1J9mXQ0y
 DEGQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=hVH1A3cq
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 board/olimex/a20_olinuxino/patches/linux/linux.hash | 2 +-
 board/olimex/a20_olinuxino/patches/uboot/uboot.hash | 2 +-
 configs/olimex_a20_olinuxino_lime2_defconfig        | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig         | 4 ++--
 4 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/board/olimex/a20_olinuxino/patches/linux/linux.hash b/board/olimex/a20_olinuxino/patches/linux/linux.hash
index 49740ece9..52688f83e 100644
--- a/board/olimex/a20_olinuxino/patches/linux/linux.hash
+++ b/board/olimex/a20_olinuxino/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  4a168aed2de5a81aadd90ba2b153860a98d99bfc34651936e17f18e54f01ba8c  linux-6.12.36.tar.xz
+sha256  c435bd74d1c21fc5a950781a50d78bae2b93944144694843359948ad3afc72a5  linux-6.12.50.tar.xz
diff --git a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
index 30246a7cd..a2725383c 100644
--- a/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
+++ b/board/olimex/a20_olinuxino/patches/uboot/uboot.hash
@@ -1,2 +1,2 @@
 # Locally computed
-sha256  0f933f6c5a426895bf306e93e6ac53c60870e4b54cda56d95211bec99e63bec7  u-boot-2025.07.tar.bz2
+sha256  b4f032848e56cc8f213ad59f9132c084dbbb632bc29176d024e58220e0efdf4a  u-boot-2025.10.tar.bz2
diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 3e86696b4..ff6eca176 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 524dc0800..7d95bd4d4 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -14,7 +14,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.36"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.50"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -28,7 +28,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2025.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
