Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D60CBC61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 05:06:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2E48061521;
	Sat, 25 Nov 2023 05:06:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2E48061521
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id L5bC3F7afY9d; Sat, 25 Nov 2023 05:06:42 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 88C456150E;
	Sat, 25 Nov 2023 05:06:41 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 88C456150E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 55A421BF4E5
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 371836150E
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 05:06:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 371836150E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 86f0gRn7fIYY for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 05:06:38 +0000 (UTC)
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com
 [IPv6:2607:f8b0:4864:20::d2c])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3F45861506
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 05:06:38 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3F45861506
Received: by mail-io1-xd2c.google.com with SMTP id
 ca18e2360f4ac-7b06844971dso77652339f.2
 for <buildroot@buildroot.org>; Fri, 24 Nov 2023 21:06:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700888797; x=1701493597;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lxkh/qdr8UcWpF2J60jlPtgxaHnsfQ51RIgkqQNXm7I=;
 b=LAzMCqGEp8lHYgDex6BHByUiHsByH5T8gCGdcUnaorLtBpUu0FCxHFwka1n0CXgAEZ
 YziubzQehPhg1f4uy4PtZTbhYSop2bfXjPQnqwqmD1hOA1Cj6wAOw5RwseybP4ku1HQX
 z7z5uKxepCTRsmEEzsDcm2tocGiYur25BMxY+d+m/sFnskqCzVyFGMeIgrj8WN37aGPG
 ut39ShT5pYK1pm5OaXZxPn/PAXv3QTzc3nHHmEV5CuhMAbGf6Mh6Hwmr7B7WE3TkfgdH
 zxukJdNS7Ba86/fiaTpbkdmhM6N1Xw3KgJZkREHM5fk29m3TioH0t3dO1OhnaKZpf9BQ
 x0+w==
X-Gm-Message-State: AOJu0Yx0wlk+eUgmkTQHaaMorhunirU9N/gNBlkQloDiAzfVsOkJEgd6
 FH+zmQCDCQbRpQGTNUbKkQrU9fTxbsU=
X-Google-Smtp-Source: AGHT+IHPJctG38LPFbv+CFyzARF1Ep7YMzpNBrRuGmL8mp6NQnNz8Nf06q3dbdCAIw5x3Dz8WtHinA==
X-Received: by 2002:a05:6602:3048:b0:7b0:af11:3ba6 with SMTP id
 p8-20020a056602304800b007b0af113ba6mr5655368ioy.14.1700888796847; 
 Fri, 24 Nov 2023 21:06:36 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 d5-20020a6b6805000000b007b357e0573dsm1258566ioc.7.2023.11.24.21.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Nov 2023 21:06:36 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Nov 2023 22:06:25 -0700
Message-Id: <20231125050625.264961-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700888797; x=1701493597; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=lxkh/qdr8UcWpF2J60jlPtgxaHnsfQ51RIgkqQNXm7I=;
 b=X2yHtRlQvST2b1gav9oeCvST6hbckAoJvEtC2SRAY+K2VP6MKgqtgbc54zbSEY/OJa
 TAabPO3T2XLcfiWbGf5nqyZEu4dwI6/C0HMhMDxKNqu53k2J0X1iBC+Yb228hrB4jSdv
 Y1ihaaSIaA0LTBsDdFaz8sO8s2mQ3MsMvCYcFLhVl/e0yTlHcUCOzKXApQrIURGR1i6L
 UQS7ZK8pyMW9KQbDMLEZs75A+dqrldlM1oIwReP8g4qwCnh4S56NHeNayLPyjpifw4aP
 PIoL9lF5HQxC3WRzOhgqm56VkxujoklXOWgZDyTO/7hGVYFGkPtaG2MfTIzhmFYOTnNq
 w2kw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=X2yHtRlQ
Subject: [Buildroot] [PATCH 1/1] package/python-pathspec: bump to version
 0.11.2
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
 package/python-pathspec/python-pathspec.hash | 4 ++--
 package/python-pathspec/python-pathspec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pathspec/python-pathspec.hash b/package/python-pathspec/python-pathspec.hash
index 5eb76cb5f9..01177b7428 100644
--- a/package/python-pathspec/python-pathspec.hash
+++ b/package/python-pathspec/python-pathspec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathspec/json
-md5  d89408b52aff020ac768a14c0ef1c7de  pathspec-0.10.3.tar.gz
-sha256  56200de4077d9d0791465aa9095a01d421861e405b5096955051deefd697d6f6  pathspec-0.10.3.tar.gz
+md5  92ebd6d735d261952ff99d64083eeff4  pathspec-0.11.2.tar.gz
+sha256  e0d8d0ac2f12da61956eb2306b69f9469b42f4deb0f3cb6ed47b9cce9996ced3  pathspec-0.11.2.tar.gz
 # Locally computed sha256 checksums
 sha256  fab3dd6bdab226f1c08630b1dd917e11fcb4ec5e1e020e2c16f83a0a13863e85  LICENSE
diff --git a/package/python-pathspec/python-pathspec.mk b/package/python-pathspec/python-pathspec.mk
index e88bce231f..d32b6a56e1 100644
--- a/package/python-pathspec/python-pathspec.mk
+++ b/package/python-pathspec/python-pathspec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHSPEC_VERSION = 0.10.3
+PYTHON_PATHSPEC_VERSION = 0.11.2
 PYTHON_PATHSPEC_SOURCE = pathspec-$(PYTHON_PATHSPEC_VERSION).tar.gz
-PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/32/1a/6baf904503c3e943cae9605c9c88a43b964dea5b59785cf956091b341b08
+PYTHON_PATHSPEC_SITE = https://files.pythonhosted.org/packages/a0/2a/bd167cdf116d4f3539caaa4c332752aac0b3a0cc0174cdb302ee68933e81
 PYTHON_PATHSPEC_LICENSE = MPL-2.0
 PYTHON_PATHSPEC_LICENSE_FILES = LICENSE
 PYTHON_PATHSPEC_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
