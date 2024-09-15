Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B0C1C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 05:46:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CF1B9401E2;
	Sun, 15 Sep 2024 05:46:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 84eCYCEzojQC; Sun, 15 Sep 2024 05:46:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 972B9401F9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 972B9401F9;
	Sun, 15 Sep 2024 05:46:49 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3E0CF1BF293
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:46:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C1DD401F9
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 05:46:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH4AnEUrMzD8 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 05:46:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 0941A401E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 0941A401E2
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0941A401E2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 05:46:45 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-39f51934f61so7566675ab.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:46:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726379205; x=1726984005;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=D5F9WG1O6lZ/ZXsgO1z2Z9aZk7RIr0IHaXCgNhGzkJw=;
 b=UTnSZH45viCOiE9YWMo8/2OJOcUaBQhepsrW8MjpQL1HJjTGAF2iqG7PMOj2Jed6XD
 ns0DChOYIs22BZas7McMHSa1BgYIw9BAFpJlxzj42tNG1zgaG4YgqtkJupm4L7WmIu+4
 SO6wjX0DZDBAGteuO8PixzvG7kB6aGI5KVByW07S9Q1KxMTyCQEtY79cHXCFV2Ss09HU
 u+ewOTxhKULbDFiVem0rgdVJwVNlf7h4kZRnVgssTLKW/faSql/7LNTp58mKUSWPWO+s
 +7/3pZXdclexBTmRCfSgq9FuJoQiVxQvskealLKtrDUnePlvgBECcigc9BjOozkwR5Ge
 hEag==
X-Gm-Message-State: AOJu0YyqyFtqcCIijURvmMVx6YYLo47Gvreff8COT50Ft2aoE6Ivln8f
 V5doaqi5Enpt2XXu44YtoHo9kg1/m2mv7yCVKz9mKsScAROf0e2tvfjUjg==
X-Google-Smtp-Source: AGHT+IGxHjsrUYxifRN8dngSbkvdw9XxHr+qniRPmAp4+cvKQThrxOq7FV0XTOD6aNyKaPI9ver54w==
X-Received: by 2002:a05:6602:168a:b0:82d:18d:bab with SMTP id
 ca18e2360f4ac-82d37842cb3mr888529939f.15.1726379204710; 
 Sat, 14 Sep 2024 22:46:44 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed35003sm763800173.139.2024.09.14.22.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 22:46:44 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 23:46:42 -0600
Message-Id: <20240915054642.1425392-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726379205; x=1726984005; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=D5F9WG1O6lZ/ZXsgO1z2Z9aZk7RIr0IHaXCgNhGzkJw=;
 b=elxEWzAp3+/e6K0Hx4WWhEWYz3VCczna5GqHdLMTx2ATUBVBJ1etzfWW5rvd2/M+Ci
 +OoOAOWm8AuB7kvXHNSEfLLrbjr452A/fQG0u05eU//cqmhQh//c3zXiLa9OKb7MRVoV
 ecKXWi2Mka5vyXn6qYnsXWw9/aMBlfzl9GPSiuBdmsLyw3dbj1dQwqn+m0uQuWNZumB3
 QbkXi/MQcloAT5f4+jgUQtB60pC2hrYzeQuRJS9HsLQQFTYn3hskRNt+jWA2VMQgltuo
 D+GB7BBVFyWXTSIldRhUHd1fUkbCHEVJBDexBUhhfhvjfy8I50cvGVhR5+ZzegJIehpL
 sc+w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=elxEWzAp
Subject: [Buildroot] [PATCH 1/1] package/python-fastapi: bump to version
 0.114.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 061266cd6d..2bbffbcb84 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  02d748d7fbc4a8e474c13471bb441cc1  fastapi-0.114.0.tar.gz
-sha256  9908f2a5cc733004de6ca5e1412698f35085cefcbfd41d539245b9edf87b73c1  fastapi-0.114.0.tar.gz
+md5  99a2b4e24bcdcfeea19c60df2b481482  fastapi-0.114.2.tar.gz
+sha256  0adb148b62edb09e8c6eeefa3ea934e8f276dabc038c5a82989ea6346050c3da  fastapi-0.114.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index b6332e9de5..5fc1a4ecb9 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.114.0
+PYTHON_FASTAPI_VERSION = 0.114.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/20/1b/fb621a3bab915ac1c9ad06943eb5a2b2aa01cd63228d524bd45261278787
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/d6/c7/cf41c991257e9babc429ae0c2c48f5315154e8b94c8ba475dc0247718741
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
