Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A255AC4707B
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 07:37:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22F2C83E53;
	Thu, 11 Jan 2024 07:37:31 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22F2C83E53
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id mgBaO3ah2jEs; Thu, 11 Jan 2024 07:37:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 65E1F83E44;
	Thu, 11 Jan 2024 07:37:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 65E1F83E44
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 2B8261BF2C7
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:37:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 11865614BD
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 07:37:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 11865614BD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id pPn60Gj8cz1V for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 07:37:27 +0000 (UTC)
Received: from mail-il1-x12d.google.com (mail-il1-x12d.google.com
 [IPv6:2607:f8b0:4864:20::12d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2F1DA60ADF
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 07:37:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2F1DA60ADF
Received: by mail-il1-x12d.google.com with SMTP id
 e9e14a558f8ab-36082f3cb05so18010495ab.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 23:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704958646; x=1705563446;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=sRzb2vMe8+A4r7d84eaLcheKcYonHvuMcjNW5fkSHAo=;
 b=O2odVLTQhYTtguacfBZGMpLr8WswQTLXDWnQ97SEUkVIZavvx3lWUNznrc1OkOo+2G
 0ivKtrw+fWd8cIklCHV6HvIMjHFgpf1STjU0gUGohtbG/Gs5fJmIHwez7+kBjMWif2Ig
 6ajWYCYdbws3R9gZN33aVSL4++HeovyD+uk1aRu7s7GNyR8AFG7LdJCO/KsKmqozgBPm
 +TXg3Rq6xcgFwkQEJSDEqK05nITjaJ52jCYDHbyuKXNn2IUWNIEyBLQJhlHUUueUrQp9
 3yVONv9ZCoI92bDJ6I7E8//e03p7fleQgBc24DeBUUPTOmkqIAqALh16BVHLE1MOpmT+
 gCOg==
X-Gm-Message-State: AOJu0YzOj5aay3glbaohmCL3ZzRd35ffJxHUTrgZAiGZ2EhKrASgnu10
 hX4n8f9nPeychoqJCXE/pm587haeIf5g2g==
X-Google-Smtp-Source: AGHT+IENQSgFVGBnyFOXvcDuoDZVBecBl6FAOZjHsWZPrJQQMc6zED80unpKR2c9OQfxyJcweYKXXA==
X-Received: by 2002:a05:6e02:cd1:b0:360:7668:f8ad with SMTP id
 c17-20020a056e020cd100b003607668f8admr765696ilj.63.1704958645870; 
 Wed, 10 Jan 2024 23:37:25 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 q11-20020a92d40b000000b00360897305afsm128595ilm.86.2024.01.10.23.37.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 23:37:25 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 11 Jan 2024 00:37:24 -0700
Message-Id: <20240111073724.3087490-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704958646; x=1705563446; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=sRzb2vMe8+A4r7d84eaLcheKcYonHvuMcjNW5fkSHAo=;
 b=YJ/rtORNX675RnG/k/8paKEs7a8onO8J6RmorZfEmCIvKHT8PAfThtCH7NJ6qcUXfE
 Vshd4JiP4CW0XYoua40cn8qlBz6i57zCpJqQuIZGVulq03QDJ4uk5Sn7328hR3Byjc9Y
 52B86dU5fbwwY+D6c8sxbSqx+F2hVG6booU+CzheH9u9KuNUZZIdDPc7S7eKjR/jiFnd
 MzAgKh45726i+2aU/ZEVJW0DhT3o8GAxCtRxrCwEyExMXVrhh/gZDh9JAy1d/BUA+qHn
 1DrT6Pr/+VYwMg/MMrz1i5xgj+nie5d0+TcYV3afEGckqB2Dy0AfOzYo2t3hCwJ/1R8c
 HoWA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=YJ/rtORN
Subject: [Buildroot] [PATCH 1/1] package/python-tempora: bump to version
 5.5.0
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

License hash changed due to copyright notice removal:
https://github.com/jaraco/tempora/commit/5957d58266e479f124b31f30e4322e798fdf386b

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tempora/Config.in           | 1 -
 package/python-tempora/python-tempora.hash | 6 +++---
 package/python-tempora/python-tempora.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-tempora/Config.in b/package/python-tempora/Config.in
index 508cbae3f3..3f4481422a 100644
--- a/package/python-tempora/Config.in
+++ b/package/python-tempora/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_TEMPORA
 	bool "python-tempora"
 	select BR2_PACKAGE_PYTHON_JARACO_FUNCTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	select BR2_PACKAGE_PYTHON_PYTZ # runtime
 	help
 	  Objects and routines pertaining to date and time.
diff --git a/package/python-tempora/python-tempora.hash b/package/python-tempora/python-tempora.hash
index ac6483b77f..ff7093394f 100644
--- a/package/python-tempora/python-tempora.hash
+++ b/package/python-tempora/python-tempora.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tempora/json
-md5  87fc0d99edd557323e61a16017707a8b  tempora-5.2.0.tar.gz
-sha256  af82eb016decda8daf566d1e4836f94f7f8ba8c7153637460156e081aadc64df  tempora-5.2.0.tar.gz
+md5  39314c5843bc3f40f8ce4f5cc340c479  tempora-5.5.0.tar.gz
+sha256  13e4fcc997d0509c3306d6841f03e9381b7e5e46b2bebfae9151af90085f0c26  tempora-5.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-tempora/python-tempora.mk b/package/python-tempora/python-tempora.mk
index 3074ad0de2..d1b333ec0a 100644
--- a/package/python-tempora/python-tempora.mk
+++ b/package/python-tempora/python-tempora.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEMPORA_VERSION = 5.2.0
+PYTHON_TEMPORA_VERSION = 5.5.0
 PYTHON_TEMPORA_SOURCE = tempora-$(PYTHON_TEMPORA_VERSION).tar.gz
-PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/97/70/5cf5031a83ca6d0431a53459b2a98aa387ba23d06710a5e48d681ff3956f
+PYTHON_TEMPORA_SITE = https://files.pythonhosted.org/packages/c9/dc/97d90b9f64dbe4f599023e19602b33a2cced68462db67a3d4805a77cf784
 PYTHON_TEMPORA_LICENSE = MIT
 PYTHON_TEMPORA_LICENSE_FILES = LICENSE
 PYTHON_TEMPORA_SETUP_TYPE = setuptools
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
