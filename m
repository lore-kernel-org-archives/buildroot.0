Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54851C021B5
	for <buildroot@archiver.kernel.org>; Fri, 21 Feb 2025 22:55:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EF80160ADD;
	Fri, 21 Feb 2025 22:55:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bg7UVesGBWFk; Fri, 21 Feb 2025 22:55:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AF6C560A65
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AF6C560A65;
	Fri, 21 Feb 2025 22:55:46 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id D6F07EDF
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C708440BF1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OwNATALZwM1y for <buildroot@buildroot.org>;
 Fri, 21 Feb 2025 22:55:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A98740BEF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A98740BEF
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A98740BEF
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 22:55:37 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-43984e9cc90so21978795e9.1
 for <buildroot@buildroot.org>; Fri, 21 Feb 2025 14:55:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740178535; x=1740783335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5hbC3YslMvlb8Lby8AxHkvk+nfURAEpfNRyhILHCH9M=;
 b=j0eHyGiFcV3yGf/xPWzWHKSDFTtw7z2qgpvPDJP1tXn6SUSZnVEfkXYXHOsw2jMeSp
 R5l2JdUKXrv+4TjiC8pYQu48n0to71JqvO5jDan5xWCT6nNM+fo4z4lkgq8WMYCAIsxb
 IlOsAiYCOtNijDWJL6kiV09R0ZBb4y3kJIy3/eoxZwtglCC8cRZOU1EF3vqf9+vuTGUk
 Jdl5vIN0VtEwDv4S05itqZ7QeaAMs3SjFy/X06ub2L+iVZaP+QpuPq8irLvwYTz5VMwT
 u+kgYMgiFI/ptCvb+TKfLLOAbSW+ZfMikzGId8UDwvDpJvDKVTqUTSSqVUEDGm0lM2jD
 gFXQ==
X-Gm-Message-State: AOJu0Yypu45hSl7YTxkipqrnQYFL9gBXy0FXJTtrOcp5vpteaQ1lpNXI
 SzffjoZJLudSS8vVHZKyZ77cykOULowr59Ej5nCgfI/dmwwytw4UXY/dgjDTLIwtp5FQfuQMvpF
 y
X-Gm-Gg: ASbGncsUYhIjAl/TwRvwMwbpeJAq/vFIIT0iwPCDh43BhTrQtc1+hiv0ZL3vC0NIxQS
 3gw1zp8U2l8lLQ/H8UqM5CEUyK2OsZjivy/fNWkwUT1lZfcaTZqru0G6HKQA++R3VtWCo3rbyC+
 MkH2UsgNBUSRH52Wh/AWRVXgmtKHe9f0Wh2lmwoXI7u2VaLNlFQMCSTAmL7DMNuvz0l21+ojgRO
 kEgDgEzF/75N4QZ5ox0O/4CKMto/Qv6RJ1vxHytkmpPX8ouogCNRES7pNHWzdJHmp3dnjRKuV0n
 dVGOMJ9em9cxNfgz85YsANi6rNJPfa8cbCT9/OF8q6B7A9JeSTaVDcRgD01qSVA4bZ6MRKwlGeZ
 um4Bzpk9qQEUYvUf3QazQJgk=
X-Google-Smtp-Source: AGHT+IFAaFEUfdnuFhxO4KGR/2hISJtpRniYmo7XMKDiXg6HpwToo2d8s6OmTb71sBy9cmv1ULOc0w==
X-Received: by 2002:a5d:64e6:0:b0:38d:b028:d906 with SMTP id
 ffacd0b85a97d-38f6f51535amr4533161f8f.21.1740178535327; 
 Fri, 21 Feb 2025 14:55:35 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38f259f8602sm25218585f8f.94.2025.02.21.14.55.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Feb 2025 14:55:35 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>, Edgar Bonet <bonet@grenoble.cnrs.fr>,
 Niklas Cassel <niklas.cassel@wdc.com>
Date: Fri, 21 Feb 2025 23:55:29 +0100
Message-ID: <20250221225529.441084-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250221225529.441084-1-romain.naour@smile.fr>
References: <20250221225529.441084-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1740178535; x=1740783335; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5hbC3YslMvlb8Lby8AxHkvk+nfURAEpfNRyhILHCH9M=;
 b=cmvh4+JcWI7BjXYOClQAI0gxF9We4rsTR4d3iUBqKnWbunjgGWi5PBXA9IytRBJsmQ
 XW3RP3qKDnzLtwc8ch4lBxpWOmWj+aTCXm1z6kG1d6nOV6nu4scbSa9KS2kEnLoTl9Ln
 UQvIYQ/8n8qVDRMPMWCTuYI0eh+7g2a5e/3wE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=cmvh4+Jc
Subject: [Buildroot] [PATCH v6 5/5] configs/acmesystems_acqua_a5_*: bump to
 Linux 6.12.9
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Romain Naour via buildroot <buildroot@buildroot.org>
Reply-To: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Cc: Edgar Bonet <bonet@grenoble.cnrs.fr>
Acked-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Tested-by: Edgar Bonet <bonet@grenoble.cnrs.fr>
Reviewed-by: Niklas Cassel <niklas.cassel@wdc.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
v6: bump to Linux 6.12.9 in a separate patch (Niklas Cassel)

Runtime testing:
v4: https://lore.kernel.org/buildroot/e68817f0-312c-4980-837c-7264656457ca@grenoble.cnrs.fr/
---
 board/acmesystems/acqua-a5/patches/linux/linux.hash | 2 +-
 configs/acmesystems_acqua_a5_256mb_defconfig        | 4 ++--
 configs/acmesystems_acqua_a5_512mb_defconfig        | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/board/acmesystems/acqua-a5/patches/linux/linux.hash b/board/acmesystems/acqua-a5/patches/linux/linux.hash
index 4b20a009a7..7a4c4e57c9 100644
--- a/board/acmesystems/acqua-a5/patches/linux/linux.hash
+++ b/board/acmesystems/acqua-a5/patches/linux/linux.hash
@@ -1,2 +1,2 @@
 # Locally calculated
-sha256  b66a5b863b0f8669448b74ca83bd641a856f164b29956e539bbcb5fdeeab9cc6  linux-6.6.30.tar.xz
+sha256  87be0360df0931b340d2bac35161a548070fbc3a8c352c49e21e96666c26aeb4  linux-6.12.9.tar.xz
diff --git a/configs/acmesystems_acqua_a5_256mb_defconfig b/configs/acmesystems_acqua_a5_256mb_defconfig
index d21ff97216..a50e306b1b 100644
--- a/configs/acmesystems_acqua_a5_256mb_defconfig
+++ b/configs/acmesystems_acqua_a5_256mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
diff --git a/configs/acmesystems_acqua_a5_512mb_defconfig b/configs/acmesystems_acqua_a5_512mb_defconfig
index d83a058537..6ae8d037e7 100644
--- a/configs/acmesystems_acqua_a5_512mb_defconfig
+++ b/configs/acmesystems_acqua_a5_512mb_defconfig
@@ -2,7 +2,7 @@ BR2_arm=y
 BR2_cortex_a5=y
 BR2_ARM_ENABLE_VFP=y
 BR2_ARM_INSTRUCTIONS_THUMB2=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_GLOBAL_PATCH_DIR="board/acmesystems/acqua-a5/patches"
 BR2_DOWNLOAD_FORCE_CHECK_HASHES=y
 BR2_SYSTEM_DHCP="eth0"
@@ -10,7 +10,7 @@ BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/acmesystems/acqua-a5/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.30"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="sama5"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_CUSTOM_DTS_DIR="board/acmesystems/acqua-a5/dts"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
