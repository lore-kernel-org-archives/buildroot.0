Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C48A2F8FA90
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 16:26:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8AA434203C;
	Tue, 21 Apr 2026 16:26:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8HgtRknFQfLe; Tue, 21 Apr 2026 16:26:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AE7BB4203E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776788799;
	bh=3Sn3A9a/v0g8VvJJmqORnMHgqaV5X6NN9tb17i/z7Ng=;
	h=To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From:Reply-To:From;
	b=kvdxJul8zi3BCLOvNcj4d85UM3Wa4njdpGuABmRAL5j05gau2vVoUBie7/gULr4IW
	 wE0yncx8C+LNTLbAdfd0eu4Paj9JN/9bDMgHVuBphy30XjV9TBXEcMx2SD94R5+PGs
	 B0B/Jcpi+H7tKbmNikCUx6qqYNdhKvn0XcyMCURqqWbdqOwDIJCuDOViHk3qjZ6Oby
	 ygEsvjj+PJvqdCPm30Y/9gMt0KfYP1/wjR8oQt6Mvwyr6P4eKv+e4aNu64qVq9PUrl
	 0wXHVEguVEzvg8LJkV2kwC0XBcdddMfDoaP72UGXHmNM63f3BRUYgisNJxMRo/QIY9
	 C6pO8efVnFLxw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AE7BB4203E;
	Tue, 21 Apr 2026 16:26:39 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 8FF27259
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 16:26:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 75C0083F82
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 16:26:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Hs77NLWrdwuJ for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 16:26:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::334; helo=mail-wm1-x334.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4549383F74
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4549383F74
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4549383F74
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 16:26:36 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 5b1f17b1804b1-488a8ca4aadso60582205e9.3
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 09:26:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1776788795; x=1777393595;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RCa9a4sBgAw4KOtvGNUOpgQUi17EEef84SejZsjMEoM=;
 b=A6Yq3ZkaBjFXv8wPYKiTINl4J3Ln2yRjH9ub8ArvVB/gHqmoJr5fphDQFbAq0DGrX2
 ZYfaolaLw6k5JULVj36OIvsPFf1pgDfyuz1MXoepdMMFpc9K0JyKzKYL/Kl+gjUR2plh
 kqbDENOj94bJDr4+aJc7ALK8PpEPk2OnD+5DL0C3YUlPACkoCCegAdv3YytdhWcoYcwb
 yjplY8q3FyBRE+/X9OKX/dZwvF1cuQBNzNKF8wteGlSnS50JC4C0xDuYMKha7ESmFnXl
 DOwPPyjgVeLDMuowvvtWQ9UbtjnnbCZL157ZfkXk9ZVDHxMveWe5RXwIs+MVPQhJLlEP
 bKPQ==
X-Gm-Message-State: AOJu0YxtOafEIq1m6EqUEvbFUGieQsUIbOrrylMO4U3AxDE0bo5cejVK
 /9c6GRl6IIbXgsTMa8ULdX8p+bc7lf6bNvr2oHRkkqgKVcAbABQ1Y+VCpfozXaBA/IRe4YliidT
 dxXYYV3o=
X-Gm-Gg: AeBDietmFfjqiOAVJGab5vRr09p+WKeBrekGwGMqYmvwYB+JM8bO9XddR6S35l6y5is
 nnJO0ss3wNaUS9OKg2cLb30O9GmQeyptNAhQp5NNZi71hr0XrK9cuzh37P76JeiVx2q53U7aYel
 XupqpLHrsARfRLcCJKLSMb1H+Pucmwu3cqqI/vOt9KgDNbCJESkAh6qhwX0j3TJnS4s8M3QdCc4
 Op9P+DEx9uMdTiOuMGDkuvS7hWdKWvOwE1tGY54zhq6NS647uDW2TmFOfY7suiNjBuNeKTr6oIa
 mkO5TbOuIvzpDHlBj20DF8HV+xKSyZzK8RRAieBj/G+AzdaUkPP8haQD6dZXjkNf3fRvkm5+4RB
 6Zy3Gn4WcsECmTkNd/j1ZFCODVJ5E1aZZsFcIM5ap6IH9T0iz8yw50vvU+hdJ++GuD4biCRBeJK
 qLb1fcniWjR2LnkSJLNWrIawx/9qBNBJPhxXj3Pd45HDA=
X-Received: by 2002:a05:600d:8408:b0:485:46fd:7887 with SMTP id
 5b1f17b1804b1-488fb74c61fmr208836845e9.13.1776788794655; 
 Tue, 21 Apr 2026 09:26:34 -0700 (PDT)
Received: from dragon.home ([109.136.97.112]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-488fb75ab25sm119151385e9.11.2026.04.21.09.26.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Apr 2026 09:26:34 -0700 (PDT)
To: buildroot@buildroot.org
Cc: Giulio Benetti <giulio.benetti@benettiengineering.com>,
 thomas.perale@mind.be
Date: Tue, 21 Apr 2026 18:26:17 +0200
Message-ID: <20260421162617.2830354-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1776788795; x=1777393595; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=RCa9a4sBgAw4KOtvGNUOpgQUi17EEef84SejZsjMEoM=;
 b=USGayXzHmQAAJBYz5qPA1p6IlwGP73gVwLG7X2GkTK9zIoBBrFu7lnp1W50JcO1KdA
 qbqOOM9ijRq0STZ+aouw+ql+MpLU8UUUN4DFneInBwQttHgaGmGOxaaAd/10sreYFxHh
 Hnkm5ng69TsrSPlz+YduXobMF8X9RYY9QpJms2p1E2wNh9Ft4x03M2ur7dz1J/esJ5DM
 DfksD1/x4PvO5MWxtjlCrBg8UsIR3aMZQep5AyLpuBCIEEpw2kBKN6G4h38krl0anPIt
 9krE7AqaW6/2ZmpwsnrPpKe4zaoxV+INxquYTtRr9e/rKic1oaAWq/UDvK/PN8t5hB9R
 YlwQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=USGayXzH
Subject: [Buildroot] [PATCH for 2025.02.x] package/dash: add patch for
 CVE-2026-31323
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
From: Titouan Christophe via buildroot <buildroot@buildroot.org>
Reply-To: Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The vulnerability description is not disclosed yet.

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/dash/0002-fix-CVE-2026-31323.patch | 42 ++++++++++++++++++++++
 package/dash/dash.mk                       |  3 ++
 2 files changed, 45 insertions(+)
 create mode 100644 package/dash/0002-fix-CVE-2026-31323.patch

diff --git a/package/dash/0002-fix-CVE-2026-31323.patch b/package/dash/0002-fix-CVE-2026-31323.patch
new file mode 100644
index 0000000000..5c92119db5
--- /dev/null
+++ b/package/dash/0002-fix-CVE-2026-31323.patch
@@ -0,0 +1,42 @@
+From 0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3 Mon Sep 17 00:00:00 2001
+From: Muchen Hou <996029583@qq.com>
+Date: Mon, 13 Apr 2026 10:28:29 +0800
+Subject: arith: Fix CVE-2026-31323 INTMAX_MIN / -1 overflow
+
+Division and remainder currently guard against division by zero, but not
+against the signed overflow case INTMAX_MIN / -1. On affected systems
+this can trigger SIGFPE during arithmetic expansion.
+
+Add an explicit guard before evaluating division or remainder.
+
+Signed-off-by: Muchen Hou <996029583@qq.com>
+
+Merge the overflow check with the zero division check.
+
+Signed-off-by: Herbert Xu <herbert@gondor.apana.org.au>
+
+CVE: CVE-2026-31323
+Upstream: https://git.kernel.org/pub/scm/utils/dash/dash.git/commit/?h=601bc50bfc2858ab7a9ec327fe4e33a9c4877759&id=0034bfe185d3d875cebace8cb3ca5c9dabf9e0f3
+Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
+---
+ src/arith_yacc.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/src/arith_yacc.c b/src/arith_yacc.c
+index 1a087c3..b978ef0 100644
+--- a/src/arith_yacc.c
++++ b/src/arith_yacc.c
+@@ -98,8 +98,8 @@ static intmax_t do_binop(int op, intmax_t a, intmax_t b)
+ 	default:
+ 	case ARITH_REM:
+ 	case ARITH_DIV:
+-		if (!b)
+-			yyerror("division by zero");
++		if (!b || (a == INTMAX_MIN && b == -1))
++			yyerror("division error");
+ 		return op == ARITH_REM ? a % b : a / b;
+ 	case ARITH_MUL:
+ 		return a * b;
+-- 
+cgit 1.3-korg
+
diff --git a/package/dash/dash.mk b/package/dash/dash.mk
index 0993cb99a6..a5455d8ea9 100644
--- a/package/dash/dash.mk
+++ b/package/dash/dash.mk
@@ -13,6 +13,9 @@ DASH_AUTORECONF = YES
 
 DASH_CPE_ID_VENDOR = dash
 
+# 0002-fix-CVE-2026-31323.patch
+DASH_IGNORE_CVES += CVE-2026-31323
+
 # dash does not build in parallel
 DASH_MAKE = $(MAKE1)
 
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
