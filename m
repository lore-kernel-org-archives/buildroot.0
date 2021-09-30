Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4807FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:53 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id DD81B615E1
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org DD81B615E1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id B6ECA40328;
	Thu, 30 Sep 2021 07:03:52 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FxBUzyGk4v3i; Thu, 30 Sep 2021 07:03:51 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id C12AC40795;
	Thu, 30 Sep 2021 07:03:50 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12CC41BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0EC0C42525
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QT31a6oqDIOj for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:20 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 0B6FA424FF
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:19 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 205-20020a1c01d6000000b0030cd17ffcf8so7449181wmb.3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tAFTEhSO6FztuBEfZysc/pOE7TMWXVV5MCLlxSh9Vxk=;
 b=EyjeySS8DtDlKqfg0gZ8wQX6b1s7w5ZcYwg3h0LuOZtl2oAegT4n4Y4N9+UEm0limp
 o46c5BSkOHFQaQsTsPR9H5GH01PLLVL27BoQxGaebUYSkhL054OV6dz4YarU0YdaElmX
 BMF9dkARbI1S53rp45Ou/+Macu4TZN2yCc8qSw+sVp2CkpNO7FVc1Djrga4wwrwxBIRW
 xalg4BRuf0Jf8Edt8rVzW7C71Fhk0vRhRPmgPMWsknpiSbmzuuzq8eL0Za2nsb5hrYf2
 MsXsVjXUSl9K1zYmANOyhgj6NElXVnng2H3RA8b/lCSwojdEQ0RulRf8iko4+4b8Doq/
 +5Cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tAFTEhSO6FztuBEfZysc/pOE7TMWXVV5MCLlxSh9Vxk=;
 b=MYk5Yc1IUsOF8WqCOD5+h3MkzF2xrqJ2zAGl3lOAxT+1z8bWZqGmSLllIR2DECfUD5
 GneFzYB1LkvKafzcRYx5OhNm4ReFXTy663G2gINDUC0DjghRPrwuR1CFf1jwRo1OqY3p
 zfYMWpVmkXRjf8/Bw87Tq7nwszqEqoifNtCUHxrlBYRSx9YBvV9cYiu3zsFq7sTBcuAA
 b7npUKjLrzdNeqv2JuV/aZ4956XFWKKCFPE9kwefEwY8A6UN1Iope2/HKXXhJGPRix3X
 wq8GLvSsa1U/jC6EX5Wief15GhFxGUcnAjZDyn0rPyC/UreFGQ3fnpDLctvB4sSv9Gq3
 WKIQ==
X-Gm-Message-State: AOAM532OAcc3R0wxYq7094yYOT/qdlNz7xg9Zhl1ynXWv7bJtyfjUogl
 V87xcZ1HfIgFRrrfhCmvgbhtcZQB9FM=
X-Google-Smtp-Source: ABdhPJxCQkOjckcNa/oiUGqvW0CbC7lAmUUbabMU7puw5ASSyyhL/A8JcMpf5jOQuLm36dJtY/lZMw==
X-Received: by 2002:a05:600c:4b87:: with SMTP id
 e7mr14298818wmp.108.1632985278167; 
 Thu, 30 Sep 2021 00:01:18 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:17 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:51 +0300
Message-Id: <20210930070051.40361-15-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-xlsxwriter: bump to version
 3.0.1
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

* The package doesn't python2 anymore.
* Indent with two spaces in the hash file.
* License changes was a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-xlsxwriter/Config.in              | 4 ++--
 package/python-xlsxwriter/python-xlsxwriter.hash | 8 ++++----
 package/python-xlsxwriter/python-xlsxwriter.mk   | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/package/python-xlsxwriter/Config.in b/package/python-xlsxwriter/Config.in
index 3641bd0525..b5da7f3f1a 100644
--- a/package/python-xlsxwriter/Config.in
+++ b/package/python-xlsxwriter/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PYTHON_XLSXWRITER
 	bool "python-xlsxwriter"
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_ZLIB
 	help
 	  A Python module for creating Excel XLSX files.
 
diff --git a/package/python-xlsxwriter/python-xlsxwriter.hash b/package/python-xlsxwriter/python-xlsxwriter.hash
index 59890b725e..7c9698067b 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.hash
+++ b/package/python-xlsxwriter/python-xlsxwriter.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/XlsxWriter/json
-md5	799bf9c16ff58a7c38509b1895b7bc63  XlsxWriter-1.2.2.tar.gz
-sha256	5a5e2195a4672d17db79839bbdf1006a521adb57eaceea1c335ae4b3d19f088f  XlsxWriter-1.2.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/xlsxwriter/json
+md5  5f759dccf222e8f2a9924e90c4afaf84  XlsxWriter-3.0.1.tar.gz
+sha256  3f39bf581c55f3ad1438bc170d7f4c4649cee8b6b7a80d21f79508118eeea52a  XlsxWriter-3.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	777cb44c00ba1c2905686fa32f2ca3ba17422b96fc229be3d8f0f1333bc4ecfe  LICENSE.txt
+sha256  8fbb9b28ef0afac1c7d999102fd2634f347448d069c8c821976f3dbd2b3f812c  LICENSE.txt
diff --git a/package/python-xlsxwriter/python-xlsxwriter.mk b/package/python-xlsxwriter/python-xlsxwriter.mk
index ccc2fc7eba..4c8a512086 100644
--- a/package/python-xlsxwriter/python-xlsxwriter.mk
+++ b/package/python-xlsxwriter/python-xlsxwriter.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_XLSXWRITER_VERSION = 1.2.2
+PYTHON_XLSXWRITER_VERSION = 3.0.1
 PYTHON_XLSXWRITER_SOURCE = XlsxWriter-$(PYTHON_XLSXWRITER_VERSION).tar.gz
-PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/73/78/3ea62c5ad7255a0ff676c87ea88b152090b2178cb27325ba3bb0bb4122c9
+PYTHON_XLSXWRITER_SITE = https://files.pythonhosted.org/packages/5d/36/e943d07af9d26cc2f11861955dbf0031e891f77f3d55f70217fd6a0f4d9f
 PYTHON_XLSXWRITER_SETUP_TYPE = setuptools
 PYTHON_XLSXWRITER_LICENSE = BSD-2-Clause
 PYTHON_XLSXWRITER_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
