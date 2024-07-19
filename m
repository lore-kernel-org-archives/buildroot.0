Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47ED5C3DA5D
	for <buildroot@archiver.kernel.org>; Fri, 19 Jul 2024 05:01:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B1F50409F5;
	Fri, 19 Jul 2024 05:01:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A4nde_9_sV7M; Fri, 19 Jul 2024 05:01:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6E40A40A7A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6E40A40A7A;
	Fri, 19 Jul 2024 05:01:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id DC6001BF841
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 05:01:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C99B040A7A
 for <buildroot@lists.busybox.net>; Fri, 19 Jul 2024 05:01:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id O3M-oMcyxW-a for <buildroot@lists.busybox.net>;
 Fri, 19 Jul 2024 05:01:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2b; helo=mail-io1-xd2b.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 8DC64409F5
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8DC64409F5
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8DC64409F5
 for <buildroot@buildroot.org>; Fri, 19 Jul 2024 05:01:38 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-7f70a708f8aso73201339f.2
 for <buildroot@buildroot.org>; Thu, 18 Jul 2024 22:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721365297; x=1721970097;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wL8GXn5mhZoCX1v9B7aEwOLos5mkCyM8J4IMyVBypbs=;
 b=jMUJc/VoiCi8s13VNE0F2j/deGFyWCywJYfM4TnZHumnTg2jl6I1xYh9kXDCtRNM4A
 DV0zsHkMK6G7Cmlvd1WDeMHwE2DfOGCw1K+bI0vL1huGTH2uk5ucV62Q+Meo61zttaPA
 g3pFI63wq/HBlrL9QY0oONdGl7akR54Sbli7WGHJQhvBZn56KWiBps8Y3PoVA224m7yB
 G20ot7uXEfBQK8p6Z13uRlSo6TOGJSh9nYuhVG6RGI6EldCabTT46I4PGVG9W1UaUd/3
 ShFKhQ5xl4g9W+6TO6pi0IcaT5La3hELMp3d0aGBtcq8l2DNTWBaUxXpGeoiPVqdT+vI
 P0Kw==
X-Gm-Message-State: AOJu0YwpCyMUpcSgjZjJy9P+sb6rvshdyblxrILoCSqUH5RLQqG2ljtY
 VU6Y4L28twJuvvwK5t9MllNd2rhylmqgd8QtDgQByaeZ54H3LRQikb8LBA==
X-Google-Smtp-Source: AGHT+IGtWIKtm7q/6Tkj+D1XrzvKnLrhWlym4Oty6YKPlDTYfSedHhBL5eGtw8sNdqkfobRmG4slzg==
X-Received: by 2002:a05:6602:6c1c:b0:803:cc64:e0d4 with SMTP id
 ca18e2360f4ac-81710040da5mr942033439f.3.1721365297140; 
 Thu, 18 Jul 2024 22:01:37 -0700 (PDT)
Received: from james-x399.localdomain (97-118-239-252.hlrn.qwest.net.
 [97.118.239.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4c2342ee53csm178919173.48.2024.07.18.22.01.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 Jul 2024 22:01:36 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 18 Jul 2024 23:01:34 -0600
Message-Id: <20240719050134.3338117-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1721365297; x=1721970097; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wL8GXn5mhZoCX1v9B7aEwOLos5mkCyM8J4IMyVBypbs=;
 b=LoG2T4Jj1V65NXVNkr+v2BJVSk5K8BUgh4ifxq0pLrOMgBsc2dzyLHkF+hNHdJnVCM
 e6dR3+vkBE8Uu0oTBc1hLqNA7JYp/5U2QQRJXh6VVjBHQh4whXXJRj6xnvZmRVViugdW
 lMDjlbW8yk1fdaz6gFroEC8i+s0fSwoWC9QP09/4xbNLtAwAYW38TQdqTmeFzL4Hr+XZ
 hsdvEk3riAe2Wy/6xnnWB2pc3gflhM7RqAbVCA5nspdqPqGjyGCZCLx5ADFa1F7I/b/7
 +Dmdu7Io6zg6ivXRt5kAT9arRXh53eK0d4+KCUxR9i91Gmg48t7esvjS4WLvuAy+DHwH
 cQSg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=LoG2T4Jj
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools-rust: bump to
 version 1.9.0
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
 package/python-setuptools-rust/python-setuptools-rust.hash | 4 ++--
 package/python-setuptools-rust/python-setuptools-rust.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools-rust/python-setuptools-rust.hash b/package/python-setuptools-rust/python-setuptools-rust.hash
index a83288e43a..61d2c8a150 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.hash
+++ b/package/python-setuptools-rust/python-setuptools-rust.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-rust/json
-md5  c5ca990845902dbaa1885f9ad9399988  setuptools-rust-1.8.1.tar.gz
-sha256  94b1dd5d5308b3138d5b933c3a2b55e6d6927d1a22632e509fcea9ddd0f7e486  setuptools-rust-1.8.1.tar.gz
+md5  e3be6366d0d71304ca859edca3c89606  setuptools-rust-1.9.0.tar.gz
+sha256  704df0948f2e4cc60c2596ad6e840ea679f4f43e58ed4ad0c1857807240eab96  setuptools-rust-1.9.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b20668c1590582b3882854050ccfbdb7aee1f71a1ffe9eacc4c5aeb08a14161b  LICENSE
diff --git a/package/python-setuptools-rust/python-setuptools-rust.mk b/package/python-setuptools-rust/python-setuptools-rust.mk
index 1203fbf616..14930501d0 100644
--- a/package/python-setuptools-rust/python-setuptools-rust.mk
+++ b/package/python-setuptools-rust/python-setuptools-rust.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_RUST_VERSION = 1.8.1
+PYTHON_SETUPTOOLS_RUST_VERSION = 1.9.0
 PYTHON_SETUPTOOLS_RUST_SOURCE = setuptools-rust-$(PYTHON_SETUPTOOLS_RUST_VERSION).tar.gz
-PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/f2/40/f1e9fedb88462248e94ea4383cda0065111582a4d5a32ca84acf60ab1107
+PYTHON_SETUPTOOLS_RUST_SITE = https://files.pythonhosted.org/packages/9d/f1/2cb8887cad0726a5e429cc9c58e30767f58d22c34d55b075d2f845d4a2a5
 PYTHON_SETUPTOOLS_RUST_SETUP_TYPE = setuptools
 PYTHON_SETUPTOOLS_RUST_LICENSE = MIT
 PYTHON_SETUPTOOLS_RUST_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
