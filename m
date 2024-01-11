Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2212EC47077
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 06:17:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72CC4213E;
	Thu, 11 Jan 2024 06:17:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A72CC4213E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7Nn7mSeCprjJ; Thu, 11 Jan 2024 06:17:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5EFC4213C;
	Thu, 11 Jan 2024 06:17:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5EFC4213C
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 76C331BF846
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:17:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5C3584213B
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 06:17:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C3584213B
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id A0B5YuzbUbqg for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 06:17:01 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6C1FE42138
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 06:17:01 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6C1FE42138
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7bade847536so206389639f.0
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 22:17:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704953820; x=1705558620;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ab1BT4fjfeynSpfd8waMtsgtF+Lj4Ca4sscLqmQhBvI=;
 b=bhpNPd6TwLqIvkczg2kTNRZZl5Gy0opgQjBq8B0KCQd4Q59tgEx+uMJWVwvz/bZ8/D
 AzNR1yGXbawQZKEv4I2iYIWg6PyQa08+SD+rFydwDuPa4JiHCxjuNAx8mgUTtiJVhRSO
 AIEAC3heHxtBTHg/lPC8r2JdddG5V98jgYwqyiwAuwgQ8c/Gh0OuVb+UxjV3IL02BBcD
 g4UthKTuYVVK1rauvviRL/xYK+xj5CHp7x+tw6l0mU/6ZO7BMJRkiUt3/fUBv0sAolYV
 r89QFhUZe/2CKaRceNRmJ+xY9k+o6rrtHQlS//B1riNTKTgmtcG+f2TiYg/bHlUM0V3I
 FKBw==
X-Gm-Message-State: AOJu0YyGnNTLcxDaKbDCJW65P55aHW/DXrH2QXSIbWFQ/rX43fKpT4i+
 TD/XDFxoznPwFTpiTBKiH6cce6cNmtjB/A==
X-Google-Smtp-Source: AGHT+IHlDeuro4siejMLaDdUqLPy3NY64ki/BvoONB15wFpZR/jPln7rmtir06gXbIjtH6xUYH1i7g==
X-Received: by 2002:a5e:8f48:0:b0:7bf:122f:8b4 with SMTP id
 x8-20020a5e8f48000000b007bf122f08b4mr113695iop.27.1704953820033; 
 Wed, 10 Jan 2024 22:17:00 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 a71-20020a02944d000000b0046e5486cc53sm124146jai.86.2024.01.10.22.16.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 22:16:59 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 23:16:58 -0700
Message-Id: <20240111061658.3034731-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704953820; x=1705558620; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ab1BT4fjfeynSpfd8waMtsgtF+Lj4Ca4sscLqmQhBvI=;
 b=ATP1r/KIyOA/CGO+MteBRJaCvkx25M3Jzjr1Hilf3wmMgx6KdvC3Z6HD0zZjAR/rup
 WMEb5ukbkE+wfuBbCGadSAcPEcAxeW9uGtmchv/3TFoN3ilwLjRj6+lNi4Pl/hTsU+Cq
 cBDe5QXXs+YEhvU/uq19QKDQwXQVjsz2jvdE826RUr6WPOzmjfgVRtofIiTI4bP2T88+
 apW+6tYGaAU3CeUXLqt4Vl4rzv16W7d5ATDh3X17r3qTm/PcYcG+XfdLLkI/eKN6gwgN
 99JNFsIjCdnw/C9US1fJEuyUnq8G6nnQ1F3tvRzCWJGujpjMJEJwHTvMscd19YfE9z+e
 IQ3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=ATP1r/KI
Subject: [Buildroot] [PATCH 1/1] package/python-service-identity: bump to
 version 23.1.0
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash changed due to MIT header added:
https://github.com/pyca/service-identity/commit/a4a82c1b646d07cf2f3b4705ce17f22e6484556c

Migrate from setuptools to hatchling pep517 build backend.

Drop no longer python-pyopenssl runtime dependency.

Drop no longer python-six runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-service-identity/Config.in            |  2 --
 .../python-service-identity.hash                     |  6 +++---
 .../python-service-identity.mk                       | 12 ++++++++----
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/python-service-identity/Config.in b/package/python-service-identity/Config.in
index 278900971e..dccd8f37c0 100644
--- a/package/python-service-identity/Config.in
+++ b/package/python-service-identity/Config.in
@@ -5,8 +5,6 @@ config BR2_PACKAGE_PYTHON_SERVICE_IDENTITY
 	select BR2_PACKAGE_PYTHON_ATTRS # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
 	select BR2_PACKAGE_PYTHON_PYASN1_MODULES # runtime
-	select BR2_PACKAGE_PYTHON_PYOPENSSL # runtime
-	select BR2_PACKAGE_PYTHON_SIX # runtime
 	help
 	  Service identity verification for pyOpenSSL.
 
diff --git a/package/python-service-identity/python-service-identity.hash b/package/python-service-identity/python-service-identity.hash
index f648918dbd..32d8f21ad4 100644
--- a/package/python-service-identity/python-service-identity.hash
+++ b/package/python-service-identity/python-service-identity.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/service-identity/json
-md5  5e5c195d8fcedc72f9068be2ad9b5a13  service-identity-21.1.0.tar.gz
-sha256  6e6c6086ca271dc11b033d17c3a8bea9f24ebff920c587da090afc9519419d34  service-identity-21.1.0.tar.gz
+md5  14a751406024544784459474d93d1ea5  service_identity-23.1.0.tar.gz
+sha256  ecb33cd96307755041e978ab14f8b14e13b40f1fbd525a4dc78f46d2b986431d  service_identity-23.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256  c5075126e1272b176504e36af369781a95c5c1124239da8e4f61b0f9c15a56cf  LICENSE
+sha256  51f7c647190e74d19f9f24f1b19645b425eb8f30f049196053686bff188505cf  LICENSE
diff --git a/package/python-service-identity/python-service-identity.mk b/package/python-service-identity/python-service-identity.mk
index e4ae8e6889..6e61dd951b 100644
--- a/package/python-service-identity/python-service-identity.mk
+++ b/package/python-service-identity/python-service-identity.mk
@@ -4,11 +4,15 @@
 #
 ################################################################################
 
-PYTHON_SERVICE_IDENTITY_VERSION = 21.1.0
-PYTHON_SERVICE_IDENTITY_SOURCE = service-identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
-PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/09/2e/26ade69944773df4748c19d3053e025b282f48de02aad84906d34a29d28b
+PYTHON_SERVICE_IDENTITY_VERSION = 23.1.0
+PYTHON_SERVICE_IDENTITY_SOURCE = service_identity-$(PYTHON_SERVICE_IDENTITY_VERSION).tar.gz
+PYTHON_SERVICE_IDENTITY_SITE = https://files.pythonhosted.org/packages/3b/98/2a46c7414ffc1d06ba67d2c2dd62a207a70cb351028a8cd8c85b3dbd1cf7
 PYTHON_SERVICE_IDENTITY_LICENSE = MIT
 PYTHON_SERVICE_IDENTITY_LICENSE_FILES = LICENSE
-PYTHON_SERVICE_IDENTITY_SETUP_TYPE = setuptools
+PYTHON_SERVICE_IDENTITY_SETUP_TYPE = pep517
+PYTHON_SERVICE_IDENTITY_DEPENDENCIES = \
+	host-python-hatchling \
+	host-python-hatch-vcs \
+	host-python-hatch-fancy-pypi-readme
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
