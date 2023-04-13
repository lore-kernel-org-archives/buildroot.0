Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD308C77B61
	for <buildroot@archiver.kernel.org>; Thu, 13 Apr 2023 17:04:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3484F40606;
	Thu, 13 Apr 2023 17:04:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3484F40606
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id XwRrcnsJFeVM; Thu, 13 Apr 2023 17:04:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 62520405CD;
	Thu, 13 Apr 2023 17:04:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 62520405CD
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 9B4151BF2F7
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 17:04:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 74298405EE
 for <buildroot@lists.busybox.net>; Thu, 13 Apr 2023 17:04:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 74298405EE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id lf12B0Zt8RvG for <buildroot@lists.busybox.net>;
 Thu, 13 Apr 2023 17:04:40 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 52787401ED
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 52787401ED
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 17:04:40 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-63b5c48ea09so94424b3a.1
 for <buildroot@buildroot.org>; Thu, 13 Apr 2023 10:04:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1681405479; x=1683997479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/NEbApDCMd7ndYekRvw/ZkIoiflbemNPXTD+qb0ewZk=;
 b=D//VXBkwEtO0sxwDP2j8LLTGu5iCHwpo9rr+WHmJWNAjqWJUnsL6n3WrPvUhFGt/af
 LiMmIgjyJZZAI6SZfXiY+ASR3Wu4Lui9+bln4sQ3dbX5c1MswWzl3AMjAqcsBFLkdxM8
 /6AxnSAiNpqYASv+r04P0j+umh2O5ZWa1SfeF3LGunlUEEplSQTdmz3479PEfiWUAJUk
 tobGN7TiGXDOniPn1coS2oPRJ+rS+10rHb1psMF1p36ZE9D4VRBsDdXtCoS15nFQcgRw
 m+8BxcnVvTcgMIUuTmX/uFE3TZYICIFmFJJDKkBzuHtJbJbP6wiUbZaGAE6BMN6hzz27
 MX8Q==
X-Gm-Message-State: AAQBX9clZ0NTwKae6qEXhDl4bysm83wh+kfqhQZB+YuMvqOmsE+u0jJY
 Cukp+B1jujgU9h8NMFlAoK7o2nfwkNp6cg==
X-Google-Smtp-Source: AKy350bmxWfvYg3aBD1sCRhdqQCpTkNDBH5GI9G68K1pUZAink+zwfc7xRPTP6Dv7Cv939zFGL2jJA==
X-Received: by 2002:a05:6a00:885:b0:62a:4503:53b8 with SMTP id
 q5-20020a056a00088500b0062a450353b8mr4747007pfj.1.1681405478832; 
 Thu, 13 Apr 2023 10:04:38 -0700 (PDT)
Received: from adam-laptop.hsd1.wa.comcast.net ([2601:603:2180:ebe0::a8d0])
 by smtp.gmail.com with ESMTPSA id
 d10-20020aa7814a000000b0062607d604b2sm1637133pfn.53.2023.04.13.10.04.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Apr 2023 10:04:38 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 13 Apr 2023 10:04:34 -0700
Message-Id: <20230413170435.18131-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.40.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1681405479; x=1683997479;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/NEbApDCMd7ndYekRvw/ZkIoiflbemNPXTD+qb0ewZk=;
 b=V4UizKNiLKQQ1tW2cBVSeIkipuK5Y0ZTAxW6IVYjlfY4xDHWuXPBFnbuHxVYqQHJ4F
 wmNiA7EnCny9KzIp56cxxf1uMWqhClXMbeb9VNVys84e9tTvtl230Z/t7ho+KG2QUCN3
 VHbvlAjxCD9DNkKBjfUjBzvGh6XuYUB0oosuS8ml3wCoyNYKVh7Kk6VoA2izfw5KgiAE
 VjMCpLE+m8IZMy81GRYjihJg1Mubdx8UBtTFBsucVOPVMN5XJbLi4Vr4pnZyo+Wgm7P2
 vd/3kkdfaptL+julWdzzsR7cqjD13GdTrCX3CXNMvBGIDF6FZfHPTBcEJzN6DrVDzEBS
 s/Pg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=V4UizKNi
Subject: [Buildroot] [PATCH 1/2] configs/pc_x86_64_{bios,
 efi}_defconfig: Switch to kernel 6.1.24 LTS
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
Cc: Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Let's use a more modern kernel with a broader range of hardware support
for PCs.

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 configs/pc_x86_64_bios_defconfig | 6 +++---
 configs/pc_x86_64_efi_defconfig  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index ec34a41667..a057ddd259 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -21,13 +21,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 6.1 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index da05471e28..efa603f0c0 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -22,13 +22,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
 
-# Linux headers same as kernel, a 4.19 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
+# Linux headers same as kernel, a 6.1 LTS series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_1=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.24"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.40.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
