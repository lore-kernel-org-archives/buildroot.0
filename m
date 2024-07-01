Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27F6CC2BD09
	for <buildroot@archiver.kernel.org>; Mon,  1 Jul 2024 19:36:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DA25D60AD6;
	Mon,  1 Jul 2024 19:36:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vZIN6vW4UoIQ; Mon,  1 Jul 2024 19:36:36 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AA0FB60AC3
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AA0FB60AC3;
	Mon,  1 Jul 2024 19:36:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 93A4D1BF346
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:36:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8D1E341365
 for <buildroot@lists.busybox.net>; Mon,  1 Jul 2024 19:36:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sT5ttlxvhkGu for <buildroot@lists.busybox.net>;
 Mon,  1 Jul 2024 19:36:33 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d31; helo=mail-io1-xd31.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ABC844016D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ABC844016D
Received: from mail-io1-xd31.google.com (mail-io1-xd31.google.com
 [IPv6:2607:f8b0:4864:20::d31])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ABC844016D
 for <buildroot@buildroot.org>; Mon,  1 Jul 2024 19:36:32 +0000 (UTC)
Received: by mail-io1-xd31.google.com with SMTP id
 ca18e2360f4ac-7f3d6785665so115371039f.1
 for <buildroot@buildroot.org>; Mon, 01 Jul 2024 12:36:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719862591; x=1720467391;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OKaLpuB+9som/aAZjIvRXxRAopW/j8gl+5XglRUnLCA=;
 b=lfyXdaMCq9DMH3+6DI04MhQyMTlt5E6c4RIifdPpIiNfq/siFRBsPqX2zXp/c5uRRN
 LAB6a60qm9J9WvCwombp+VqYUdUmMSJHp97AqBXAwYUEXHiZBCx9PQCNQ0JsCZaao+bx
 mDttmvQYeg9WIRrMgNIeXDSw4qzQNxKsxDp1AQxxTfYzRuo9OR0kne/OjJp86o8bJ98f
 A3wVDmAzR8K/o+T745QPv53mXs3r1fCHnswQVfCABtTqcnbGpOF+2YvKQYqHh5LxdRAl
 /7t9kmS/S3kvblaWYuQu+ul5e01pOh+WQfjfhzMN1DgMYOEDQnaPx/6dvBOxzhHMDHwK
 M8bA==
X-Gm-Message-State: AOJu0YxWGThqZRoJuPC7cFClT0WEW6m5iGdOiQ1mGt+pufgdoev1+k7X
 xh8uS/psj7OipDDhBbJFqaku3LWnOK1Mn9WqdYIt8Om84jQXTrpdvMJCGw==
X-Google-Smtp-Source: AGHT+IFVbCnQtKNAQNEPEsuqTQNZttUcadg2U4F4/Sly7Vr1lbUBlNm9NGs0POl5jUio+lu+Enx0Qw==
X-Received: by 2002:a05:6602:2d90:b0:7f6:366e:d4cd with SMTP id
 ca18e2360f4ac-7f6366ed627mr790208339f.0.1719862591289; 
 Mon, 01 Jul 2024 12:36:31 -0700 (PDT)
Received: from james-x399.localdomain (97-118-179-167.hlrn.qwest.net.
 [97.118.179.167]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4bb73bb37basm2329344173.34.2024.07.01.12.36.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Jul 2024 12:36:31 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  1 Jul 2024 13:36:22 -0600
Message-Id: <20240701193622.1786979-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1719862591; x=1720467391; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=OKaLpuB+9som/aAZjIvRXxRAopW/j8gl+5XglRUnLCA=;
 b=JeWdtVhYDA574TBTzpxfRNHWg8wS5vnyyOHMkLo2uBZlXpMtRORHsVGpWMlIKd3zVV
 //9TMCrs/7XWGZKkMdl7f72inK75vmPkjoXtOaEWDqf7d+j2loNxdd6q6aHGJeQ/spO+
 pHS2y/MOvFJse8nzkPjarUYv5wcmitgAH4nVJYZErwiRBe5Okzj7llUSYDwFYVG+LJao
 eZSl1J+3CxIb+bwiGvmz/4coj6ZuV+/X6zaOpY5lYtvkZruns24w/4XlDe6nDZMHA0cO
 XPxNlEMMuWJlMFKHvATUjbPVKLGUIqqmiAg4oGrlyBLKD/CtcJYLch7WULApxyUq6niy
 +c0w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JeWdtVhY
Subject: [Buildroot] [PATCH 1/1] package/python-pydantic-core: bump to
 version 2.20.0
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

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pydantic-core/python-pydantic-core.hash | 2 +-
 package/python-pydantic-core/python-pydantic-core.mk   | 6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydantic-core/python-pydantic-core.hash b/package/python-pydantic-core/python-pydantic-core.hash
index d11b3bfbb4..1703fcff3d 100644
--- a/package/python-pydantic-core/python-pydantic-core.hash
+++ b/package/python-pydantic-core/python-pydantic-core.hash
@@ -1,4 +1,4 @@
 # Locally calculated after vendoring
-sha256  3359b437ca74c8f7e1b8ec477b1ff1e39f0fff08abb0eb171953f9bc3e8773c6  python-pydantic-core-v2.19.0-git4-cargo2.tar.gz
+sha256  a3597bcb7a6c9aabee543ba5797ba4997eb5a91b36bc6c596be4640bccf98daf  pydantic_core-2.20.0.tar.gz
 # Locally computed sha256 checksums
 sha256  2afdd30d54b4d62b6f488a6bcc1546e84ec5061f13f4209c03d012348783795a  LICENSE
diff --git a/package/python-pydantic-core/python-pydantic-core.mk b/package/python-pydantic-core/python-pydantic-core.mk
index 79d06deab2..2e37c37004 100644
--- a/package/python-pydantic-core/python-pydantic-core.mk
+++ b/package/python-pydantic-core/python-pydantic-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_CORE_VERSION = v2.19.0
-PYTHON_PYDANTIC_CORE_SITE = https://github.com/pydantic/pydantic-core
-PYTHON_PYDANTIC_CORE_SITE_METHOD = git
+PYTHON_PYDANTIC_CORE_VERSION = 2.20.0
+PYTHON_PYDANTIC_CORE_SOURCE = pydantic_core-$(PYTHON_PYDANTIC_CORE_VERSION).tar.gz
+PYTHON_PYDANTIC_CORE_SITE = https://files.pythonhosted.org/packages/7d/fa/9802d053f33dbcf110d46e3f28667b06cd764b164f1e3f4189848cdd6e78
 PYTHON_PYDANTIC_CORE_SETUP_TYPE = maturin
 PYTHON_PYDANTIC_CORE_LICENSE = MIT
 PYTHON_PYDANTIC_CORE_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
