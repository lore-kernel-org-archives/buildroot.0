Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C1B7C02180
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:03:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4E88B60AA9;
	Mon, 13 Jan 2025 13:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Td7S8acNYRXD; Mon, 13 Jan 2025 13:03:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 42CD660A58
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 42CD660A58;
	Mon, 13 Jan 2025 13:03:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B0AE940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4BC25812E0
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PEyOUWttfJaN for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::335; helo=mail-wm1-x335.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 38341812DF
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 38341812DF
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com
 [IPv6:2a00:1450:4864:20::335])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 38341812DF
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:27 +0000 (UTC)
Received: by mail-wm1-x335.google.com with SMTP id
 5b1f17b1804b1-436341f575fso43947715e9.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:03:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773406; x=1737378206;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=o9Vb2oOjJWc398sxgTvdlNU33Gp3EWenzCY1/LEMgKs=;
 b=wSK1fsS8w64umPEpzsQBuctO+kRM7Ivw0uMq+xBsllWx+jm9JmjjLdHYPqKooh/Dhb
 Gqw2BsTpwuTJraB8XkEGt4Mjt1Vx8Ak82IbBctEY7KJyYYPtkrAVg2uwcKutY6d1ssVS
 bGfgSyGtsWYwFNMpnYoTFnMxwhRmB+qSPlFzARFcnuWL6BI83eHJSg0SuOHLGfLbmZbP
 wPDymbUwcgnQM6wUkUAz9pxvQ7ojIzlIcXOv+IADPfcoinicW3VQuEORUaSqn84XSfVV
 D2z0csdBgej6W4vEg0w3fkg4cyQ+bO1xV6ZkBF1EcdI9xgDZYKTDyRX7gBmNcHHuJRwX
 KA2w==
X-Gm-Message-State: AOJu0Yzj3U7KKaJfWVYrX/+jGyBO5fwxwo6iZ2S09BcOLKxzLerhoH3i
 rekSqWig+fbaRBEYM4Exxm7RYy0RxgyCReBEeaUNJYGWigyxuGR6Od2oWMqkGiG3N8qwnWVQuxs
 A
X-Gm-Gg: ASbGncu4JQNFBNzHt3pXEJTkh+BgoJTPXMhPRk7zWwnfGIli0U+uqNG18fdhwPky2YU
 pJpFJ3vLSYK7x1W77BI2nEoIcVxT0pRl3JAWJryksqaFnjfBUJJG4Uwo7Z2UlffjE2P8dylvxUP
 zDkfQ0X7noZKH1hLtQOc3jFeQjpg+lVU+7uFiNp7Ed6EitUrNZOPg8m6wfwhbQxp9+Eb9c66NIX
 qdAouLmjVExc62LBnKqywMP7mLWb8uVHQz4hY0r63iwOwlkm8JGXRCRyharslJMH9nwgo6Khjbf
 /sXifDT41l8e+jph5l2/bNx5e+lYSQy8CY1Ds9jU47a+aNcRyK5a3Q==
X-Google-Smtp-Source: AGHT+IGn7MjGrBACvZroa9vzRMFCQIdfCkUpsQd9BvptYvAn6EJTole4fi5cWSULa/VmF9PlWdNUSg==
X-Received: by 2002:a05:600c:1c1a:b0:434:a802:e9a6 with SMTP id
 5b1f17b1804b1-436e2679a94mr199983165e9.7.1736773405666; 
 Mon, 13 Jan 2025 05:03:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11812279f8f.85.2025.01.13.05.03.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 05:03:25 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>
Date: Mon, 13 Jan 2025 14:03:18 +0100
Message-ID: <20250113130322.3962035-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250113130322.3962035-1-romain.naour@smile.fr>
References: <20250113130322.3962035-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736773406; x=1737378206; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=o9Vb2oOjJWc398sxgTvdlNU33Gp3EWenzCY1/LEMgKs=;
 b=v5z0xqtede9pwozGYJ2fAe8h5it+dUuKDWoUFGNYI51iYO/BenjiAHp7iSUbyho2ef
 R1hVMj+iESM4mK4CkuGYaw1zczdWbfOzpfKgBtfHWZB9DwH5+aIX/rI6lJccVREoTeh+
 JAUS4dGf3OpACmRxyqmE/cLCl/qaw3wSZ2eBc=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=v5z0xqte
Subject: [Buildroot] [PATCH 2/6]
 toolchain/toolchain-external/toolchain-external-arm-aarch64: fix
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

Fixes: 7b4b3c2c78034fb3b16ad9658057f05066dcc4dd

[1] eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a

Cc: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external/toolchain-external-arm-aarch64/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
index 7f4fc61f2f..38f4dafeee 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-aarch64/Config.in
@@ -2,7 +2,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_AARCH64
 	bool "Arm AArch64 13.3.rel1"
 	depends on BR2_aarch64
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
