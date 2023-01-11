Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45493C46467
	for <buildroot@archiver.kernel.org>; Wed, 11 Jan 2023 08:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CFEB641975;
	Wed, 11 Jan 2023 08:55:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CFEB641975
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id P5mny96973TD; Wed, 11 Jan 2023 08:55:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id C7809418D7;
	Wed, 11 Jan 2023 08:55:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C7809418D7
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id D524B1BF215
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 08:55:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B0A8481FBC
 for <buildroot@lists.busybox.net>; Wed, 11 Jan 2023 08:55:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B0A8481FBC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id SLovn2Bv5qcQ for <buildroot@lists.busybox.net>;
 Wed, 11 Jan 2023 08:55:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D498A81FBB
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id D498A81FBB
 for <buildroot@busybox.net>; Wed, 11 Jan 2023 08:55:39 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id m21so21354654edc.3
 for <buildroot@busybox.net>; Wed, 11 Jan 2023 00:55:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+itAUI0jir0lJ1S2KWexDx3cqpSBIgKCXiLClKYB7mQ=;
 b=abSosifa1xJFAPEvBWdkW4A9HYn4e5ghYLQavhtknFmG3Kt5ibWJeJniBGAf+bvxjU
 /De2tI2s33KpfOYhfV01ykWlJo7hiOP0B9sC02ab1dcfk8FmQWcFimeT3E2lX7/ewdZw
 eLmPvdTJggDU4/cBdHU/FZ3PUq54LWwHds0sSa/Psi4lrtyshrAfblh1yPRNPybJzsnr
 +HVgpnxD8WjlWbjZuVO0vQY78esg/3DAmXtzHyc8jbMeYsRWKPNZ4vBmwOhap3aAalyx
 +GDIcS6hz1yC1vOles4BluXeIwdIKj9SDFPZELJrI3gq7PMHtUFXN+JvRi3PjKmx+1XC
 K3qQ==
X-Gm-Message-State: AFqh2kpXBHOrq7KItuc/ptogkFK+JgmmDxltfVBKHe3zu1x2ZSN0Jf2P
 qiNs7Jim5fzLG4eTpgwscndUMCxXkv0=
X-Google-Smtp-Source: AMrXdXtIUvxmBrWye4fy9lcGm1rwK/pD8KMdjFBuHzUJuCVRQJ9vkaizaFhnOkVcsLrvFQWBRTTamA==
X-Received: by 2002:a05:6402:24a0:b0:499:b683:b5d5 with SMTP id
 q32-20020a05640224a000b00499b683b5d5mr9397141eda.15.1673427337852; 
 Wed, 11 Jan 2023 00:55:37 -0800 (PST)
Received: from vm-22.. (12.197.24.93.rev.sfr.net. [93.24.197.12])
 by smtp.gmail.com with ESMTPSA id
 t8-20020a05640203c800b0047b252468a4sm5826792edw.78.2023.01.11.00.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jan 2023 00:55:37 -0800 (PST)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed, 11 Jan 2023 09:55:22 +0100
Message-Id: <20230111085522.2301383-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.37.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+itAUI0jir0lJ1S2KWexDx3cqpSBIgKCXiLClKYB7mQ=;
 b=Sg4FDrjURVudCvnjxpjMTpZjCdzF16XTabgQzX0wUZPrfzWFxFeCkWu+ltOxDRoJ5r
 aBt8DUivIKTWYRRHvKTe691Wh3KoPOZnhIaDFZOluUrkfGOVfsZz4SeBK0+mL+P60Xp1
 6jds2KJV7J8NBewR9j8SjKK/pL8o93C6aVwf/v5QYt2CDaXhtP4eUT6e3smC5AJLX8X1
 KR2T9KASk6cNt54avXMqYn9ZRzal+SePbrCzURPeDLceAVa9/jpZQdWngXk50BTDbWGw
 nTnt/04JaSnxq0XrT/QfMo12+djIH6emhY13Y292EVheAn2yQ/SgoDElKNO0iob9NL3a
 cQjg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Sg4FDrjU
Subject: [Buildroot] [PATCH] configs/olimex_a20_olinuxino_lime*: bump Linux
 and U-Boot
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
 configs/olimex_a20_olinuxino_lime2_defconfig | 4 ++--
 configs/olimex_a20_olinuxino_lime_defconfig  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/configs/olimex_a20_olinuxino_lime2_defconfig b/configs/olimex_a20_olinuxino_lime2_defconfig
index 1bb628b56..a0ebcaed6 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.71"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -44,7 +44,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 7105ea996..f685d1942 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -22,7 +22,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.71"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.86"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -44,7 +44,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2022.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.01"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.37.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
