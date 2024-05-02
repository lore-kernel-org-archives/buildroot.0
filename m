Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05552C4345F
	for <buildroot@archiver.kernel.org>; Thu,  2 May 2024 04:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3AA804083D;
	Thu,  2 May 2024 04:56:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qdi3hCqWN6sb; Thu,  2 May 2024 04:56:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EC71B40845
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EC71B40845;
	Thu,  2 May 2024 04:56:20 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E6D61BF2C5
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:56:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7645540834
 for <buildroot@lists.busybox.net>; Thu,  2 May 2024 04:56:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Yq6Ds1RkSFOG for <buildroot@lists.busybox.net>;
 Thu,  2 May 2024 04:56:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::12c; helo=mail-lf1-x12c.google.com;
 envelope-from=dm.chestnykh@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EDF2C4081F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EDF2C4081F
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EDF2C4081F
 for <buildroot@buildroot.org>; Thu,  2 May 2024 04:56:07 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-51d9d8c2c3dso830263e87.0
 for <buildroot@buildroot.org>; Wed, 01 May 2024 21:56:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714625765; x=1715230565;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tPBiEUDWY78uKtEE8XLDeLt66ArDI+HmxCv9JuKkU3I=;
 b=ZX4SI0qSfU1FDIrAUdp3TPG+GdRfjkOZhQD/HhsX05BOWJYt53p3hHb9GEebji0Gz3
 xGiEjyvyUwYGh1DBpMZ5s4KdNZlWVgiXaLv0FRn3EsltnQUovSgOZmvYltP1O4w0fpzT
 bX4sIfnwMP0si02C4o5lKcwO4fd2LOtd1zrE44XoDrQRaowRhOH2zwWNkOfTIQGmHqEt
 OmcZnCurHOvaZLDkfdHir1biXSkxguZbTqyjKBdR2QChUAu21d7Xa3PwRy6EdGOk6tjW
 w1sTfjnivBehyZMnQpAIPdXRr248IkjUoqGMJb+3Wwydo9psrnCRcZ9+g50MeAcxCI6a
 EHfg==
X-Gm-Message-State: AOJu0Yw4p0LZIEzq6CqKtEQphjnEARTNKqBCeWm+NroFGttaaH+Lw528
 N5OK9qC8zBMRkX15EQl3cKoMFm/6aeAyxpjCE9Mfc+04VIIT/FEPGnbcJA==
X-Google-Smtp-Source: AGHT+IHCLNvkQKx20nkfvk3YFsg/R12yxBHcKV0mYy4ewTZ9cSVQlp91InOD6OIJLNuEtUKKQId6hg==
X-Received: by 2002:a2e:8004:0:b0:2de:1218:af30 with SMTP id
 j4-20020a2e8004000000b002de1218af30mr2680239ljg.1.1714625764850; 
 Wed, 01 May 2024 21:56:04 -0700 (PDT)
Received: from localhost.localdomain (109-252-38-243.nat.spd-mgts.ru.
 [109.252.38.243]) by smtp.gmail.com with ESMTPSA id
 i8-20020a2e8648000000b002d8744903ebsm35466ljj.68.2024.05.01.21.56.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 May 2024 21:56:04 -0700 (PDT)
From: Dmitry Chestnykh <dm.chestnykh@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  2 May 2024 07:55:18 +0300
Message-ID: <20240502045518.4875-3-dm.chestnykh@gmail.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240502045518.4875-1-dm.chestnykh@gmail.com>
References: <20240502045518.4875-1-dm.chestnykh@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714625765; x=1715230565; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tPBiEUDWY78uKtEE8XLDeLt66ArDI+HmxCv9JuKkU3I=;
 b=bssphbJrMmB0+qjeSW7SbJdWPYNTP/eN8CT8goG01b4IYkooDqAYC3kIUY8pNRwnhz
 DNz4sOEE856AElhrFfR0HYgE+TpdZtZzNs+XvA3X3lob8zAhDE6NLoCjhWrB6KFCUuWq
 ZjK7ivR8t1lf+2XDLa/h9NU1cNxL0ZoPHl1M9LQ1IEL1y7x/DIUtH5kLpDsHV39lr6lI
 Xomau+MZoP5yifL9O5A+BR4VAUiGk985ONsz7GT0mg4ZRQT+67wv/9GZ5uYmfyCAr2L4
 jitEg5gruK2oKgaTX+VK+QwwPo+ej2cZdy9Xpq7IYdO9T85WANdEmyGbw0z/UC95yNyF
 X5Cg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=bssphbJr
Subject: [Buildroot] [PATCH v2 3/3] configs/qemu_sparc_ss10_defconfig:
 Re-introduce.
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
Cc: Dmitry Chestnykh <dm.chestnykh@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

With uClibc-ng-1.0.48 we can restore this config
because uClibc-ng was provided the fix for SPARC.

Signed-off-by: Dmitry Chestnykh <dm.chestnykh@gmail.com>
---
v1 -> v2:
- Split the patch into two parts:
This part re-introduces defconfig.
- Removal of GCC patch was rejected because
gcc-8.4 is only used for PowerPC.
---
 configs/qemu_sparc_ss10_defconfig | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)
 create mode 100644 configs/qemu_sparc_ss10_defconfig

diff --git a/configs/qemu_sparc_ss10_defconfig b/configs/qemu_sparc_ss10_defconfig
new file mode 100644
index 0000000000..a8e3df9180
--- /dev/null
+++ b/configs/qemu_sparc_ss10_defconfig
@@ -0,0 +1,28 @@
+# Architecture
+BR2_sparc=y
+BR2_sparc_v8=y
+
+# System
+BR2_SYSTEM_DHCP="eth0"
+
+# Filesystem
+BR2_TARGET_ROOTFS_EXT2=y
+# BR2_TARGET_ROOTFS_TAR is not set
+
+# Image
+BR2_ROOTFS_POST_IMAGE_SCRIPT="board/qemu/post-image.sh"
+BR2_ROOTFS_POST_SCRIPT_ARGS="$(BR2_DEFCONFIG)"
+
+# Linux headers same as kernel
+BR2_PACKAGE_HOST_LINUX_HEADERS_AS_KERNEL=y
+
+# Linux kernel
+BR2_LINUX_KERNEL=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION=y
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.8.6"
+BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
+BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/qemu/sparc-ss10/linux.config"
+
+# host-qemu for gitlab testing
+BR2_PACKAGE_HOST_QEMU=y
+BR2_PACKAGE_HOST_QEMU_SYSTEM_MODE=y
-- 
2.44.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
