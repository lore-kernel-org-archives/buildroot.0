Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0B78C46CD2
	for <buildroot@archiver.kernel.org>; Tue,  9 Jan 2024 07:42:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 799AB41A84;
	Tue,  9 Jan 2024 07:42:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 799AB41A84
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id KTVi0p6T6eet; Tue,  9 Jan 2024 07:42:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id BA0A041921;
	Tue,  9 Jan 2024 07:42:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BA0A041921
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4C2B11BF3EC
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:42:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 30CC641921
 for <buildroot@lists.busybox.net>; Tue,  9 Jan 2024 07:42:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 30CC641921
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZBgmyyZ63PIh for <buildroot@lists.busybox.net>;
 Tue,  9 Jan 2024 07:42:26 +0000 (UTC)
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44E5B418FF
 for <buildroot@buildroot.org>; Tue,  9 Jan 2024 07:42:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44E5B418FF
Received: by mail-il1-x12e.google.com with SMTP id
 e9e14a558f8ab-3606f133b1fso7725725ab.0
 for <buildroot@buildroot.org>; Mon, 08 Jan 2024 23:42:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704786144; x=1705390944;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wduDyNEA8WlQYGxTbuTll+j1R2/hfMFkNgbkbiPxOzU=;
 b=X4fNth33Lsc92NMjnmfHf000lVaLgixBrLac/2gD789bDBrffCv9TQOpDEbsaNAISC
 SksMIrvG0etK8zZBMMG20Xt9PaGkJlqxYvM7u3C+T6peSupC02jyDovPnGBRtJTvKqFt
 HqGq2C7K4UO6tDZbsLy+9MameS/Nm+NH5qcJBTBA/RD9K/mIiSoaA5JIdMsg8RqboY4F
 vIq301TFvsRuTMKPwNS3LS6tZRrZg5fJHiKn8pZuBslmWyjJCztt8iDlnBu09gvaicO3
 FP8ixNMexDqlsaMGnGWOjCmFNi6SP1Q/VVi/+ymm4Ats1kQproJmO8VFMjp+F3JfZM0i
 K6HQ==
X-Gm-Message-State: AOJu0YwRYwzzModKnfKj4bMag1L56H+m3x1zpxr7hawvuwyDC6uss/XD
 iALQxkXZl7/yI36ds9wxH+mMYYRyLwe5HQ==
X-Google-Smtp-Source: AGHT+IFZpWB6XfiWaAZS2Bl7OswERyskKYOYm+xoFUuQApXQhjGpCLFv9NkSwnoLf1WbFk+ZQOXCMw==
X-Received: by 2002:a05:6e02:194f:b0:360:632e:73a4 with SMTP id
 x15-20020a056e02194f00b00360632e73a4mr314629ilu.31.1704786144744; 
 Mon, 08 Jan 2024 23:42:24 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 bg6-20020a056e02310600b0035fedce3160sm453237ilb.33.2024.01.08.23.42.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Jan 2024 23:42:24 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 00:42:22 -0700
Message-Id: <20240109074222.4046259-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704786144; x=1705390944; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wduDyNEA8WlQYGxTbuTll+j1R2/hfMFkNgbkbiPxOzU=;
 b=TujMJLIlx3NmX095ILd41jzk4tvZpAn8greDL1x/YZhogTwW7bH4lnwVd2h6p6DFfc
 zv9K7HyI4ZO5qJ0zSsGFdwfTQq66ejZ04herLqE9EnWULKLrV53bAfzWav3Pk0mpwK4H
 4J+yjdKWh8Aycr46+6A7PdsU4dxrstu0nIx/YKsPxWBc9arvBMXJjHXbMyHLKWvoX7tT
 pQOZNiAw2OJ1Hzi48tvq2LF2G6MdB05j9GGqTqVxviOUkL4IGo2U36nJ9tUzAle3pJZ6
 HNYSLoTPJpW0X3ttwRlMDIQu/m6MJerOCNeFOuWmyQNFuqelocQ9xYwh7F9/L6bGZSl/
 D2CA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=TujMJLIl
Subject: [Buildroot] [PATCH v2 1/1] package/python-fastapi: bump to version
 0.108.0
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

Remove no longer required python-anyio runtime dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
Changes v1 -> v2:
  - fix commit message
---
 package/python-fastapi/Config.in           | 1 -
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 7d376d3dd7..d4a527c601 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -1,7 +1,6 @@
 config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
-	select BR2_PACKAGE_PYTHON_ANYIO # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 3dc1578cb7..8c578a386f 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  06bfa7c610fc9e81d05b0319eb70cae7  fastapi-0.105.0.tar.gz
-sha256  4d12838819aa52af244580675825e750ad67c9df4614f557a769606af902cf22  fastapi-0.105.0.tar.gz
+md5  6dd5b159f2d6a7c405b4cb5cb9afb564  fastapi-0.108.0.tar.gz
+sha256  5056e504ac6395bf68493d71fcfc5352fdbd5fda6f88c21f6420d80d81163296  fastapi-0.108.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index dc6d919926..dd435445cb 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.105.0
+PYTHON_FASTAPI_VERSION = 0.108.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/77/bb/5941e6e2ce3020f64b539a49d39f49be05de17d0c47fea95012589f812a5
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cb/0d/ec01761249b228f288b693a7ad6b2e695af521ca0f32dd09aef58890d9a4
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
