Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E83D4CCA476
	for <buildroot@archiver.kernel.org>; Fri, 10 Oct 2025 06:56:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9AA0540EFD;
	Fri, 10 Oct 2025 06:56:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WqigYHf8ASkD; Fri, 10 Oct 2025 06:56:18 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B4AB240FC4
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4AB240FC4;
	Fri, 10 Oct 2025 06:56:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 27C0D119
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:56:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 12E9140857
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:56:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fm79CLqeViM9 for <buildroot@buildroot.org>;
 Fri, 10 Oct 2025 06:56:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 202444077C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 202444077C
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 202444077C
 for <buildroot@buildroot.org>; Fri, 10 Oct 2025 06:56:17 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-92aee734585so67611339f.3
 for <buildroot@buildroot.org>; Thu, 09 Oct 2025 23:56:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760079376; x=1760684176;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iqMHu8byt4kGhlOPWQTTEddYaHoYtvVwlRsQI8JjlZI=;
 b=ZlMdOgQboqM1X3Gw0oUCPzmNURBuxkwBOw93C1XtreFj06ufOAn2ri3JOtn+a283k8
 gnaqDOKUGU94QWzPUtCxrb6XKf/a5HHwU2dUYlVFBXKau7ZBif8jpT2gWCG5Rs2MnSAB
 kAaYjOU8hvm3DoptI5H18YEM0SAYv+LjxmSTnOrEszpz6TINjOsJS1g5zC1ObaNzuHDI
 gWpX5uQQzscDsIY6etzTxSSKeg7YS51CIZ/e8+BNc19fScl1XNm7VaKhM85pG7MnB2gr
 3vqTB6aRLwv/dJNvyWM+POpjqbjY82qWGifkThNS0Jqd6EvamoikUXAsd6jPWpIti8gC
 PeHg==
X-Gm-Message-State: AOJu0Yz5gUvXonn5fGtWoxedyjkCENd/3snr+GDeKcoSD9qtyWWp5xxg
 aQQwQa8wi8gOHi7Cs5uKaZzPcidI9doPzM2zeaddvYcVuI9LZEkmeRr3jXRslA==
X-Gm-Gg: ASbGncvEf1EMcvavD+scIjPvEz2Tb548fwK105lkR55uNYRIBP3tpAP6bIofV+jMVVW
 DeElSt8W89+WBAYYUt78cgDkGwwu0hIsVh0llMN7UFiAODc7dF5XYEgRcIsUEQz3aOsYNPys9ah
 eL7eoNGFxaEqIspWDSaxNsrTcbFeBzHeNYnkZSzJqMtWbyXZLlrlZR5/OwXdTCTvlmShHXaZGhz
 eKVwyUBZO7awjG6llEOSGMj+e3e37EPRzasim/IRZB1u1NltQdQq7ndk+V/7lHh3ZLy54P83hYy
 zfPKrYNKQP4YW39ikuU/qBImZrvpZJ0f5yu+PERBLXunz9f8gBU1JIHG9djjS1sKuFhoy1N5PUn
 RjvUFoL52EH9ycfwD6DeJ1Jh5SFouhoNmccICff3qGqb2MUrxxuS7+GS9dRs5MkmVDzZ3XfZhKt
 nmUdYCmQM6BDxPn08pvs4UcJifjFgPw91xPkyx
X-Google-Smtp-Source: AGHT+IHR/vA2snMqm4xIxvVidCwMHK5PUn3kp7yyYU2iNTGHRxc+j1kvBxl1WZp+r34655Zru5f6Nw==
X-Received: by 2002:a05:6602:13c9:b0:887:54d4:a8c8 with SMTP id
 ca18e2360f4ac-93bd1987b63mr1203654539f.12.1760079375684; 
 Thu, 09 Oct 2025 23:56:15 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (71-218-100-179.hlrn.qwest.net.
 [71.218.100.179]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-58f6d045275sm616090173.24.2025.10.09.23.56.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 23:56:15 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Oct 2025 00:56:06 -0600
Message-ID: <20251010065606.3819391-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760079376; x=1760684176; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=iqMHu8byt4kGhlOPWQTTEddYaHoYtvVwlRsQI8JjlZI=;
 b=FfE8wtZKALgy/giG3J2XTacJAjFVt/uyuSl5bCT+aKW2hoYMj9JURZd8s1+2m7JWtY
 vndmzA4jblaHsyyfWjkU5sfHQ72vFsyJycZ5sdqR3nlS8BJKJkRb8LqyjmOc9wI3oG+U
 ErikiIhm53qBwnEdPs15J6/XZLKvjaYzq/0YdATiVNdTLpQM6yF0OyTFZVZSpoq3Yebk
 K1nofcYQhVOSxJGWeVvRU1qj1DYmOH0jgz1zHjwWeOcfBW/PDarDVpNDKgfrdpd+O5nO
 VB1CpCWaQEeF2IzkhF7Xc9m3mdc0ySUbD/WAIQ/Ss+upadpGL045vTMp4Vivu9jFHLYK
 39rQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=FfE8wtZK
Subject: [Buildroot] [PATCH 1/1] package/python-aerich: bump to version 0.9.2
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

Drop pydantic/tomli-w runtime dependencies, add anyio runtime
dependency.

Migrate from poetry to pdm-backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aerich/Config.in          | 4 +---
 package/python-aerich/python-aerich.hash | 4 ++--
 package/python-aerich/python-aerich.mk   | 7 ++++---
 3 files changed, 7 insertions(+), 8 deletions(-)

diff --git a/package/python-aerich/Config.in b/package/python-aerich/Config.in
index 4e7ea1117c..9b6d8f16c6 100644
--- a/package/python-aerich/Config.in
+++ b/package/python-aerich/Config.in
@@ -1,10 +1,8 @@
 config BR2_PACKAGE_PYTHON_AERICH
 	bool "python-aerich"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_ASYNCCLICK # runtime
 	select BR2_PACKAGE_PYTHON_DICTDIFFER # runtime
-	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
-	select BR2_PACKAGE_PYTHON_TOMLI_W # runtime
 	select BR2_PACKAGE_PYTHON_TORTOISE_ORM # runtime
 	help
 	  A database migrations tool for Tortoise ORM.
diff --git a/package/python-aerich/python-aerich.hash b/package/python-aerich/python-aerich.hash
index 6e44c241f3..7990532a2e 100644
--- a/package/python-aerich/python-aerich.hash
+++ b/package/python-aerich/python-aerich.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aerich/json
-md5  4d647c8f3829782f5770b7b120832f63  aerich-0.9.1.tar.gz
-sha256  629afbef5902635c41f410dd05def984c02e05e62d8a2020210a29a4aae19001  aerich-0.9.1.tar.gz
+md5  e4c7fcf3593c22d58c372595ca3d2e6c  aerich-0.9.2.tar.gz
+sha256  02d58658714eebe396fe7bd9f9401db3a60a44dc885910ad3990920d0357317d  aerich-0.9.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4cc00f0e33ac8e089b37d8a1474be441b26311bdc16fe035c75b51201515f617  LICENSE
diff --git a/package/python-aerich/python-aerich.mk b/package/python-aerich/python-aerich.mk
index c7417f3179..916279be78 100644
--- a/package/python-aerich/python-aerich.mk
+++ b/package/python-aerich/python-aerich.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_AERICH_VERSION = 0.9.1
+PYTHON_AERICH_VERSION = 0.9.2
 PYTHON_AERICH_SOURCE = aerich-$(PYTHON_AERICH_VERSION).tar.gz
-PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/a5/98/75c6e3053a14a14ffe86e2435698b960abe0bf03c114e67f966d92ff19e7
-PYTHON_AERICH_SETUP_TYPE = poetry
+PYTHON_AERICH_SITE = https://files.pythonhosted.org/packages/c4/60/5d3885f531fab2cecec67510e7b821efc403940ed9eefd034b2c21350f3c
+PYTHON_AERICH_SETUP_TYPE = pep517
 PYTHON_AERICH_LICENSE = Apache-2.0
 PYTHON_AERICH_LICENSE_FILES = LICENSE
+PYTHON_AERICH_DEPENDENCIES = host-python-pdm-backend
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
