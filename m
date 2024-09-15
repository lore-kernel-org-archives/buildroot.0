Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FC74C35FE7
	for <buildroot@archiver.kernel.org>; Sun, 15 Sep 2024 06:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DBF5040290;
	Sun, 15 Sep 2024 06:45:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Za7oJ3uvdniU; Sun, 15 Sep 2024 06:45:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9E966404D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 9E966404D8;
	Sun, 15 Sep 2024 06:45:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 73FF71BF47D
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:45:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6F53B406C1
 for <buildroot@lists.busybox.net>; Sun, 15 Sep 2024 06:45:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SIf0Sat90fpr for <buildroot@lists.busybox.net>;
 Sun, 15 Sep 2024 06:45:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2f; helo=mail-io1-xd2f.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 457114065A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 457114065A
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 457114065A
 for <buildroot@buildroot.org>; Sun, 15 Sep 2024 06:45:35 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id
 ca18e2360f4ac-82cd93a6617so112403839f.3
 for <buildroot@buildroot.org>; Sat, 14 Sep 2024 23:45:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726382734; x=1726987534;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SivQliWcQTM1FR2gQcmEQ3C0DunVj4sCa1SflPIsSBM=;
 b=EdYJL+39xD9c48TNQpT7URNu95lda4ng8P7QMDWqy9p5Pxl6nqdkvIUzTe53LnphkT
 QG3VwXWoq4tO/0mpt+gHQrHEOVrr9g5YjVCyivTLh9ePB0cSJCnP4htz4FydgZAf+YT9
 bYxj6Lyc8xeH5AIoetmDFgr12eahnjYOn2CrgDtGJKKyA/z+YER0w9i5EFx8xoGp239Q
 A9ti3aDqfSxsB348rdytyDEirgwFQdtGRk7XYA2RGf1wuLmhK8+ZATfxzpnbmSDZZI+h
 l2X7Ie6WDSzuLcE/UfV0KModA1kfUXEUZpdSORmc2rxEDu+ZONegYMa5wNv5dVgCyeAn
 IUZA==
X-Gm-Message-State: AOJu0Ywv+D4DtksWdswb67JPKGe0IIQwv2y+bTWuVpAZCt67YVNtgIiQ
 UMee9NDXkpBJkITQGK5NQBYhqhBOw7ubSrCRKeyYLPmYEn0+7UUsreWhBw==
X-Google-Smtp-Source: AGHT+IGai2rJBNNP9jJAw7ZwXnmzSZx6wvHj+xarVZaQL0nfX4rXSkCArPSHIcXlQ86S95+Ib/4BUQ==
X-Received: by 2002:a05:6602:3cc:b0:82d:129f:acb6 with SMTP id
 ca18e2360f4ac-82d1f9672bemr1520213339f.14.1726382733765; 
 Sat, 14 Sep 2024 23:45:33 -0700 (PDT)
Received: from james-x399.localdomain (71-218-252-223.hlrn.qwest.net.
 [71.218.252.223]) by smtp.gmail.com with ESMTPSA id
 ca18e2360f4ac-82d492b733asm81716639f.25.2024.09.14.23.45.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 14 Sep 2024 23:45:33 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 15 Sep 2024 00:45:31 -0600
Message-Id: <20240915064531.1528042-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1726382734; x=1726987534; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SivQliWcQTM1FR2gQcmEQ3C0DunVj4sCa1SflPIsSBM=;
 b=DQ6lXrMbEa2+0Ny/Xq6+q9MCARQWFRN8F0BE84m5O9oEC34B8EQpOssKHWE/aPBEfL
 hF0MvIL8lGX3tBQ8UVqkuqGRGlKQWZeM1EnEFnTtWEDF0PpenCBLFwvoSRudWA8TtXwp
 bAe9wTX2gawARgRYaSsvTbdmssq6HnbcYJQuNNDr/t2MurBuG+oY8hJQQ9FAyN/PTc9g
 yky6aJ3KprQxl2crv0ukuX138gEE6od/EpPwZ2bnysGzOn3UY9bMxuMbjM+GF0McwazC
 egi/WWHT9F03ST5hS3KyjDaAMXTS8KuRF/yYWovrXlQfGNkjrtR2OBWtAHyQhXQMEXMO
 +FlQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=DQ6lXrMb
Subject: [Buildroot] [PATCH 1/1] package/python-fonttools: bump to version
 4.53.1
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
 package/python-fonttools/python-fonttools.hash | 4 ++--
 package/python-fonttools/python-fonttools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fonttools/python-fonttools.hash b/package/python-fonttools/python-fonttools.hash
index 7476656410..2319c55913 100644
--- a/package/python-fonttools/python-fonttools.hash
+++ b/package/python-fonttools/python-fonttools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fonttools/json
-md5  767059d1d373ade070d38295feaa3f92  fonttools-4.47.0.tar.gz
-sha256  ec13a10715eef0e031858c1c23bfaee6cba02b97558e4a7bfa089dba4a8c2ebf  fonttools-4.47.0.tar.gz
+md5  2601d5b066fc9f388a6816725f52f368  fonttools-4.53.1.tar.gz
+sha256  e128778a8e9bc11159ce5447f76766cefbd876f44bd79aff030287254e4752c4  fonttools-4.53.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6787208f83f659ccbc2223b2fde952ffa6f7e8aca62f1a8a2bf5bc51bb1b2383  LICENSE
diff --git a/package/python-fonttools/python-fonttools.mk b/package/python-fonttools/python-fonttools.mk
index e2472aa184..23588cd755 100644
--- a/package/python-fonttools/python-fonttools.mk
+++ b/package/python-fonttools/python-fonttools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FONTTOOLS_VERSION = 4.47.0
+PYTHON_FONTTOOLS_VERSION = 4.53.1
 PYTHON_FONTTOOLS_SOURCE = fonttools-$(PYTHON_FONTTOOLS_VERSION).tar.gz
-PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/dd/e5/9adc30ebca9009d5ad36c7e74462ee5fc51985ca9a845fd26f9f5c99b3df
+PYTHON_FONTTOOLS_SITE = https://files.pythonhosted.org/packages/c6/cb/cd80a0da995adde8ade6044a8744aee0da5efea01301cadf770f7fbe7dcc
 PYTHON_FONTTOOLS_SETUP_TYPE = setuptools
 PYTHON_FONTTOOLS_LICENSE = MIT
 PYTHON_FONTTOOLS_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
