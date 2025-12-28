Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BCCE784BE
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 22:38:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DB0E040712;
	Sun, 28 Dec 2025 22:38:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vQujRFlr28kz; Sun, 28 Dec 2025 22:38:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC6774050F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766961493;
	bh=+LqpSU+uvZ7MWC4BnwpWV8aCDV5XCpuRZqvJGif/KPA=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=QVzqMyZ0X7zYWn9MAhq0R9duHbUczjpki4qqxEH0NDGW/lYqJwlvqI/8qCxFLydlO
	 hS6/LoVNu/C62LQiloWPGlEeIdXaVdx0+bo1PrWJ1PtYcQnf8tsyex1Lh5N1Yk652r
	 16iQLm8LcfNBPrQTOb0zCrmYhn85CTCRoE3O6UZiowy7uBt6VKnlMvKGhg+nz0tZfY
	 eBJI7tCci/q0+HSrrH+TqaaNuBu5PhOoL7LvR5xBkC8xtYHRAXRj+3/RJ1RhI/lE56
	 39OZ0kWZgV4craRmxZHrumWFJOIISIYsY15HW8rawGUhHBGDzbaAxDoHANZ5VlXvXf
	 X7opKUbgTDvkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC6774050F;
	Sun, 28 Dec 2025 22:38:12 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id CAE55B9
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:38:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id BC49260A5C
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:38:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rxqOfDhTYk2e for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 22:38:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::330; helo=mail-ot1-x330.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org DF90A60785
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org DF90A60785
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com
 [IPv6:2607:f8b0:4864:20::330])
 by smtp3.osuosl.org (Postfix) with ESMTPS id DF90A60785
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 22:38:10 +0000 (UTC)
Received: by mail-ot1-x330.google.com with SMTP id
 46e09a7af769-7cdd651c884so2150110a34.1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 14:38:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766961489; x=1767566289;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4UInPPYECxMbRmiUrshVSLQXwied6+mbQS1zthpKyow=;
 b=FM6lYJ6jI5W77DRVyu9kEOadntG07NfXM/L6PZ1WzvEyAiXfY/acwNqGDJb1AGWQVk
 nEmXh+PlDx7YpqvsgrOY/oWo01I2cUUWx4WJ6HcteRhko0bE7xL6tx+M9pPkgZ0xtPv6
 mpB+0dg/VY4m9EXhQic7vi6Y97NgwpH6vznyNw9bOh7y52etnBhh6mhEyRJ56mz7HNRY
 GLL82D++6M23a7g4glcZZDD2aidy05rm8H+TTEE3s3i6Z0I2YJSkil+o0D/AZ7a2H/sB
 DibKzkIYiEmHRXtwa2PzHQj4WhzHMq6fPBrUaDOCNG/1Hk5zWfbsh42WVjWucKlnXVJA
 OIVQ==
X-Gm-Message-State: AOJu0YyD+F6Zz52G+Hj0nDTI7uoFBOkGypsI66FIF3y+3g7d537WvmHy
 /3/sAarMG4xpHVAmr7bNGAbOnlcc46KqtL0cQmbT4C56iM5gsGFgYzlk81eugUW3kS0=
X-Gm-Gg: AY/fxX6Mgd0yvrHWHConJM8SIBcfwLy6AQBv6/5fXxjrmimI2ad06AEEgcSUIe5sTkK
 M86vmrZpekWZ+bYgeTqdiOfIQJkmFfUMVqlCsT6jfpZ2fYKjYwujYp4sOkCPH0UYuRxtKcOGzdz
 1cBdHYZ5aWZn+vMsMA1kCgamgvjq0YjB2xXcvR6HhanL2pqkAB0THMochbC/zMZEgLtcJRwoFu5
 RP9wcHK0ATKAOSRN7p5VrHf3XDD7HYh4lH1FKdkEx+bE/HYrUl2VgFBwXxCmeBMJgeFLI2zDwCH
 pXIqhOsFlALO9N+z1492YmpCtM+XjFrAX5cMeKw+hrlGg2Shgzk41oZh88Xi1jPWD0ep2MwzbEb
 Dq54Tzd+2xen5PfB2e1BpFiWH8PuwBFRce1mLlpiht4kc0f8F5Ls34+p/n+sal6ZEERI9f2yr7O
 MDTTjq0XLwePs7L2YEahRhBMxhDnDKvs23QRXHBsSkCT0RjNlDyAO1CmZofgtTJcmtEj5Ylrb5A
 kC3G+UTvcqe0vXxjK301Ey4xPhfKnjj73J6gjBvIUUyEKE0yjDrF0I=
X-Google-Smtp-Source: AGHT+IFaojuq03xQLOTs5OjnHARKzXvjBNnXTA+v6JC6GdZ2bIg6w1ABmflZ/g0mDQgLC9ulvCyKKw==
X-Received: by 2002:a05:6830:4c0e:b0:7c6:9fcf:85d8 with SMTP id
 46e09a7af769-7cc65e7369cmr20533475a34.15.1766961489503; 
 Sun, 28 Dec 2025 14:38:09 -0800 (PST)
Received: from james-x399.tailafd1a.ts.net (71-33-156-49.hlrn.qwest.net.
 [71.33.156.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-7cc667d6b04sm19713500a34.16.2025.12.28.14.38.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 28 Dec 2025 14:38:09 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 28 Dec 2025 15:38:05 -0700
Message-ID: <20251228223806.2791954-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1766961489; x=1767566289; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=4UInPPYECxMbRmiUrshVSLQXwied6+mbQS1zthpKyow=;
 b=Koobbro7kEru/zNuko1HUErPK87XTGbI9G93RVgnFvEkTVd8n5BdGJNV+xGVUArlqY
 0mTjoUkQzrenmFjP6pPBaq62YKfq8l7ufMq7iouyR7PRYbNDlHp0PgYvnrahCADe5XGZ
 cfbEGhJ5s7Uh8YU5LqFnIkVJBncCLJoVUoXNKN+guiqi5jAqupP1fXwqZUg2KtzrGREj
 FyYJWQ+Jxxjx3hOuxCwYrcT9ONt2yJUBs7KlHJZHPSMV/3V/7sIipbsZbvAFX0MccZLi
 ti6PYzPRdoy26yL3BaZmIvVXg5rZYzo7GnXYAmZT/+QPb1hHY3Y6VtH2oGztoZdv/yh9
 4cFg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=Koobbro7
Subject: [Buildroot] [PATCH 1/1] package/python-txaio: bump to version
 25.12.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to hatch build backend.

License hash changed due to formatting changes:
https://github.com/crossbario/txaio/commit/9d1cb8a83964cb52643df4a105dc368c9c4f09ea

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-txaio/python-txaio.hash | 6 +++---
 package/python-txaio/python-txaio.mk   | 6 +++---
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-txaio/python-txaio.hash b/package/python-txaio/python-txaio.hash
index d561cec635..7e729e969f 100644
--- a/package/python-txaio/python-txaio.hash
+++ b/package/python-txaio/python-txaio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/txaio/json
-md5  297409f2dff8e71bad24467374aa8775  txaio-23.1.1.tar.gz
-sha256  f9a9216e976e5e3246dfd112ad7ad55ca915606b60b84a757ac769bd404ff704  txaio-23.1.1.tar.gz
+md5  86e8dd45a2ef07583fd85006cebd90e3  txaio-25.12.2.tar.gz
+sha256  9f232c21e12aa1ff52690e365b5a0ecfd42cc27a6ec86e1b92ece88f763f4b78  txaio-25.12.2.tar.gz
 # Locally computed sha256 checksums
-sha256  ab1dd7a42dbdae302346c5a4571f2149691cc1ec06836232bf4923527e3fe41c  LICENSE
+sha256  e7b0171093d8d2cec2db922db6d7634b5ddbb0338de111b38857d3160a7ea770  LICENSE
diff --git a/package/python-txaio/python-txaio.mk b/package/python-txaio/python-txaio.mk
index 585b3a5f57..cb29609254 100644
--- a/package/python-txaio/python-txaio.mk
+++ b/package/python-txaio/python-txaio.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_TXAIO_VERSION = 23.1.1
+PYTHON_TXAIO_VERSION = 25.12.2
 PYTHON_TXAIO_SOURCE = txaio-$(PYTHON_TXAIO_VERSION).tar.gz
-PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/51/91/bc9fd5aa84703f874dea27313b11fde505d343f3ef3ad702bddbe20bfd6e
+PYTHON_TXAIO_SITE = https://files.pythonhosted.org/packages/7f/67/ea9c9ddbaa3e0b4d53c91f8778a33e42045be352dc7200ed2b9aaa7dc229
 PYTHON_TXAIO_LICENSE = MIT
 PYTHON_TXAIO_LICENSE_FILES = LICENSE
-PYTHON_TXAIO_SETUP_TYPE = setuptools
+PYTHON_TXAIO_SETUP_TYPE = hatch
 
 $(eval $(python-package))
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
