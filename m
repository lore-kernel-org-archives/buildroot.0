Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56F5DC433F5
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 08:34:19 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 171FD6127C
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 08:34:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 171FD6127C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8B9444036A;
	Sat, 25 Sep 2021 08:34:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DUZ_F98EtDst; Sat, 25 Sep 2021 08:34:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8932C40371;
	Sat, 25 Sep 2021 08:34:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 3CBD71BF2FB
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 08:34:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 398D9403F2
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 08:34:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yZmjM7nzxM1j for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 08:34:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com
 [IPv6:2a00:1450:4864:20::42e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id F29C9403F0
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 08:34:12 +0000 (UTC)
Received: by mail-wr1-x42e.google.com with SMTP id w17so34420094wrv.10
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 01:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njzrVWleJCU2KEmNIy4QEAMF6t90MnLPVNUaU66n9UA=;
 b=FKODFr78HAokzGhERunhwZge3SPLsjwWVuaHeE4XlAUCzlzwaCTKgd/hjpEAa7cQVF
 Tp3ItIDwW97oBGAGhNL1hGWmHwRn38PNtpdEWladabreSUdUkRiHHeeRwYfVdc0k8fNI
 Ch1MDG/iL+cMNH8t25ebmMjOQCh8G6K9UkrT9iiU8GSWj94hY7etWZ52lcb/1OL3Lr+7
 2ehgJ1y6GZ9ztH3cS8ZOR5do9b+hx49dSpYGMc45/RDiJ5KzvFMbRlDg8j3hTs3j/M5e
 xMfIO9vcBET5DN7UPlA+sNO4iiiatNTtXAXsdSkm4YqogskRRkfYB3c9M9gqDRwNpIk6
 z0Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=njzrVWleJCU2KEmNIy4QEAMF6t90MnLPVNUaU66n9UA=;
 b=G6oeMk3fZf+ZcmeupEDjaMUhj6xBDcaepHaByQQ6MvG24OBk/6jr4ARbV1wRqxwLKA
 Hryh9bX4ICGoemC3nKLnqjVYVUh72kLh+tZMKUhRAH+TXFiCp3Dba0rcBIu737yFLKA8
 7bgrpcCBVeUjBAnevq1oJivwJYPkyNJJLdBT8ybzKgx2Y4QIO7V2C4i2CmO4D563vQYj
 zazAiP7hDVkMDMD9EvJTLWHYNWk0fI2DyR0L3wwJBJSxUHcc3wsHZTqhlK1+O8IGC1CR
 9tGD4NnDfX7LfGoSX1D62gImkVen65ClELSIvjTPNhJtByRj6IWQiEqa68UzdCInWZw6
 iVFQ==
X-Gm-Message-State: AOAM531kF38w8G4VLeIXTxOLjLfIXG1A6l6yQvq15Yw9JrTYdf7RyhGx
 BRwzajd60+yN+66FToTn9oBvsJD4BuY=
X-Google-Smtp-Source: ABdhPJyKL4XIoqMCYv7ch3FzxaM0f5Z8L7UMQCxFCkCsy2C6fT4/otvKyQMDoy7v+FH4ANAYH4VWXQ==
X-Received: by 2002:a05:600c:3b83:: with SMTP id
 n3mr6149007wms.50.1632558850889; 
 Sat, 25 Sep 2021 01:34:10 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id i67sm12618160wmi.41.2021.09.25.01.34.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 01:34:10 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 10:33:49 +0200
Message-Id: <20210925083349.3233388-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pip: needs python3
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
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

python 2 support has been dropped since version 21.0 resulting in the
following build failure since bump to version 21.2.4 in commit
3491f34d9ed97ac5980ff4a450367914b6985ff1:

  File "setup.py", line 7
    def read(rel_path: str) -> str:
                     ^

Fixes:
 - http://autobuild.buildroot.org/results/ed74f4ca96332454af329fac23505000c379d4a3

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/python-pip/Config.in         |  5 ++---
 package/python-pip/python-pip.mk     |  1 -
 package/python3-pip/python3-pip.hash |  1 -
 package/python3-pip/python3-pip.mk   | 19 -------------------
 4 files changed, 2 insertions(+), 24 deletions(-)
 delete mode 120000 package/python3-pip/python3-pip.hash
 delete mode 100644 package/python3-pip/python3-pip.mk

diff --git a/package/python-pip/Config.in b/package/python-pip/Config.in
index 61d8d7d317..92c3e3bd46 100644
--- a/package/python-pip/Config.in
+++ b/package/python-pip/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_PIP
 	bool "python-pip"
-	select BR2_PACKAGE_PYTHON_HASHLIB if BR2_PACKAGE_PYTHON # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_SETUPTOOLS # runtime
-	select BR2_PACKAGE_PYTHON_SSL if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_SSL if BR2_PACKAGE_PYTHON3 # runtime
+	select BR2_PACKAGE_PYTHON3_SSL
 	help
 	  The PyPA recommended tool for installing Python packages.
 
diff --git a/package/python-pip/python-pip.mk b/package/python-pip/python-pip.mk
index ba7134e235..81fc87d5f0 100644
--- a/package/python-pip/python-pip.mk
+++ b/package/python-pip/python-pip.mk
@@ -4,7 +4,6 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-pip/python3-pip.mk
 PYTHON_PIP_VERSION = 21.2.4
 PYTHON_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
 PYTHON_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
diff --git a/package/python3-pip/python3-pip.hash b/package/python3-pip/python3-pip.hash
deleted file mode 120000
index d90fb3d005..0000000000
--- a/package/python3-pip/python3-pip.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-pip/python-pip.hash
\ No newline at end of file
diff --git a/package/python3-pip/python3-pip.mk b/package/python3-pip/python3-pip.mk
deleted file mode 100644
index 5e20b06865..0000000000
--- a/package/python3-pip/python3-pip.mk
+++ /dev/null
@@ -1,19 +0,0 @@
-################################################################################
-#
-# python3-pip
-#
-################################################################################
-
-# Please keep in sync with package/python-pip/python-pip.mk
-PYTHON3_PIP_VERSION = 21.2.4
-PYTHON3_PIP_SOURCE = pip-$(PYTHON_PIP_VERSION).tar.gz
-PYTHON3_PIP_SITE = https://files.pythonhosted.org/packages/52/e1/06c018197d8151383f66ebf6979d951995cf495629fc54149491f5d157d0
-PYTHON3_PIP_SETUP_TYPE = setuptools
-PYTHON3_PIP_LICENSE = MIT
-PYTHON3_PIP_LICENSE_FILES = LICENSE.txt
-PYTHON3_PIP_CPE_ID_VENDOR = pypa
-PYTHON3_PIP_CPE_ID_PRODUCT = pip
-HOST_PYTHON3_PIP_DL_SUBDIR = python-pip
-HOST_PYTHON3_PIP_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
