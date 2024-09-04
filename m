Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBAABCD3431
	for <buildroot@archiver.kernel.org>; Wed,  4 Sep 2024 12:35:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id ADE65605AA;
	Wed,  4 Sep 2024 12:35:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N0LKivZ3nmh2; Wed,  4 Sep 2024 12:35:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C928260877
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id C928260877;
	Wed,  4 Sep 2024 12:35:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 45F491BF267
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:35:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 301F560877
 for <buildroot@lists.busybox.net>; Wed,  4 Sep 2024 12:35:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4OtsAh_sP4-s for <buildroot@lists.busybox.net>;
 Wed,  4 Sep 2024 12:35:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::102f; helo=mail-pj1-x102f.google.com;
 envelope-from=festevam@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 9F832605AA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9F832605AA
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com
 [IPv6:2607:f8b0:4864:20::102f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 9F832605AA
 for <buildroot@buildroot.org>; Wed,  4 Sep 2024 12:35:08 +0000 (UTC)
Received: by mail-pj1-x102f.google.com with SMTP id
 98e67ed59e1d1-2d88edf1340so2760626a91.1
 for <buildroot@buildroot.org>; Wed, 04 Sep 2024 05:35:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725453307; x=1726058107;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WnDMex8ZYN6lNn+znKvwxnnI5iCySz8htD3+q2819zA=;
 b=Po+DIuOWHBwkho9B8ds5p2JIut2CeWcPK13Uh7uYJwz8BOM06AKEO12XaTpbZNlIOG
 jjQY9VixuiLGKPAdASIKxHEhR4Zu2fk0InP+zJHD9PL+pV51vIuvI5JkzCJO2z9JYEi4
 v2TLpdyD2+F1elVHtg0wbxCIneAh+TvmTmbHki0/8sWhXnJBj+pRgRQLagAfkUlNiG3A
 Ezp1qcayIATjuha7w3RVcVZq0C1PrMy3f6Z0SnPvDVqWy+DyK7DRLq481enH2HUaXAkY
 NEPMklBbZa2XzABcHiu9dkYYmEsZK7KpuPpC4cfKUdK6rB28qYDNbTee83paEk8DqB6l
 JudA==
X-Gm-Message-State: AOJu0Yz7sObfNq4+ppswjC4FPMRKyUkO6NRoGpQnzedMtww0MU8UBDag
 Di7KFyQM8TM6z9UiP0pmomWU0hxF5Qzq41O+3kyaHImxGN3NqyJHWXVptA==
X-Google-Smtp-Source: AGHT+IGv1EPWsRS5fhlBTAXp0PY1YWITjNcFBfCrn/L5ejbxw9pnDbSwpaL4b/EWnpVBZnhrFq0Xtw==
X-Received: by 2002:a17:90b:33c4:b0:2d8:f81f:87a0 with SMTP id
 98e67ed59e1d1-2da55924709mr7296628a91.9.1725453307367; 
 Wed, 04 Sep 2024 05:35:07 -0700 (PDT)
Received: from fabio-Precision-3551.. ([2804:14c:485:4b61:b37a:332a:2373:a683])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2da64b07d5esm3620252a91.47.2024.09.04.05.35.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 04 Sep 2024 05:35:06 -0700 (PDT)
From: Fabio Estevam <festevam@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  4 Sep 2024 09:34:59 -0300
Message-Id: <20240904123459.2089677-1-festevam@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725453307; x=1726058107; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WnDMex8ZYN6lNn+znKvwxnnI5iCySz8htD3+q2819zA=;
 b=lcubczS7p2+0TZBwjIbG85WCo9Tbrb5suo4tbyroX1OQd9UNBPqE7dPI6fuY0zV1iF
 OOybYMkJqvz/sPg6ZvrwVLQgeljOKsIwiqA9q3SAz5FSCyt1HVanvzD2SXaGrozry2S9
 9jJYK5yiFtWt7k4T2NV83zRhsSzWkI+3cOC49GvFqLltiUwmi7JQT8ySTRuaVBUB4Fk8
 LLPHEyK7iRB971r4jlb1pHWIrzvjsxMZpey9y413j/daP+frWFS9We7/MgjxYDxJRvvJ
 d5Eul4Q1b0YGQ/L0qwlv7iTyUy0ZIXf2hnRFDL+50h65ZLa4AwltaZo8uzhZc5+1yL83
 DqEQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=lcubczS7
Subject: [Buildroot] [PATCH] configs/imx6ulevk: update U-Boot and kernel
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

Update to U-Boot 2024.07 and kernel 6.6.48 versions.

Signed-off-by: Fabio Estevam <festevam@gmail.com>
---
 configs/imx6ulevk_defconfig | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/configs/imx6ulevk_defconfig b/configs/imx6ulevk_defconfig
index 22b5a45480bc..271b62be81fe 100644
--- a/configs/imx6ulevk_defconfig
+++ b/configs/imx6ulevk_defconfig
@@ -3,8 +3,8 @@ BR2_arm=y
 BR2_cortex_a7=y
 BR2_ARM_FPU_NEON_VFPV4=y
 
-# Linux headers same as kernel, a 5.15 series
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_5_15=y
+# Linux headers same as kernel, a 6.6 series
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
 
 # system
 BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
@@ -12,17 +12,17 @@ BR2_TARGET_GENERIC_GETTY_PORT="ttymxc0"
 # kernel
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="5.15.11"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.48"
 BR2_LINUX_KERNEL_DEFCONFIG="imx_v6_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
-BR2_LINUX_KERNEL_INTREE_DTS_NAME="imx6ul-14x14-evk"
+BR2_LINUX_KERNEL_INTREE_DTS_NAME="nxp/imx/imx6ul-14x14-evk"
 BR2_LINUX_KERNEL_NEEDS_HOST_OPENSSL=y
 
 # bootloader
 BR2_TARGET_UBOOT=y
 BR2_TARGET_UBOOT_BOARDNAME="mx6ul_14x14_evk"
 BR2_TARGET_UBOOT_CUSTOM_VERSION=y
-BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2021.10"
+BR2_TARGET_UBOOT_CUSTOM_VERSION_VALUE="2024.07"
 BR2_TARGET_UBOOT_NEEDS_OPENSSL=y
 BR2_TARGET_UBOOT_FORMAT_IMG=y
 BR2_TARGET_UBOOT_SPL=y
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
