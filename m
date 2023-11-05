Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30816C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 09:11:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 63B0D60FEB;
	Sun,  5 Nov 2023 09:11:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 63B0D60FEB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NCrZdpPipyoX; Sun,  5 Nov 2023 09:11:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 751B760FF4;
	Sun,  5 Nov 2023 09:11:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 751B760FF4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8721D1BF578
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:10:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6D29C41952
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 09:10:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D29C41952
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Nm0akcFmbz0I for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 09:10:48 +0000 (UTC)
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com
 [IPv6:2607:f8b0:4864:20::d35])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5EE954193E
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 09:10:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5EE954193E
Received: by mail-io1-xd35.google.com with SMTP id
 ca18e2360f4ac-7aca968a063so133132839f.0
 for <buildroot@buildroot.org>; Sun, 05 Nov 2023 01:10:48 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699175447; x=1699780247;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Wi2SYCL0KA0u/r7Lq+JpzlVAG6WLr7oUnPeVtBMooWs=;
 b=vmbVjaZWaPB9IfsLiuXFaivD3w4nfpr6ITOCaJOPT+loyeCi2sTdlhs7tLGyQLviuL
 nH1Iu6QdTO30BzJSKNbDQmVCJBlUFnPTKKnjOrkB0ZLTTRcxDTHV4+MsZ7RCd+V1mx63
 HydtIyUmkKTJqJM6/eR7airnnkQ2XzA0vY5wTSg613zL6qoH9gKW6DYFLUVwRItyBO2Z
 m0rXTyGlEZ3+R0GbXmJ7n2Zp4FUDdYsfvNfzryzEvtcj5v02tvfdZ1LUyrM/qf6bzZ4o
 I3E6O9aGohN+ZZ2SOqW1rD0UpW4kNjT5TLmVKsPRgM7xFqRvCeHrhr0UoSqy+kGCr25U
 gyfw==
X-Gm-Message-State: AOJu0Yw3+7nuhtLlscw+s4yHGaeMTvjMjG7kD98lr1jAnkHJ6nDzpDhR
 coix/Tl3R8kCcXgWNvtQpOwomLi0ZLh13g==
X-Google-Smtp-Source: AGHT+IFI8RVuxaPUfFyDqvKnymcIxwgblR/UMAtDnYjTI/HlLFgAJKVfi77myT43gxM5n6OlRl8qnQ==
X-Received: by 2002:a05:6602:1506:b0:7a9:629f:3c5a with SMTP id
 g6-20020a056602150600b007a9629f3c5amr37473418iow.14.1699175446685; 
 Sun, 05 Nov 2023 01:10:46 -0800 (PST)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 m14-20020a0566380ace00b0043a11ec651asm871207jab.169.2023.11.05.01.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 05 Nov 2023 01:10:45 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun,  5 Nov 2023 02:10:40 -0700
Message-Id: <20231105091040.2924287-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20231105091040.2924287-1-james.hilliard1@gmail.com>
References: <20231105091040.2924287-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699175447; x=1699780247; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Wi2SYCL0KA0u/r7Lq+JpzlVAG6WLr7oUnPeVtBMooWs=;
 b=KfMe5/N6qIPebs2aajuUg+Jj1UkiCj56DA+BnczFewd143F5w9Zor/8UYmv2d0RB7T
 0b3BsmDSn44Qjkhk32fBHnY6T0weN/wMHRPCdGEEW1eT2xwvFELHg4C2jqmO58q6P5eK
 QRLJ8qRMZUrq2jssuD/GVRMQggeqw7LjmFd2r+YHZk/dEIqFal3ycc39iNnsYkbDeQ1Q
 khCUMm3QJFEn9q/VmhS4o0246LaorMhan6lBQerqJPYOLfFtxaZCimTfBEK+Fcs7qB8R
 wR54yigS7etQvnQfEgZVzRtetGQwNoBLLkvE4FJDTKD0TzI6eJ+k0yWplX975Zf6rj6Q
 ozXA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=KfMe5/N6
Subject: [Buildroot] [PATCH 2/2] package/python-keyring: bump to version
 24.2.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-jaraco-classes runtime dependency.

Add new python-jeepney runtime dependency.

License hash changed due to copyright notice removal:
https://github.com/jaraco/keyring/commit/5957d58266e479f124b31f30e4322e798fdf386b

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-keyring/Config.in           | 2 ++
 package/python-keyring/python-keyring.hash | 6 +++---
 package/python-keyring/python-keyring.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-keyring/Config.in b/package/python-keyring/Config.in
index 6b33686cbe..6c03317f61 100644
--- a/package/python-keyring/Config.in
+++ b/package/python-keyring/Config.in
@@ -3,6 +3,8 @@ config BR2_PACKAGE_PYTHON_KEYRING
 	# python-secretstorage -> python-cryptography
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
 	select BR2_PACKAGE_PYTHON_ENTRYPOINTS # runtime
+	select BR2_PACKAGE_PYTHON_JARACO_CLASSES # runtime
+	select BR2_PACKAGE_PYTHON_JEEPNEY # runtime
 	select BR2_PACKAGE_PYTHON_SECRETSTORAGE # runtime
 	help
 	  The Python keyring lib provides a easy way to access the
diff --git a/package/python-keyring/python-keyring.hash b/package/python-keyring/python-keyring.hash
index 837743f5c2..50ac3df342 100644
--- a/package/python-keyring/python-keyring.hash
+++ b/package/python-keyring/python-keyring.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/keyring/json
-md5  a0640ab7525b4fe58061b5999cca5026  keyring-23.13.1.tar.gz
-sha256  ba2e15a9b35e21908d0aaf4e0a47acc52d6ae33444df0da2b49d41a46ef6d678  keyring-23.13.1.tar.gz
+md5  ed5df85d33c36bb268a79d4472a13312  keyring-24.2.0.tar.gz
+sha256  ca0746a19ec421219f4d713f848fa297a661a8a8c1504867e55bfb5e09091509  keyring-24.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
+sha256  86da0f01aeae46348a3c3d465195dc1ceccde79f79e87769a64b8da04b2a4741  LICENSE
diff --git a/package/python-keyring/python-keyring.mk b/package/python-keyring/python-keyring.mk
index 766139f525..87b51a8960 100644
--- a/package/python-keyring/python-keyring.mk
+++ b/package/python-keyring/python-keyring.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_KEYRING_VERSION = 23.13.1
+PYTHON_KEYRING_VERSION = 24.2.0
 PYTHON_KEYRING_SOURCE = keyring-$(PYTHON_KEYRING_VERSION).tar.gz
-PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/55/fe/282f4c205add8e8bb3a1635cbbac59d6def2e0891b145aa553a0e40dd2d0
+PYTHON_KEYRING_SITE = https://files.pythonhosted.org/packages/14/c5/7a2a66489c66ee29562300ddc5be63636f70b4025a74df71466e62d929b1
 PYTHON_KEYRING_SETUP_TYPE = setuptools
 PYTHON_KEYRING_LICENSE = MIT
 PYTHON_KEYRING_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
