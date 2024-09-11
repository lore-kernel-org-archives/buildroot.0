Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C6AEE57CF
	for <buildroot@archiver.kernel.org>; Wed, 11 Sep 2024 20:33:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id F196A40542;
	Wed, 11 Sep 2024 20:33:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kqug0DfzjFKg; Wed, 11 Sep 2024 20:33:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 7722B40240
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7722B40240;
	Wed, 11 Sep 2024 20:33:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 3EEEF1BF423
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:33:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2E0156075A
 for <buildroot@lists.busybox.net>; Wed, 11 Sep 2024 20:33:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O2Ji1PVQUP4x for <buildroot@lists.busybox.net>;
 Wed, 11 Sep 2024 20:33:34 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::12e; helo=mail-il1-x12e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 1912360067
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1912360067
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1912360067
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 20:33:34 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3a0436958d9so1120305ab.0
 for <buildroot@buildroot.org>; Wed, 11 Sep 2024 13:33:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726086812; x=1726691612;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PJOeqXKDiA/Gd4r7CTqFkod5G5KCam3QXG9BAbkLQ0Y=;
 b=oTOEcNegTc7zGnpFhqZLSHi6IFLAbnLnZf7ZGq3DqzWPJREYo1QQp5+M5M5enVpuSq
 msqDW4uIR24qgSsKfLryN0fcs9hZPgPNiXOKVrK3//jkANACPtKqsLNH9pp0As0y16cc
 OtqxCA2by9/ERCN4HkNqdEtVUn7S2Ieaa9QVEVCrHqkld5bu4NpKfr3mq8xCg41N2Pb3
 vMNLs04i3CJfBeN6I3AssrrFEar6eE+AgaYNpxHJeBEcmfQPm5VcSBYSBXlv+GnGoVOE
 Idnb+rtloOavG5RvGxMxUr/OfIWjtjnUeh9ONLEmuryhklCLycCwUQTuVAXgQwq3vuJ+
 +UDw==
X-Gm-Message-State: AOJu0YyxBKZq2d+4KwaLMKje2nCrIic2ejXn9+Pb2hvE9u0+VnahYWA5
 rgkWiMykm0I2lnRw61RU+v+DqQlSHKu0v08xtafFFkfSDRQJw8k6rUCW7g==
X-Google-Smtp-Source: AGHT+IGKm+Xo09lixcbov072VFuAIXlE0ixtFBV0/A4E6ZjPnMeAVwEmD9wfXY1zWEqX7tJ2zzyAGQ==
X-Received: by 2002:a05:6e02:178e:b0:3a0:5566:bda5 with SMTP id
 e9e14a558f8ab-3a084902a5cmr5368435ab.9.1726086812560; 
 Wed, 11 Sep 2024 13:33:32 -0700 (PDT)
Received: from james-x399.localdomain (97-118-128-240.hlrn.qwest.net.
 [97.118.128.240]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3a058fe5648sm28145365ab.40.2024.09.11.13.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Sep 2024 13:33:32 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 11 Sep 2024 14:33:31 -0600
Message-Id: <20240911203331.906197-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726086812; x=1726691612; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PJOeqXKDiA/Gd4r7CTqFkod5G5KCam3QXG9BAbkLQ0Y=;
 b=nLR8lEqMxLoTYYLtwK+oYYM3x+NinBazi+Q1oR41yOaQSg4yjrJzDQXMxd1bB2XOgC
 QFcO1rR61KS1pvSQqQQRB/Gx+j/LJoeizV+lbUx6FinHkW+r/xI8/TnZRaf0B9+X7k4p
 f8YJLWw3cyKTAp0qGNQoBGa7E8Ro+wYZgyT4XtSdHgveIFxGPO0DYOY6L69sDFd3BzAF
 E0pp4tJhnmAdsQ1Yu7VxZ5HcVsfSATYRzPsaNb9A23TCVur16umO1L7QWz+Ach3QCSPq
 HJEFeNQ5mIa++SceVcokc734JFNkonAnFG8joA8sP8NHcWW5bkQwQTXtf2NFicRavTBB
 7igQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=nLR8lEqM
Subject: [Buildroot] [PATCH 1/1] package/python-aiohttp-sse: bump to version
 2.2.0
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
 package/python-aiohttp-sse/python-aiohttp-sse.hash | 4 ++--
 package/python-aiohttp-sse/python-aiohttp-sse.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.hash b/package/python-aiohttp-sse/python-aiohttp-sse.hash
index 224601450c..e8382e7f8e 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.hash
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp-sse/json
-md5  822cd0c30325e8a711101c1a1ede4058  aiohttp-sse-2.1.0.tar.gz
-sha256  dfe8f7271ab4470891fa1bfa1913d6889b3d19015dd3d3a4cab949e66971bbca  aiohttp-sse-2.1.0.tar.gz
+md5  8c86e737a2f3642941c1d383f42ce6ae  aiohttp-sse-2.2.0.tar.gz
+sha256  a48dd5774031d3f41a29e159ebdbb93e89c8f37c1e9e83e196296be51885a5c2  aiohttp-sse-2.2.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5585eb91ec607b4fdbe97d44a61146a9cc27bb703336628bc3c6a1eaffe60307  LICENSE
diff --git a/package/python-aiohttp-sse/python-aiohttp-sse.mk b/package/python-aiohttp-sse/python-aiohttp-sse.mk
index 2aef1579f5..bf46c98528 100644
--- a/package/python-aiohttp-sse/python-aiohttp-sse.mk
+++ b/package/python-aiohttp-sse/python-aiohttp-sse.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_SSE_VERSION = 2.1.0
+PYTHON_AIOHTTP_SSE_VERSION = 2.2.0
 PYTHON_AIOHTTP_SSE_SOURCE = aiohttp-sse-$(PYTHON_AIOHTTP_SSE_VERSION).tar.gz
-PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/2f/3f/cc4f5a3fe6cb50ad5b9d26bb7738c5da1f61645b517d4230df2fc32d89f0
+PYTHON_AIOHTTP_SSE_SITE = https://files.pythonhosted.org/packages/80/df/4ddb30e689695fd91cf41c072e154061120ed166e8baf6c9a0020f27dffc
 PYTHON_AIOHTTP_SSE_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_SSE_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_SSE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
