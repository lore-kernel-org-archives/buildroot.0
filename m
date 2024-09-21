Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3B30CF9C68
	for <buildroot@archiver.kernel.org>; Sat, 21 Sep 2024 23:44:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5BDE481A50;
	Sat, 21 Sep 2024 23:44:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id zMN6KtMTP7nw; Sat, 21 Sep 2024 23:44:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5FB6681A65
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5FB6681A65;
	Sat, 21 Sep 2024 23:44:27 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id B30EC1BF3C4
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 23:44:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id A18B8406A4
 for <buildroot@lists.busybox.net>; Sat, 21 Sep 2024 23:44:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 4aFY_CYF5Zt7 for <buildroot@lists.busybox.net>;
 Sat, 21 Sep 2024 23:44:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::131; helo=mail-il1-x131.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 584D4406A2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 584D4406A2
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com
 [IPv6:2607:f8b0:4864:20::131])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 584D4406A2
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 23:44:24 +0000 (UTC)
Received: by mail-il1-x131.google.com with SMTP id
 e9e14a558f8ab-3a098564893so10721365ab.1
 for <buildroot@buildroot.org>; Sat, 21 Sep 2024 16:44:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726962263; x=1727567063;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ETquH8IlY2twj6g9JMOcqbjHUgoydknJ24WRixpdIKQ=;
 b=PiBTGTUPgjAfvlyMgZMiHJ0TTmexkXol5CXYq7h6TsQZ8YtDXxAKsJ6R5nnP3Dch2X
 BrTGp0NFRoA8mBPQ80suQp37Nl+FFaQ/SQOLW5EKpjLW7thAncKaaXWL/O56avNQPdYH
 iCBfUq0kAbyonsir0GMmRAg3dCrYnB16B6EN2z6r3/ZOkFOVMD52nZfcOSkumTf75Crb
 YBeKDm1AHlhHDWTy4hnpAQL964Lo0d0wtI5rQDcslkkoGD8bx/CSaA1mNxM+Tur5ihFj
 +Wj+D0kwgYHF3vXmAez4ILJ6N9EshAZHKJEQKw6+znNapCv/aJ/+UGjDr6BtubdHDOKA
 FKgw==
X-Gm-Message-State: AOJu0YzTB3DjsCPo1QJvKog/K5ds6Gprg9zhlegkN6P+1jqs3+MeOTOn
 3UZlWxZa/ReuP9toUcPa3uKmUPJQ2JXJqIAb3Pp56OcIDFcs9rnGh2nW2Q==
X-Google-Smtp-Source: AGHT+IF3kjHyS5B9qCDhBXB4+frVayFdvM0xKix4cFdpXGfgZu6b97cHhj2BQQ9P641w2zFp0J4xlw==
X-Received: by 2002:a05:6e02:1a25:b0:3a1:9661:58b1 with SMTP id
 e9e14a558f8ab-3a196616113mr8322365ab.12.1726962262872; 
 Sat, 21 Sep 2024 16:44:22 -0700 (PDT)
Received: from james-x399.localdomain (97-118-132-252.hlrn.qwest.net.
 [97.118.132.252]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4d37ebf4e1csm4394169173.20.2024.09.21.16.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 21 Sep 2024 16:44:22 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 21 Sep 2024 17:43:42 -0600
Message-Id: <20240921234342.708536-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726962263; x=1727567063; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ETquH8IlY2twj6g9JMOcqbjHUgoydknJ24WRixpdIKQ=;
 b=YVmrFZoL5XzjtyTsyLAT7Uw/9Ana//Sr7xxNg44gjMgviZ9rUfMe6Mvr7b+Bge5MXU
 CEUZRm3wHC6ok0PjvG4EoLsi25tlQ+HM+ZCCvs+Igckwlo0m1jbcUsVZbRsNe0bXfB2B
 cAyvT3Uk6162HV+AG0sR1KgHsx9qLIHLBMSWDMts4Tg37/GcXir3w5HTaVdVqodGIpqO
 jTcbbJ9MvHpFSQXiNLtdGHsSFMOm/UqmXOxFlMm3rP6PtV78mRSBER8/8xsWY3bPZ/UP
 hPppRBVRC8Mto7RLCnwoBckERv/uJGlMT7RON9fsaJq9aX1DlE+ASBEH4J3fNJqls+XO
 oJBw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=YVmrFZoL
Subject: [Buildroot] [PATCH 1/1] package/python-selenium: bump to version
 4.25.0
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

Migrate to setuptools-rust build backend.

Add new python-typing-extensions runtime dependency.

Add new python-websocket-client runtime dependency.

Add license file which was previously missing from release.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-selenium/Config.in            |  3 +++
 package/python-selenium/python-selenium.hash |  7 ++++---
 package/python-selenium/python-selenium.mk   | 10 ++++++----
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/python-selenium/Config.in b/package/python-selenium/Config.in
index 30820f07f8..fa725cdf44 100644
--- a/package/python-selenium/Config.in
+++ b/package/python-selenium/Config.in
@@ -1,10 +1,13 @@
 config BR2_PACKAGE_PYTHON_SELENIUM
 	bool "python-selenium"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_CERTIFI # runtime
 	select BR2_PACKAGE_PYTHON_PYSOCKS # runtime
 	select BR2_PACKAGE_PYTHON_TRIO # runtime
 	select BR2_PACKAGE_PYTHON_TRIO_WEBSOCKET # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
+	select BR2_PACKAGE_PYTHON_WEBSOCKET_CLIENT # runtime
 	help
 	  Python language bindings for Selenium WebDriver.
 
diff --git a/package/python-selenium/python-selenium.hash b/package/python-selenium/python-selenium.hash
index ef1c34bfd3..aa492248a5 100644
--- a/package/python-selenium/python-selenium.hash
+++ b/package/python-selenium/python-selenium.hash
@@ -1,3 +1,4 @@
-# md5, sha256 from https://pypi.org/pypi/selenium/json
-md5  9afd7110a9e06721baae028ac42a2221  selenium-4.16.0.tar.gz
-sha256  b2e987a445306151f7be0e6dfe2aa72a479c2ac6a91b9d5ef2d6dd4e49ad0435  selenium-4.16.0.tar.gz
+# Locally calculated after vendoring
+sha256  2e801325943bae1ccf4978b76e25f539d2e24d5765891be20d77d117940a9674  python-selenium-4.25.0-cargo2.tar.gz
+# Locally computed sha256 checksums
+sha256  de658a7d3761e92b471e2f630ea99eeb3389b27820809b1e4853baabd5fbadb7  LICENSE
diff --git a/package/python-selenium/python-selenium.mk b/package/python-selenium/python-selenium.mk
index 0428cefa46..b317a83148 100644
--- a/package/python-selenium/python-selenium.mk
+++ b/package/python-selenium/python-selenium.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_SELENIUM_VERSION = 4.16.0
-PYTHON_SELENIUM_SOURCE = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
-PYTHON_SELENIUM_SITE = https://files.pythonhosted.org/packages/16/fd/a0ef793383077dd6296e4637acc82d1e9893e9a49a47f56e96996909e427
-PYTHON_SELENIUM_SETUP_TYPE = setuptools
+PYTHON_SELENIUM_VERSION = 4.25.0
+PYTHON_SELENIUM_SOURCE_PYPI = selenium-$(PYTHON_SELENIUM_VERSION).tar.gz
+PYTHON_SELENIUM_SITE_PYPI = https://files.pythonhosted.org/packages/0e/5a/d3735b189b91715fd0f5a9b8d55e2605061309849470e96ab830f02cba40
+PYTHON_SELENIUM_SITE = $(PYTHON_SELENIUM_SITE_PYPI)/$(PYTHON_SELENIUM_SOURCE_PYPI)?buildroot-path=filename
+PYTHON_SELENIUM_SETUP_TYPE = setuptools-rust
 PYTHON_SELENIUM_LICENSE = Apache-2.0
+PYTHON_SELENIUM_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
