Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8104C02181
	for <buildroot@archiver.kernel.org>; Fri, 24 Jan 2025 19:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9B06A81926;
	Fri, 24 Jan 2025 19:42:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Sc3fll8WZuyM; Fri, 24 Jan 2025 19:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9F290818DC
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F290818DC;
	Fri, 24 Jan 2025 19:42:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 615EC944
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:42:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5D1B6818E6
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:42:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HC00cY4A6Q5U for <buildroot@buildroot.org>;
 Fri, 24 Jan 2025 19:42:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2a; helo=mail-io1-xd2a.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 747F6818DC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 747F6818DC
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 747F6818DC
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 19:42:08 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id
 ca18e2360f4ac-852050432a8so70892839f.1
 for <buildroot@buildroot.org>; Fri, 24 Jan 2025 11:42:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737747727; x=1738352527;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZvP8c67645bIEhmxsOc73RUyONnATqpqj6jP8l8YLTQ=;
 b=VJCHSzwwAPkonvwVI3UQfBzD15sjtU3Bn07KbCL/et34fG2d+XeUMkx+qKgcW6f8EI
 TIlJ2JQ1xJA5RWzPm5vlZTPMeUaCWHEF/ax5WVPvlv4iyicILf6gy/uEqYqQEhhFfpwZ
 yVzgTlCXj6SUb7CuPJFRC6t4rRaHoO8b3vAmKFCDRFG0Adwum/Gh2OJshdGZNWQ1pfOj
 0wAS7OUZxsqYys4GnnBGAU4xNa7pXbAiwOO51Oaia4HLBShhJzINACTmLEEYRs03HyTX
 BxXMeX6KjreBA7jpweoPYy29KAL1K+xcpdZpLNFHvPBSk+T8Mr0mzN1HicJUEDrYZe7S
 /2yQ==
X-Gm-Message-State: AOJu0YxSJ6xXxAhfo5wHE4zDn0H8huyU4xrlObRNQGvVQMx6wRfgZ0x7
 dAEzIIE7aaL4bCRVCPIamtKALM1DArOJU51+/JGhLGo2uqoMN9uh7TiyIws7
X-Gm-Gg: ASbGnctA0lt7JOsc24VNEaCyEklb7gkryqarwzOnYl4APgsjw/yEBH9FxtAAiwHJ5Sc
 e4GXQd2u/sFCSrG6CIGyPFYEe6/qfywjgEfK1Rc+ay7pp7IS6Qsoz1dVDqAIGGmSTnSLm0kqwlQ
 Gd5ERXaafPmbtfjtN9P4YsxQgUm+YKxUVtlKdNQDwCUKH6vMsgnDtWjdsz9BHTlsdb74TxeuntQ
 Fa16flu+B5R2pAoQ7pgXJlgwIUfuBeTUiaIsIy0nW98uUvMOaAchG8sZ7VTBI4jeBgyrsJXxnTi
 3GUHnhQZaLGM2E5XUCxM1Sog70jmrOH0NdYlR0yyKJBZE/rO0vTz7cQ=
X-Google-Smtp-Source: AGHT+IHcoM4oMIRoJpR+aAFM8JMrS8mMKjSiPFxKWpHIc3E3DNRvgUN1F0Sc9FyLLLb7AHCRYb0eXw==
X-Received: by 2002:a05:6602:280c:b0:84f:70b6:d827 with SMTP id
 ca18e2360f4ac-8520bde410dmr526296939f.8.1737747727264; 
 Fri, 24 Jan 2025 11:42:07 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-8521de0b206sm86016339f.11.2025.01.24.11.42.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 11:42:06 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 24 Jan 2025 12:42:04 -0700
Message-Id: <20250124194204.3819779-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1737747727; x=1738352527; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZvP8c67645bIEhmxsOc73RUyONnATqpqj6jP8l8YLTQ=;
 b=VDknZiGHcGADwTeuIybg9Lv4DnvdSrgngyLSkagxKbnOOGWki9IAvwXmKWOi+7i5eG
 iTThZX3Ly5sxzUHlkO0fb9ImdwjfsxogiQII/B2NBDA98lfg1Zqjm5TGoRzeh7/xlxVS
 RmDPiatIBt6UFbm8MpofOs/d75YIdJPfM18r6oWiboAYpANQgAFdUdEPjE1DESvLpYW0
 GM7849pQJk3UYro4C8qKO8myvDL+AGilYaU67XtvA7tovsV+VsEPW7G2rwTxHURIwPNU
 odFmzNaoPEcQWMEBUt4eB2loMFq9xyEkcZGlIs0D6NUnKlFYVi6N9Mq5Pa06AvqZvSxK
 Rbfg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=VDknZiGH
Subject: [Buildroot] [PATCH 1/1] package/python-marshmallow-sqlalchemy: bump
 to version 1.4.0
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-marshmallow-sqlalchemy.hash                        | 4 ++--
 .../python-marshmallow-sqlalchemy.mk                          | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
index 1fa5cee0c8..d91dca88b5 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/marshmallow-sqlalchemy/json
-md5  355535b775773755337059a1a990a0dc  marshmallow_sqlalchemy-1.3.0.tar.gz
-sha256  5ddf583dd75fdf5ab31df76987cda2ba91942996ba5d577e92d6748fa93a5f52  marshmallow_sqlalchemy-1.3.0.tar.gz
+md5  a037666fa3558f984dcc4b2b443378df  marshmallow_sqlalchemy-1.4.0.tar.gz
+sha256  ca169a26171077af8afa25789e9781680de0e9187563c422f1f67d0a0133433a  marshmallow_sqlalchemy-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  906b5d9051e426144cb173ad911667b8ebd05a9c584c2c26c135b32a3ed12001  LICENSE
diff --git a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
index 50bf77af85..6ce354a252 100644
--- a/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
+++ b/package/python-marshmallow-sqlalchemy/python-marshmallow-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.3.0
+PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION = 1.4.0
 PYTHON_MARSHMALLOW_SQLALCHEMY_SOURCE = marshmallow_sqlalchemy-$(PYTHON_MARSHMALLOW_SQLALCHEMY_VERSION).tar.gz
-PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/2c/6f/38843dc27666b2c802edc256c1981a34d1c28e898f3503ab5ea89c10f138
+PYTHON_MARSHMALLOW_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/6d/0c/89544d2b3aeae4af61ecd9df347d61d36768a67563e47b98423a853e8470
 PYTHON_MARSHMALLOW_SQLALCHEMY_SETUP_TYPE = flit
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE = MIT
 PYTHON_MARSHMALLOW_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
