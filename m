Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DD69E7718D
	for <buildroot@archiver.kernel.org>; Mon, 23 Dec 2024 15:15:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id ED72B8126B;
	Mon, 23 Dec 2024 15:15:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J9sspB1bDWeP; Mon, 23 Dec 2024 15:15:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0C91F81276
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0C91F81276;
	Mon, 23 Dec 2024 15:15:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id A28E8D8
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:15:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 821C640274
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:15:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WFh_sif7_AKr for <buildroot@buildroot.org>;
 Mon, 23 Dec 2024 15:15:52 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6166C4019A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6166C4019A
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6166C4019A
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 15:15:52 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-83eb38883b5so160240139f.1
 for <buildroot@buildroot.org>; Mon, 23 Dec 2024 07:15:52 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734966951; x=1735571751;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=P8JuAfOfYM8nzEPpiGuYvhgUy3VFYnpfSFoFuRdEXcA=;
 b=BNkUEYvVUM9DnmojYNhnQOG2zmsoZdAzS69Hro1aJtkUv/IjPqJ7mT1+F5d1VR0Vkb
 +MA4Gxj2r7W5eoUJI3R5vgXbSRYOA5bHFCyaMx2OteEU+y4mzEmLn1stpfIgcsBECvf6
 fA+TE7WSsu49dgJR6a3Zi95F7S6VJA3Lw0ZXOn+Mifclk09MA4yoYDzL8FUcAAS0M7m5
 tEoOxr9Ns96zRUEA8NOwAeVSQ0mvzoIuqMT76uPSHc2lzEtlUVyf9/YRjEKGsYy17EXx
 FJX2JR4lly1w2BJ6R9GO75bYtuRt4XxglSEX9rv2Mh3r1sTjerFoG7QXWYMBQsTAkIkw
 FKMg==
X-Gm-Message-State: AOJu0Yzq1UaTH0hjSNznFAYuwkMbcLj2ZvYOSe0Q5MHPDDdBZ5p74WCH
 aK2SeiFrLNKf0MTSQ1bEpjfpK4mTGlxTZ073t9W5Vc7TPlhkIOfyr8Tb6Tu9oWY=
X-Gm-Gg: ASbGncuhZkd86eeAQEMTYCSgXpiDVQDDIFwZbtQf7/ayeN1HRUmLLSBR773GwhgWgMB
 SqZ3XrkCFompKYCkKybunyHnXxgATY651raq1hL7saDK6jpnxwvqqfrZTabL85VvHz0QzHQkMUa
 lMTrtg3FWOANlyjFrvyjOVMn1MiqpUIfM7TrOrbj6t9T1mGHoo4IBHPwO86IlsFnl+8sinjKIIc
 C4d2aZLuiVxppm1QeXroDHELa//320V4IIepvomcJ5cMxq8205Nry+8GgLLfnnAWBggi44CmXKh
 N5j734uY9/LNZnvLZLLYguE+36fji186Lw==
X-Google-Smtp-Source: AGHT+IFfUZLvlmMsHwMqAZCLM/7RMI5p58GJqGbzW1RjguKF87HIvwUger8lNLiWKNPagkQ+IRVj7A==
X-Received: by 2002:a05:6602:13d0:b0:837:7f1a:40af with SMTP id
 ca18e2360f4ac-8499e6c5927mr1427789439f.14.1734966950901; 
 Mon, 23 Dec 2024 07:15:50 -0800 (PST)
Received: from james-x399.localdomain (71-218-105-232.hlrn.qwest.net.
 [71.218.105.232]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8498d7dd8c4sm220010539f.12.2024.12.23.07.15.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Dec 2024 07:15:50 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 23 Dec 2024 08:15:48 -0700
Message-Id: <20241223151548.1728545-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734966951; x=1735571751; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=P8JuAfOfYM8nzEPpiGuYvhgUy3VFYnpfSFoFuRdEXcA=;
 b=QS5FnG8KBW90HodzG/r3oSqLIk7vFu4bBk6NDba8jcLHRpbRRVbzISionIz4bQw5Qf
 0mYSAsPsotyVPGlvu5nZFYxHfNR+ZrrgO36Ep/vIB8gRw21XjnRoYUyWBjM2fR5GVqhr
 x1BkHEnDtlqyHsIlIZv5ViBDV8N4BQhBR12v7nnUFhXN1Z4bV/6KkOOzl07J8PkbvNY5
 uAoJDKHYMwpqGosXknjAUdUbSrNYPfsQFxVrhF75AVmWaNWBZNQ7blhyOwyBTBCgoG2L
 QwGSak/YjaGgOGcZ84JKFm0kCf+KvalGeMPjk0tciDjR+1eB9T7pOBe7PDlJMmwtT7Ed
 POzw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=QS5FnG8K
Subject: [Buildroot] [PATCH 1/1] package/python-asttokens: bump to version
 3.0.0
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

Drop no longer required python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-asttokens/Config.in             | 1 -
 package/python-asttokens/python-asttokens.hash | 4 ++--
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-asttokens/Config.in b/package/python-asttokens/Config.in
index 2732b8124b..66c46bb013 100644
--- a/package/python-asttokens/Config.in
+++ b/package/python-asttokens/Config.in
@@ -1,6 +1,5 @@
 config BR2_PACKAGE_PYTHON_ASTTOKENS
 	bool "python-asttokens"
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Annotate AST trees with source code positions.
 
diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index 9042c3002d..a8b552913b 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  c353679585a40f43c24ca60fca33bbf6  asttokens-2.4.1.tar.gz
-sha256  b03869718ba9a6eb027e134bfdf69f38a236d681c83c160d510768af11254ba0  asttokens-2.4.1.tar.gz
+md5  7d99c4c80190c3ba64839138ea827970  asttokens-3.0.0.tar.gz
+sha256  0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7  asttokens-3.0.0.tar.gz
 # Locally computed sha256 checksums
 sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 4806d17915..327ee6af91 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 2.4.1
+PYTHON_ASTTOKENS_VERSION = 3.0.0
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/45/1d/f03bcb60c4a3212e15f99a56085d93093a497718adf828d050b9d675da81
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/4a/e7/82da0a03e7ba5141f05cce0d302e6eed121ae055e0456ca228bf693984bc
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
