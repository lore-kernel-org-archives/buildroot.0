Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07A9FC433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 52ECD60FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 52ECD60FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2C53F80D40;
	Tue, 28 Sep 2021 06:44:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ixbur4ja2KFi; Tue, 28 Sep 2021 06:44:45 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7104880EEF;
	Tue, 28 Sep 2021 06:44:44 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 4613B1BF40A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 425CE80D36
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id cBoVNRxJuMD2 for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 06:44:12 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 22DC580D40
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 06:44:11 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id w29so55940720wra.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 23:44:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=NsJz99aOllmzR+OP+RHi0qoEfaL0tGOPgSUT5F5Ypkk=;
 b=V7MrrrQ1ltiA8U0uU1w5avvtx9tSJseJqQmW7NeVz0xiEYTlzxalAPil9QArFN1257
 PgIk/tcWg6BXTKKI77CtO1I2nyi+Mi3TEks+p+sqZkv6L9JSBKC+j8hTq/asW58n1nCB
 IqpY0pBjCE96dW4bPy+fexQdac3aFvZqwR2qYD/i29XGuHIOhuj08BTgOFErZnO6zOx7
 gfoRxyqWVfD9hiuN2zFCattzpjadVh/EWcZBDplJOTiH6COwV/fmk3C6GKgiap452E8m
 fxlwMBMcwBSqI7/x9XPCDhHaNwY9hA7HjVzGZJ6ELK5IH89DOaWHY+gtR+TNDhIQeSzd
 quHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=NsJz99aOllmzR+OP+RHi0qoEfaL0tGOPgSUT5F5Ypkk=;
 b=fcGefb/q8Gz1zfmoaJU6OA2J6jS2pjPVk7X4SJYYE0jkOpk3b/Y+JQe4+1N7LbwVSQ
 5d7vETuv2/2o2yj+hMYygThgzShKQfFebol+0pxcajRXZDnG1BwYxJvGs25Sm1kHVDCb
 fb2otjoc6f9c48wSgG+PYSWnw4nUygkR9BERHzYKdKR1MFmylooK5mXPJYfYnXABwjCn
 WmyNTvnK+4omn6tm7V+3d+LRrgDkor81A+W0AnbkiYCO8JHwYt82xqKLiehh27qMfZny
 0rAuWqkX+tyTJMfUHqz9+wIOYG/zRk4bIxSHp1kdtnPjwH15PS8kdgt+1Zdrk3fNkmef
 auLw==
X-Gm-Message-State: AOAM530IegrEZ4RObEXaigCylH2A8987+OQR6eUqYfnNO2Nw3KzaVvUZ
 b6a+UuWzuwAgcXYQcLt8sok73nsK24U=
X-Google-Smtp-Source: ABdhPJyZwLmS7A0OkUGmzu+NJYHirPDG7JMhFGp2na9Ctbu5I7WZccVnqVt1SWnliu9RF1bYkksiHA==
X-Received: by 2002:adf:fb0a:: with SMTP id c10mr4586146wrr.354.1632811449299; 
 Mon, 27 Sep 2021 23:44:09 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7b33:8acc:211c:62ed])
 by smtp.gmail.com with ESMTPSA id 1sm1923428wms.0.2021.09.27.23.44.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 23:44:09 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 09:43:58 +0300
Message-Id: <20210928064400.573159-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928064400.573159-1-asafka7@gmail.com>
References: <20210928064400.573159-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-more-itertools: bump to
 version 8.10.0
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
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

And update URL on Config.in.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-more-itertools/Config.in                  | 2 +-
 package/python-more-itertools/python-more-itertools.hash | 4 ++--
 package/python-more-itertools/python-more-itertools.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-more-itertools/Config.in b/package/python-more-itertools/Config.in
index 1a7f95c27f..f54b52d1f0 100644
--- a/package/python-more-itertools/Config.in
+++ b/package/python-more-itertools/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_MORE_ITERTOOLS
 	help
 	  More routines for operating on iterables, beyond itertools.
 
-	  https://github.com/erikrose/more-itertools
+	  https://github.com/more-itertools/more-itertools
diff --git a/package/python-more-itertools/python-more-itertools.hash b/package/python-more-itertools/python-more-itertools.hash
index 189498ec5e..4e6e7bdfb8 100644
--- a/package/python-more-itertools/python-more-itertools.hash
+++ b/package/python-more-itertools/python-more-itertools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/more-itertools/json
-md5  0912041c05148ed079984cff69af2e99  more-itertools-8.4.0.tar.gz
-sha256  68c70cc7167bdf5c7c9d8f6954a7837089c6a36bf565383919bb595efb8a17e5  more-itertools-8.4.0.tar.gz
+md5  9930552c4f7eedc00193673d5f7f0f19  more-itertools-8.10.0.tar.gz
+sha256  1debcabeb1df793814859d64a81ad7cb10504c24349368ccf214c664c474f41f  more-itertools-8.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  09f1c8c9e941af3e584d59641ea9b87d83c0cb0fd007eb5ef391a7e2643c1a46  LICENSE
diff --git a/package/python-more-itertools/python-more-itertools.mk b/package/python-more-itertools/python-more-itertools.mk
index ef21f4d27d..3b9957b72e 100644
--- a/package/python-more-itertools/python-more-itertools.mk
+++ b/package/python-more-itertools/python-more-itertools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MORE_ITERTOOLS_VERSION = 8.4.0
+PYTHON_MORE_ITERTOOLS_VERSION = 8.10.0
 PYTHON_MORE_ITERTOOLS_SOURCE = more-itertools-$(PYTHON_MORE_ITERTOOLS_VERSION).tar.gz
-PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/67/4a/16cb3acf64709eb0164e49ba463a42dc45366995848c4f0cf770f57b8120
+PYTHON_MORE_ITERTOOLS_SITE = https://files.pythonhosted.org/packages/8a/f7/93cf3c81629c95f6f40e509f7cd63985a6ddd829181a66c1c8ef101e55f2
 PYTHON_MORE_ITERTOOLS_SETUP_TYPE = setuptools
 PYTHON_MORE_ITERTOOLS_LICENSE = MIT
 PYTHON_MORE_ITERTOOLS_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
