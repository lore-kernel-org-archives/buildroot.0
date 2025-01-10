Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10660E7719C
	for <buildroot@archiver.kernel.org>; Fri, 10 Jan 2025 19:54:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C44FF60E5D;
	Fri, 10 Jan 2025 19:54:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rU6Agu5WWg-6; Fri, 10 Jan 2025 19:54:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E237260BE3
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E237260BE3;
	Fri, 10 Jan 2025 19:54:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id CD57776C
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AC51E4109B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GE7Jf7pqT99T for <buildroot@buildroot.org>;
 Fri, 10 Jan 2025 19:54:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::32a; helo=mail-wm1-x32a.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7A1B740B5B
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A1B740B5B
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7A1B740B5B
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 19:54:18 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 5b1f17b1804b1-436202dd7f6so28248165e9.0
 for <buildroot@buildroot.org>; Fri, 10 Jan 2025 11:54:18 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736538856; x=1737143656;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6yZEbZooyiQomOeAagGGtas67BYFF4CU9nrnaTJmk8=;
 b=aqoNgfRhwOPaaKxH1oc9W6OyvtNY5CLezLwpJVwwyB/oP3jX/ez4DdFK4iD2mw8ziZ
 BFGbyw2yY5+EMWEkBLeDoUkD1XobPRC8+AQWQERdVrRXNIfvz05O5fpqgVimRTuWjMaD
 4EizWhWMC3XCgi25YSYCZWmvM+bLTjIkhIoBA47C46Hcv1b2yrc70Flr6UjsmfRB2YCR
 KkLrphf0hg+MabpyzKCqqD1DFCvk9508RULcOUtDCssKUK3u/hPKmtYESu7QC4qIzr7P
 yLIfM4Y3R77Wwi8uqtYfvRnP1nPC/Vr+27lREUgI5cEO5ZRThzl3c+4R1sPCTzY3venQ
 ob2g==
X-Gm-Message-State: AOJu0Yxfy8CdleQQvJDLs2XuahoMIy9Glm9X7bYYnF92RP9dTS8sOUHQ
 V+OeU2C2y+tLNVE38Ss0JiWA//Ce1vrzK5QMMe+ghF055bajMA8sRwyexRNKAZoTmFOUUEBjdWB
 m
X-Gm-Gg: ASbGncu79HmZHDhXVMJcGErTESgY6yIxD9+l5CNXLsyc0XCDPe5uOtrNBrk0ZIL1Etl
 rH3zyVs1Qn+A/53FPOuDa4Ww16g1tJvljL9UJTNQpzpVRlKCFEGJUCZMOOfvV1gwiJNPzBDqgR1
 Zy5gaxeEmphRACHlXgSTKFvrV9kFJrX5KfDkOsSa+lBTJjV4GAzUNAUeuqVKY4BHy4QuyJdQSfP
 kYk7dWOsqu+wh0pYRnqb+EtX5Cqc4iHa5xBxji8dUDOnd2a7cmoHyORvws0dqkZfm9gWhxPYS1p
 vru8cEndYwCILhH/6TcRB6qGUQVxrjm01NEEKne8jeWQfJIamq8aBw==
X-Google-Smtp-Source: AGHT+IH9R+BFUpZONIsqODGaMCcErO+Sl/UC+4EpzWyrM2Z2A6MeGcjjmLDKiX7FZFdnWM+Hh3ai7g==
X-Received: by 2002:a05:600c:1d0c:b0:434:ff25:19a0 with SMTP id
 5b1f17b1804b1-436e2706f7emr98172365e9.21.1736538856336; 
 Fri, 10 Jan 2025 11:54:16 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e2da66fcsm96439635e9.6.2025.01.10.11.54.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Jan 2025 11:54:16 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Fri, 10 Jan 2025 20:53:58 +0100
Message-ID: <20250110195359.3358022-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250110195359.3358022-1-romain.naour@smile.fr>
References: <20250110195359.3358022-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736538856; x=1737143656; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6yZEbZooyiQomOeAagGGtas67BYFF4CU9nrnaTJmk8=;
 b=yX0ZDI0DQjceka+2YCuDf3nRZcs2xrVhl5yRq5bvhYfFsx7uPB/FhWNrmiMIqoIfBk
 I6iiyRFtfVubBFgi9JcmSLZzj4ILSe0c8NHFY2FNHmvAfeuP5lGF/NRmKGx5iUKlf5gx
 AYkJX3qUFlnsnRNBDSIP437phVPiL738ACvgE=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=yX0ZDI0D
Subject: [Buildroot] [PATCH v2 11/12] toolchain: remove remaining BR2_nios2
 from toolchain bugs
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
 toolchain/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/toolchain/Config.in b/toolchain/Config.in
index 86ab3710a0..d6ed25ff96 100644
--- a/toolchain/Config.in
+++ b/toolchain/Config.in
@@ -89,7 +89,6 @@ config BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 config BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	bool
 	default y
-	depends on !BR2_nios2
 	depends on !BR2_ARM_CPU_ARMV4
 	depends on !BR2_ARM_CPU_ARMV5
 	depends on !BR2_sparc_v8
@@ -221,7 +220,6 @@ config BR2_TOOLCHAIN_HAS_GCC_BUG_107728
 	bool
 	default y if BR2_microblazebe || BR2_microblazeel \
 		|| BR2_mips || BR2_mipsel \
-		|| BR2_nios2 \
 		|| BR2_or1k \
 		|| BR2_sh
 	depends on BR2_TOOLCHAIN_USES_GLIBC
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
