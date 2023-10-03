Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98E46E75424
	for <buildroot@archiver.kernel.org>; Tue,  3 Oct 2023 05:21:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0535740907;
	Tue,  3 Oct 2023 05:21:36 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0535740907
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id BoXhmVvVUhU9; Tue,  3 Oct 2023 05:21:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0B67E40914;
	Tue,  3 Oct 2023 05:21:33 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0B67E40914
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 2A7B61BF34B
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 05:21:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 03A4E81F8B
 for <buildroot@lists.busybox.net>; Tue,  3 Oct 2023 05:21:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 03A4E81F8B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id epPF7T1mtA9h for <buildroot@lists.busybox.net>;
 Tue,  3 Oct 2023 05:21:29 +0000 (UTC)
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8A8F281F86
 for <buildroot@busybox.net>; Tue,  3 Oct 2023 05:21:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8A8F281F86
Received: by mail-ej1-x62d.google.com with SMTP id
 a640c23a62f3a-991c786369cso71733366b.1
 for <buildroot@busybox.net>; Mon, 02 Oct 2023 22:21:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696310487; x=1696915287;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0MNg7G1+aSMRjgdGZjsQSMcnWwfytl8Stp6wK3WnUvw=;
 b=preMcel8DJi7QlrjxjlnNCsExuW0y9Aj6tE0xFkS6xncOhFSM4FCB/mrH0PS9bf9H8
 XZDUj8tVBjUNTBmqROzUY9m821QPB6cdiqbxN32xozRm9A9u3dajJHlPCe+it1S3ojVs
 GHiQZwW/GGrZbF/FE90eVgYC7RgkbVIeTiEZ5Bl56SwNRp5aIHFqgKP8H3pjS3C6Zcse
 WZK7GlzzP8A6HJ7wX9UOBtIAohewpjzL8mBlqrtX71BIkcM0+I6H60q35qeFsjvwOggd
 4s4u8Z2PN5Dblx9Mvk1QI4sTv1UuV/UPU9BAOxMmb2NhV4gevpJdI6zJdYuNt9TmClHf
 xBBw==
X-Gm-Message-State: AOJu0Yy+X2x3b7/qxRQOCYAZ3BDeshFsI3D3dOVlcY1cp6t45ysxZxmT
 J/r/pQGjcfeSk4ezpOWgBTTLM8uHc4c=
X-Google-Smtp-Source: AGHT+IEi8jKHMM33QJgd2G/k28XzyS1y8PgYKnJsM7+vOKzKLSSMMABZYAQNph7H8Mh+Z0pMXfMbWw==
X-Received: by 2002:a17:906:311b:b0:9a2:28dc:4168 with SMTP id
 27-20020a170906311b00b009a228dc4168mr10760833ejx.61.1696310487199; 
 Mon, 02 Oct 2023 22:21:27 -0700 (PDT)
Received: from vm.. ([93.24.197.12]) by smtp.gmail.com with ESMTPSA id
 g12-20020a170906594c00b00997e99a662bsm403180ejr.20.2023.10.02.22.21.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 22:21:26 -0700 (PDT)
From: Francois Perrad <fperrad@gmail.com>
X-Google-Original-From: Francois Perrad <francois.perrad@gadz.org>
To: buildroot@busybox.net
Date: Tue,  3 Oct 2023 07:21:20 +0200
Message-Id: <20231003052120.3594513-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1696310487; x=1696915287; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0MNg7G1+aSMRjgdGZjsQSMcnWwfytl8Stp6wK3WnUvw=;
 b=C4EpgxGo1IsofcQbVGtThlFvLbQ5aJ9JslRRdPdXIkCii8+x9bwjm/fuKe4ATFGTZA
 dOklKb0a/OaxhjYoW63D2kpLFrr5PGhOf3P8wN903pH9hsM6lIhBCMhhOp8V9A6xCMyN
 91t+fHUkA5WKFw29hN4PpnwbPvxquS+4iTzjXXSiNZvkqF6rbKsvBoE7cU8KP/NARSXH
 ZuvUPNPAw8EVG0TKVu1hg3E+lEJuGN5XY1AsHlopT6p3xClP20ywrSUNBqpzHcpXmKGk
 rQWZfPctUhztxs0nlG4UbztjaPL5o7GZpv/Sz6PDhVdKEzc8jaucK5vwqW6RdN8K84fF
 BoYg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C4EpgxGo
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
index d817e1dd1..3294748b1 100644
--- a/configs/olimex_a20_olinuxino_lime2_defconfig
+++ b/configs/olimex_a20_olinuxino_lime2_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.55"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime2"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
diff --git a/configs/olimex_a20_olinuxino_lime_defconfig b/configs/olimex_a20_olinuxino_lime_defconfig
index 88967e70c..6b46794df 100644
--- a/configs/olimex_a20_olinuxino_lime_defconfig
+++ b/configs/olimex_a20_olinuxino_lime_defconfig
@@ -23,7 +23,7 @@ BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/olimex/a20_olinuxino/genimage.cfg"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.38"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.1.55"
 BR2_LINUX_KERNEL_USE_DEFCONFIG=y
 BR2_LINUX_KERNEL_DEFCONFIG="sunxi"
 BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES="board/olimex/a20_olinuxino/linux-disable-lima.fragment"
@@ -45,7 +45,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.07"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2023.10"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="A20-OLinuXino-Lime"
 BR2_TARGET_UBOOT_NEEDS_DTC=y
 BR2_TARGET_UBOOT_NEEDS_PYTHON3=y
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
