Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 267E2C369B1
	for <buildroot@archiver.kernel.org>; Wed, 16 Apr 2025 06:37:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B877380DCA;
	Wed, 16 Apr 2025 06:37:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g82ZYYetP1EG; Wed, 16 Apr 2025 06:37:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E6BAA80F37
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id E6BAA80F37;
	Wed, 16 Apr 2025 06:37:51 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B5690435
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 06:37:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 83DE680F37
 for <buildroot@buildroot.org>; Wed, 16 Apr 2025 06:37:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 27FyQx_7uoXn for <buildroot@buildroot.org>;
 Wed, 16 Apr 2025 06:37:49 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2a00:1450:4864:20::42f; helo=mail-wr1-x42f.google.com;
 envelope-from=francois.perrad@gadz.org; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9EF7180DCA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EF7180DCA
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9EF7180DCA
 for <buildroot@busybox.net>; Wed, 16 Apr 2025 06:37:48 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id
 ffacd0b85a97d-39ee5ac4321so162167f8f.1
 for <buildroot@busybox.net>; Tue, 15 Apr 2025 23:37:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1744785466; x=1745390266;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=94pitYnewdbBfd07MBoQkfyJ8kYbnIEQSHTv9dr75Qo=;
 b=dTRcKwzWjULaQx0FdAlBAJGklkV3kicXwCCwET4FXUDsQ0AJJAD4+oFZG4dNINX758
 QfYSSUrKbF0j2ojYXOlnet1S3Q1x+WokNFUNCZBI12o+EGT6Wq9lPgSou5/pdYKAbdij
 yoo0Y2j1wiQkPw5+NnMoWMrjECySwo6GnGCKcCfbS53PyMDDRI0W58NGLq2MS8S38krc
 ITCQOIxjoUCO4+quo3OBRzaU1yICJHHHYPS6ja4htyH82aAdMqQrMI0Hnr/baI7xun6K
 xgaS75CFuliWjljFBy3pkPJBdSRjqp2B1m4m+5CJeGULemYVfGfsi2WatetIhZdYfcLl
 TBMA==
X-Gm-Message-State: AOJu0Yzr2XkiNSKN4mqC7BBU+qYvpU8IGoxGovjgZNJJMWhe+0QuWjun
 xmnmpk/8isQX6f2aSMVHxmxzinywjLGBIb0yvnnVn53bMl+tICbwPkj48iiIu50rC3Hdnycq9tC
 FBg==
X-Gm-Gg: ASbGnctIGV1nGIQKZYTaeO6S6dvrJovadrXt1OXVXonIh0eU/IMpvgNk2SQdVLvOodE
 WjCIyxf8kBc7jFbXRGIiW7gnwzIsSHJd6Xu0iifzsw9IAIWCPcdGDsmGQ6cSIR7Nq2RTOi3fNcx
 Av/1kNTxOHXQTqc6+Qn3PZYwVvZAdYWznuF0Ka4OLmtphTdBEVvjsW6/rb+KIajn9mhSE91Jk1P
 n9fwrVVq1bpUd1QFWAn2u7xVZCDq4xPUltaWy/v0wT15X34AfELg3a6yHGvucP2ZxoOkytYwHDv
 LsXocdvv5ZRbvDCbonusQ1aGL+EO+C0bb1ag/pOiabKqPrmmEiRofkB3IQ7yKLjO/8ho97MvnBB
 ApA==
X-Google-Smtp-Source: AGHT+IGNLpVPX64zoVJ1eTre1FngeO8OsIPQubR4vSm5UVH1Rcm+aqk0uGe1C87VUGXPbLjRyVNRZg==
X-Received: by 2002:a05:6000:184e:b0:391:38a5:efa with SMTP id
 ffacd0b85a97d-39ee5b163c7mr583573f8f.23.1744785466376; 
 Tue, 15 Apr 2025 23:37:46 -0700 (PDT)
Received: from vm-2404.. (151.187.66.37.rev.sfr.net. [37.66.187.151])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-39eae96c03dsm15878265f8f.24.2025.04.15.23.37.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Apr 2025 23:37:46 -0700 (PDT)
To: buildroot@busybox.net
Date: Wed, 16 Apr 2025 08:37:32 +0200
Message-ID: <20250416063732.469526-1-francois.perrad@gadz.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gadz.org; s=google; t=1744785466; x=1745390266; darn=busybox.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=94pitYnewdbBfd07MBoQkfyJ8kYbnIEQSHTv9dr75Qo=;
 b=qf3kz2F7FJfuEXfWjucswOviJ3vvj1ygMioAkPhCSfq1HpT1mfWuar4zh38LUrtK8d
 5x3kxeA3+w7GtAtO4FZvc6fRx7n3gecILXFZJ33h5tcSe7G3MQ1GKQtkwb9D639ps/qY
 Mr3pGXTxdACgz0BuYRoRqjYbkZyJ72f/tSJmGSBxjaMTdKd0uVBHa3FOYYDaJNz1mtWJ
 oBPt99oeYM7XdIp10Hmqukp+0ojYG/ALiaCzntk1Eod5uqSJHyrKAsUm0hMIXMs+PaeA
 xSInz4dHkSTsWdqUe6qX6VIR+wk+wupz7zZQa0IElLUxG0bZiBcXOKFu7gURj0tW7GrQ
 rsMA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=gadz.org
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gadz.org header.i=@gadz.org header.a=rsa-sha256
 header.s=google header.b=qf3kz2F7
Subject: [Buildroot] [PATCH] package/lua-periphery: bump to version 2.4.3
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

diff LICENSE:
    - Copyright (c) 2014-2023 vsergeev / Ivan (Vanya) A. Sergeev
    + Copyright (c) 2014-2025 vsergeev / Ivan (Vanya) A. Sergeev

Signed-off-by: Francois Perrad <francois.perrad@gadz.org>
---
 package/lua-periphery/lua-periphery.hash | 4 ++--
 package/lua-periphery/lua-periphery.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/lua-periphery/lua-periphery.hash b/package/lua-periphery/lua-periphery.hash
index 666165616..b09dbe7c5 100644
--- a/package/lua-periphery/lua-periphery.hash
+++ b/package/lua-periphery/lua-periphery.hash
@@ -1,3 +1,3 @@
 # computed by luarocks/buildroot
-sha256  63694d795a630afcdb4812cb0af489ab088501ad7fe1dc9ee1337b53ff849721  lua-periphery-2.4.2-1.src.rock
-sha256  2c29e38ac4d393558522c5fa671bd03f9d6f7d751c899a3482b20ab2a0ba5122  lua-periphery/LICENSE
+sha256  cd8ecf48e1dd53244f7e108e5e77f8a1c78949e8decd7ada1a881c6178b840e6  lua-periphery-2.4.3-1.src.rock
+sha256  fd3377c82df42bd00d8ac9c25d22dc63f80b7a491b84f2ba82d2a7621432c511  lua-periphery/LICENSE
diff --git a/package/lua-periphery/lua-periphery.mk b/package/lua-periphery/lua-periphery.mk
index b9933a900..f0a52bf8b 100644
--- a/package/lua-periphery/lua-periphery.mk
+++ b/package/lua-periphery/lua-periphery.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LUA_PERIPHERY_VERSION = 2.4.2-1
+LUA_PERIPHERY_VERSION = 2.4.3-1
 LUA_PERIPHERY_SUBDIR = lua-periphery
 LUA_PERIPHERY_LICENSE = MIT
 LUA_PERIPHERY_LICENSE_FILES = $(LUA_PERIPHERY_SUBDIR)/LICENSE
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
