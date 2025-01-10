Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C819E77188
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5B7DD41220;
	Fri, 10 Jan 2025 19:54:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DD2l23GKLffx; Fri, 10 Jan 2025 19:54:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org F395941204
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id F395941204;
	Fri, 10 Jan 2025 19:54:42 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id A56D3942
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85CDA60E81
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Km9YkzC7ypyV for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32f; helo=mail-wm1-x32f.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4F55E60B63
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4F55E60B63
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4F55E60B63
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id
 5b1f17b1804b1-436202dd730so18031425e9.2
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538857; x=1737143657;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=b2dwOjUmN7oBGt10xS79nSTGTF1vXCzb5j3zUCj6umY=;
 b=q7ZgPGicPyOrPyws22Lrxw081WhjmjoJrsRukfR3ZlmU6tHcnBiDHPe1oXxWmv5Yb2
 NaHnnNqoXIlxvlJnfKFebOROkRt4CptlZxnX4QdbJl5Cq1UMXnZtGLaIjRq3ZnwY/oGq
 IRsQIhzNlD1lEODUBzb0WFiZs5g3gmU/uWNzpWGX8GVOeAzh6XXNo+FfTjC73vbQBUuK
 +hglF/nJWNpv3gzhsAkKsymyRYNG5/SiOAocwezPnJAKtbjdQRb8pOSmIG46h63Yrr6u
 2+STYcNl/2/O+NKMU56MUuc4X45+1t2LqJWYZwlv8ZNIVqUMHltQBll38E25PyGkqN15
 W9+g==
X-Gm-Message-State: AOJu0YwkT6b/eZAic8OFzfyxhbuksWVjovu3/4I2Vj94Y54gQ12BeVPU
 4Xa+uNZFLMZAim5+HciS4V7ZlgK7Y8XP+4XvTSRDM9ZVQQyK5PXibAR7RhoIRFjxpcJQ4rOU9Hw
 3
X-Gm-Gg: ASbGnctZHYK/8NzHxVJ04wMW2UEmWwS80X+eKA3s2Ldy02eIXG4qUUipBw5r7F07wNH
 5fkfYKeVuHEX7tyA4prSWt2lLt9h8gUU2PYIoLbCxHwowU4YOBfxld9EUFvzEE9bTklvu1NFAQk
 X1zAV7XA2uKBc7pmAXoojtdmINnb0jr2EiqD4F56kFXHu8cWNZI+LFWASxG21ECp+yhyzMbeAZZ
 YGTpBeDRgXxaobCMxfew4GrB4HAIbjk6Wax0y1wh6Mkzw6YEVESL9SQ6cMExWGg2dOf4R2aPavA
 sPx7d2GVuyZz6Y9IMX/B64zeVDeUAohlgsoho6n5HLeljc3vpJw4ow==
X-Google-Smtp-Source: AGHT+IGlgg+tT9zHtBfDSYHVfJVNxFpklsztut9lKA59WB1OIgdnuC5UddMpkBGXosZV4fUihVO57Q==
X-Received: by 2002:a05:600c:1386:b0:434:f8e5:1bb with SMTP id
 5b1f17b1804b1-436e26aeb43mr120919515e9.12.1736538857261; 
 Fri, 10 Jan 2025 11:54:17 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:17 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:59 +0100
Message-ID: <20250110195359.3358022-12-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538857; x=1737143657; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b2dwOjUmN7oBGt10xS79nSTGTF1vXCzb5j3zUCj6umY=;
 b=UHGEPujTz4fpFD7EN0RSH4Vckw/mrerwH1NTJoBVo43GM8jFx0gj/OAZr7w/8+Thf0
 m5y08+1fKFrerrOFNOFfOf0bG//FpNReOdjXyI2n198lCJS9Eq2bRbHxxenMQW70KBOT
 k4W55TpgagKZpMiDd4a61dujS2zPkRe95dZ4o=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=UHGEPujT
Subject: [Buildroot] [PATCH v2 12/12] arch/nios2: drop architecture
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
 arch/Config.in       | 13 -------------
 arch/Config.in.nios2 | 14 --------------
 5 files changed, 7 insertions(+), 30 deletions(-)
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
index e7bf0b53cb..6b54c65df9 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -143,15 +143,6 @@ config BR2_mips64el
 	  http://www.mips.com/
 	  http://en.wikipedia.org/wiki/MIPS_Technologies
 
-config BR2_nios2
-	bool
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
@@ -394,10 +385,6 @@ if BR2_mips || BR2_mips64 || BR2_mipsel || BR2_mips64el
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
