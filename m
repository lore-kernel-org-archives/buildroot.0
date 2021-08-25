Return-Path: <SRS0=vKZi=NQ=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 61FE5C432BE
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:20:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 05AD060EAF
	for <buildroot@archiver.kernel.org>; Wed, 25 Aug 2021 19:20:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 05AD060EAF
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CB48240365;
	Wed, 25 Aug 2021 19:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fg63gZcfMWLb; Wed, 25 Aug 2021 19:20:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD858403D2;
	Wed, 25 Aug 2021 19:20:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 179611BF588
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:20:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 13C7E403D2
 for <buildroot@lists.busybox.net>; Wed, 25 Aug 2021 19:20:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id rewLhrd3uUNu for <buildroot@lists.busybox.net>;
 Wed, 25 Aug 2021 19:20:23 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CB43640365
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 19:20:22 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l7-20020a1c2507000000b002e6be5d86b3so467854wml.3
 for <buildroot@buildroot.org>; Wed, 25 Aug 2021 12:20:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=dIObrlQJgDMCa0x2EZOKZwkLd0Huf2vkPBdF7Br5ULk=;
 b=H9xuTCB4/qHKIZPQz15tKYPB+Mv1AMJaFWDb01wIBLpCrHfNrikeKR/J+mO8ktIWpb
 nHMiwhdEHQc34tVfs+0fv8NVKlkS+HjXBGWaNSl81KThaF6LS8ui2A0WuGGH+CIzjJY4
 Sbl5u9czVe11igzN364G01euj8MuNDZPPjBm/E/iXsHIeo8qYHQXyo9GeivLcfDE49B+
 S4uiJ4fqjDcVtsT/zpRWvJmOMP/VBcqUeFO4OCDd21dsLKuQGjhM5sXLuAvaVhV3IVPG
 TafbmnEVJUiQylzLW7VPLeKl86VIiwcdXEYn2XS7+Hv3/65e223agCiN0rIu6U6WFMva
 o3EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=dIObrlQJgDMCa0x2EZOKZwkLd0Huf2vkPBdF7Br5ULk=;
 b=gK5bzHIKg4TYEZPDxeS6BjfameQX6j5iG0bRZpqOpUQ25h1RRBgIDzqd9+Y9fxLV4w
 Zw+RcXV06Orus1oe35AfcLMkk9JEGyy8co7nEcg+QL5Ass2OPFrnyrtj7vSs2yZ7EWb9
 t02kTcLBC3LBCuUCjq0D3kCW/8laPU0OeAkSrVyLxBp4CvsO3zLOOP6tRpmk+wIUmbzo
 87PPSbXOTKLtuV5yXPd6KsQi+1TWNreh2zv4FWTlJ83t3gOqNFwCqaAJGN5s490yNtsS
 +KJbuy8ZswZHwyAHRnjI7nz3dUjuhTuK/BqSsjKi97pS1UqkSrNsnRQROPLYL+IOrhwq
 TlZA==
X-Gm-Message-State: AOAM532ftZ7iOMGukehqxe7B0tuyup81wQcgnpmK4lSvEV4eHCoJjB5L
 tNt39eIqdftHP/lAE00/xLJ30r5tiJA=
X-Google-Smtp-Source: ABdhPJwTj5gTO7nPUV+KhJXBwaQ8o7JqQqDU+zToATlekHPjlLDoQh3r7/jozSXRoZMlQF/Wzaz3ew==
X-Received: by 2002:a1c:4e02:: with SMTP id g2mr11041669wmh.64.1629919221126; 
 Wed, 25 Aug 2021 12:20:21 -0700 (PDT)
Received: from localhost.localdomain
 (2a01cb058f8a180098814a9aef637f91.ipv6.abo.wanadoo.fr.
 [2a01:cb05:8f8a:1800:9881:4a9a:ef63:7f91])
 by smtp.gmail.com with ESMTPSA id c2sm759465wrs.60.2021.08.25.12.20.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 12:20:20 -0700 (PDT)
From: Romain Naour <romain.naour@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 25 Aug 2021 21:20:14 +0200
Message-Id: <20210825192014.1203727-2-romain.naour@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210825192014.1203727-1-romain.naour@gmail.com>
References: <20210825192014.1203727-1-romain.naour@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH] configs/pc_x86_64_{efi,
 bios}_defconfig: update kernel to 4.19.204
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

gcc 10.x is now used by default but the kernel 4.18.10 used by
pc_x86_64_{efi,bios}_defconfig doesn't build with it.

Bump the kernel to 4.19.204 release that contains a lot of
fixes for newer gcc.

Fixes:
https://gitlab.com/kubu93/buildroot/-/jobs/1525741062
https://gitlab.com/kubu93/buildroot/-/jobs/1525741060

Signed-off-by: Romain Naour <romain.naour@gmail.com>
---
 configs/pc_x86_64_bios_defconfig | 6 +++---
 configs/pc_x86_64_efi_defconfig  | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/configs/pc_x86_64_bios_defconfig b/configs/pc_x86_64_bios_defconfig
index 1c1f7a3666..3290a1dda0 100644
--- a/configs/pc_x86_64_bios_defconfig
+++ b/configs/pc_x86_64_bios_defconfig
@@ -23,13 +23,13 @@ BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/pc/genimage-bios.cfg"
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
diff --git a/configs/pc_x86_64_efi_defconfig b/configs/pc_x86_64_efi_defconfig
index 984fc8f92f..18d2c477d5 100644
--- a/configs/pc_x86_64_efi_defconfig
+++ b/configs/pc_x86_64_efi_defconfig
@@ -25,13 +25,13 @@ BR2_TARGET_ROOTFS_EXT2_SIZE="120M"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/pc/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="board/pc/post-image-efi.sh"
 
-# Linux headers same as kernel, a 4.18 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_18=y
+# Linux headers same as kernel, a 4.19 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_4_19=y
 
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.18.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="4.19.204"
 BR2_LINUX_KERNEL_USE_CUSTOM_CONFIG=y
 BR2_LINUX_KERNEL_CUSTOM_CONFIG_FILE="board/pc/linux.config"
 BR2_LINUX_KERNEL_INSTALL_TARGET=y
-- 
2.31.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
