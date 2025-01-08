Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70B02E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3DB3980E41;
	Wed,  8 Jan 2025 23:05:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id F_Sbnzm3Mjyr; Wed,  8 Jan 2025 23:05:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FDCC80DDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FDCC80DDF;
	Wed,  8 Jan 2025 23:05:46 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 91CC97AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7F6D2605F7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8mQO1IF8b4-T for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32e; helo=mail-wm1-x32e.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2EDE160609
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2EDE160609
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2EDE160609
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:31 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-4362f61757fso3510495e9.2
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377529; x=1736982329;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vdWZZBRPQ866tgKuOUOaJDdE2LLYzVgzzO1A5W/vl3c=;
 b=CObDJ8NdQcUvAVAIzeunNJHduYT9VeCC9fH7tlgdkPDgjfhgeyjJSKbEFFBGY5xKFg
 pkGVsGWZajfnT9bWTVBN1TDXSCBxgzO93hS4CFFaiEpcsHvca87fwocsqLwrtlehVq7A
 FO7/NL5sa7cSoGIELvLUzGZn1FGg+p2WmHw9M/874psah+/HPyv/Qtql0h/wJ9PfLCeL
 LPOkzzvw1FKQYpqJzDCRSPAAI61C61SV7sQ4Gy9YYb6awvaketUxE1YAEZXpjDoqH0YI
 E15zI9xDkd7qZ4HpP7B3qfsBdhuWXIrDTH7/kCEqekIRAP8cXXxxzRgxEan2/7QNCar/
 yG4Q==
X-Gm-Message-State: AOJu0YyFIc4CVXdeIWkuGv8BJAY79Lcw/eQxQDA8KIDd4LbtTbKbHPwk
 W73EIdvRNKqUX6RPzBCLyQ+gVWjDCN7r1enaAYnKXxhUTwMItTqtwgBZxDl9g1p+C3sRVURwE3L
 E
X-Gm-Gg: ASbGncveYIIAReROI0RvGN2AmJlSETQCwr1KKX2nvAiVbNJX/1o1orhEjKsnzbpxhJB
 7IWNmr70Bl9orFQGy9rovvwm6k9SjWS+/Evhm53fJ/9N0K0Vjp8kFSavq/QZsIBbzU8+oZIsByg
 40SFnQkbt8zMxLH0rF/GimWBoFwt5BoVCgmgS7X1n5y6JeI02C1F1q0vFZdjSdOYEnIejJhvG3I
 Dsi54BNDv04vZHNv3o0sofB2Z/jziaqRY+no/T5+EUVEtzNOWS6MIvYkE5L1+rEDMpuj44w38VD
 ucf1qK7J4G4yZhG/ysszGyMqKIO/9yuUt8Aetq9Q5qYe4GG33HFxeA==
X-Google-Smtp-Source: AGHT+IGigsguJVKn4FYcQoIeCZFJWDiP1oFUli6h4NOkcMndZ9ZLZcZBGEGQBGzcFx/B9nQjV7/YTw==
X-Received: by 2002:a05:600c:4f06:b0:431:12a8:7f1a with SMTP id
 5b1f17b1804b1-436e26d018emr44575115e9.16.1736377529079; 
 Wed, 08 Jan 2025 15:05:29 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:28 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:15 +0100
Message-ID: <20250108230521.1345210-6-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377529; x=1736982329; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=vdWZZBRPQ866tgKuOUOaJDdE2LLYzVgzzO1A5W/vl3c=;
 b=R87EmG66eDNzpevnrKhNJFQxSBmX0sFWgxdiQRpEjBMOk59NTefpPkAhLsCa1wFndL
 R9O9xVZU4auT/vfQ42asfMISNtPDnMneHPEwMzq41Pv88VUYWk9uhLKe6Pwz59TzQU3D
 JEBDK+cqDoScZCDPVKo4MC182UJc+HG7g+t38=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=R87EmG66
Subject: [Buildroot] [PATCH 06/12] arch: disable nios2
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

Our last and only nios2 defconfig "qemu_nios2_10m50_defconfig" was
removed in 2024.11 due to nios2 removal from Qemu 9.1.0 [3].

This patch only definitively hides the symbol. When all references
to it are removed (to come in followup patches), we'll eventually
remove the symbol altogether.

[1] https://sourceware.org/pipermail/binutils/2024-April/133675.html
[2] https://gcc.gnu.org/git/?p=gcc.git;a=commitdiff;h=e876acab6cdd84bb2b32c98fc69fb0ba29c81153
[3] f96b4c176f6e9d6c4374a0d322de672bf44c35bf

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
ignore warning about BR2_BROKEN symbol:
  arch/Config.in:148: BR2_BROKEN referenced but not defined
---
 .defconfig     | 1 -
 arch/Config.in | 1 +
 2 files changed, 1 insertion(+), 1 deletion(-)

diff --git a/.defconfig b/.defconfig
index 7ab0c3fbf0..d25c62e104 100644
--- a/.defconfig
+++ b/.defconfig
@@ -12,7 +12,6 @@ BR2_i386=y
 # BR2_m68k is not set
 # BR2_mips is not set
 # BR2_mipsel is not set
-# BR2_nios2 is not set
 # BR2_powerpc is not set
 # BR2_sh is not set
 # BR2_sparc is not set
diff --git a/arch/Config.in b/arch/Config.in
index 7da2dc69e4..6254cb6467 100644
--- a/arch/Config.in
+++ b/arch/Config.in
@@ -145,6 +145,7 @@ config BR2_mips64el
 
 config BR2_nios2
 	bool "Nios II"
+	depends on BR2_BROKEN
 	select BR2_ARCH_HAS_NO_TOOLCHAIN_BUILDROOT
 	select BR2_USE_MMU
 	help
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
