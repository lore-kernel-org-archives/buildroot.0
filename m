Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CCF3E7719F
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:03:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B767C60E85;
	Mon, 13 Jan 2025 13:03:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wgRB2aLb7scR; Mon, 13 Jan 2025 13:03:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4053960BBA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4053960BBA;
	Mon, 13 Jan 2025 13:03:41 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 4C6DC95D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B039812F1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2BT23rEp9pTK for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:03:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0D73F812DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0D73F812DF
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0D73F812DF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-38a25d4b9d4so2189532f8f.0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:03:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773408; x=1737378208;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/YFKuJEUICK8rZB4J0vWLMCznqI0CRoOTFg8okmgYGI=;
 b=sB9WnKWkgTa+XAqO6d8e417EYdDcXazlypuTBeVRxjzPDRPas6A4pgUqS0m41g87Fi
 wvLXGDkH8C2I3g8ArF3X1ANHn3R3r1Jj8TEo13HNRFtutoBhAPr3KCz8O7x0WraWztmE
 QvIZGMeHQwenTqjAJdBRIqDHF11O5aeXIJnoOHAN/AQx+0hc63eVwtESK+7JDz1j7CZ3
 IRNOkZFsUJuwArg+S2LFK26qOBIzjgIxk3Z1WJ79dO2Ti9d10Z+Uml3EwqVpfu5vCuAe
 F27Zq5hpASsZ3Ik1aQaKKGWlYL4UxrCK8IOGIu7G26+AZoIQK2v52+RZ8/zDgmTCTRHf
 +0vw==
X-Gm-Message-State: AOJu0YxOeDAbo9235bsJ3z2SuJi536Sj0NxsGSKdiwfOuaVp1Oi2vv6V
 rY4qSruURD9oJZeO8qEOQ+nclIC69hpsfo1n1edmY36VqD5+gtS2M4Gia5d6DZs4Xfw9KyGKWGl
 P
X-Gm-Gg: ASbGncvilspwqhRLcqjw+S199FhsY6fahheUZLZThgj9FhbvjYRz0xHOgEAoeXYVg++
 d7iLdgu+tVzaalRDwuDdITNcNn9YqW4VvjGoKVD6MrNT1bgHr8o4C8W+Gk1cWvx2mnjRoLit2/4
 vFSDl9qpyqQp+HaWFbtS06j4bJ+RSlkwf6WBm9bQS4q+dduUOqbxFtgL+8XzSdt2oV46E978God
 AtiEpoaxO1mI9+odMAKFJGZlEORR8mME8vzo5B+CWks/dcXXTWgP1Fnaz4KIHTyJxHHx9Y+K+v2
 5U3yoNJnUnmDtfghbFWmWUehsS8ZKy+6JLivI4v/GS97Gh5bOLsFFw==
X-Google-Smtp-Source: AGHT+IFpiIf8Wo0WiND4dLCfvHYE0mrcLuR+vEnob/bDQ7XpfEZW8DImr1sddPJ4Vmq8kRnzHtIFag==
X-Received: by 2002:a5d:47c4:0:b0:385:f69a:7e5f with SMTP id
 ffacd0b85a97d-38a87308ae0mr22954913f8f.38.1736773407957; 
 Mon, 13 Jan 2025 05:03:27 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11812279f8f.85.2025.01.13.05.03.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 05:03:27 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Mon, 13 Jan 2025 14:03:21 +0100
Message-ID: <20250113130322.3962035-5-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130322.3962035-1-romain.naour@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736773408; x=1737378208; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/YFKuJEUICK8rZB4J0vWLMCznqI0CRoOTFg8okmgYGI=;
 b=HzOcr7OLY1DaUHS61oEa32lVV5e+mplnMilSq5L7nn61U3qRMGnE637YyHs3h8qYPl
 85sPNxNhRjKkaSX/4IVkqzknoEQ3gjT/Zfnua7762For5zj49evGzp5hChIj0zMqRIK9
 MmyTjGa4zifzWxuVUYpJqH+p8wfae5IB0Ux9E=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=HzOcr7OL
Subject: [Buildroot] [PATCH 5/6]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: bump to
 14.2.rel1
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

Tested with qemu_aarch64_virt_defconfig.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external-arm-aarch64/Config.in                | 6 +++---
 .../toolchain-external-arm-aarch64.hash                     | 4 ++--
 .../toolchain-external-arm-aarch64.mk                       | 2 +-
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 38f4dafeee..309994d014 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -1,13 +1,13 @@
 config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
-	bool "Arm AArch64 13.3.rel1"
+	bool "Arm AArch64 14.2.rel1"
 	depends on BR2_aarch64
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_15
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
 	select BR2_TOOLCHAIN_HEADERS_AT_LEAST_4_20
-	select BR2_TOOLCHAIN_GCC_AT_LEAST_13
+	select BR2_TOOLCHAIN_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_HAS_FORTRAN
 	select BR2_TOOLCHAIN_HAS_OPENMP
 	help
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
index 75478913b0..ed80511f7f 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.hash
@@ -1,2 +1,2 @@
-# From https://developer.arm.com/-/media/Files/downloads/gnu/13.3.rel1/binrel/arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
-sha256  322f0b4482fc0d9fa0bb468134841f08d8c554c54ff5aa29a13a7a24bf7e1eb5  arm-gnu-toolchain-13.3.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
+# From https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz.sha256asc
+sha256  47aeefc02b0ee39f6d4d1812110952975542d365872a7474b5306924bca4faa1  arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
index b6c75ecf3f..7f9c97c5e5 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/toolchain-external-arm-aarch64.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 13.3.rel1
+TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION = 14.2.rel1
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SITE = https://developer.arm.com/-/media/Files/downloads/gnu/$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)/binrel
 
 TOOLCHAIN_EXTERNAL_ARM_AARCH64_SOURCE = arm-gnu-toolchain-$(TOOLCHAIN_EXTERNAL_ARM_AARCH64_VERSION)-x86_64-aarch64-none-linux-gnu.tar.xz
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
