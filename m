Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38A90E7719F
	for <buildroot@archiver.kernel.org>; Mon, 13 Jan 2025 13:03:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 993BF60A6F;
	Mon, 13 Jan 2025 13:03:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Id0AV6W9MqGD; Mon, 13 Jan 2025 13:03:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2E9D60639
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E2E9D60639;
	Mon, 13 Jan 2025 13:03:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id B759C940
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B1E4C6078B
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MSdbsX3GR33u for <buildroot@buildroot.org>;
 Mon, 13 Jan 2025 13:03:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 59DD660639
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 59DD660639
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 59DD660639
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 13:03:27 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-3863494591bso2254497f8f.1
 for <buildroot@buildroot.org>; Mon, 13 Jan 2025 05:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736773405; x=1737378205;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=VLCs+V2umeJ93xnBF0H6a5suuFxCDj/7FTRRCRizxbo=;
 b=aTbzJErcpb7uU4OiO5GeHXP2icZy9aMxlyWU5MQEq3sxuLLKBERkU62IQ9IO/TKvki
 FjHavnjAvC0nFNbJXyEMiqi0Fr34TjywAUVtE2JJZwQtEDhrAGVX3uVXGdq6qjwBcdJa
 tlSZ1Vbf7PL9EAoE9jDb3xwVaRtCyLxO3eOFMflY9Yk2+bsM0+je3fHpcN+jyZ1JR1xN
 Ea4MuvXCEOLVWvTF71HeAWC48ooSvw08EZV9ftcxD+97uAI5LmT+SLLo2Qxc8IuOldvn
 ojA49V/YASpyDvYgKB7m/rQtoyYl8sNhWnQ76y3gX0qAoY1f/RxZdbis3MnjtfQrtwDn
 xkyw==
X-Gm-Message-State: AOJu0YzgcrJnH9VuxLkhapXzT2Oyj/fa57eEygb6C5Put8Qs5BD/Ejg+
 kc3vX1TORkpgth9lQezaXlP+LwesEPVRvLIfRkl5uHx46jkCGo/zcoSCBn1g2bsJyVTQPsKdNAM
 Y
X-Gm-Gg: ASbGncscx4Le51d/nOX2iY6orDztD/oJbpDq/T11ZLzjqlIwhT+8GklUntaaMhCeiAZ
 ReBqgb8KpZa8iCkkMi603bbrTdIkjRJ1OEEWPy+YL95O2IP/TF7CLGrUG+FFVPR02gddgNAXMPn
 ksxNhZErlAN/VgexxDnTtaz+XzBWsm18uyGHP2ePjBQrbmVK/ve68rBRB8+J+FiXYdIjbekzB3c
 //RaYc6uL2QFVCu0+N0T6UUFi2uRbn6Kw8MQKtSuSUXmlcvkzzz6llnypJp+X5uToERm0tFFWv5
 P715ap1EN9rzLLjhbOV1YjXUIzc8dNG2gxXCquCYGnHaCLw6v0P/lQ==
X-Google-Smtp-Source: AGHT+IE4lCQtAhsA/Y1TwG8FiqYhgD3PvMVfmiFNB2dnNIY5jXvYoUzP5JFd7JZDuw+mV1DG76ZF1A==
X-Received: by 2002:a5d:5f44:0:b0:38a:864e:29b1 with SMTP id
 ffacd0b85a97d-38a8730ddf8mr19477880f8f.41.1736773405099; 
 Mon, 13 Jan 2025 05:03:25 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38a8e4b80d4sm11812279f8f.85.2025.01.13.05.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Jan 2025 05:03:24 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Antoine Coutant <antoine.coutant@smile.fr>
Date: Mon, 13 Jan 2025 14:03:17 +0100
Message-ID: <20250113130322.3962035-1-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736773405; x=1737378205; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=VLCs+V2umeJ93xnBF0H6a5suuFxCDj/7FTRRCRizxbo=;
 b=I5tDZ4nm54RU8huD1EbiRBOJH7uonT5+ORcNLFc4aY+Wd1KXwzVcfXXf8vrcJC/1NH
 AAfzSDxTLJ7G8MEtwru8EjS6mM5JyTwYUaX7egRqEYzwiCERq7xlrW23a4pHnEJSfw4q
 VfMdhCZYXae8OyNAFoNpFDejHmjY0YrcTTt0k=
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=I5tDZ4nm
Subject: [Buildroot] [PATCH 1/6]
 toolchain/toolchain-external/toolchain-external-arm-arm: fix
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

But it was not updated while updating to to version 13.2-rel1.

Fixes: 0dd599d171df7852ae801173c8212976e50b09e1

[1] eed1670d8a6f0899f5fdfc26bd6d1609ebc19c7a

Cc: Antoine Coutant <antoine.coutant@smile.fr>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 .../toolchain-external/toolchain-external-arm-arm/Config.in     | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
index b110885a96..683854e05e 100644
--- a/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
+++ b/toolchain/toolchain-external/toolchain-external-arm-arm/Config.in
@@ -9,7 +9,7 @@ config BR2_TOOLCHAIN_EXTERNAL_ARM_ARM
 	depends on BR2_ARM_CPU_HAS_NEON
 	depends on BR2_HOSTARCH = "x86_64" || BR2_HOSTARCH = "aarch64"
 	depends on BR2_ARM_EABIHF
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
