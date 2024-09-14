Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42136FC6176
	for <buildroot@archiver.kernel.org>; Sat, 14 Sep 2024 22:36:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 06A884063C;
	Sat, 14 Sep 2024 22:36:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id g0uJn2BXx5Kd; Sat, 14 Sep 2024 22:36:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org ADE5A40652
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id ADE5A40652;
	Sat, 14 Sep 2024 22:36:34 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DC35F1BF3DB
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:36:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id D84AC607D5
 for <buildroot@lists.busybox.net>; Sat, 14 Sep 2024 22:36:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5Uth2Xa5R005 for <buildroot@lists.busybox.net>;
 Sat, 14 Sep 2024 22:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EA3F1607D4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EA3F1607D4
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EA3F1607D4
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 22:36:32 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-82cdadeeb2eso112527639f.2
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 15:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726353392; x=1726958192;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Mhi7gJ584VNQW3vU7N3hJEo1oXtAeWLruFcYXvxNTO0=;
 b=ZowvaJyCkjt5w5rTv83IJ71VwJhyqVnE5TBUB1ZRAXD2dRG+tjwwpteRBtz9yoYyuj
 yVVwaLPz1jEYZJ5WFHyxsUehAWDrTteA9Dc6UtizXYCiFHpACpy+7IyqCDzlYrnyNutu
 mgB2qxnqsNjBsC9Txes4Z1M1nHzPzmhF6JEEb+SFtJ2rWwfeHC/qfaAbFMa2xRpfZGrj
 FBXSKwx7ekw78VXUr8Aw+JKA3a2sA17sxf4a/J40biikztJxuwZVAvw3zREIF77ZurA6
 Ww85xp3Bu4+pYagy3HNilI0RjUyn893hPTp1r59SUTSD+xH2+yBxGaFjd5deZrIcvprI
 weAw==
X-Gm-Message-State: AOJu0YyAWH2rfZAIom4IbREiTXRhags7iAPvRm7V0hN9ocJ1Zh47WByB
 /0y/GHpiJaMnClGOqHe6vYGcRyZC3pPBHRwoVFClEI6uiA4yXzd8CS+L5Q==
X-Google-Smtp-Source: AGHT+IHcAu/Cn2fhOqtR71Tp65q0SFH40RjI0nn7ZQcZbf1bzvvTX2vBLp0HErxa6KHZ5W/knSHHCw==
X-Received: by 2002:a05:6e02:1c0d:b0:39f:60d7:8146 with SMTP id
 e9e14a558f8ab-3a0847d8ecamr102474945ab.0.1726353391728; 
 Sat, 14 Sep 2024 15:36:31 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ed13d4asm592859173.90.2024.09.14.15.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 15:36:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 14 Sep 2024 16:36:29 -0600
Message-Id: <20240914223629.1352911-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726353392; x=1726958192; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=Mhi7gJ584VNQW3vU7N3hJEo1oXtAeWLruFcYXvxNTO0=;
 b=DInDILXvtxJynVRFNIMgTfVZh0JQZ085Unvi90SuLpDivRz8l1/RBFBrEIBcyAAjfn
 R1l2OCa6Aayyu0FIWwgPh3B4PbxiQwpTW1aggp94njY5Oe+B82TXBNV2f6gUuIaBayyr
 tLsxE+7P02ddEHLylf0X1ryDHOz95xu6qX7kzWylJEj2HhVhtLcAl0l/wOZ7W+wzZmDB
 YjLVywvCCZKVzS/7+HNFchB30yPjHzuCWzS0nyNggRsbSW0pKdMT2iuBrMtRb+pcXWJX
 0i7ZH1E1b+U1SreghiXVPfh2EOSWfDH6cjTc/cwOAxk6CaAio800IHLIMS02IpDQRBql
 h9UQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DInDILXv
Subject: [Buildroot] [PATCH 1/1] package/python-boto3: bump to version
 1.35.19
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-boto3/python-boto3.hash | 4 ++--
 package/python-boto3/python-boto3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-boto3/python-boto3.hash b/package/python-boto3/python-boto3.hash
index 02440a2960..5b7c1cdba3 100644
--- a/package/python-boto3/python-boto3.hash
+++ b/package/python-boto3/python-boto3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/boto3/json
-md5  7cc00aa828c5d3a5c09e3af284e6d23e  boto3-1.34.14.tar.gz
-sha256  5c1bb487c68120aae236354d81b8a1a55d0aa3395d30748a01825ef90891921e  boto3-1.34.14.tar.gz
+md5  b344337be1e7925cbc32940567432e5c  boto3-1.35.19.tar.gz
+sha256  9979fe674780a0b7100eae9156d74ee374cd1638a9f61c77277e3ce712f3e496  boto3-1.35.19.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE
diff --git a/package/python-boto3/python-boto3.mk b/package/python-boto3/python-boto3.mk
index 52bb5bc3b1..1584c81971 100644
--- a/package/python-boto3/python-boto3.mk
+++ b/package/python-boto3/python-boto3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTO3_VERSION = 1.34.14
+PYTHON_BOTO3_VERSION = 1.35.19
 PYTHON_BOTO3_SOURCE = boto3-$(PYTHON_BOTO3_VERSION).tar.gz
-PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/5f/b6/1e45c3a145304c3feaf48959c6a46efe9a256eec4d417a445b0d9827d20c
+PYTHON_BOTO3_SITE = https://files.pythonhosted.org/packages/80/85/d4119201c65b56a2bcc8dc328db98cd1c769a2376aea1613a6f5e8f2a88b
 PYTHON_BOTO3_SETUP_TYPE = setuptools
 PYTHON_BOTO3_LICENSE = Apache-2.0
 PYTHON_BOTO3_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
