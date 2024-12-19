Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FE48E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 02:41:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7EAF84F52;
	Thu, 19 Dec 2024 02:41:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l3ggN33N-kBM; Thu, 19 Dec 2024 02:41:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EFDEA84F74
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EFDEA84F74;
	Thu, 19 Dec 2024 02:41:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id D4C2CE9
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:41:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B591A84F74
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:41:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DCSaeQoYrKX0 for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 02:41:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d30; helo=mail-io1-xd30.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org A460484CDC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A460484CDC
Received: from mail-io1-xd30.google.com (mail-io1-xd30.google.com
 [IPv6:2607:f8b0:4864:20::d30])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A460484CDC
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 02:41:33 +0000 (UTC)
Received: by mail-io1-xd30.google.com with SMTP id
 ca18e2360f4ac-844e55a981dso11834839f.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 18:41:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734576092; x=1735180892;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=poMTWAIGMEFV0UY1pDcB6tnkYkRvGOrZEsWRNQTOtiY=;
 b=Mp9yDx3EUpRVpNwOU77QlRrUbm+pWeWxoCA5dilpMe/s1eEuxt9BvWcLnDJyOb+b9c
 oAH+WZGOXadwMx+sN183p5/L3px+m4ICVR+FLI85Nc/UrgE15UNmDJPVhmlz7aCU0u95
 RrHYbY2IrvJumcV1Mab3yu/uTSgPa2cRhYZu77ohuw3XEjkWJk6KnyCcNRVFOS0gwXfm
 zgb6yWw3HqwfPiRUXeNJL0JCWPbEsgyndpkCMyy1G8uJ/g/pWd+cAUWuBXawf8GLaJLH
 0SCfX4FykT1NXXx3/7Xxnm1Ig0Zroc8IRoOfrnbq5FGOMXLR8pxGSPdH8JrNvDlmPonN
 zRSA==
X-Gm-Message-State: AOJu0Yz0aR5JuFpyQnNYQYG86SiHN9ePzcYT1LWpoCEwfrr8Bd/nibu2
 8tqvzy3h6a0ZoPL8xMas5MOlDB5ThTCUErA7eoBSqLApXbFsLhc2qAGVl16m6Qk=
X-Gm-Gg: ASbGncunymu0Kplh0hKP3Nmq7mcgl7t2QGxlZpTiSEwG28akd2oTnrXc/iwAGQKiTR0
 uFHzQS1ffALKIXmWFQoIcIVRFi0d7sW6aWqambimThSLCnl+DEFQvXdzhfG4aKErhflv8QVFKFa
 GhOPiD1SkbCl6gDbq7banSiJHp5cnJZJJYrIbLrUJCYv0DCx5dHGyIJFdlt9uF5P4vHd/JRVaZM
 BsaZVoyISKr/3x3pbrqZJrcGbpsuGVe5062sVNJr2MvXALQ5pmgyTmtD3hNf7vDfeLcQ9TG/In+
 l3xylwn/pugMmaKSD0vvmakf2eFQ0P0gOw==
X-Google-Smtp-Source: AGHT+IGNjiNMoLMvjm0NaJNNqFP+Q62T6kfQgBG0dlqzGWuW5dWqAo6f2l236P9XJPvVoqcYFE+5KA==
X-Received: by 2002:a05:6e02:1a6f:b0:3a7:7124:bd2c with SMTP id
 e9e14a558f8ab-3bdc428264bmr49073635ab.19.1734576092444; 
 Wed, 18 Dec 2024 18:41:32 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4e68bf7eaf0sm61526173.68.2024.12.18.18.41.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 18:41:32 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 19:41:30 -0700
Message-Id: <20241219024130.291876-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734576092; x=1735180892; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=poMTWAIGMEFV0UY1pDcB6tnkYkRvGOrZEsWRNQTOtiY=;
 b=fGOg6o4C/5tvjeMPwG7G4PY7CsMYPvgixJhyvOXubrnREhQVwji8W+UA4kkDkMq/3e
 rZ8FRoOZSuqXtVGa/8623dca6xlrNT+OGs6XnFxiiyDSgqxOpEA3DitNh0VMhVXh2NLi
 wGuHKZHCNz27I8lUAb0TGNHsK9qVv25eCBeH2m6hzfQSsbcGHwsv28fic9rrt1uRFcly
 soBeMgczA9nVmU62MUHdGmDuJ8/J4q+84nMd9BJUcJDApwtTmq4r9+raGKENdoTgFGxW
 cxz6Xsd3HoohCZkYNxNuoSMp4q02VXfIWTwDn4vXpam8JcE9WFOHLcueskXp/ap/6+5A
 hApg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=fGOg6o4C
Subject: [Buildroot] [PATCH 1/1] package/python-starlette: bump to version
 0.41.3
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
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-starlette/python-starlette.hash | 4 ++--
 package/python-starlette/python-starlette.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-starlette/python-starlette.hash b/package/python-starlette/python-starlette.hash
index f422e6cfe0..1542e565f9 100644
--- a/package/python-starlette/python-starlette.hash
+++ b/package/python-starlette/python-starlette.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/starlette/json
-md5  97321ad76438c1106ddd817baddcda06  starlette-0.41.2.tar.gz
-sha256  9834fd799d1a87fd346deb76158668cfa0b0d56f85caefe8268e2d97c3468b62  starlette-0.41.2.tar.gz
+md5  ccdbb470d005b83cc8f808e6dc25f890  starlette-0.41.3.tar.gz
+sha256  0e4ab3d16522a255be6b28260b938eae2482f98ce5cc934cb08dce8dc3ba5835  starlette-0.41.3.tar.gz
 # Locally computed sha256 checksums
 sha256  dcb95677a02240243187e964f941847d19b17821cf99e5afae684fab328c19bf  LICENSE.md
diff --git a/package/python-starlette/python-starlette.mk b/package/python-starlette/python-starlette.mk
index 3caa136987..0a4e5f3f17 100644
--- a/package/python-starlette/python-starlette.mk
+++ b/package/python-starlette/python-starlette.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_STARLETTE_VERSION = 0.41.2
+PYTHON_STARLETTE_VERSION = 0.41.3
 PYTHON_STARLETTE_SOURCE = starlette-$(PYTHON_STARLETTE_VERSION).tar.gz
-PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/3e/da/1fb4bdb72ae12b834becd7e1e7e47001d32f91ec0ce8d7bc1b618d9f0bd9
+PYTHON_STARLETTE_SITE = https://files.pythonhosted.org/packages/1a/4c/9b5764bd22eec91c4039ef4c55334e9187085da2d8a2df7bd570869aae18
 PYTHON_STARLETTE_SETUP_TYPE = hatch
 PYTHON_STARLETTE_LICENSE = BSD-3-Clause
 PYTHON_STARLETTE_LICENSE_FILES = LICENSE.md
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
