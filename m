Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 053D9E6689E
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 08:39:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4873D60D9C;
	Sat, 20 Dec 2025 08:39:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id LhI4wTHFu6TG; Sat, 20 Dec 2025 08:39:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A012660836
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766219966;
	bh=0YyzfeKH5byjIyAwidccxf0Jp96zEaJiZsLgJVdwJuA=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=o1YKOz6ijEp7AAWSzVrkPcRtVTUzvqLYLzQdgRJTa6b3ZjmUMKJXX7RK0MIL6rd7y
	 cHANRpddXIFcdVRO3r5jAFt7GYRmRTv9mqm+aGtUmNu0ZoGQp+5sWpQDOzNGlEki7R
	 VRVjJzYb0QVVS/EHCVB/wdS63jXkSeOMe+0/8lmG7PTkXmK5obfjd4gtRzhPvrQXT2
	 Nur6slE5zIWIYtQk1mksu5/pU4Sw6XSMbSVXj7sRbG6H4dTdAdUievD/EJhsYNUYM/
	 MBcH4qTlbywCEA3rq+S4dGg04aXfOykOlOmuVRjgH2lW/IXwkmprKRXE5rkVZSryFx
	 vBHtE2/iC9sQw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A012660836;
	Sat, 20 Dec 2025 08:39:26 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5150B23D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:39:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 42DCB83CF1
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 08:39:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uPJzgOiZntvM for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 08:39:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42c; helo=mail-wr1-x42c.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6729B80C2D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6729B80C2D
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6729B80C2D
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 08:39:24 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-42fb0fc5aa4so2090846f8f.1
 for <buildroot@busybox.net>; Sat, 20 Dec 2025 00:39:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766219962; x=1766824762;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hS1jFT3OFS8GTYuCY1zTEoNKUHXV9MapuHjEDku4hFk=;
 b=uVZ9RqMH4OkYwrpXYmvNXSzkyTQuME/z9YMec0ohw80QT/LeriBgUMCwumJ0r6DgX5
 j89R+1pmOxJ51M893+6wUf8h6Yp9RL+mFZ8FiNUU8/z5JqNpr4W8xG20EZdCZhoWvr+P
 ar4kADt1d5bqr7dGS3atm5I2UNoTY+zuhfpoKuI0FY99I/pWxRsSkJkSwUnhW07vrfkI
 o0H0QzDyw/c9CmqJgehrarcMQ0u0/XUfptv+vVLU0nIy/+GhmIUqRRMbxzOvYnbpZjRw
 ujOM7DzZLud5msCc/1Nnq0Zfgf/5MCZldeZeCMpGZAW7DsS/F4PIazGHw+VvW3t8j1xr
 z/Cg==
X-Gm-Message-State: AOJu0YyfRq5IM55U64XIxFli9FX/SAvhk4GtqXBrMSwetLMIZH2smMfC
 vh5IIAubvah3fY1U+6zZV52fOiLZzztWa1P/rXrICbN7aJzjNEwTeUmA825eWEiY+bNB3zrVQXU
 5IxksvA==
X-Gm-Gg: AY/fxX4vDKOsai4dBWqiXKQm654qSEmIXGHTV/enzgFaLDBV/iFuN24mb3M/2YAM82v
 mpdlOYqZIKGaC7xsR5RT9QI32jNVKNxi2/kj3BDPMBuDrVJhKK7pPkYulm49M226ibKEiWAlpbA
 kYiHUkr9S9hQO0AeOTTDQvT55/xAf8TnGI0epXeeHbSG3J3EcuC5s/SoX7b99x9jDY/RpWmXvvN
 FPB1KQCblc13Tl5qL7wecO3dtXQaIs+wcAhWwxzoHrEkOScn1V75w/Qp+RzpWOeJh6n15jN7GJb
 01aUdhRSQgjTPCBMI45ZiKGIL2kQ7TAJno2PNQYCfU6ZYVUgJIyB1UC6gYfE6hETcxGy/nicaJu
 SMFJk23OWouaH7ofNJXmfudkz30ha7DVymo7qphfyIhkbT9cHJu2beYp9QA1XxLIII5LWFKUQR5
 3+iTkAjqP0qiMCzJAwSbTUrsoRyPb1t+uxHhE=
X-Google-Smtp-Source: AGHT+IFZiQsrSYa964GA96kcUdZ2UWhQ1fWU/ZrcsMpJ39BbI+V2+1x8kveTtqOqGcjU9l4dPFHeXw==
X-Received: by 2002:a05:6000:402a:b0:430:f41f:bd5d with SMTP id
 ffacd0b85a97d-4324e708e9amr4403694f8f.55.1766219961683; 
 Sat, 20 Dec 2025 00:39:21 -0800 (PST)
Received: from vm-2404.. (46.184.66.37.rev.sfr.net. [37.66.184.46])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-4324ea1af20sm8742453f8f.2.2025.12.20.00.39.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 Dec 2025 00:39:21 -0800 (PST)
To: buildroot@busybox.net
Date: Sat, 20 Dec 2025 09:39:16 +0100
Message-ID: <20251220083916.348329-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1766219962; x=1766824762; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=hS1jFT3OFS8GTYuCY1zTEoNKUHXV9MapuHjEDku4hFk=;
 b=bkv3rVl16fGmaT/pXljFxZoGPZTWtrW70jT5eUZQzCYKgTK0ochiYZ5/LmmEcreeeK
 NcelnYW53SH0RbVTY8lCkQjr3MoBw2aWEn+hS2K5iOQmGJVAnioDxoINxmFYzt2bgRRN
 a1Jr1XuISDCXkIo18QltnPxgOlnUB2iZAgorDJzR7vv6/wQuC4aNZ3lUYifldCQqkNdF
 G8BtqAahrLf46eCqqzR0oXOArZaBlPI0/Jb9unf76Js/8alFEusfH8wHJAz6kZgRUD+v
 renVE413WDuKY4V5BdeIsylh0ZElQyKGIJB/z4BdVieb2RkMP33sc6C2IzCX3/8rhFS7
 TR9w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=bkv3rVl1
Subject: [Buildroot] [PATCH] package/linenoise: security bump to version
 e26268de5e56bfaad773786471844578fe9f7f4b
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
From: Francois Perrad via buildroot <buildroot@buildroot.org>
Reply-To: Francois Perrad <francois.perrad@gadz.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

fix CVE-2025-9810: TOCTOU  in linenoiseHistorySave

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/linenoise/linenoise.hash | 2 +-
 package/linenoise/linenoise.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/linenoise/linenoise.hash b/package/linenoise/linenoise.hash
index 9a1436eb8..3f82ba0ff 100644
--- a/package/linenoise/linenoise.hash
+++ b/package/linenoise/linenoise.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256  1086f82fbf30b0618b1953b05d33db62c68fc7ce49391ce1374192f776fde72d  linenoise-97d2850af13c339369093b78abe5265845d78220.tar.gz
+sha256  d5e702e7e04f0fcd09393bd4c010ce2bb19b4d137e22f2dd6064e848f4a6b5b2  linenoise-e26268de5e56bfaad773786471844578fe9f7f4b.tar.gz
 sha256  efe1692aa5b869edaa0ac88f95eb0276c1125304ffc636a299db3ebbab47f62b  LICENSE
diff --git a/package/linenoise/linenoise.mk b/package/linenoise/linenoise.mk
index fd2c4c703..05f8aa484 100644
--- a/package/linenoise/linenoise.mk
+++ b/package/linenoise/linenoise.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LINENOISE_VERSION = 97d2850af13c339369093b78abe5265845d78220
+LINENOISE_VERSION = e26268de5e56bfaad773786471844578fe9f7f4b
 LINENOISE_SITE = $(call github,antirez,linenoise,$(LINENOISE_VERSION))
 LINENOISE_LICENSE = BSD-2-Clause
 LINENOISE_LICENSE_FILES = LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
