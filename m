Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAD25C02183
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9A59D40325;
	Mon, 13 Jan 2025 13:03:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tNSnlAPkyLTm; Mon, 13 Jan 2025 13:03:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 64A2540342
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64A2540342;
	Mon, 13 Jan 2025 13:03:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 9287D95D
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 743ED606BA
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zCQbDYnKBN0C for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32d; helo=mail-wm1-x32d.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 95873607B6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95873607B6
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 95873607B6
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:28 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 5b1f17b1804b1-4361f796586so43837555e9.3
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:03:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773406; x=1737378206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4EZDkH8viILY0sQ9YZs9qRoR94z4ck/nlEBEAza5sxs=;
 b=BlyCS7JuTjasXPYejwVridA+b0LUkw60h1vFGiqLI2vlWwvToD4ZLJzASpQk9xUVMa
 5voXcomIENK3ueJnkPot8sJZ90IBZ/hMWukr5yL/8cg/qU9DxRmRJZjJI2jODHeqGO4V
 bk+tCtOth15Ews1yZtu8leAy0xd+0svSuYJ19yYqvFwymYvrXDtDwKh90KO9wxAyBZnn
 K9oLn4TNHxOXkrodttxFZbL6RDhYEpYkZ3nAZ6JgaMVt9HEmHQyvx3p4HZbE6CHuhzak
 ujm79ztAmEZz2auKMz08CQ9c2JG9+nRHxtpf1D2SANWOC7sS+kDUCubWLlDF1d2PT04v
 E4JQ==
X-Gm-Message-State: AOJu0YwL0sza3jJO04b6/M69YgxgKMd+sEUumgpaqih3SI/2PdemA/2u
 UezZwdlXVGUG57OWo4oyxt7pT8AXGx+Zcso0aMPFgFssscv2bF9oC5fN9aZMa3Lm5q0rBFzzzve
 c
X-Gm-Gg: ASbGnctv4DEBaWGiduRtgg+brKLkK4orZs6L/RMZX7BcoeKze7AWsSGPoC8V4DQZPSO
 zgQlQluk3BI8eGYU+IOKPl22cDBs3hz/pOIL1yqTyWvjvz1LoLergXmGRavSMFC4GOO/zj8Rfob
 E+jzb20z/Mo+a9O0/Fcon1Lm0vDRbyr/5mlK6faaEqAXR8q+jlBwYAsEBbKQsSBBNTTGKJvI34s
 BGbVuWwmFf8AlwKcotGU7rNkq18x7d2AnCQidqKh5SjM3lQ9UVgCyfh+CdSWLqHCT3mA9Ns4Srr
 agP7xxlJHQiBsxQYo58j4qGJtdk5oBKDnPKknd5o3HHqWIleFz6D8A==
X-Google-Smtp-Source: AGHT+IFnHyiyLbnp3UmyLr+tbOuR929wV7l3BxB5LJKxyZmSVZGYcYqEiqGdipDNl/Jbj2ZtM9kkFg==
X-Received: by 2002:a05:600c:138a:b0:434:f0df:9fd with SMTP id
 5b1f17b1804b1-436e2679a1cmr75137385e9.2.1736773406490; 
 Mon, 13 Jan 2025 05:03:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11812279f8f.85.2025.01.13.05.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 05:03:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>
Date: Mon, 13 Jan 2025 14:03:19 +0100
Message-ID: <20250113130322.3962035-3-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130322.3962035-1-romain.naour@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736773406; x=1737378206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4EZDkH8viILY0sQ9YZs9qRoR94z4ck/nlEBEAza5sxs=;
 b=Nr/JAO6qmah82A8+krwcx2TeNbslk3RYYNPbV2og8De9BxoogreIOdDHcZ5+qfrYxo
 qNsK+ImORe/jBti2WxVueTcO1O2fjtKSXNSTR/Maw5uHfVrcB1eAeJd7+ddVM5qd9WSx
 GgokBUGvDH65Vb5UQWVRHJZi1e06r/IAvXpOY=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=Nr/JAO6q
Subject: [Buildroot] [PATCH 3/6]
 toolchain/toolchain-external/toolchain-external-arm-aarch64-be: fix
 BR2_ARCH_NEEDS_GCC_AT_LEAST_X guard
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

BR2_ARCH_NEEDS_GCC_AT_LEAST_X guards has been introduced by [1] to
prevent selecting an external toolchain that did not support the GCC
arch tuning the user had selected.

But it was not changed while updating to version 13.2-rel1.

Fixes: 50ae5ea963b7ed34b1511d4d2487bef083f5b1a7

[1] eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a

Cc: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external-arm-aarch64-be/Config.in                 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
index d3c095b2b6..725925a5a6 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64-be/Config.in
@@ -2,7 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64_BE
 	bool "Arm AArch64 BE 13.3.rel1"
 	depends on BR2_aarch64_be
 	depends on BR2_HOSTARCH = "x86_64"
-	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_13
+	depends on !BR2_ARCH_NEEDS_GCC_AT_LEAST_14
 	select BR2_TOOLCHAIN_EXTERNAL_GLIBC
 	select BR2_TOOLCHAIN_HAS_SSP
 	select BR2_INSTALL_LIBSTDCPP
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
