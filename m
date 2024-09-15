Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A565C35FE8
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 07:18:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 26D8B400F1;
	Sun, 15 Sep 2024 07:18:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vrGOpGhrAJOP; Sun, 15 Sep 2024 07:18:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D1A77402C6
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D1A77402C6;
	Sun, 15 Sep 2024 07:18:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5F6431BF282
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:18:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4DC65402C6
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 07:18:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RL-6gNVw6lk9 for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 07:18:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d29; helo=mail-io1-xd29.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 17143400F1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 17143400F1
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 17143400F1
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 07:18:52 +0000 (UTC)
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-82aa4fd82a4so115610339f.2
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 00:18:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726384732; x=1726989532;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=qLl9e70EsiXMIUFVS6MxQLfmeUGIhTbJU3aEnB4jnt8=;
 b=nuM9MI6FjDFef720cQhxXVyDfaCreTfUj5vva7Gcgs8LP+LNY8jm7fbHDEQqLq2ueT
 /4m65fzsnTV2GZ2x9wK07g22uxg9UdHEnr+Tnb46JYKcBXf1vDDz8rUqy8mXV0iAmx0Y
 MQQWCMaLKModAEqUja/oZ6uyC8CPIPCoqOxqO1mgAEh+NLoIwxw2kHX7fWzN5lewmhs/
 MAnC0jCILKoSdnvi14Wkuw/c1Q69/i/kJocqstB0gB3Dne7rPpqSA9Vji/kS9E5X+UST
 9wgrDcj7/Kxi5OvyOaVX3kMUfMsdZiwacEoSNsxkiEp5srCw81G/GqVkewcarmo1BO2j
 MUDQ==
X-Gm-Message-State: AOJu0YxlWpKwv+rpQOvzXz6oBA6C0H8BBC+evmvTgOMDo2y4cE1d7x45
 +gJGTIVKl89HraMOHRHP/1NiJs8qvpshujWePx1k2sVGgAAKN8oRdpzg+Q==
X-Google-Smtp-Source: AGHT+IEVPLF4qWq2eKdrDLRn88snM2KZlG5VIJc76oZrGWJ8F1+tBeK7Hvu/dODKDAsK893W6XwjPQ==
X-Received: by 2002:a05:6602:6b8c:b0:82a:2ad1:d622 with SMTP id
 ca18e2360f4ac-82d1f986517mr1332976539f.16.1726384731870; 
 Sun, 15 Sep 2024 00:18:51 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf479fsm796982173.15.2024.09.15.00.18.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 15 Sep 2024 00:18:51 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 01:18:49 -0600
Message-Id: <20240915071849.1544675-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726384732; x=1726989532; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qLl9e70EsiXMIUFVS6MxQLfmeUGIhTbJU3aEnB4jnt8=;
 b=CpO5rgwvm9Dq3aYZIETaczX2Cu+G4jHnIRIxsO6JH+B0UdWwzM0D6oBVVs7LjCC4F/
 WuNVdiu0QhKLsH03a+F77Bj7ZOSP/5/CAbh105JvuJK9FWzwS7nV6VgzxlNNpa8aX6e0
 5RAcR8bEARCh0aazTrTc1ipS0niNo20272jR3h9tLHqB3G/sE4BVoQgGsOY9oKcCCTmb
 PrWers7hlivf+XOjYS1VJBv5tjQ6KrhrBHhxt739u7fGfRpiSGdVTEmIRkVJWEdwveQC
 Nmxg0Na+A9+HazCwTOAZC8tQQ2cKWRSBdsuT+mi/yZaQ6f9m3DtGWU/5M5C4HTBsA/aA
 F2nw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=CpO5rgwv
Subject: [Buildroot] [PATCH 1/1] package/python-googleapis-common-protos:
 bump to version 1.65.0
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
 .../python-googleapis-common-protos.hash                    | 4 ++--
 .../python-googleapis-common-protos.mk                      | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
index 1169e945e9..408f07994d 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/googleapis-common-protos/json
-md5  148bfe9b5a92663c5ff0a6700453ebad  googleapis-common-protos-1.62.0.tar.gz
-sha256  83f0ece9f94e5672cced82f592d2a5edf527a96ed1794f0bab36d5735c996277  googleapis-common-protos-1.62.0.tar.gz
+md5  cdb94d19ca05b4f16da10bbf39da2347  googleapis_common_protos-1.65.0.tar.gz
+sha256  334a29d07cddc3aa01dee4988f9afd9b2916ee2ff49d6b757155dc0d197852c0  googleapis_common_protos-1.65.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
index ca943a1cd3..3f43f1516e 100644
--- a/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
+++ b/package/python-googleapis-common-protos/python-googleapis-common-protos.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.62.0
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis-common-protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
-PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/4a/5f/eb12d721b45d20a977289d674e179995a0ddab1684d2c61b29a63d43a5f1
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION = 1.65.0
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SOURCE = googleapis_common_protos-$(PYTHON_GOOGLEAPIS_COMMON_PROTOS_VERSION).tar.gz
+PYTHON_GOOGLEAPIS_COMMON_PROTOS_SITE = https://files.pythonhosted.org/packages/53/3b/1599ceafa875ffb951480c8c74f4b77646a6b80e80970698f2aa93c216ce
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_SETUP_TYPE = setuptools
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE = Apache-2.0
 PYTHON_GOOGLEAPIS_COMMON_PROTOS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
