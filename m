Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FE94C3064D
	for <buildroot@archiver.kernel.org>; Thu, 27 Jun 2024 07:55:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9C40040114;
	Thu, 27 Jun 2024 07:55:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vOPgyReznm2l; Thu, 27 Jun 2024 07:55:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org B2E1641A5F
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id B2E1641A5F;
	Thu, 27 Jun 2024 07:55:04 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C82A61BF3D8
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 384FB40120
 for <buildroot@lists.busybox.net>; Thu, 27 Jun 2024 07:54:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SzBIDiqOHLR4 for <buildroot@lists.busybox.net>;
 Thu, 27 Jun 2024 07:54:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::330; helo=mail-wm1-x330.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 859FD400A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 859FD400A4
Received: from mail-wm1-x330.google.com (mail-wm1-x330.google.com
 [IPv6:2a00:1450:4864:20::330])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 859FD400A4
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 07:54:47 +0000 (UTC)
Received: by mail-wm1-x330.google.com with SMTP id
 5b1f17b1804b1-4256742f67fso506885e9.3
 for <buildroot@buildroot.org>; Thu, 27 Jun 2024 00:54:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719474885; x=1720079685;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ytjmA8QaTrbSevgrmYI+J1m3OMjmlQSCocDUa5BDeb0=;
 b=TsAhuG64oiP3glnLEQHzKYQc5hGnTP5e4KWfgt+G6r8aid45B1u9g3/lWMGYKoqtEx
 1TThxVjUSNPZjMAkA9+MdClETLKSC1CRQZBuVMHBziq4hNzpoy0axSFiqwCIgzXyx5qg
 gx05PRuPoyyRp72hthuJ2mCSPSRFYb/JFRQMxZ3uUNoJt8puqmQ5Romeila0qaIBFc8E
 TS2LJYwbxFrRExtL/kfrgfzv0EwpgF0+wV0T178Fnae9mpqMGjTpizv6rltLy/pvJdR3
 F+ELmOULMzSgYonHIQvEXa/lXCfuM5uQZAtO/Kfey7RO2tkD54gzJwNpRgwixoS6NNsK
 3LlQ==
X-Gm-Message-State: AOJu0YzdBZuq51tE2Mcrx4RC/UZ7Z31aj7tGCFM/3pDEXTMlY5h7Sysn
 07+4dBY7NWptqUwyJZ7Eq2th3ykeeK416gFUoBTaKtDgxKxetXfG1TXbDoV//6k+sX4qEFtRwSL
 Q
X-Google-Smtp-Source: AGHT+IEqQal9yZURzzjvjbjRwFqbbJtfGYEDS/4GYOcYEmsWLj+lmfdXzGSGABlf63SBbO18haCb7Q==
X-Received: by 2002:a05:600c:2e87:b0:425:5e8b:af9a with SMTP id
 5b1f17b1804b1-4255e8bb07fmr28942555e9.36.1719474885305; 
 Thu, 27 Jun 2024 00:54:45 -0700 (PDT)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-3674369ee67sm991923f8f.110.2024.06.27.00.54.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jun 2024 00:54:45 -0700 (PDT)
To: buildroot@buildroot.org
Date: Thu, 27 Jun 2024 09:54:36 +0200
Message-ID: <20240627075441.4116645-2-romain.naour@smile.fr>
X-Mailer: git-send-email 2.45.0
In-Reply-To: <20240627075441.4116645-1-romain.naour@smile.fr>
References: <20240627075441.4116645-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1719474885; x=1720079685; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ytjmA8QaTrbSevgrmYI+J1m3OMjmlQSCocDUa5BDeb0=;
 b=xaI9DBNI5o0I8sOvlGoVJs/l/kXgk8QaqHxqSOqlYshrOnlbNBRtaZcDZxNqO+D7MT
 iNz2oeSLGAPffBhUV1b6TlBGESdlE59y+FJkhzeY1Y2DLJO1h3tinnqVKq4wVIka9PY2
 jMyF8XupM3Pz5tJszki9Qc8XA0qtry7hhro1Y=
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (1024-bit key,
 unprotected) header.d=smile.fr header.i=@smile.fr header.a=rsa-sha256
 header.s=google header.b=xaI9DBNI
Subject: [Buildroot] [PATCH 1/6] package/ima-evm-utils: update url to github
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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
Cc: Romain Naour <romain.naour@smile.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The project moved from Mimi Zohar personal github account to
https://github.com/linux-integrity/ima-evm-utils.

Signed-off-by: Romain Naour <romain.naour@smile.fr>
---
 package/ima-evm-utils/ima-evm-utils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/ima-evm-utils/ima-evm-utils.mk b/package/ima-evm-utils/ima-evm-utils.mk
index b969b4709e..a7d70bc1bb 100644
--- a/package/ima-evm-utils/ima-evm-utils.mk
+++ b/package/ima-evm-utils/ima-evm-utils.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 IMA_EVM_UTILS_VERSION = 1.5
-IMA_EVM_UTILS_SITE = https://github.com/mimizohar/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
+IMA_EVM_UTILS_SITE = https://github.com/linux-integrity/ima-evm-utils/releases/download/v$(IMA_EVM_UTILS_VERSION)
 IMA_EVM_UTILS_LICENSE = GPL-2.0
 IMA_EVM_UTILS_LICENSE_FILES = COPYING
 IMA_EVM_UTILS_INSTALL_STAGING = YES
-- 
2.45.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
