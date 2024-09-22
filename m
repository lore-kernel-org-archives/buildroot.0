Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD26CF9C68
	for <buildroot@archiver.kernel.org>; Sun, 22 Sep 2024 06:39:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id CEB0B4011C;
	Sun, 22 Sep 2024 06:39:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 62FLrQ4aQWLc; Sun, 22 Sep 2024 06:39:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8094E402E4
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8094E402E4;
	Sun, 22 Sep 2024 06:39:13 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A00D31BF86C
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:39:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EF35606CA
 for <buildroot@lists.busybox.net>; Sun, 22 Sep 2024 06:39:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id m7uFb4Ch_Cz8 for <buildroot@lists.busybox.net>;
 Sun, 22 Sep 2024 06:39:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2c; helo=mail-io1-xd2c.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 87A0B606B1
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 87A0B606B1
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 87A0B606B1
 for <buildroot@buildroot.org>; Sun, 22 Sep 2024 06:39:11 +0000 (UTC)
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-831e62bfa98so167020439f.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:39:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726987150; x=1727591950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BayL1XIqS/Mb9qVRw17kfwguSzC5X2clYR4/sjSAdrU=;
 b=Nr5TqEC0pT0Q/GbUsDNTcvJpIZ/KEqs0w4BgR4hGaT8F8tsRYMS2rsSCZ0s3lk12f5
 3SLUyWbm+h1/d1Cb8B9QJNlasi5G4KEWuF/i/3NTXbU3j5JugOkEKaXdNNTKBQIX2fCS
 c5GPXdBDfom9vekqLIExnlVxVav+OTXDajvKwWIEgj//+pa2aFtL9oGYPXx1xNGa5oSm
 iAAbSI0y+9np6je6FMnBshwjJcXuCg/2+1RPGIg3ys4FG+zkPVf9Wv1jIgd9atz7NXWu
 88fXENaq0W5ewSxjGmFFbkOV50rPQyo7CTYW9UkKqQTLvAoBA24Ex5CzwIqkPIFmHh32
 ypTw==
X-Gm-Message-State: AOJu0YyVJBMR3XjoTcLh1CKt6R+q7ANG76pk57DbkcinKP/WlykhrfsQ
 G3TKJn2TWZw4//j5a+ioowmiEXtk4hcx3T72nyUMoRHhSuqUuomHpUfnyg==
X-Google-Smtp-Source: AGHT+IFmUi5ikehwQl/VgGCIINU0Mj3N3YG9UufY28aqP2L4RVoBkpXg9PpmJ9NgzcHyF0nbcYz4QQ==
X-Received: by 2002:a05:6e02:184e:b0:39f:797a:65f8 with SMTP id
 e9e14a558f8ab-3a0c8d09220mr62620975ab.19.1726987150205; 
 Sat, 21 Sep 2024 23:39:10 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec3cfc3sm4494276173.73.2024.09.21.23.39.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 23:39:09 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 22 Sep 2024 00:39:08 -0600
Message-Id: <20240922063908.975418-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726987150; x=1727591950; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BayL1XIqS/Mb9qVRw17kfwguSzC5X2clYR4/sjSAdrU=;
 b=iS8y5qluqZwhICA0UXjAI5xmVqNPy8oE+Rl5jT17FV1IZHmi4qm9yApPTdLtIHw3J0
 vIWE0Nd4ocSwXc1g/VKnFK7L739xOmddLe5a8Hay/pxUASVIZeS14Fv0W/wdoHu92IX4
 URIJQ9245mqtMXMOx27OX8TAbNdm19oOGHLq/Oy6SclfBbOM58T6YcFp0v5KvmvlBvKk
 JbFZn9aseayh4LTUMA1d2icBhiv9wFoEGQJT9fUH4hWGVEwS820LPASYiV6OOghamNTP
 JRG4bGwM8wztNRiblkyN99hc+X2oKhAWk+4iJgYVULSTD1npKhLeeyedp1d9BcEj1D6b
 P1TQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=iS8y5qlu
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 13.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-websockets/python-websockets.hash | 4 ++--
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index 33d28745b0..5d24d5f6c4 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5  b3d1cc7a447c4f91b0c6f24beaf312cc  websockets-13.0.1.tar.gz
-sha256  4d6ece65099411cfd9a48d13701d7438d9c34f479046b34c50ff60bb8834e43e  websockets-13.0.1.tar.gz
+md5  ff1293b549e8177a5272e54208659d0d  websockets-13.1.tar.gz
+sha256  a3b3366087c1bc0a2795111edcadddb8b3b59509d5db5d7ea3fdd69f954a8878  websockets-13.1.tar.gz
 # Locally computed sha256 checksums
 sha256  3d6a0c050d8bec52fabad502e45fb25bd02bcadbd70dea34d447b6a0ff4e6da8  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 00d69f9ddd..6fbdf983e9 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 13.0.1
+PYTHON_WEBSOCKETS_VERSION = 13.1
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/8f/1c/78687e0267b09412409ac134f10fd14d14ac6475da892a8b09a02d0f6ae2
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/e2/73/9223dbc7be3dcaf2a7bbf756c351ec8da04b1fa573edaf545b95f6b0c7fd
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
