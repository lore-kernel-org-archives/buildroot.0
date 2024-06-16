Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF962C2BA15
	for <buildroot@archiver.kernel.org>; Sun, 16 Jun 2024 14:11:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 33E9040503;
	Sun, 16 Jun 2024 14:11:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rcM5yuvgwxsa; Sun, 16 Jun 2024 14:10:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9A84B404E5
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9A84B404E5;
	Sun, 16 Jun 2024 14:10:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id E252F1BF2C1
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:10:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1E3754033F
 for <buildroot@lists.busybox.net>; Sun, 16 Jun 2024 14:10:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cIE2lm05fqqD for <buildroot@lists.busybox.net>;
 Sun, 16 Jun 2024 14:10:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::133; helo=mail-lf1-x133.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 4601040177
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4601040177
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4601040177
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 14:10:47 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-52bc335e49aso4104661e87.3
 for <buildroot@buildroot.org>; Sun, 16 Jun 2024 07:10:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718547045; x=1719151845;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mtofEhQszTnWKHad5bHFBih9CdLjBuNXISyQP+mrywA=;
 b=eb0y15BFnzDxcxs2UHcbI7Zm4WkUzg1POqDCWu3GccBA4Oym03IOT7e8eT6OS9SxuV
 CLjCxAAtHAGHYD1HbDYZBh0P4HSgW+1fqQ9zbG1B/ZDe5XYLZp78e2h27nfAsDyKMI48
 zR9DValw0wkud+KqeQthWKl6W5gIVxw1a8x0vo+aXqgJfCzqWxYjPSqMVWS32MHHl7Mm
 PIYdJcfscijxouspiKXwUNwF0DEULFpXGqwQ76RQR2sGQml08/vDqwA9TdQQ7r8kxW1I
 GKitLbzsp9Xbf6lCUlBjEHyqdSmLAtPqxsnf9FaNzJ/ChW/PpfSpxF9eoFznWYzGdbMN
 Bs/A==
X-Gm-Message-State: AOJu0Yxm/sPwYMGZRLaoxVTy6EXLpbOdSOBW7JP/VVqjCYOs4lchx3bR
 3dOr04sGNCxEEdZi4kEgBhHH1bK1ldYQlcu1MuH3u0l54L5wFDUK+itliQ==
X-Google-Smtp-Source: AGHT+IGChzgcbG7D8kQfTYdt+gojk06RkzoQcXbhuPC4DS4FA11RA8M4zYlrVCzSnSVjEisM8l7MCg==
X-Received: by 2002:a05:6512:370f:b0:52c:8b72:3cdd with SMTP id
 2adb3069b0e04-52ca6e94665mr5395463e87.47.1718547044604; 
 Sun, 16 Jun 2024 07:10:44 -0700 (PDT)
Received: from landeda.home ([2a01:cb19:8290:3800:e05a:3b8d:ff83:9629])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4246a2db4fbsm4421575e9.5.2024.06.16.07.10.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 16 Jun 2024 07:10:44 -0700 (PDT)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 16 Jun 2024 16:10:41 +0200
Message-ID: <20240616141043.2775083-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.45.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1718547045; x=1719151845; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=mtofEhQszTnWKHad5bHFBih9CdLjBuNXISyQP+mrywA=;
 b=gtXEoX9ytAZlUe/QF9nFbppu8b4aH2Pnt/Wfw87ioDse5IRJnYtiByUlMgaKv8ZaGS
 IpbWkXI/BWS8bFP7O9zD204fR211YyJLHsSFrfG+jiMOa/zCF8sAUm62X3KLtCGemUTL
 +HNx/IPYQg12og1azz3firjhzQpRqfB+BVbWjOsTqqnJc9iBspT2cK21IxiTJUkcdst6
 tustQxG2UZnv1zPrTK6VFnAjvbFsvurZeCkaL/PDDaA9O0WJAL5/mqcV4XL9kTpwTqP8
 JqTaEIlq0fHtqSdGpYQtcJlo6P5bG9R+cpxQy/ijRGDqSgvhTHxcS+moH2pQ6gMmamV+
 BRag==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=gtXEoX9y
Subject: [Buildroot] [PATCH 1/3] board/chromebook: use global-patch-dir for
 kernel patch
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
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

We're going to add hashes soon, so we'll need to have that directory
populated with hash files, and it would then be a bit confusing to not
have the patch file in the patches directory...

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Alex Suykov <alex.suykov@gmail.com>
---
 .checkpackageignore                                            | 1 -
 .../linux/0001-linux-4.15-dts-tpm.patch}                       | 3 +++
 configs/chromebook_snow_defconfig                              | 2 +-
 3 files changed, 4 insertions(+), 2 deletions(-)
 rename board/chromebook/snow/{linux-4.15-dts-tpm.patch => patches/linux/0001-linux-4.15-dts-tpm.patch} (85%)

diff --git a/.checkpackageignore b/.checkpackageignore
index dd1fd31e86..c39c6a257f 100644
--- a/.checkpackageignore
+++ b/.checkpackageignore
@@ -26,7 +26,6 @@ board/canaan/k210-soc/post-build.sh Shellcheck
 board/canaan/k210-soc/rootfs_overlay/sbin/init Shellcheck
 board/chromebook/elm/sign.sh Shellcheck
 board/chromebook/mksd.sh Shellcheck
-board/chromebook/snow/linux-4.15-dts-tpm.patch lib_patch.ApplyOrder lib_patch.Upstream
 board/chromebook/snow/sign.sh Shellcheck
 board/ci20/patches/uboot/0001-mips-Remove-default-endiannes.patch lib_patch.Upstream
 board/cubietech/cubieboard2/post-image.sh Shellcheck
diff --git a/board/chromebook/snow/linux-4.15-dts-tpm.patch b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
similarity index 85%
rename from board/chromebook/snow/linux-4.15-dts-tpm.patch
rename to board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
index c71ff1b584..01f452b563 100644
--- a/board/chromebook/snow/linux-4.15-dts-tpm.patch
+++ b/board/chromebook/snow/patches/linux/0001-linux-4.15-dts-tpm.patch
@@ -9,6 +9,9 @@ See https://code.google.com/p/chromium/issues/detail?id=220169
 and https://lkml.org/lkml/2013/3/4/242
 
 Signed-off-by: Alex Suykov <alex.suykov@gmail.com>
+Upstream: Not Applicable
+[yann.morin.1998@free.fr: add Upstream tag]
+Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
 
 --- a/arch/arm/boot/dts/exynos5250-snow-common.dtsi
 +++ b/arch/arm/boot/dts/exynos5250-snow-common.dtsi
diff --git a/configs/chromebook_snow_defconfig b/configs/chromebook_snow_defconfig
index bcb94b716b..50e355647c 100644
--- a/configs/chromebook_snow_defconfig
+++ b/configs/chromebook_snow_defconfig
@@ -1,6 +1,7 @@
 BR2_arm=y
 BR2_cortex_a15=y
 BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_15=y
+BR2_GLOBAL_PATCH_DIR="board/chromebook/snow/patches"
 BR2_TARGET_GENERIC_GETTY_PORT="tty1"
 BR2_TARGET_GENERIC_GETTY_TERM="linux"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/chromebook/snow/sign.sh"
@@ -8,7 +9,6 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="board/chromebook/mksd.sh"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.15"
-BR2_LINUX_KERNEL_PATCH="board/chromebook/snow/linux-4.15-dts-tpm.patch"
 BR2_LINUX_KERNEL_DEFCONFIG="exynos"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/chromebook/snow/linux-4.15.fragment"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-- 
2.45.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
