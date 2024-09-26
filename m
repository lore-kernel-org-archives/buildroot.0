Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5375ECDE01B
	for <buildroot@archiver.kernel.org>; Thu, 26 Sep 2024 15:58:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E5CEF41167;
	Thu, 26 Sep 2024 15:58:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QE5m_3SBE-Iz; Thu, 26 Sep 2024 15:57:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A268141157
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A268141157;
	Thu, 26 Sep 2024 15:57:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A52831BF30D
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:57:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9FCC641167
 for <buildroot@lists.busybox.net>; Thu, 26 Sep 2024 15:57:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zpNwR26XLS1g for <buildroot@lists.busybox.net>;
 Thu, 26 Sep 2024 15:57:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::129; helo=mail-il1-x129.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7EA2141187
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7EA2141187
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com
 [IPv6:2607:f8b0:4864:20::129])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7EA2141187
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 15:57:57 +0000 (UTC)
Received: by mail-il1-x129.google.com with SMTP id
 e9e14a558f8ab-3a1a3090f39so4321985ab.3
 for <buildroot@buildroot.org>; Thu, 26 Sep 2024 08:57:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727366276; x=1727971076;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MSjqOhhezT1uospmPENuwj1ainjwF6j2W7nnXKuEPU8=;
 b=tylXJAo1ujE+qSmjyz6ele7xvxaSPWgQbEqWDAB1Q1GztpLcSB1GxnUmzvOCaJNBRR
 P39STc4NEyPUlA1yvqIpfIB8K87fG9K6Dx9jjrTOVuWGu+54P4IDba8JugpsO92kT5DM
 vPrw1GChiP4YPQaM3uhUTpDzNDbfLLFgLiBQSFEPjdLoljcQB8ATjWyru25NyQoYu1f7
 87jOm3uvQer2S29Dyh0k5LYK/v1jkA070JH5UKY6Cc+jDnFZi3fTSGhWf5pmYASVUXhm
 dBlMIJIjett0e/ITtHrlIoUdG2W0HR+Ak/nL3RrcGLSPvs8/hKLs0/fCgxFqofZzZVC3
 R+2A==
X-Gm-Message-State: AOJu0YwrB2y7Lo1LGo5hY+kG8R2u4oa0J5JGeLiMz8GGf6O9lJj00PXn
 cCslUMlTV/hB3IYV9rx3iopF/JklnZVK80RdQyqZs6a7vvGi6kHdxuuEPA==
X-Google-Smtp-Source: AGHT+IFE49lSRRpIu19WhyMXlVaIhdwEIfAxYhpWG/GSeJ1SgttNMo7sIcZWazZ1Zir4aLuhNOeiKg==
X-Received: by 2002:a05:6e02:1d08:b0:3a0:4d1f:519c with SMTP id
 e9e14a558f8ab-3a26d6ddce5mr76613645ab.3.1727366276202; 
 Thu, 26 Sep 2024 08:57:56 -0700 (PDT)
Received: from james-x399.localdomain (71-33-156-34.hlrn.qwest.net.
 [71.33.156.34]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d8888c2b4fsm18755173.86.2024.09.26.08.57.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Sep 2024 08:57:55 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 26 Sep 2024 09:57:54 -0600
Message-Id: <20240926155754.44832-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727366276; x=1727971076; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MSjqOhhezT1uospmPENuwj1ainjwF6j2W7nnXKuEPU8=;
 b=DarcpWWLHSOPbchorx1BLBHzGab/nasCQcamVXvlKpJL+lJAdhsghpIdD+YN2txDax
 cvQSUMMCRN02DjRGJRSjumJRUSrsstTSXwN7wAPxrwsDWbHuedRabCfbzvyuBHfXIRVZ
 G33bk/EWupj+aYIzA2tN1r9VdrzdUkoiRcHnFDj1tlgWtkTt5LsGoRgnP8KybJVIZUov
 t34xVr7wvqeSI40stUFBY9QKe+7hJ1XSHeYlu88DP9GLa+XLEdYDEgQaqW0hfBusU3uz
 5fEdbOtJ8jWKmK3ztcogZzk/2uksi6BQK6qzef5u0Cp/kgb8wmfAsQnoh2nw1Y8jPKJL
 4tZg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DarcpWWL
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.35.27
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
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index 3bb00446d6..4abd9ca4ea 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  cd8e35723318fb0d66604ee290804bd9  botocore-1.35.19.tar.gz
-sha256  42d6d8db7250cbd7899f786f9861e02cab17dc238f64d6acb976098ed9809625  botocore-1.35.19.tar.gz
+md5  36c20cc947094f913c16c1109b13fdd3  botocore-1.35.27.tar.gz
+sha256  f68875c26cd57a9d22c0f7a981ecb1636d7ce4d0e35797e04765b53e7bfed3e7  botocore-1.35.27.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 24caf71b91..cc7b9949a2 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.35.19
+PYTHON_BOTOCORE_VERSION = 1.35.27
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/68/e4/d0114af2ec0495c7b415b5a739a3f5b7c35a4e0b7ecfd1a7ea533606f834
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/7d/b8/ffe0d717da12ff6028466b28d79b0d8f53d64ad7ddd33326fd55860d29ee
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
