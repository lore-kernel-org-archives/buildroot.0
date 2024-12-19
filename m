Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1035E77188
	for <buildroot@archiver.kernel.org>; Thu, 19 Dec 2024 01:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5D0A161AF2;
	Thu, 19 Dec 2024 01:20:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id h3stcVTQIzYr; Thu, 19 Dec 2024 01:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 66A8361B04
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66A8361B04;
	Thu, 19 Dec 2024 01:20:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id D676ECE
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:20:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id B73A9851D6
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:20:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id FQMf8p_vtNQM for <buildroot@buildroot.org>;
 Thu, 19 Dec 2024 01:20:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::130; helo=mail-il1-x130.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B1372851D1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B1372851D1
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com
 [IPv6:2607:f8b0:4864:20::130])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B1372851D1
 for <buildroot@buildroot.org>; Thu, 19 Dec 2024 01:20:21 +0000 (UTC)
Received: by mail-il1-x130.google.com with SMTP id
 e9e14a558f8ab-3ab37d98dd4so845955ab.3
 for <buildroot@buildroot.org>; Wed, 18 Dec 2024 17:20:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734571220; x=1735176020;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cMo5+v8AjipObP9+pvL15jrmGFRWTflK9CWqDgWm924=;
 b=g5040cJpka90iMkrGwS4jkhFUv3x79e/7T1a3S5KRramz3Bm5Sc7cXeC51Jl9P2MEu
 zOIjiTHQPeUy1rQWGP4ezSVnYwz88r2/ZOZQIL9toaPII53nmNrMkfwfmvmIzjApPZke
 roqpk9+ScIxHmq5s9ez2lOqilPeha0MGmpJ05zw4/lX6UeLeTze3QjgRQSy/NFPYB06W
 O1nifDd/6XTU6r8kdNEkYsAa3zPUT5vsaVVhuuhkbgSn3qn0YqfPAeVOazxuIBMc4msg
 43IMpZVWAwP17rqrZLVNiUmgo4U4UDWtDVkzbl6yezuD9Q/qTbcdKTjDrc+EBjwjMh9j
 GARA==
X-Gm-Message-State: AOJu0YyOgtgb/c2aZrzYUulKyusAlZpTVnZuk7DVtwCmA3j0BIb6ehTC
 V1/nlqZtGHNVuQCes920bDavzipaMfKbR9qJbZG5mRmqUenecb6YP5W3yq/rWd8=
X-Gm-Gg: ASbGncuO/48TFmO61BFduN4VxNF4p8vOmSXDz0sqlWJPrRuRosO87nMSIGXDr75hKfv
 h1/BwKt7BT+JhQmVvK5sUkaZZBY5CaCLayKqAxNYBb1hEg1LmJLDk/6Mer6OklDlzBXNgsN4Gen
 W6T+0LKdK7bRI2CIhxHxDkUb4EqVxkj4FTB6VdKwK5AJzun9MdzYEz7sB8l0jjqgA93/aJrB8tx
 EicnvHtTzJgl+TAuMDd1TIBr2ScEFkBwqc3cId84qlyplGTmcw9i0MscDoaX+/pDVM1YYaLSkrp
 ptOJhrWxsIIV/7zg6YYp7vEYw9c0OXe+oQ==
X-Google-Smtp-Source: AGHT+IGVb/I5Qfd4lVnsUa9NH2yhUAT3611Lfomzu6JMGEkiS8Vw3gaiktmB0v43nheTo6TAV6FJhg==
X-Received: by 2002:a05:6e02:3dc7:b0:3a7:8720:9de8 with SMTP id
 e9e14a558f8ab-3c0110b229cmr16477125ab.5.1734571220261; 
 Wed, 18 Dec 2024 17:20:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 e9e14a558f8ab-3c0df949ad8sm451875ab.33.2024.12.18.17.20.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 17:20:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 18 Dec 2024 18:20:18 -0700
Message-Id: <20241219012018.239934-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734571220; x=1735176020; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cMo5+v8AjipObP9+pvL15jrmGFRWTflK9CWqDgWm924=;
 b=Vzw0txi8Vy08qBbb4g0f4sRIwpIZ8GjkYycUhJ9csUJ1nhpGGRhp3vrHNwSe28kNO8
 uJM2dv+Sojn1xj+ldJvis1xWQi2nZjszjJ2Y71uwiCcpYWH7unhckh113En0BEf7zpZC
 zG6S1A0FwaByks6Ep7fB/cqOmPrU0xcW6W5CEjepUkjVODwv7U/4U3FMkp8qBtqZCTHA
 gOngDmiOVpfnmiiM4/B9JeV8AMT0rI4zLs9McfxtyxQ8laP4vej/T0YgMQ5fCRoW0ap6
 RJ0D82YxUWIKusz5lDC/vVoj1Bhhf2qWWPI6RoPu7QeeC5o9ieFA3HwDOFLLJxk9w7Ya
 ZKvQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Vzw0txi8
Subject: [Buildroot] [PATCH 1/1] package/python-anyio: bump to version 4.7.0
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

Add new python-typing-extensions runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-anyio/Config.in         | 1 +
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/Config.in b/package/python-anyio/Config.in
index d843f37af0..353c7e4629 100644
--- a/package/python-anyio/Config.in
+++ b/package/python-anyio/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_PYTHON_ANYIO
 	bool "python-anyio"
 	select BR2_PACKAGE_PYTHON_IDNA # runtime
 	select BR2_PACKAGE_PYTHON_SNIFFIO # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  High level compatibility layer for multiple asynchronous
 	  event loop implementations.
diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index cfd65ee92f..6896b7d516 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  3aae01d9007bd08538158c7a7fa18c39  anyio-4.6.2.post1.tar.gz
-sha256  4c8bc31ccdb51c7f7bd251f51c609e038d63e34219b44aa86e47576389880b4c  anyio-4.6.2.post1.tar.gz
+md5  6d0431fec06206d2bdbf57d449f1616b  anyio-4.7.0.tar.gz
+sha256  2f834749c602966b7d456a7567cafcb309f96482b5081d14ac93ccd457f9dd48  anyio-4.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 74c49c2e73..8c814abfdd 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.6.2.post1
+PYTHON_ANYIO_VERSION = 4.7.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/9f/09/45b9b7a6d4e45c6bcb5bf61d19e3ab87df68e0601fa8c5293de3542546cc
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/f6/40/318e58f669b1a9e00f5c4453910682e2d9dd594334539c7b7817dabb765f
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
