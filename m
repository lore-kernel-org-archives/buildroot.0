Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3502BE7719A
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:05:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 81B3280DE3;
	Wed,  8 Jan 2025 23:05:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dgg_yvjpFrbK; Wed,  8 Jan 2025 23:05:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7CAC080DDF
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7CAC080DDF;
	Wed,  8 Jan 2025 23:05:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3EBC97AA
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3AB9580DDF
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ok7_8gkFe806 for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::432; helo=mail-wr1-x432.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org EE04A80DCD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EE04A80DCD
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id EE04A80DCD
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:28 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id
 ffacd0b85a97d-3862d16b4f5so205345f8f.0
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377527; x=1736982327;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IgfGlRNGT0dy+qj/JigKQugtcQXSltdQ2GQ6O7ZIZdI=;
 b=EEGCO+IC1uUiKSOOvFnKQm4ebNqgvDj3x552PCh5E5fjRbbZyVZrP+bMxSlvDf2WRw
 FPcTeBIL6n1k7SLvQHk3exERlhQwq/NRHtSsGMYg+Zu6IxpwdVAlDW6jaknK+sm48oVY
 uYYTyHsizD71IWbkgf1B4xwV4PWm/TZiUjoUPYc0CDmQPsFV9SUTBl+/IxkYd1wGqkJ2
 5u+ZNyLZfrLYQXYvUSa2tIUo0f5QCe543IjIajEs3OeMUhuJAwlEleNIO5VLIRXZD//W
 vTipT/bFSaxE3ymSWA7QFGEzPlEiuMeMW9MQEI2YyEoHU5cFH+AIdiDiMp2JylZTcxCP
 C8tw==
X-Gm-Message-State: AOJu0YwW6gjZ5G6WpqrwW/4U5mTYXI2Xi7p2oxQFFQTao93M4bNp49GA
 8hQ2gSioIk+4q7rZct3npRfUkhRExyikF+Dl/8N1oahK8dwaZQt8zfZdmgbRsLv3C84+E4Qq91+
 N
X-Gm-Gg: ASbGncudXrSnwjGIRY9FETOK809tShLKSilA+NXCQUx/0WBFFimCyfxJwfNJyjT/2B7
 dU03uzmYKAewr2j+AcKNk5cDYV6Gb7TGhbbydrQth7svRbK4wFrUpJq541Ny4dHAFEP1LhLH7r9
 N1ps0mvk5OJWS8AQJU4hi2xmQu/py4Ps7nR2SNwUe0U/vjIHGLU5hr/6WaD7s6JEh6DnhaII4/c
 4tSE+7cn9UFD9rskyKRVApDJR3kwjg49yXtin4f6e5nRSlQAT4WdpmA8pgTjwFOl7rhAdII7U/8
 K7OUr7nvjceRFH34wk8PLlejxZejoSfrSY6zGE9CdtrMeDaZNseflg==
X-Google-Smtp-Source: AGHT+IHuWw4lC5pOQGwme3sE08AsJBDDGo0RJOhNo4OwNOYjdrue8yqSP3DNiBfaSYM+UHEhM9RMuQ==
X-Received: by 2002:a5d:64cb:0:b0:386:3711:ffa9 with SMTP id
 ffacd0b85a97d-38a8b0d327cmr726311f8f.16.1736377526880; 
 Wed, 08 Jan 2025 15:05:26 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:26 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Date: Thu,  9 Jan 2025 00:05:11 +0100
Message-ID: <20250108230521.1345210-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377527; x=1736982327; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=IgfGlRNGT0dy+qj/JigKQugtcQXSltdQ2GQ6O7ZIZdI=;
 b=Xwm3a20olgwOjJmPgSMTgSUT6jSBUXPE4pw9t07MSWGjUbNn+lgNz01wrPZA1rfqrU
 IWLOcTWJO3xM1fMy3LavkRbyrpACII9m6jJXKszAKHSzdvUycyWpSydGb0kU4Ud72qA6
 Hk9+E6WD40l7E80FeF9Wu5nBB7KvJvfK+PTuU=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=Xwm3a20o
Subject: [Buildroot] [PATCH 02/12] support/scripts/gen-bootlin-toolchains:
 remove nios2 toolchain
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

Nios2 will be removed from Buildroot, so Bootlin toolchains will
no longer provide nios2 toolchain in further releases.

Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 support/scripts/gen-bootlin-toolchains | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/support/scripts/gen-bootlin-toolchains b/support/scripts/gen-bootlin-toolchains
index bd1beec995..df16cff5c4 100755
--- a/support/scripts/gen-bootlin-toolchains
+++ b/support/scripts/gen-bootlin-toolchains
@@ -118,10 +118,6 @@ arches = {
         'conditions': ['BR2_mips64el', 'BR2_mips_64r6', 'BR2_MIPS_NABI32', '!BR2_MIPS_SOFT_FLOAT'],
         'prefix': 'mips64el',
     },
-    'nios2': {
-        'conditions': ['BR2_nios2'],
-        'prefix': 'nios2',
-    },
     'openrisc': {
         'conditions': ['BR2_or1k'],
         'prefix': 'or1k',
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
