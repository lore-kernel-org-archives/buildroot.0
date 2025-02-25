Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 408E8C021B2
	for <buildroot@archiver.kernel.org>; Tue, 25 Feb 2025 18:03:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05FF608A0;
	Tue, 25 Feb 2025 18:03:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id v9TIHdygMMid; Tue, 25 Feb 2025 18:03:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D5CEF6078D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id D5CEF6078D;
	Tue, 25 Feb 2025 18:03:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 378F12292
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 18:03:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1C1706078D
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 18:03:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yIxWn1x3i_vB for <buildroot@buildroot.org>;
 Tue, 25 Feb 2025 18:03:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42b; helo=mail-wr1-x42b.google.com;
 envelope-from=yann.morin.1998@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E2589605E1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E2589605E1
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com
 [IPv6:2a00:1450:4864:20::42b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E2589605E1
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 18:03:21 +0000 (UTC)
Received: by mail-wr1-x42b.google.com with SMTP id
 ffacd0b85a97d-38f3ee8a119so2947341f8f.0
 for <buildroot@buildroot.org>; Tue, 25 Feb 2025 10:03:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740506600; x=1741111400;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=43/cd+R0aizTy5trB3Ifov3GiEqXUNHRSx6UDoEOW30=;
 b=dyR2p4SsDlw1FmSXKWB4sfMfBAT3kvyhoqa4IvPlag8GI+0ySpYeyPnXqrDexlqrsP
 j8+Npl0dg/G4ZmOcbcBRsGzboXYGWl2CBrYm6diHLiMj1YwA5+RIes+G5/cDvPRPeudX
 /JxDLcxBuIT+KA0V8KR+kA8bN0+9mJlmH9SW8hjLbCZWeTcpEtP5y4znzwQq6GtY1L92
 BqOwEWM+CZxKMoY/dkfk5rX0mcHR6gRpxn1eCVKClge9OQUtY/M/mDsZH5b4cCj65pMB
 snf60nvMuk9FifC8oiX9Jpc4hgP+QEI2OUMsT+pDmBpmm2h205z0Qji1sIvi1Q/ACw28
 ZVFQ==
X-Gm-Message-State: AOJu0YyE0W2hCQX6qsTdBjTKYpfGWG36uWCSZYYJBTI3Jo8HcK/KgYQE
 7oitPJQzNNhEirtnHS7n3jQ2e4XAdnVUZ0ME37fnbE0+xFcrznW5iCWYHw==
X-Gm-Gg: ASbGncvk8ZqKcFI3Fy9gIBbVC4TagxNS10RhgBZwdRlKdZBffLGe2f/MOcoxcMDJ3jS
 I1pX1V2E5aNmlJVdAFo+SEyWxRAjLotDktYTHnyNNDLSADZxNn16nljf/LLN05X6DGnL0Jf3YWF
 L5VOC0Ks7I0sWx3c+2uz1WTDtucqMDYjP1ydGRgrHRr6dFprswTfnV4wl1AXmaz4Er6utScG2Hf
 c+PY/CnE2oy2w/1wZzOlh2cYABuxR1GtpLSpNp0eTryic/MjtgVrS8K0whhq9KLsJCJEH59EllO
 nEPdnE7s0n4/78iGiCJAhwR61c7mR6FjggDJ
X-Google-Smtp-Source: AGHT+IHEvzuZ2xB41kED185IHcUBy4XTZ7LwocRhiKni3opRJjDzuBqz1FhlJcaWp/Du972+fUCb3g==
X-Received: by 2002:a5d:6dae:0:b0:38d:d946:db15 with SMTP id
 ffacd0b85a97d-38f70773086mr14120345f8f.5.1740506599431; 
 Tue, 25 Feb 2025 10:03:19 -0800 (PST)
Received: from landeda.home ([2a01:cb19:93aa:5000:c0e7:5e2f:eef4:db82])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-390cd8fcd03sm3125423f8f.99.2025.02.25.10.03.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Feb 2025 10:03:18 -0800 (PST)
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>,
	Julien Olivain <ju.o@free.fr>
Date: Tue, 25 Feb 2025 19:03:18 +0100
Message-ID: <20250225180318.1885826-1-yann.morin.1998@free.fr>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1740506600; x=1741111400; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
 bh=43/cd+R0aizTy5trB3Ifov3GiEqXUNHRSx6UDoEOW30=;
 b=LP8p6uJOl/ah0e476+x8V3KhtMeqkZomLLFZ0GtFsBegDCJ4KrkIbEcHdWYpKSFd4T
 NUhfKaErtFgWXM1iSevoJU1abNuh3ePlodE+wMM6PmJ4Qx3DpO3u4vapu3oBD2psnTYJ
 8YT+6N5Gw1KrS0N75QrgK5cBtlIDnxQzNsi8pB7R5AoVeA07y8e6MVL9B1DzpTSZ6aeu
 MlyU9rHNxcmGRGGlQf/nei2RtyF9oYDXqPPHqDDKn0Je/4nTXjftjpq0piqdooDqKXFp
 zHXO0lIyg4maJVcv+VbUEtRkcUsEkc1OidevH/4TutAirKBEZL18Uf1Je2LiMzPwARBD
 +qMQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=fail (p=none dis=none)
 header.from=free.fr
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=LP8p6uJO
Subject: [Buildroot] [PATCH] package/mokutil: fix dependencies of comment
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Since the package was introduced in 2e6e121496bf (package/mokutil: new
package), the dependencies for the comment about missing dependencies
are not all inverted compared to the actual dependencies.

Notably, gcc and headers versions should be negative, not positive,
dependencies. This makes the comment visible even when said dependencies
are met.

Fix that.

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Julien Olivain <ju.o@free.fr>
---
 package/mokutil/Config.in | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/mokutil/Config.in b/package/mokutil/Config.in
index 8895b66d20..33208ac583 100644
--- a/package/mokutil/Config.in
+++ b/package/mokutil/Config.in
@@ -30,6 +30,6 @@ comment "mokutil needs a toolchain w/ dynamic library, threads, gcc >= 4.9, head
 	depends on BR2_PACKAGE_SHIM_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_STATIC_LIBS || \
-		BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
+		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_12
-- 
2.47.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
