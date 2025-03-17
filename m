Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87354C282EC
	for <buildroot@archiver.kernel.org>; Mon, 17 Mar 2025 21:56:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 294E3820AE;
	Mon, 17 Mar 2025 21:56:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wKYZ1occLCzc; Mon, 17 Mar 2025 21:56:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 10EA8820B1
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 10EA8820B1;
	Mon, 17 Mar 2025 21:56:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 33BF3D5
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:56:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 20A8140DAA
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:56:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uC_NdfjBmXQa for <buildroot@buildroot.org>;
 Mon, 17 Mar 2025 21:56:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org D0C4040892
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D0C4040892
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D0C4040892
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 21:56:25 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-85db3475637so158501739f.1
 for <buildroot@buildroot.org>; Mon, 17 Mar 2025 14:56:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742248584; x=1742853384;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FUCy0zqSphRo/mY94n1Bb/3hC2+XdyXHu2QrPyxW4jw=;
 b=cRKoHYtCxvXtfnIUMxVITaf/t2jeNO8hEBEaoykrkcEUNGWsG7z4k2WmcE0hEuJMa5
 J6ohe9SrFmnYPnjuk92F2YBP444HuYza21ccAPLNwgZe+GMRcVb6cU6oLt7kf4+Pg9f9
 aFcqu0mVbnYWGYtj7jNu62Pz49WJc/7do/Y+vdwOlhUCZpzyEVT7AA+CWqGvAKIu1oC+
 7bqb4LZ7Xm4TRXLWgbJwlvy6WPCUZkEgkaiuMYcP+8dEhaY9zloj+d1PnAec9m5R0V4f
 wdjS47htwmn9NjRtWCKv4uF6nymxf38FcOq/KcTR0ZtAU+e7ozHpyOIL+GII3vE3rnan
 R3FA==
X-Gm-Message-State: AOJu0Yy865bmJLyyhGMIRz0uiIzhqqlktBgy4cVccqQ/b/ZA7NgaJYuH
 Fl6LnVVu/9jsqwNpp3SLaqSt8CiZF5Dd74vih1IRMQPFRKlzLgE7C4eKMQ==
X-Gm-Gg: ASbGncvg1yROVRSSiayN9lCmj2Cvr/sIJvvu2t3M/Ng2uhdx29tA1BPPuDfKWiaEcFv
 MwT+Vi+B4af3L2j5B6upzURIcWNp1L6nkt69QY3RGxEHHLZB0MQssdZFoGejEFFwTAt/HE909PA
 wg1E9FOUpwUgHBR8J9zWfe7w2HBgFZ8F8BH/QU3T8L1PT4MThifZ6IMhYPJfTiFeFY53fX2kTht
 wk6vEdwCu5czRRTFHV5v4ZCpOip/Ao18Meo2HzDdzNJQVsILGQa3uqQ8zLO7zMRbiLJ/pPehbgt
 rIZ/kO1uQ3fS2kITTqQrxQ2TP98xeygkM0aD5kQwdNtO4kbB1vUaMZG6B+WDrNjvgldACMk2Snw
 Z4HQPiaknmGPKNN6s0yO786yRnMEQxEU=
X-Google-Smtp-Source: AGHT+IH8g5LNQTukAI2N5L7MyakPI57OaeUR4i7so5/kBhHYvoTmexMo4vLu69PQ4M/Yc0zOPmwl1g==
X-Received: by 2002:a05:6e02:4816:b0:3d3:f15e:8e23 with SMTP id
 e9e14a558f8ab-3d57c31e161mr11657815ab.10.1742248584517; 
 Mon, 17 Mar 2025 14:56:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3d47a646abbsm28421955ab.11.2025.03.17.14.56.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Mar 2025 14:56:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 17 Mar 2025 15:56:14 -0600
Message-Id: <20250317215614.3052928-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1742248584; x=1742853384; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FUCy0zqSphRo/mY94n1Bb/3hC2+XdyXHu2QrPyxW4jw=;
 b=BbyhZje+B2ZCV05rYdZpxDXCqNkmhwYLTgoyms/OWQwLI5UkFsR+ovVuVeJs2XqmZG
 F3nkBLoBX06zr7m6NrE4alyIO4K7x68r1n79zZ9KrXgXJRezYlbcGNcYR+XP0v5BkUBO
 9dsQWWjBjd6cx7IKQ7aFtZhKeDoqLf4ukCneCA6oOLSOX59WcBD3Dt+WwgQGjxTEHYNJ
 wKAaRq9nnj88VQzb43BLB2WgpCj1X1QtpgujZmb5xabvDmlWxPAqcTPXds8zLDC1KLuh
 B+Sh20HpeQ2MhWdtxMCiCZfr9HYsK5Mkbxp6UhplEQhW1eP98yOkUsEaRqd05XCp/s0D
 Qh0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=BbyhZje+
Subject: [Buildroot] [PATCH 1/1] package/python-flit-core: bump to version
 3.11.0
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
 package/python-flit-core/python-flit-core.hash | 4 ++--
 package/python-flit-core/python-flit-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flit-core/python-flit-core.hash b/package/python-flit-core/python-flit-core.hash
index f8e71bf398..80f8d915fe 100644
--- a/package/python-flit-core/python-flit-core.hash
+++ b/package/python-flit-core/python-flit-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flit_core/json
-md5  a3381dd58e23e9826c5199b1f70318b0  flit_core-3.10.1.tar.gz
-sha256  66e5b87874a0d6e39691f0e22f09306736b633548670ad3c09ec9db03c5662f7  flit_core-3.10.1.tar.gz
+md5  6d677b1acef1769c4c7156c7508e0dbd  flit_core-3.11.0.tar.gz
+sha256  6ceeee3219e9d2ea282041f3e027c441597b450b33007cb81168e887b6113a8f  flit_core-3.11.0.tar.gz
 # Locally computed sha256 checksums
 sha256  35b4f1dec512e617077fd6980dbb43ef8c2887adc5d0185edb4c04da175dd816  LICENSE
diff --git a/package/python-flit-core/python-flit-core.mk b/package/python-flit-core/python-flit-core.mk
index bfa80af3e3..e46453443c 100644
--- a/package/python-flit-core/python-flit-core.mk
+++ b/package/python-flit-core/python-flit-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLIT_CORE_VERSION = 3.10.1
+PYTHON_FLIT_CORE_VERSION = 3.11.0
 PYTHON_FLIT_CORE_SOURCE = flit_core-$(PYTHON_FLIT_CORE_VERSION).tar.gz
-PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/d5/ae/09427bea9227a33ec834ed5461432752fd5d02b14f93dd68406c91684622
+PYTHON_FLIT_CORE_SITE = https://files.pythonhosted.org/packages/bc/18/b9b81cab2b8f63e6e7f72e1ba2766a0454fcd563e7a77b8299cb917ba805
 PYTHON_FLIT_CORE_LICENSE = BSD-3-Clause
 PYTHON_FLIT_CORE_LICENSE_FILES = LICENSE
 PYTHON_FLIT_CORE_SETUP_TYPE = flit-bootstrap
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
