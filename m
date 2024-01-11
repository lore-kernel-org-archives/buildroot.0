Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9040C47073
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 02:14:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5F44A43791;
	Thu, 11 Jan 2024 02:14:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5F44A43791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8GYMfwwZMvKN; Thu, 11 Jan 2024 02:14:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3D5C3437CD;
	Thu, 11 Jan 2024 02:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3D5C3437CD
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 9F3331BF588
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 77867611CE
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 02:14:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77867611CE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CqmTPHvkvOFA for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 02:14:37 +0000 (UTC)
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 93002611BA
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 02:14:37 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 93002611BA
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-7bc3e297bc9so220879239f.3
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 18:14:37 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704939276; x=1705544076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=G9uJmgb10Ig4i2drjZKE/6B4qxaMQw7w6eFn1yF1kXE=;
 b=hDyM3Yb1tSkSQtq2N+qIKABgEAeAczaCJmgnu/AeeOWfDn0pddZGDoE+BgUsv2GS7X
 yf6jbzb2znBz8ZjKSK3gJaIpnONPiYwNvwxqtJZYDX6rgR3iUil/qMtuFh0M5pcBhXSY
 HaDp3YrKgVIpG0ZxgUjNQB55xCSYSCRWyjO5xQ1cHoLV6orXwEFNRQuecRV02XRPGpic
 KP6VVSRiDr0YM8+07Zr6DynHzEK7NKhglil5BXTy4wS0p7LlLC8JoE91SSPA3F7LNlWr
 4LI5oDYdRUVNrirenoFraRwjwRqElv81GBALex5SUos9E0Ti5gZEwF8GVS8LzW8mCZQp
 lm5g==
X-Gm-Message-State: AOJu0YwifzVRqX6V4GdlzEvJDhRZkmhmcG+Iv/7vzlf0n5V19421zhxM
 WNBApzS3rqeIySaKcF92nFYOrLddYMyjzA==
X-Google-Smtp-Source: AGHT+IFh8IzUjKyrXiu019uE7YxwMG1s5qG1Xj1nSk9VYaYszC7ZwCS67sV3dBhQgyRynKgHUnH4lg==
X-Received: by 2002:a6b:7713:0:b0:7bb:296d:34fa with SMTP id
 n19-20020a6b7713000000b007bb296d34famr583139iom.12.1704939276231; 
 Wed, 10 Jan 2024 18:14:36 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 j27-20020a02cc7b000000b0046dcfe79c7bsm36152jaq.84.2024.01.10.18.14.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 18:14:35 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 19:14:34 -0700
Message-Id: <20240111021434.2655120-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704939276; x=1705544076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=G9uJmgb10Ig4i2drjZKE/6B4qxaMQw7w6eFn1yF1kXE=;
 b=ljoDGVUEBKFEwgdQoj6DtYeBEK2OOVlQl4J0iE4p0R0HoW5+RRCtDoGAdCc23Uh9M6
 rbVdKE5dFhdHihPRjGAKyefYMqmdE7xMQZb5MfHnRE52SNnWFus+tYHfHIwkYYrMMKrj
 NsR06oMxwa/LiNsRF1DdFi4oJF/poNa8vSoqszWtZhWhD+0JBF53ZdtVmV5WqyDytRQ7
 6q3NeMiJZbAxDLXnuxwdz5q9S+wtgJ63/fFMa7mTiM1a/H3pTntSW3w3sQ9gxfJebvHD
 Tlz2GcA7bbIHOA3OTzkmrDEUrzHLLKaOMOfiwZzyzk2Ctjkj4orFxvSZKYIB3XtrSsxk
 ijzw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ljoDGVUE
Subject: [Buildroot] [PATCH 1/1] package/python-pyrsistent: bump to version
 0.20.0
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

License hash changed due to year update:
https://github.com/tobgu/pyrsistent/commit/acdffe6967a821165155ac16bee48054fd61385a

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pyrsistent/python-pyrsistent.hash | 6 +++---
 package/python-pyrsistent/python-pyrsistent.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyrsistent/python-pyrsistent.hash b/package/python-pyrsistent/python-pyrsistent.hash
index d5c9a22656..780a7f09d9 100644
--- a/package/python-pyrsistent/python-pyrsistent.hash
+++ b/package/python-pyrsistent/python-pyrsistent.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyrsistent/json
-md5  761266eab1f9dc9280cdb0a6d2dedb08  pyrsistent-0.19.3.tar.gz
-sha256  1a2994773706bbb4995c31a97bc94f1418314923bd1048c6d964837040376440  pyrsistent-0.19.3.tar.gz
+md5  dce0f9a13668dbf8bb76f74954b4a42a  pyrsistent-0.20.0.tar.gz
+sha256  4c48f78f62ab596c679086084d0dd13254ae4f3d6c72a83ffdf5ebdef8f265a4  pyrsistent-0.20.0.tar.gz
 # Locally computed sha256 checksums
-sha256  3ea56753cbd0cc897d3f4414a902f5694991db7c1b3abb8230216381185f9112  LICENSE.mit
+sha256  3fd3d3d1ab9c733ee453fbf3bbbaa845440d0d8c20d7b5a039d2e46a2ed7fc01  LICENSE.mit
diff --git a/package/python-pyrsistent/python-pyrsistent.mk b/package/python-pyrsistent/python-pyrsistent.mk
index f3457feebe..6c52d7dbc8 100644
--- a/package/python-pyrsistent/python-pyrsistent.mk
+++ b/package/python-pyrsistent/python-pyrsistent.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYRSISTENT_VERSION = 0.19.3
+PYTHON_PYRSISTENT_VERSION = 0.20.0
 PYTHON_PYRSISTENT_SOURCE = pyrsistent-$(PYTHON_PYRSISTENT_VERSION).tar.gz
-PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/bf/90/445a7dbd275c654c268f47fa9452152709134f61f09605cf776407055a89
+PYTHON_PYRSISTENT_SITE = https://files.pythonhosted.org/packages/ce/3a/5031723c09068e9c8c2f0bc25c3a9245f2b1d1aea8396c787a408f2b95ca
 PYTHON_PYRSISTENT_SETUP_TYPE = setuptools
 PYTHON_PYRSISTENT_LICENSE = MIT
 PYTHON_PYRSISTENT_LICENSE_FILES = LICENSE.mit
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
