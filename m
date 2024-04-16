Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EA68C4345F
	for <buildroot@archiver.kernel.org>; Tue, 16 Apr 2024 23:23:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id AB446400D3;
	Tue, 16 Apr 2024 23:23:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FgDQgIlRbnY1; Tue, 16 Apr 2024 23:23:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 067BA400D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 067BA400D8;
	Tue, 16 Apr 2024 23:23:29 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 1D5F61BF4E7
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 23:23:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0946D4114E
 for <buildroot@lists.busybox.net>; Tue, 16 Apr 2024 23:23:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fjB7bilJxYDn for <buildroot@lists.busybox.net>;
 Tue, 16 Apr 2024 23:23:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::630; helo=mail-pl1-x630.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 157B840167
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 157B840167
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 157B840167
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 23:23:26 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1e825c6c10fso25425ad.3
 for <buildroot@buildroot.org>; Tue, 16 Apr 2024 16:23:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713309806; x=1713914606;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9c6NBiYZY/B7bos8tdHJGVYrf/vW32ks6XMHR+EB9ZE=;
 b=MnQcn2Y/lHNJDhFgl6zEaTnMEY2LixphuSPsyigOzALQKzwpAblzbjjMzhAxfhfT35
 Gho4NJPqX7TnhCSdb0O8BhA5LoKGEu3heebvtelmNU9I1ZYc9oEHL7Vt2j2mPr0JqKNH
 LvDM2pHbDnK9Neorq9JZL3de8pqdVq1M0nppYt9zaeVIoBeLfxqa0TCUfYZ5qPGx/E6m
 IDROEWQH7TSILXvVu2qD19rS+uyJzjfQ7KIMmV2QqICxptlESsMCVaJkrmEVWlB52NtU
 6ik0wKfDOqB8oMkxArNlWS0VwJJ6zLag5fuBfZZfZ9XorOI+0WghWzR/4ASaPl/lUyhQ
 7nKw==
X-Gm-Message-State: AOJu0Yxc6fvPMTir5BKfpN/0Cpqn6KZshETuKRle7bfW60bLPZifKAB7
 oieiQxOBSnfCFWjO6H2Yk6BaAT7bK7b+nwbaH8G0KhZH8Yzr8KqnbgXfMA==
X-Google-Smtp-Source: AGHT+IETXtoGq/b4OxaUlsgA3VdJX+aa82ffgZZg2F1Q/+XebSpnhGJVYclS29ga4cDUkKlWM1tNRA==
X-Received: by 2002:a17:903:41cf:b0:1dd:85eb:b11 with SMTP id
 u15-20020a17090341cf00b001dd85eb0b11mr18041483ple.1.1713309805595; 
 Tue, 16 Apr 2024 16:23:25 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:2b0d:9a9d:d5e1:50da])
 by smtp.gmail.com with ESMTPSA id
 4-20020a170902c24400b001dd578121d4sm10312089plg.204.2024.04.16.16.23.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 16 Apr 2024 16:23:24 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 16 Apr 2024 20:23:17 -0300
Message-Id: <20240416232317.580780-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1713309806; x=1713914606; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9c6NBiYZY/B7bos8tdHJGVYrf/vW32ks6XMHR+EB9ZE=;
 b=HLhU1wgMn7K4CyV/97pFB8MLmaMajMm8T+wlDIFqHoMYBzZPjnNPIQ5AN43P5SRJNr
 UCLkQb+wofzj9k4S+oSfyowhg40MnPiEEfzXnjvRT9IVMezPRPLB5EBc2Oz3MGqG97y9
 j9klrlwptwRmma9KIOlCUL0Bg38EzkrMFnTiS/31UdvjRZhtjPw9Ia/VXKKHRvHkDH8a
 BGsaLDuxcnP9hGIF9ZJoMr01N2jY/qH38vwskXTf1J1SppLCMLqaH4755esk0gsfiKrg
 yVQVVR6d4OzSAD6b/xLJQ0qzVCvVMhd5+GPox6dk1a138V8qFxPS5K/kx2J4kzADj3Jd
 w3Fw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=HLhU1wgM
Subject: [Buildroot] [PATCH] configs/wandboard: update U-Boot and kernel
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
Cc: Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Update to U-Boot 2024.04 and kernel 6.6.27 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/wandboard_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/wandboard_defconfig b/configs/wandboard_defconfig
index 522173b8ed91..40d8254242cf 100644
--- a/configs/wandboard_defconfig
+++ b/configs/wandboard_defconfig
@@ -23,7 +23,7 @@ BR2_TARGET_ROOTFS_EXT2_4=y
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BUILD_SYSTEM_KCONFIG=y
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.01"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.04"
 BR2_TARGET_UBOOT_BOARD_DEFCONFIG="wandboard"
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
@@ -32,7 +32,7 @@ BR2_TARGET_UBOOT_SPL_NAME="SPL"
 # Kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.12"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.27"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6q-wandboard nxp/imx/imx6dl-wandboard nxp/imx/imx6q-wandboard-revb1 nxp/imx/imx6dl-wandboard-revb1 nxp/imx/imx6q-wandboard-revd1 nxp/imx/imx6dl-wandboard-revd1 nxp/imx/imx6qp-wandboard-revd1"
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
