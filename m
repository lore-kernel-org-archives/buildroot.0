Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86C94E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:06:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 48D22405C1;
	Wed,  8 Jan 2025 23:06:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bFronZiE0hOj; Wed,  8 Jan 2025 23:06:12 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 636CD405B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 636CD405B6;
	Wed,  8 Jan 2025 23:06:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2EAD17AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 1E12A80DD5
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WDdFr0q3cTXp for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42d; helo=mail-wr1-x42d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01FB380DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FB380DCD
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01FB380DCD
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id
 ffacd0b85a97d-385e87b25f0so934447f8f.0
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377533; x=1736982333;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CZ4vGVFFphxka/qn1hDudflZdwJsP+151GYL/cdRteg=;
 b=waO10GeTucpotOoGOSA/Y8fhMlSRyd6Ty0V8pYhI2nRIm6DzZrKFWv0yf1b6qyd7NI
 56Sgu4jGuxVSPFvPVq/xPgKBH++6NB2WZ8z7MZCK7j1leHbEx++LPqB5FRllHIfBflvM
 o4h3MHfu5nIEru+iy1NKBvQ2XFqAk0cQn6u7mXhq32RlYB/6V8kbQkiZmWqEFT0EGQ9n
 UkMEZHKJ9kUZ/l6VqcTNL3oeED7Yqbj+WXeEoZMq3rbTIGHgpExiVIN2ItaUenbnw54Q
 QpVIiTuKZVbuhfZN149rgcnq8esF8dtgcyhzLPCaWt0CE8Bc2fAplSIMK/mv6qPTHD6Q
 ECSQ==
X-Gm-Message-State: AOJu0YyaVbah9f1dwTGw1l8Bk2OevU7XloyWuBkXDGmz7/B/dj3EJDZR
 2MeqF5T8wOkrN1ypzFrs7YeHu6UCsCppzhG2oZlkLGwI/eS4vmCsBjxjeCe9wG15XopzGHYsLGV
 I
X-Gm-Gg: ASbGncs1O5YQ47IQm0qpVz76csxdiop/Qyh7mVJaYbumvju1wmwsCwqHCQiF6mbOGmh
 fy1uVxUZ5jQk38zFx8+nIS3jmR4EfCJdPt7Xd9vlV62my4xVyz9kJwBd/cHCRnSleFYfyiaDoFX
 1JXpGHYva1qD/am+4OHGSPudzggfic1Z3lR30YKg2idECWyruZJJWOV/DeL1M23TYIJJLprWxro
 yhM+pQHd887dlNfteNpIPHa+hqKuBmPfLeRrYhHRq8TeZ4bN4rM7q0QkvXl4QBWtvP8Ap/b2Uuz
 rAh7O+TamEKw//rkTSzGmRvEoXRWz7yfnL7+evAIeJ0mjQS95cW6JA==
X-Google-Smtp-Source: AGHT+IGlE/MoD9DRVi1G+4CE1v0wRu28htomrZzbxY5K3mwDT37XpcMsnZlnuv7kXm9CHuYMDfsGWw==
X-Received: by 2002:a5d:648a:0:b0:386:42b1:d7e4 with SMTP id
 ffacd0b85a97d-38a8b0f3158mr843104f8f.19.1736377532666; 
 Wed, 08 Jan 2025 15:05:32 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:32 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:21 +0100
Message-ID: <20250108230521.1345210-12-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377533; x=1736982333; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CZ4vGVFFphxka/qn1hDudflZdwJsP+151GYL/cdRteg=;
 b=Tu5iWs5FZKaCjfZxPkOhLKnuhNqdUi2t+yEv1quFCiL2zGlA+hcnzrvTlP3O2OM86R
 1cfrwITuDbpn/cbQWx5Wr8Q9mKHl+v8EXYyOrGTTH3+Iqx7SzHl1AdjGvxpllk8szL/f
 yJ1jF9KBZAxbOnWcX1gYcyxx7uDrLF00aJL0Q=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Tu5iWs5F
Subject: [Buildroot] [PATCH 12/12] arch/nios2: drop architecture
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

The nios2 architecture was deprecated in gcc-14 and has been removed
in the upcoming gcc-15 [1][2].

This commit removes nios2 from the architecture entry.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 Config.in            |  2 --
 Config.in.legacy     |  7 +++++++
 DEVELOPERS           |  1 -
 arch/Config.in       | 14 --------------
 arch/Config.in.nios2 | 14 --------------
 5 files changed, 7 insertions(+), 31 deletions(-)
 delete mode 100644 arch/Config.in.nios2

diff --git a/Config.in b/Config.in
index 247a9e8ef1..d290431ab5 100644
--- a/Config.in
+++ b/Config.in
@@ -799,8 +799,6 @@ config BR2_PIC_PIE_ARCH_SUPPORTS
 	default y
 	# Microblaze glibc toolchains don't work with PIC/PIE enabled
 	depends on !BR2_microblaze
-	# Nios2 toolchains produce non working binaries with -fPIC
-	depends on !BR2_nios2
 
 config BR2_PIC_PIE
 	bool "Build code with PIC/PIE"
diff --git a/Config.in.legacy b/Config.in.legacy
index 54c251be1f..e091fd8c0a 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,13 @@ endif
 
 comment "Legacy options removed in 2025.02"
 
+config BR2_nios2
+	bool "nios2 architecture removed"
+	select BR2_LEGACY
+	help
+	  The nios2 architecture was removed, by lack of toolchain
+	  support.
+
 config BR2_TOOLCHAIN_EXTERNAL_BOOTLIN_NIOS2_GLIBC_BLEEDING_EDGE
 	bool "Bootlin nios2 glibc bleeding-edge toolchain removed"
 	select BR2_LEGACY
diff --git a/DEVELOPERS b/DEVELOPERS
index 16b72eee08..09a7e65a9b 100644
--- a/DEVELOPERS
+++ b/DEVELOPERS
@@ -950,7 +950,6 @@ F:	package/tcf-agent/
 N:	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
 F:	board/ci20/
 F:	configs/ci20_defconfig
-F:	arch/Config.in.nios2
 F:	package/fio/
 F:	package/iptraf-ng/
 F:	package/jimtcl/
diff --git a/arch/Config.in b/arch/Config.in
index 6254cb6467..6b54c65df9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -143,16 +143,6 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
-config BR2_nios2
-	bool "Nios II"
-	depends on BR2_BROKEN
-	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
-	select BR2_USE_MMU
-	help
-	  Nios II is a soft core processor from Altera Corporation.
-	  http://www.altera.com/
-	  http://en.wikipedia.org/wiki/Nios_II
-
 config BR2_or1k
 	bool "OpenRISC"
 	select BR2_USE_MMU
@@ -395,10 +385,6 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
 source "arch/Config.in.mips"
 endif
 
-if BR2_nios2
-source "arch/Config.in.nios2"
-endif
-
 if BR2_or1k
 source "arch/Config.in.or1k"
 endif
diff --git a/arch/Config.in.nios2 b/arch/Config.in.nios2
deleted file mode 100644
index a5d7e66d40..0000000000
--- a/arch/Config.in.nios2
+++ /dev/null
@@ -1,14 +0,0 @@
-config BR2_ARCH
-	default "nios2"
-
-config BR2_NORMALIZED_ARCH
-	default "nios2"
-
-config BR2_ENDIAN
-	default "LITTLE"
-
-config BR2_READELF_ARCH_NAME
-	default "Altera Nios II"
-
-# vim: ft=kconfig
-# -*- mode:kconfig; -*-
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
