Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A89E9C54ED1
	for <buildroot@archiver.kernel.org>; Tue, 27 May 2025 19:21:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 52CF4404AF;
	Tue, 27 May 2025 19:21:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ouySwjlNr90; Tue, 27 May 2025 19:21:17 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80D6840486
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 80D6840486;
	Tue, 27 May 2025 19:21:17 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D4693B66
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:21:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BA00860BDA
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:21:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2cZO8PlSdLiu for <buildroot@buildroot.org>;
 Tue, 27 May 2025 19:21:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::62b; helo=mail-pl1-x62b.google.com;
 envelope-from=kadambini.nema@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 14F21605CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 14F21605CE
Received: from mail-pl1-x62b.google.com (mail-pl1-x62b.google.com
 [IPv6:2607:f8b0:4864:20::62b])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 14F21605CE
 for <buildroot@buildroot.org>; Tue, 27 May 2025 19:21:14 +0000 (UTC)
Received: by mail-pl1-x62b.google.com with SMTP id
 d9443c01a7336-23278ce78efso26029095ad.2
 for <buildroot@buildroot.org>; Tue, 27 May 2025 12:21:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748373674; x=1748978474;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Bvkv4zjz95la0CB4xMyS1rdSA3NzQM9HJajpFXKZi24=;
 b=AFhff2TQq2ZyLciJt+NP4bEj8n0Idh4FoIQQk8VeEK4GMiRHGqUTQWT5j8rjGn1BNa
 tKOY+FvZi9QOQm8paz4b6M2e1RKCmt6GJo5aDdoujO2LSsiWoFpywgpJcBft5kbVTLK7
 rzySuyGMIsJL0Kb0kA4aFdYN8/r1I/T9HjKFMBZWPYBSYEsamXS6+jwMmjMHCzecoCRX
 M6hGi9eMdx5tQIo914pUxXRF3PqRrxZ/Qge6lg6iDmr5Kvb6yPRjXJO23nzmccyvXkWc
 Q4ejbvvxPshdKk1cKFDHTlSONPjC108bd1Vo8fcAQC4hIoDJ/kne1kmHJfzH2zb9hDeJ
 wM2Q==
X-Gm-Message-State: AOJu0YxdqYTJROa+M2sX9n2KyawSpMFGMs8Yd5wK6XCsKo9LJPFSE5AY
 0npJotFeLWT63Jg8PiMTrPVvcuRTWObghqCQJOu9KLlX1VoU0B7vFilqjdcGRBAS
X-Gm-Gg: ASbGnct/rZ9389ArjiQplx0FojK8h58Tl5Nm7WhPt0faH6E70xec/0KSPjaKR+YLjT7
 hiteUSvFaRmNTwl8QyxFRFekqSwFz+v6N93Xoctfl2OpuDFrD7cW9CXaQpDKHhJtl7As+e3itKQ
 Cd8dS0ByG3qK3XXiSt4HwXVtwqewZUprD0KFIEumsDe/2JPqtqGi0D1Yl27vc/7XFdrwtjT+a62
 40cyZom6PwTW5Nv2A8/WeimqK+Z79Gp5vHSmTtNpxMjtdxf8g3fkZjBWDMxjTK1FFx2wK99WqHN
 /8PQjweGMVNbl64oFFm8Gqgx4ylFF8jnN9V5VNj7wRCiy/nWoeikVZi0qmqX4VpY5QneHjgqgCo
 LoKB/oxO7zGjUDVQAn8qjb/cPHjczNHi2dh8V+g==
X-Google-Smtp-Source: AGHT+IG/bGINMPAug7VCfzWdWaz+0/2hI8EdJ6/8iqMWO6yy0qKEq+YWxSuN2Zpy50cemouY4PQgHQ==
X-Received: by 2002:a17:902:e5d1:b0:231:d0f4:6264 with SMTP id
 d9443c01a7336-23414f48bfdmr246157605ad.10.1748373673784; 
 Tue, 27 May 2025 12:21:13 -0700 (PDT)
Received: from localhost.localdomain (ip72-203-121-181.oc.oc.cox.net.
 [72.203.121.181]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-234a44f0086sm13721525ad.144.2025.05.27.12.21.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 May 2025 12:21:13 -0700 (PDT)
From: Kadambini Nema <kadambini.nema@gmail.com>
To: buildroot@buildroot.org
Cc: Kadambini Nema <kadambini.nema@gmail.com>
Date: Tue, 27 May 2025 12:21:09 -0700
Message-Id: <20250527192109.371731-1-kadambini.nema@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748373674; x=1748978474; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Bvkv4zjz95la0CB4xMyS1rdSA3NzQM9HJajpFXKZi24=;
 b=Q/I1TGuqUDb5PNNjmQOo6aCSnG+kvWbK2uHilOWhwgXE991B9BKVfxK9VdjTyEFscV
 cJ7i/cASWCUIAiKzsCmPWisjMNuD93wDgvmOwR/0bWrntPNvr9P7dsIarCjC9cByFFzA
 lqD3A9EmlFsLuoSKZKFto5ojiGW4EJ50O/77sgD26jSE8FpsPFby2j+Z6pnjW+5VOfxD
 kW3iWH3dxtIuCpLMQEE7OC+tuEsMCf4FBOcUUvmYAuATxR2HnadMInJdwXHvcmDrzZ5l
 U2CQzMcuQPfqsGwrUyEymwky3nST5g6ahNQ6dRSYD80M0CZN+31IumUhgAhnzS3amq86
 SDjw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=Q/I1TGuq
Subject: [Buildroot] [PATCH 1/1] package/ustreamer: bump version to 6.37
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

Changelog:
https://github.com/pikvm/ustreamer/compare/v6.36...v6.37

Signed-off-by: Kadambini Nema <kadambini.nema@gmail.com>
---
 package/ustreamer/ustreamer.hash | 2 +-
 package/ustreamer/ustreamer.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/ustreamer/ustreamer.hash b/package/ustreamer/ustreamer.hash
index 98d2d4b60a..30c8735901 100644
--- a/package/ustreamer/ustreamer.hash
+++ b/package/ustreamer/ustreamer.hash
@@ -1,3 +1,3 @@
 # Locally computed
-sha256  71aaba1427e8bb690500f1ae940aa64c3b3f7253750448c1331fad3b31500f3e  ustreamer-6.36.tar.gz
+sha256  b134bd9e291d2e7222e135f9b1b22f89ebf7c78c9c22333a4046a21365f87b2e  ustreamer-6.37.tar.gz
 sha256  8ceb4b9ee5adedde47b31e975c1d90c73ad27b6b165a1dcd80c7c545eb65b903  LICENSE
diff --git a/package/ustreamer/ustreamer.mk b/package/ustreamer/ustreamer.mk
index dd1369c121..abbeac2382 100644
--- a/package/ustreamer/ustreamer.mk
+++ b/package/ustreamer/ustreamer.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-USTREAMER_VERSION = 6.36
+USTREAMER_VERSION = 6.37
 USTREAMER_SITE = $(call github,pikvm,ustreamer,v$(USTREAMER_VERSION))
 USTREAMER_LICENSE = GPL-3.0+
 USTREAMER_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
