Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E24C02193
	for <buildroot@archiver.kernel.org>; Tue,  4 Feb 2025 16:36:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45C56820CC;
	Tue,  4 Feb 2025 16:36:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GxopgdmN8AFM; Tue,  4 Feb 2025 16:36:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4052E82238
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4052E82238;
	Tue,  4 Feb 2025 16:36:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id B73DA12A
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B00DC40AE5
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2xe9TpsueYb4 for <buildroot@buildroot.org>;
 Tue,  4 Feb 2025 16:36:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::431; helo=mail-wr1-x431.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A874140635
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A874140635
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A874140635
 for <buildroot@buildroot.org>; Tue,  4 Feb 2025 16:36:28 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id
 ffacd0b85a97d-38a8b17d7a7so3089245f8f.2
 for <buildroot@buildroot.org>; Tue, 04 Feb 2025 08:36:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738686987; x=1739291787;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=djau88jYWcOMBtd0HcTY4WzofSTl4G79uEgtwiULUVM=;
 b=T3QYthmwuVjkoXbb6sZXRyifRa2jdwpQ26hmtVWZnpzmwdlXTou2kzbN4UWW2A+5ih
 ZlpmsrCC/Rw+fSF6BZkqsroGwzEj4WrIa+8EkX1h78/zYRbfKsKG9aCR/e8u8Lhj1hMh
 PbOzgW3lW+jJPbd1U3dFGs7mw3FruYFk9RU+Jy2rARJLB3DWmWbajFIjg4IwHgbnv/Lp
 x36vjkAd3tWv2bzphU50Gk+3qf4wx9b7aeKzTA3e8MC0Mxp9pmYeH5hwa3Ygsb0vl3PP
 4S4R4XaGaa127GRzwUbvua5Z3SAvjJFX2M+kh6pNl0et0g+uRkt61lAk8j1CV6XYvWXr
 4/WA==
X-Gm-Message-State: AOJu0YwBYyDZw6BaDzodiAwPFX57R0Qh3+HU2W3PbwIPXHh2GVyXaJ/q
 wQBKgkVLIh6D3HRTbYltF+xiUO0iVmZbMdsAObZgg0mKZZgWx3GSPFRiB1PqQrlTHPJ9BO76sdy
 l2ig=
X-Gm-Gg: ASbGnct+FivDncxtDajwazTSHJ7+crNQJW6fQo/XTKHK96Yk7SHilTR4VEmMgRL6dPi
 ux3I8Az24eWnfY/D56SibgUurl2zhcUZ0w0U6BXtRu+fPcJZsQ+Ux8GddH5uLBlGdrnol8IEKPR
 CChBgnWJiO4XSef/WenEUM1ES362zvHU0csqY5Fbgs/MRzyGB3Th1oLlTKoAeHaSWviI4HeY147
 R98o2/4gGrVrkhNsPpdqBA3togDZoWhuOGmTtRz577vbk2iSpQBqVKEbewAHztu9gOTtkdO/Gl4
 QGu7QN7iTDp+s1IRG9/HZJ7CrvlOSc24DcfNUEZ082dh0FTsqvOUiMk=
X-Google-Smtp-Source: AGHT+IFheTvoaY2jgOcQqadoDuxuDBa2MEs211aNrgtRNpqkvXKK92LBTav2rRBTKe26Tu5BA6Azxg==
X-Received: by 2002:a5d:47ab:0:b0:38d:b0fe:8c99 with SMTP id
 ffacd0b85a97d-38db0fe8d27mr1302826f8f.48.1738686986653; 
 Tue, 04 Feb 2025 08:36:26 -0800 (PST)
Received: from P-NTS-Evian.. (host-109-89-232-55.dynamic.voo.be.
 [109.89.232.55]) by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c5c1cf560sm16032693f8f.89.2025.02.04.08.36.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Feb 2025 08:36:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Tue,  4 Feb 2025 17:36:20 +0100
Message-ID: <20250204163622.192932-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250204163622.192932-1-romain.naour@smile.fr>
References: <20250204163622.192932-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1738686987; x=1739291787; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=djau88jYWcOMBtd0HcTY4WzofSTl4G79uEgtwiULUVM=;
 b=nmE13vGOcXJd8bev5nTS4t0GGuZ4I9IUVNpjpW+BXXLU9bo4vPekDfGr1c4oIt7ne9
 Z2P7zWkS5KszFH8Xn5qz5JqNUmb1MV0bcbkG3mdYvNDRiUmbt+UCqzvn4w8muH18r/3h
 377ZFBWuTuj6VBIk6PGrMRcdeAaN7YH4XUS88=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=nmE13vGO
Subject: [Buildroot] [PATCH v5 5/6] [WIP] am57 kernel version bump 6.12
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

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 configs/am574x_idk_defconfig | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/configs/am574x_idk_defconfig b/configs/am574x_idk_defconfig
index 5d3ec12ad6..4b90d12745 100644
--- a/configs/am574x_idk_defconfig
+++ b/configs/am574x_idk_defconfig
@@ -1,13 +1,13 @@
 BR2_arm=y
 BR2_cortex_a15=y
-BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_6=y
+BR2_PACKAGE_HOST_LINUX_HEADERS_CUSTOM_6_12=y
 BR2_SYSTEM_DHCP="eth0"
 BR2_ROOTFS_POST_BUILD_SCRIPT="board/ti/am574x-idk/post-build.sh"
 BR2_ROOTFS_POST_IMAGE_SCRIPT="support/scripts/genimage.sh"
 BR2_ROOTFS_POST_SCRIPT_ARGS="-c board/ti/am574x-idk/genimage.cfg"
 BR2_LINUX_KERNEL=y
 BR2_LINUX_KERNEL_CUSTOM_VERSION=y
-BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.6.14"
+BR2_LINUX_KERNEL_CUSTOM_VERSION_VALUE="6.12.9"
 BR2_LINUX_KERNEL_DEFCONFIG="multi_v7"
 BR2_LINUX_KERNEL_DTS_SUPPORT=y
 BR2_LINUX_KERNEL_INTREE_DTS_NAME="ti/omap/am574x-idk"
-- 
2.48.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
