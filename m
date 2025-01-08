Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BC38E77188
	for <buildroot@archiver.kernel.org>; Wed,  8 Jan 2025 23:06:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id DD73C80F7B;
	Wed,  8 Jan 2025 23:06:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Z70ZWlmgblAL; Wed,  8 Jan 2025 23:06:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2A3A08100F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2A3A08100F;
	Wed,  8 Jan 2025 23:06:05 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id CCEA21FF7
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BA17B80DE1
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VIQtfqhnh_Pz for <buildroot@buildroot.org>;
 Wed,  8 Jan 2025 23:05:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=romain.naour@smile.fr; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 00F5180DD5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 00F5180DD5
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 00F5180DD5
 for <buildroot@buildroot.org>; Wed,  8 Jan 2025 23:05:33 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-436a39e4891so2731865e9.1
 for <buildroot@buildroot.org>; Wed, 08 Jan 2025 15:05:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736377532; x=1736982332;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v6yZEbZooyiQomOeAagGGtas67BYFF4CU9nrnaTJmk8=;
 b=msSBRbzDTlSTNwlovPkNI+UklENIDJDhNPrRrFrZYOrHL2pJ8tn6Pc6LJLoC9lpD3m
 BLLDS/3gflnQ5lf2rZ+Nf1eJYLeCZccRUAUD7AGMavFn/as1bWwC3Il8cKjvvn9zMoao
 5P0CEfJdeSetE6uRIVTHKKs3LcZUSa5eOnCCPFYWBJSZo02hzuByVxCt1P2N8qPgY09n
 tIVJ0fcs7DTrn5/NnGPXKjZDp9a3Z86epOXl0DJxG2NIQRielyjZ1fz2Ga1Wz9Vd+NOr
 2FfyNwaMIDMeX2NljlVBtKYpgyH9eBvuEPCcBMOlwsICsSVohOpnBB2YsDNq57iLwJHh
 LaWg==
X-Gm-Message-State: AOJu0YzNJjHkYgoWeIicYpYiTxxG5oUuc9eYTZp9wjGuXVpw1Wo3+JTa
 25qVuazaD+IGYyscl6PEhxcJqUPFSdVFHJ2z1XNTZu7JLNWT6kjBEAiB0UCc4+Xd+KvNR8V4vc4
 3
X-Gm-Gg: ASbGncv7s/Zw3CGz0l58PDV4fPyIQ+HFNcSZ/Vnj0UKsGWL6sXMqNhBNWNw5g5mnpJB
 eFEe4qUe35ydbZhrUbciHRF0lNEBgqH7VhI9X7INHs8++zgHSocCR1omXL9md0f0Ecgh1yyiTiF
 v7XIsrd8oEe0wjOfWy1SnebIbR06Xvydt9ohCQRnY06Ai4YNNLAjANeQGgZG1gJV3AXaq/nBKgx
 Zxl18VWPgOUxnBhxn9pLmNbkOWYUYb2yKTqY0k5ht6U2w1+v3eZfFmCIxZ/o06ZuHvzadAPWIYm
 ylUoXFwzEy9JOVhWjoXLTC0expppKyaon/OplqiEM34Lug4KrUS0JA==
X-Google-Smtp-Source: AGHT+IFidJwUaP3hTLE+jq8EBzafXOIXgNhPj8dfplfnAGaKJmaP1XrAizb3K38IRg07E0djdYrHOg==
X-Received: by 2002:a05:600c:3c97:b0:436:840b:261c with SMTP id
 5b1f17b1804b1-436e26ab54fmr38580665e9.19.1736377532134; 
 Wed, 08 Jan 2025 15:05:32 -0800 (PST)
Received: from P-NTS-Evian.home
 (2a01cb05949d5800e3ef2d7a4131071f.ipv6.abo.wanadoo.fr.
 [2a01:cb05:949d:5800:e3ef:2d7a:4131:71f])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-436e9e03ffcsm1059745e9.20.2025.01.08.15.05.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jan 2025 15:05:31 -0800 (PST)
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@smile.fr>
Date: Thu,  9 Jan 2025 00:05:20 +0100
Message-ID: <20250108230521.1345210-11-romain.naour@smile.fr>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250108230521.1345210-1-romain.naour@smile.fr>
References: <20250108230521.1345210-1-romain.naour@smile.fr>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=smile.fr; s=google; t=1736377532; x=1736982332; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v6yZEbZooyiQomOeAagGGtas67BYFF4CU9nrnaTJmk8=;
 b=ZeEdhMag+DdxzMKsOZsb/Sh37mreO0yQk/VfnHFmPPXlnPHEgp0PnbLm5wtkM26R3C
 U0+fUvKDlN+qN1r06q6lvEeU+HC4vKiWp6sar7ctqszUu8/rsjzF6gLTJuTt17mg9vcL
 0zsf3r0x1HwUNZRwaJbSHax+AwdHZE25MF3Bg=
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=smile.fr
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (1024-bit key) header.d=smile.fr header.i=@smile.fr
 header.a=rsa-sha256 header.s=google header.b=ZeEdhMag
Subject: [Buildroot] [PATCH 11/12] toolchain: remove remaining BR2_nios2
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
