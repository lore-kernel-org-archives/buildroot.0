Return-Path: <SRS0=ghJV=P5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92A84C433EF
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 07:37:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1BBFD6113D
	for <buildroot@archiver.kernel.org>; Wed, 10 Nov 2021 07:37:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1BBFD6113D
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CC98A608FE;
	Wed, 10 Nov 2021 07:37:19 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ym9zNtkzDFvK; Wed, 10 Nov 2021 07:37:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 402E7608FA;
	Wed, 10 Nov 2021 07:37:18 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 475A61BF376
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 07:37:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3607C608FA
 for <buildroot@lists.busybox.net>; Wed, 10 Nov 2021 07:37:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id olmYZPYAkiZV for <buildroot@lists.busybox.net>;
 Wed, 10 Nov 2021 07:37:14 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com
 [IPv6:2a00:1450:4864:20::52e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 54CF3608D4
 for <buildroot@buildroot.org>; Wed, 10 Nov 2021 07:37:14 +0000 (UTC)
Received: by mail-ed1-x52e.google.com with SMTP id v11so6769481edc.9
 for <buildroot@buildroot.org>; Tue, 09 Nov 2021 23:37:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=kmU1hbnl6ULbwH6ftFKyF6SNeowRuYRhQ02F71QiD30=;
 b=VehmMSmkSgHl0IbtoGEVwz+DV1KSJzH1O7rrEf0w9ZSS8y83p0xuieMyQo3GSdGcld
 4eZXSuvyhgGzyyfFyHysLTXArb97e5GtdgRRZIAVbdDUpULDtDblsHivi44CjBJSdjB4
 Zb5XfgRHOVr7pzv8uSoS8NfitiapMWiQnh9WkfanHs1KHF76XV6NW7kka1FLZJkUf4lL
 vEclYykMQc13UnkWb4ZRZk255ExIw00ic+oD78eS6MkFh69NuQl/D/QVfv7n0OVqBC3z
 CBV8WBFM1uxB+nObU8nZ/ENeXKUa581mxgz8W8l/T1/62xq9vV0lYM1HzaE6hzLlKEW8
 7HOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=kmU1hbnl6ULbwH6ftFKyF6SNeowRuYRhQ02F71QiD30=;
 b=eiJ6ovlJsNx6WMYXn4nQ9wlbsJ/QRYqbPUvfKBqdEAUDnMepxYcI3RnTdGUl3LbeRs
 lT4Fwptufr/exkcgpMk5xv0WzKO1T3b7Ebh9FNduj7l6etSRcBbkseqHgdLoSbEkdYDR
 xkUV4GvVNNZl2itUourxi25vocC3398lNqfjJFWY6M8F6l4uwj9mjla8waSceioeBBYc
 iHPfvImMU4EUsTLR26FB2EG8dLiiA8AKrmpIXF8ZL8SUxABz1RgEQ7RlKq3K4q8dqPpg
 l7+S9wq3t/TDNBSIR2yhJQi6gyQccXYakCMsZdj9FGDiokdyj5c329RW1FGxHeKFDq/7
 ZWig==
X-Gm-Message-State: AOAM532SUgDPCkTJobeMihZtTemp0DL52mkSLDJERj5AZbaVBU6wjl3C
 iuwrLPB2jlFX65ql7H3KxTRITPXpA0g=
X-Google-Smtp-Source: ABdhPJzGAE+Nn47tC3rW5WiegkcKT+BbOgFh8aCk+YarNc2hiSgcAvYPfaWzkUooeuc2Zk8qHPmqRQ==
X-Received: by 2002:aa7:c78f:: with SMTP id n15mr18893694eds.344.1636529832461; 
 Tue, 09 Nov 2021 23:37:12 -0800 (PST)
Received: from envy.example.org (router-taduha-nat-l.pilsfree.net.
 [212.79.110.139])
 by smtp.gmail.com with ESMTPSA id qk13sm7291432ejc.3.2021.11.09.23.37.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Nov 2021 23:37:12 -0800 (PST)
From: Jan Kraval <jan.kraval@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Nov 2021 08:36:38 +0100
Message-Id: <20211110073638.22135-2-jan.kraval@gmail.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20211110073638.22135-1-jan.kraval@gmail.com>
References: <20211110073638.22135-1-jan.kraval@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] configs/orangepi-lite: bump kernel and
 u-boot versions
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
Cc: Jan Kraval <jan.kraval@gmail.com>, Sergey Matyukevich <geomatsi@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bump Linux to 5.15.1 and U-Boot to 2021.10.

Signed-off-by: Jan Kraval <jan.kraval@gmail.com>
---
 configs/orangepi_lite_defconfig | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/orangepi_lite_defconfig b/configs/orangepi_lite_defconfig
index e75943c986..e834816456 100644
--- a/configs/orangepi_lite_defconfig
+++ b/configs/orangepi_lite_defconfig
@@ -1,12 +1,12 @@
 BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_VFPV4=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_3=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
 BR2_TARGET_GENERIC_HOSTNAME="OrangePi_Lite"
 BR2_TARGET_GENERIC_ISSUE="Welcome to Buildroot for the Orange Pi Lite"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.3.8"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.1"
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/orangepi/orangepi-lite/linux-extras.config"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
@@ -22,18 +22,18 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2019.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="orangepi_lite"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
+BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
 BR2_TARGET_UBOOT_NEEDS_PYLIBFDT=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM=y
-BR2_TARGET_UBOOT_FORMAT_CUSTOM_NAME="u-boot-sunxi-with-spl.bin"
+BR2_TARGET_UBOOT_SPL=y
+BR2_TARGET_UBOOT_SPL_NAME="u-boot-sunxi-with-spl.bin"
 BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT=y
 BR2_PACKAGE_HOST_UBOOT_TOOLS_BOOT_SCRIPT_SOURCE="board/orangepi/orangepi-lite/boot.cmd"
 BR2_PACKAGE_HOST_DOSFSTOOLS=y
 BR2_PACKAGE_HOST_GENIMAGE=y
 BR2_PACKAGE_HOST_MTOOLS=y
-BR2_PACKAGE_HOST_UBOOT_TOOLS=y
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/orangepi/orangepi-lite/genimage.cfg"
-- 
2.20.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
