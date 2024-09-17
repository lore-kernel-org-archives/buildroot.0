Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EB6BCAC5AC
	for <buildroot@archiver.kernel.org>; Tue, 17 Sep 2024 23:26:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7579261185;
	Tue, 17 Sep 2024 23:26:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7D75Ti9B62tm; Tue, 17 Sep 2024 23:26:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 33455611A9
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 33455611A9;
	Tue, 17 Sep 2024 23:26:05 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 347E81BF2FF
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:26:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D3D5041A3C
 for <buildroot@lists.busybox.net>; Tue, 17 Sep 2024 23:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EmjI4XCzUE3C for <buildroot@lists.busybox.net>;
 Tue, 17 Sep 2024 23:26:01 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A5334418AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A5334418AB
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A5334418AB
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 23:26:01 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-82ce603d8daso207416139f.0
 for <buildroot@buildroot.org>; Tue, 17 Sep 2024 16:26:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726615560; x=1727220360;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BcRWWThiBTDMWIDfwkdvS0IDS6hicNtX5ZyyqaASdcY=;
 b=xC+7yCqZw/9j+YG8omrgkTRe39ON4hpeWaBtyuPzrca0lSTmXd7sCgup5tEH5Uu1pG
 6McS2y3UVY6RIMBEBLbvs+knlM0jKDuWFJA7XYYHot/nYDJU8zVQg6LM6aXuj61jIXkw
 J6AbZ8qgNmrCe053zj3ClTI6bzoYpDE9Yb6MSCbwwkIAoCyuSDWzMrhSY2JDoUgJoUhH
 GEnTD4xoEI3AjKhTtrYYgJdBBRHP0H6RFXPgPNgWhre04B3CjbKKBlGT2xHtokP3Dd8M
 UllS2hSQO8gZl62W7A6d9QENzh8Fra3An9KKjNLdsJWvo8+fA4mhqXuf3lwk+f5Q23NM
 AZKw==
X-Gm-Message-State: AOJu0YxHTS8owYvEVuzYar/dtWsToGmG02ied69sOyexylA/+/zMMN7v
 Z97a40dkafiWVWeaGXH/zeMYfDgrYGqsL9ZWGT2QKXXkfYnpObDjr/CR/muV
X-Google-Smtp-Source: AGHT+IH38ApfHEnAIqgHzOZe2RKb44OJ3n7tCOTLqJVrjkO6aODCzJaxYR13LhwFd/gDompXeTUstQ==
X-Received: by 2002:a05:6e02:17cb:b0:3a0:9159:1561 with SMTP id
 e9e14a558f8ab-3a0915919b7mr119714995ab.2.1726615560309; 
 Tue, 17 Sep 2024 16:26:00 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ec17e9bsm2172996173.53.2024.09.17.16.25.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Sep 2024 16:26:00 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 17 Sep 2024 17:25:58 -0600
Message-Id: <20240917232558.396111-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726615560; x=1727220360; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BcRWWThiBTDMWIDfwkdvS0IDS6hicNtX5ZyyqaASdcY=;
 b=C8oB4etoHStiRh1yrpiCTyr1vXv8Iq+508xp3/4/cED0EUgW6iRsldwKNuKdsWUnOi
 jOSBJ5ahP3YhifXc5OlVIyDAzhj4tuTfpqB53++YpIslCz4F368aIcotxN3/LIsV0gQz
 R9iC+WYm2+BAPJwZfGXAJI+xit3Mdlqf76MeMUOu0axVSES+Z0u5i0ZdjPGsDfTwkjDS
 FSl1vevowO3IoGk0YEOWYSQ1s2ny2SA+gLwVSb2RGNb0v3QX624QzDtihIdxDPHDcn25
 O2eZEv34NmUzyCWBoRs/nMXSRk8oJGn3E5ePh7ZHLMheSFdZYMvXX++yr1jAX3sN1LIo
 UQaQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=C8oB4eto
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 24.2.1
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
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index fb5f75db96..6c968eff16 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  4c4f6f9e1c731b8ee7adcd9fbeccec62  pyOpenSSL-23.3.0.tar.gz
-sha256  6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12  pyOpenSSL-23.3.0.tar.gz
+md5  4e41c41b8a14ac141dde132c348aaf5d  pyopenssl-24.2.1.tar.gz
+sha256  4247f0dbe3748d560dcbb2ff3ea01af0f9a1a001ef5f7c4c647956ed8cbf0e95  pyopenssl-24.2.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 9865f2bb00..077322131f 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 23.3.0
-PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/bf/a0/e667c3c43b65a188cc3041fa00c50655315b93be45182b2c94d185a2610e
+PYTHON_PYOPENSSL_VERSION = 24.2.1
+PYTHON_PYOPENSSL_SOURCE = pyopenssl-$(PYTHON_PYOPENSSL_VERSION).tar.gz
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/5d/70/ff56a63248562e77c0c8ee4aefc3224258f1856977e0c1472672b62dadb8
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
