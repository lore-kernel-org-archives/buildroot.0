Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A585E99049
	for <buildroot@archiver.kernel.org>; Fri, 10 Apr 2026 07:28:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CB7E960839;
	Fri, 10 Apr 2026 07:28:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DNTs_OUIJX9X; Fri, 10 Apr 2026 07:28:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E77C960880
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1775806107;
	bh=dwfel2tNCTHt3/6P5zgzOeiPaA5ux5hGOmtYrgGKlfo=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=L7tmlLpgmELOAf5jPiyrndLOni5m6W//03ONCO2pFZdcj1mBT7X1wMSpbBjfqJ+hX
	 0Cpk4IT9v9cPTn8Bk5dWJKT0xATWPnRjO8DJBp8Bl/Esjlu8gdS6lNxAnw/FyETn03
	 bwaWnkrOHxQatOpnJ4GO5/t1V4mXLHqEUGZ+uofjWjfuTtznxiF9d/iuMxyFrCL7nf
	 0G7wU1Z3RWsXoczwSh4Z/XYGjzmMJjQ/S2Z71OYWFW7mqKsD2pe/x9y4QRHIRVtrtk
	 sELiypT9zAGHy9b7Kk5u7sQsZCDmuAQpKSrZhCBSnSh9zP2aN95e0qV8kaLAQMXFgP
	 gM03uHWuZfRgA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id E77C960880;
	Fri, 10 Apr 2026 07:28:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id C2F6D237
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:28:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A90E781D02
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:28:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id AxmuI5Cbq8Ds for <buildroot@buildroot.org>;
 Fri, 10 Apr 2026 07:28:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=titouan.christophe@essensium.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A71EC81754
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A71EC81754
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A71EC81754
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 07:28:23 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-43d02a71526so1000470f8f.3
 for <buildroot@buildroot.org>; Fri, 10 Apr 2026 00:28:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20251104; t=1775806102; x=1776410902;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c1Wjm/ddfcp0Hqb7aptCWwmjFh3tpH2O1jkqcjyugTU=;
 b=EcntKCbZul/Pm6WG0Fo/vwFvCGfN+vzZ0OhCLPkOOUPFoyR3OtQG2QJZeOc6m5GQYe
 JQDbyut/hxqCzM7gsiZW+cY8wcyAnWJrGK/LeZ5EhbesuE+E0sMU5iN23pQFwd8BF7t2
 en9eklkcEUMb064pp2j/BiF9oZ7+bzdRueYldYF7zuwhSmk8m8VAai+wnvaH2D3rq4s+
 nEB/lrR02/Dp++5KtV8g/jo9MIQHGhtLiVWW8YdtSKVPfbjnmlux/Nruu7bA9mbolJRS
 wOh7sg2wZNN//7s9Dbsq1IPWO4BLDWrXHqIVBmYg9ca9uCa2TN63ihfkQu19aeRSK3jy
 Sycw==
X-Gm-Message-State: AOJu0YyZfR/faP+EwrRhU0xZIfD09nJKdKO9i2Xeo9dc9WOIH6q5pgjM
 oEVDjvdwyN/KY3RXD1hJOqz+dIZBTCZq1qpZwi+iEI9HdWPc1eeo34CEdugtgHrx0DMuxl7q8mq
 UAq9n
X-Gm-Gg: AeBDievISD+ay2nLghNsR6NrZIgCQ9xdvQW6BVVNuKY9jnghZqadD+ZkFMl4vukSIeD
 Fd+kkfFFLeL8Ghnl1TmhL8EbQVPYcnzgJnKPalmj1lS/Z/CHNWQ+rdTH0HZso0vHvjlD244Xseq
 Ym5IV/BbPEO044e5DsnExGSVRSUWMNrydSFvw6WPUfwcXQVx0Vh0QWK8081FsKScDHKKx+a451+
 SJA/GTY/d7H3F/JZYsfKnUWNSntq333/mffrbYyU63MOxQZ8COdfdSKffJwsFHvHSLoIGDOCRyK
 PI2vEESDMx2V05Hjajoqy6/Tc62EPGG2ReYiPxlREmalFBxktDkscCTzWJDBHIbgmhO8/47d/dJ
 E81gfJ42JqFiYpqStWp7U/IMkD6ADRYJK3jN5oQr+2s5yk/kSe+rQcCNEv0HyZp7Jt3Kr2sYjlp
 l2yhA14S4ty1q3ok1cXXXF3nkhBT8Fr8gxoh+Kz3WsSpfmGZWSNcV3gcRYKEbN
X-Received: by 2002:a05:6000:3105:b0:43d:309b:f2db with SMTP id
 ffacd0b85a97d-43d6423d032mr2784320f8f.7.1775806101766; 
 Fri, 10 Apr 2026 00:28:21 -0700 (PDT)
Received: from dragon (ptr-94-109-198-162.dyn.orange.be. [94.109.198.162])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-43d63de3499sm5067183f8f.1.2026.04.10.00.28.21
 for <buildroot@buildroot.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Apr 2026 00:28:21 -0700 (PDT)
To: buildroot@buildroot.org
Date: Fri, 10 Apr 2026 09:28:12 +0200
Message-ID: <20260410072812.1874864-1-titouan.christophe@mind.be>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mind.be; s=google; t=1775806102; x=1776410902; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:to
 :from:from:to:cc:subject:date:message-id:reply-to;
 bh=c1Wjm/ddfcp0Hqb7aptCWwmjFh3tpH2O1jkqcjyugTU=;
 b=YOratGZk2QsDubmSJUuBkFKWmKIqm6HhbxUpWxqAbUyM3yOXQgbNdrikkxHoeAAtDg
 XZAIlcnMwG/0GdlqWI5BF1rEF4lNi6cBjU9RDSQU3oVUzwTFIYbSNGBLm4cU5U5jIraB
 QTpomXYf1qLzDB9WRyMXsEZbZe/IfnSiBsYTsVNWTEdru9a09tyeir3vBcTW9YSxIwTg
 QA/xXWgObdSgtgT4hJJYzXGX5Ca4eKVyMUpL8jg8bFNaCM/V2o+ZZz9lrUZbcFupJLFL
 LR/sMFvs357hKVjLYWAcy8yrkOSt+rMoHyYNgDlXHF0fhTf5c69HQFRm/iDr/FPpVMho
 VZIA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=quarantine dis=none)
 header.from=mind.be
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=mind.be header.i=@mind.be
 header.a=rsa-sha256 header.s=google header.b=YOratGZk
Subject: [Buildroot] [PATCH] package/waf: bump to v2.1.9
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

This contains some minor bugfixes and enhancements, see the release notes
https://gitlab.com/ita1024/waf/blob/waf-2.1.9/ChangeLog

Signed-off-by: Titouan Christophe <titouan.christophe@mind.be>
---
 package/waf/waf.hash | 6 +++---
 package/waf/waf.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/waf/waf.hash b/package/waf/waf.hash
index 061a093c55..12dd57a4e2 100644
--- a/package/waf/waf.hash
+++ b/package/waf/waf.hash
@@ -1,7 +1,7 @@
 # Locally computed
-sha1  d11579fb088200adc5e6bf6c96e31fcb7afd94cb  waf-2.1.6
-sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf-2.1.6
+sha1  40033ed0306c210f4e8d6e6cd5cb0592acec55c3  waf-2.1.9
+sha256  e235eeac6d34f039834e355a738298416a92a17defd1b6e1eae48488ba4a6864  waf-2.1.9
 
 # The waf script also contains its license, but is renamed `waf` in the extract
 # step, so this is a synonym for the above, to check WAF_LICENSE
-sha256  4bc4587a11925e19739da021e021a5764d39759fada85563bc6d4ded17515b14  waf
+sha256  e235eeac6d34f039834e355a738298416a92a17defd1b6e1eae48488ba4a6864  waf
diff --git a/package/waf/waf.mk b/package/waf/waf.mk
index 911dcc5fc6..13d088d54e 100644
--- a/package/waf/waf.mk
+++ b/package/waf/waf.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-WAF_VERSION = 2.1.6
+WAF_VERSION = 2.1.9
 WAF_SOURCE = waf-$(WAF_VERSION)
 WAF_SITE = https://waf.io
 WAF_LICENSE = BSD-3-Clause
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
