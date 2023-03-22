Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C8BEC6FD20
	for <buildroot@archiver.kernel.org>; Wed, 22 Mar 2023 00:07:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6C58F40465;
	Wed, 22 Mar 2023 00:07:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6C58F40465
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id qtOXGTeVTvvH; Wed, 22 Mar 2023 00:07:20 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id AD54140A54;
	Wed, 22 Mar 2023 00:07:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org AD54140A54
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 50FA11BF5F5
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:07:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 39671403B7
 for <buildroot@lists.busybox.net>; Wed, 22 Mar 2023 00:07:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 39671403B7
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 593gXMl4kFAl for <buildroot@lists.busybox.net>;
 Wed, 22 Mar 2023 00:07:17 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 46FBC40154
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 46FBC40154
 for <buildroot@buildroot.org>; Wed, 22 Mar 2023 00:07:17 +0000 (UTC)
Received: by mail-io1-xd2d.google.com with SMTP id p17so6014225ioj.10
 for <buildroot@buildroot.org>; Tue, 21 Mar 2023 17:07:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679443636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=MxItXUk7YAiAKAdG4N2t0CFmo1LfAW0WFt86K0NTahY=;
 b=6pxpLqrqpwOXeAPyc0LHxufUwbEzZMWZ3k6Uvtya5mK/pbGF2KQbQBFtHm/yHgQg67
 Dkx6Lj7PmL5pkgGv/84vh3Ddio3TRaMCuLjwdRynXGBAzZ9y3KIjrq1FoG7jngO2kP6G
 2td2jQ1PfaJMccmXN53UHlJmcxlPqayYeEzefKXW5Ej6YtVGC4Bg6XWvBjYJehPq/TKw
 ZUBqfMMNrpzJaHkaoumctOxy91SGW5VprXZCqniUiOn8z4lEpJgkku1IQMdB2rQhFNHq
 Krum0oVAQiI/ggclLaMjiOKIHxRb3I5JnTDqLEDm2yu4AD/PuNDJOgbTQcI2mhtORPx2
 xt4A==
X-Gm-Message-State: AO0yUKVvpHrqvfX5sc7SwNkvu2CeEgPfkjH1XP359EOnQTdRi9DTlzoD
 jN/kXStWf91cvLy0saxsunLK7kvHnbzkAQ==
X-Google-Smtp-Source: AK7set8t3qjNkz9r4W9KYdZSkxY7y4Cq+d9m4YwxnPfSAFQKdUOLZJTMA3XM52dP74uGzWrwMelyjg==
X-Received: by 2002:a5d:8c8b:0:b0:71a:1b72:5afc with SMTP id
 g11-20020a5d8c8b000000b0071a1b725afcmr2873456ion.19.1679443636172; 
 Tue, 21 Mar 2023 17:07:16 -0700 (PDT)
Received: from james-x399.localdomain (97-118-149-35.hlrn.qwest.net.
 [97.118.149.35]) by smtp.gmail.com with ESMTPSA id
 az3-20020a056638418300b0040558314d81sm4565325jab.95.2023.03.21.17.07.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Mar 2023 17:07:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 21 Mar 2023 18:07:14 -0600
Message-Id: <20230322000714.4045454-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112; t=1679443636;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=MxItXUk7YAiAKAdG4N2t0CFmo1LfAW0WFt86K0NTahY=;
 b=Nj7WAUfreAjwqWyET6xEUztLjLnflLLyNlwT543Cdx2EYaBcdt9rLLcmKkI/HuUF2I
 9iQ+C0ZBH+xGDDqVS12JKvFfWzBf3xGWJtk2OqsC7C7YsG0IZaMx7nmt6N/TFhJhxXIC
 DZfht9W0nxX36nKwEXhij28i9Kfpu6NhosTM5DwBaIDSgJT/juvNHHTQ4znv82mokOpQ
 ujOPG8hhtRVJZ57MvoRWV7pwGRkab/s7ZGxY9UfpSDpm/68H1zvlnmr6w1j9XtUa0wvv
 tdLuKDIlenOIGYgOTfcPWyuiSmZ15GrHZzytfaP4xRmPirxXwsx0HA/Oz1q4JXPFHWks
 RUrg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=Nj7WAUfr
Subject: [Buildroot] [PATCH 1/1] package/python-aexpect: bump to version
 1.7.0
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
 =?UTF-8?q?Jos=C3=A9=20Pekkarinen?= <jose.pekkarinen@unikie.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Drop no longer required six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aexpect/Config.in           | 1 -
 package/python-aexpect/python-aexpect.hash | 4 ++--
 package/python-aexpect/python-aexpect.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-aexpect/Config.in b/package/python-aexpect/Config.in
index cc805da657..59671621dc 100644
--- a/package/python-aexpect/Config.in
+++ b/package/python-aexpect/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_AEXPECT
 	bool "python-aexpect"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Aexpect.
 
diff --git a/package/python-aexpect/python-aexpect.hash b/package/python-aexpect/python-aexpect.hash
index efe4f55fb8..ff30c765e3 100644
--- a/package/python-aexpect/python-aexpect.hash
+++ b/package/python-aexpect/python-aexpect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aexpect/json
-md5  d37473ff0024c15938bfe86a543537e6  aexpect-1.6.4.tar.gz
-sha256  3998aa84ae54963fd59488f0caa533f6edbb31bc6cb842da09b041cbad56ad88  aexpect-1.6.4.tar.gz
+md5  bb05319c277cfe97114780579d251c30  aexpect-1.7.0.tar.gz
+sha256  11bfeea78ef6147ac8f6e29c2a720bd332598383d88274cdca5e6413c2070d52  aexpect-1.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7be26abf35e531a226dc742d2379d42d372cb61f027a6e26477c0e2f1a03bfcb  LICENSE
diff --git a/package/python-aexpect/python-aexpect.mk b/package/python-aexpect/python-aexpect.mk
index 8b5e165135..1cfcc9ffaf 100644
--- a/package/python-aexpect/python-aexpect.mk
+++ b/package/python-aexpect/python-aexpect.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AEXPECT_VERSION = 1.6.4
+PYTHON_AEXPECT_VERSION = 1.7.0
 PYTHON_AEXPECT_SOURCE = aexpect-$(PYTHON_AEXPECT_VERSION).tar.gz
-PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/3b/22/f87ffa70348dde4597d9314995be89c8d4c7728260033b972a8d691e3f7d
+PYTHON_AEXPECT_SITE = https://files.pythonhosted.org/packages/dd/32/738b5190adb5ed387d3e755885f646b714fbf9c22adbda7ff988db7ede49
 PYTHON_AEXPECT_SETUP_TYPE = setuptools
 PYTHON_AEXPECT_LICENSE = GPL-2.0+
 PYTHON_AEXPECT_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
