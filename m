Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14A2DE77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D1AB180F9E;
	Wed,  8 Jan 2025 23:06:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id mPKbBtpFp8ip; Wed,  8 Jan 2025 23:06:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D172F80E2D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D172F80E2D;
	Wed,  8 Jan 2025 23:06:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 7E5F91FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B313A4026A
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DyiKSwZAH9gG for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9E6B4059F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9E6B4059F
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9E6B4059F
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436ce2ab251so2900485e9.1
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377532; x=1736982332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uMKFLhyrFUBqoji0JfgkhrGupRt9asW7wO4AM62cLzA=;
 b=sEanH+DLnIGekzQtDTgt+4f3AWHig0vwZj3tzqXPxPU8kDBxIfC7OpsSBIlch6fcVX
 uG5l+DBJMUxvoCIy0tLk1evPBGgQULmRefW0y+vPnOqmAvZ0Bnrw9kCAr1GEVR7+nlBt
 /DvRjUmNoCy0xlCZvwi8/0oaXabB6+gNxNN6gaUql8sEvnpdSLPXpjimabc6arqkqgqE
 yuCw+qvbOCalM07B2lrQF5UwtfnegcmLN9c9BqGuJiKwQLPL9XR6ivtepyxSs4eqY8jv
 sP1NCgwBfZ69V7NIRphakcR3Kv6UJ1+ZEfejVckDVm7TW7xVTG0QRpXynW7rkDZa/g1C
 I+rA==
X-Gm-Message-State: AOJu0Yy5f+3MBtxOCQmqbJiWT9/rWJtRPNtOFI3XYEqEJkb5nyNdrukV
 fQH6peAfZ3SYcPUuxuIbXq3kiRSUQvjl1XnflPjWWs2ehQDUGe7ZhJVAgaOtRxR1ngB8Yrh1vzP
 f
X-Gm-Gg: ASbGncuXkiPBOxbmOORi0E/MGMK3Zue212S1yaom4huSIwn8ll7ujpSr+JzMyADgquC
 sa9CCSqjHWJsecfcCOOKrHfHCkshlPUzGcOvIrit+SrmQYtYWrQatnUkjcaj3LDEjnx1s1SScuU
 GdjbEMIFuD5JM1bllTcm2tk3XRsEOH/bnH7KSp+X4zEFrK3lNAykG7SkwDMR+g+2uR8HUCy1EO8
 iUAMomru3oWNOXDcpGdVC1q0rvRAO/wFnTNvviuEEnc6XgtSyB7EnYyfKq3Xq416dhhKVPPQqmW
 hC+HBQmit/PT6pH2bNhSQgmSO7cvseglw1vo+YTb8ciJD1cBdiIONQ==
X-Google-Smtp-Source: AGHT+IF7ZF9d1nw5poBk6fy9YmA18IRCfzCpaz9tWsBN/0+yc2A+UnIzi5X/sYiTKvJbE6nXDivz7g==
X-Received: by 2002:a05:600c:3505:b0:434:a7b6:10e9 with SMTP id
 5b1f17b1804b1-436e26a9045mr43024385e9.17.1736377530598; 
 Wed, 08 Jan 2025 15:05:30 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:30 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:17 +0100
Message-ID: <20250108230521.1345210-8-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377532; x=1736982332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=uMKFLhyrFUBqoji0JfgkhrGupRt9asW7wO4AM62cLzA=;
 b=sUXjUXI26pXk6z/wampD+V03rk8+9dlqr3AMG/MUfJgPIbxDwWDKCiLYLjTYObrmSL
 Wo+ZL4hO7DEk7Zxob2thQl4OmgcHtqNmJiR2BtNoZXQ6NZb/WN4hylorX0C8giGAwL7G
 Q2zbE4+he/B3uRpWpWxKeAz95hXaUG+wpp/6o=
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=sUXjUXI2
Subject: [Buildroot] [PATCH 08/12] linux: remove BR2_nios2 symbol
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
 linux/Config.in | 2 --
 1 file changed, 2 deletions(-)

diff --git a/linux/Config.in b/linux/Config.in
index 98db89f8ab..943fd77f27 100644
--- a/linux/Config.in
+++ b/linux/Config.in
@@ -33,8 +33,6 @@ config BR2_LINUX_KERNEL_LATEST_VERSION
 	# mips always generates an ITB image
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
 	select BR2_PACKAGE_HOST_UBOOT_TOOLS_FIT_SUPPORT if BR2_mips || BR2_mipsel || BR2_mips64 || BR2_mips64el
-	# nios2 always generates a U-Boot image
-	select BR2_PACKAGE_HOST_UBOOT_TOOLS if BR2_nios2
 
 config BR2_LINUX_KERNEL_LATEST_CIP_VERSION
 	bool "Latest CIP SLTS version (5.10.162-cip24)"
-- 
2.47.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
