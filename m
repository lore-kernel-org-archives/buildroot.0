Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68626CD1288
	for <buildroot@archiver.kernel.org>; Wed,  3 Apr 2024 09:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32B2A820C3;
	Wed,  3 Apr 2024 09:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H1kxLVE5sQbE; Wed,  3 Apr 2024 09:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 31B1A820BE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 31B1A820BE;
	Wed,  3 Apr 2024 09:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 9DCFD1BF271
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 89EF5820BA
 for <buildroot@lists.busybox.net>; Wed,  3 Apr 2024 09:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 01M2ke8HjCg4 for <buildroot@lists.busybox.net>;
 Wed,  3 Apr 2024 09:40:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::52c; helo=mail-ed1-x52c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0850F818D0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0850F818D0
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com
 [IPv6:2a00:1450:4864:20::52c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0850F818D0
 for <buildroot@busybox.net>; Wed,  3 Apr 2024 09:40:21 +0000 (UTC)
Received: by mail-ed1-x52c.google.com with SMTP id
 4fb4d7f45d1cf-56bc5a3aeb9so7880433a12.3
 for <buildroot@busybox.net>; Wed, 03 Apr 2024 02:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712137220; x=1712742020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WQxJIMk1rj2/f8+9OwHJs/s4iJCReTvNiXGNfDp+OUw=;
 b=M5WIGFz+otegALSicZiHAcx/PXeDBQ4gcdhSdM9N73znQ0NTnlp+HNI1jvGskWh6yQ
 7rYyxsSFyLLfOCeULuWKn6gY05GVw60gS7RHIHG2GYBTed7cxP16BS+z1Vqtf24dTCOk
 QyrbEnmhI/7QFk6dVYLNK1yDRpDjugvjSRe9aBgDRz39+uAy5buwd7O9SoOswWiwMu+J
 QysIMmtNLNUaPwcEjRMdXUDlFsXGG8M/7LXNftDrIbLJQ9oO2FTeBN0jl3eWbekCCZdW
 oeKiGQRAabIk9h/ue8UbcPP6InkcL1ooWDumOLFTGRaunJdF1tTZXKrnv/uMm87y9C2m
 IU5Q==
X-Gm-Message-State: AOJu0Yw0CX5xxLUt4mnKbBaeYl9PrBdo9cj/et33DNR7AShr/Fs4NK67
 BZ94Z4CIAiNXJ/EP9dU2hFBbNxRUe2afAwDZtj122/7NiWufvDcnR6NMndj0InDH6S9iLlYDnZw
 =
X-Google-Smtp-Source: AGHT+IFr81NzHeRBPS2GQ4eJ9c/+QW9zdtjRiEl9TQQnaEQsQDEdy8hGNwLtXfvcqKXyDS+xVK1TSw==
X-Received: by 2002:a50:ccdd:0:b0:568:b41b:afd7 with SMTP id
 b29-20020a50ccdd000000b00568b41bafd7mr9368114edj.29.1712137219681; 
 Wed, 03 Apr 2024 02:40:19 -0700 (PDT)
Received: from xubuntu-23.. ([37.65.6.74]) by smtp.gmail.com with ESMTPSA id
 f8-20020a056402150800b0056e0988bccesm420694edw.31.2024.04.03.02.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 02:40:19 -0700 (PDT)
From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Wed,  3 Apr 2024 11:40:11 +0200
Message-Id: <20240403094011.523032-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1712137220; x=1712742020; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WQxJIMk1rj2/f8+9OwHJs/s4iJCReTvNiXGNfDp+OUw=;
 b=JGBjaeVoC9DzR1UtIURQTWW9Jg4SnwcrHtIaQd55rP+CrJ925FLvF+tgQJaURl/JQ0
 M9n4IJviNB/mkMq9PXDZUQoz/YgShpCDJgVGEsfiNuoP8M5rH15+MYprzMZms9SojfXk
 /HS9CSW0jV77x0DzO6IjJD5yM05w/LhE6OfWcHLgw8/Ccv8xUzTyP6OT75b8XSseFGAL
 Nzl5Q7WhTTK3eDnTu4cu+WnHAlz5YIFgOTlSzGVBwWqJj8jiNrfx1r+AekeeQ+/W8i9P
 Ex+DyAjUbDBycPY5aRGsTw2asvtaFQ41aq2DY8rmQjVGdNtIZPDuBKtysrxfO7oMr5UJ
 yrUg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=JGBjaeVo
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
index bf4420739..04e191b44 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.23"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 5e26eaf85..05666fa98 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.10"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.23"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.40.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
