Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA260C61D9D
	for <buildroot@archiver.kernel.org>; Sat, 25 Nov 2023 08:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 57E0060BD6;
	Sat, 25 Nov 2023 08:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 57E0060BD6
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6m9JD2ppnumT; Sat, 25 Nov 2023 08:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8294F60E47;
	Sat, 25 Nov 2023 08:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8294F60E47
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44E381BF3D2
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:11:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D81A41EBE
 for <buildroot@lists.busybox.net>; Sat, 25 Nov 2023 08:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D81A41EBE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id E2wLSYzRc6fZ for <buildroot@lists.busybox.net>;
 Sat, 25 Nov 2023 08:11:01 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3989441841
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 08:11:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3989441841
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7b35b9645e1so93685739f.2
 for <buildroot@buildroot.org>; Sat, 25 Nov 2023 00:11:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700899860; x=1701504660;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tGMXETjxUIgrznaIPwkDir75cvQVAwV2mfYik7tS0HM=;
 b=XP3A2bFjNEYOYefnY2m95JmEoW855PrmysLMvL1H5KDlm00gDTTDqx/GSBEM4AmWO6
 6fKU9JCBJfOHZGeXI1cp9O8hRc6y8GCrvF7Y34Myd1VoGquhW7dbbJQNY88/w3rv68V2
 R6k3+rKgreTe4TNEZDnyxfnFzmf7qZX6TXd3tuPkn8Lsp1a57sxJW73eDhQxC7p7Q07k
 G8FRxSMFIUH20N3xhov8x5x7f7inWR10k7CqGAIV3zbySyKqKnk+fqTYiiLVjmgtL0bb
 26PKLLEeL7c9rT25zlKWQmUoOhYXUUlRPJazhD+aLGZCfBRmMlJJ5h4gwhsBkhMyBS5A
 ZqBg==
X-Gm-Message-State: AOJu0YwdGJGN3QRntVMm2KgUdoTAeeevt+YjHB5bcF+HryPfltJepTxY
 RVCxOpJyHK9uHvUn15j6LCmVohZ70xs=
X-Google-Smtp-Source: AGHT+IGGx8cJJi5E2Xjh9/RXhZB3/W6Bb8HmwbSzutlu5uIFqZhj/5jUDb4tNn9Lci2aGQ53pyYdvw==
X-Received: by 2002:a05:6602:27d6:b0:7a6:7e4c:1bf0 with SMTP id
 l22-20020a05660227d600b007a67e4c1bf0mr972667ios.16.1700899859862; 
 Sat, 25 Nov 2023 00:10:59 -0800 (PST)
Received: from james-x399.localdomain (97-118-243-253.hlrn.qwest.net.
 [97.118.243.253]) by smtp.gmail.com with ESMTPSA id
 z23-20020a6b0a17000000b007a667c41368sm1294634ioi.54.2023.11.25.00.10.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Nov 2023 00:10:58 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Nov 2023 01:10:52 -0700
Message-Id: <20231125081052.881728-3-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231125081052.881728-1-james.hilliard1@gmail.com>
References: <20231125081052.881728-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700899860; x=1701504660; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tGMXETjxUIgrznaIPwkDir75cvQVAwV2mfYik7tS0HM=;
 b=J/Ycc46EOPWsNunP2fr4J1BUzsA41nSkAUA4c/aVmxl+c129p/Wa7RSwszICSPaXzS
 PhpSMmj6j9wJIL+xl6v4gSsNloRj5iNoekl6LnZ7aOTbwKzX0Kx7v/IGacnRWb4bHWtX
 4YXynUJ+hjuTIiZzrCZ43/Eb/J794mEp98if4J3clTLSDxbno+Qkc0PtrNujBTzXLlM4
 eV5psGkHI44q3Qq83wLiptp+NexDUEjKXRTLe1nxvq9x+Hh2WOU/D2XLWYkrRvfbdBoM
 ojqQkgh0B7KPXg6khNTqPytbqHq1v7SMqhFJ3QELs2vESW3k44HY7H4B68CYd5VVg2R3
 b+4w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=J/Ycc46E
Subject: [Buildroot] [PATCH 3/3] package/python-pydantic: bump to version
 2.5.2
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-annotated-types runtime dependency.

Add new python-pydantic-core runtime dependency.

Migrate build backend from setuptools to hatchling.

License hash changed due to adding contributors:
https://github.com/pydantic/pydantic/commit/7bc9c6525a81680c0dd9df3558ed5f33345a77c2

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic/Config.in            | 5 ++++-
 package/python-pydantic/python-pydantic.hash | 6 +++---
 package/python-pydantic/python-pydantic.mk   | 9 ++++++---
 3 files changed, 13 insertions(+), 7 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index 41ec43adf4..e9cd2e6780 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -1,8 +1,11 @@
 config BR2_PACKAGE_PYTHON_PYDANTIC
 	bool "python-pydantic"
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANNOTATED_TYPES # runtime
+	select BR2_PACKAGE_PYTHON_PYDANTIC_CORE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Data validation and settings management using python 3.6
 	  type hinting.
 
-	  https://github.com/samuelcolvin/pydantic
+	  https://github.com/pydantic/pydantic
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 88b17f4575..0848debc1c 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5  f0e286c32f40ec45aba9603742739cd6  pydantic-1.10.8.tar.gz
-sha256  1410275520dfa70effadf4c21811d755e7ef9bb1f1d077a21958153a92c8d9ca  pydantic-1.10.8.tar.gz
+md5  348281a5a27eb5253c7a83927aae64e1  pydantic-2.5.2.tar.gz
+sha256  ff177ba64c6faf73d7afa2e8cad38fd456c0dbe01c9954e71038001cd15a6edd  pydantic-2.5.2.tar.gz
 # Locally computed sha256 checksums
-sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
+sha256  a9e186f3ca16b5eef84318e7a701721351a00cb7b8ae3a4394b67b49e3529ef3  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index b800426d22..b5bb7ff853 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.10.8
+PYTHON_PYDANTIC_VERSION = 2.5.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/23/65/2aa13873e9e0084ecaec00fbe6c6096b65e1ab99ba66bdbf7e4e7c4cc915
-PYTHON_PYDANTIC_SETUP_TYPE = setuptools
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b7/41/3c8108f79fb7da2d2b17f35744232af4ffcd9e764ebe1e3fd4b26669b325
+PYTHON_PYDANTIC_SETUP_TYPE = pep517
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
+PYTHON_PYDANTIC_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
