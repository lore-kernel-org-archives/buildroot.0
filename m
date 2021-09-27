Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 462E3C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:57 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D1BE460FED
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D1BE460FED
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id A502181016;
	Mon, 27 Sep 2021 19:52:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tH7AMxSyfL29; Mon, 27 Sep 2021 19:52:55 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF3708104F;
	Mon, 27 Sep 2021 19:52:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id EE7C81BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DE7CC40276
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:54 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id exrHiWTQxxnH for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:54 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C4EFA40251
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:53 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id w29so53775369wra.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UOFcVmEwpuekqwOPMDMHRnhMJNiGdaxQ/LvXtRroKDI=;
 b=QFIR1MiN/CWXONe8rbdr8WDd2vSQ6qlFimwm9st6v6Y1F5TJTLUJg9xP7d6583uMH6
 DeSmrmkZqVmIYphvIoKCMC4gg5wdKhrrdTb3g36pj1sCVeQl7V8hG8tfC403Nalabtaw
 byVBlFyU5mTt/PgiGjP1zAVIhvC+nX1HIgpUNUmr7CZCV0Ac+oeNXXMH3CW1ZvbqA4C4
 toe49N3pWBqrk6FJXyLyLTfzOjpHuQfXaN0JfDGqPrOFGfv89h1pxrqrxSVzaa8EnCA9
 YYIHkRE1T+Wyt4kZC5fkhIXChq7m3aGenhRRBfZtlWVyqEZbxYOTFwD7IyU9B1Rahmr6
 YpzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UOFcVmEwpuekqwOPMDMHRnhMJNiGdaxQ/LvXtRroKDI=;
 b=ZuZAvxHNfMfwQzKxJ6wtAE53Fh2qGHQm9VJ82MCcOIZl/65xB7qFq4qTKScSA32J5u
 g2dTaqJp/9jEdUdvi8qFXNyX3JATwhghxvZ6hWA5vAE4NRNiMoAunLUOsIwJV+dFfzR8
 4rydYEKRVXlQfF1yiQ2D94twsrYAo16cJebUeVEl6Hit4IAjgiYzSGqGRkK4hEEubw/Q
 LkwsL33D0jOOq1ZS55pWe2pQgnV442mcibS11LNC2K+YAVHysczDU6c/cw7VNwjd7ltO
 QgB0hZ73l3qUB085vwQCwEAXxLOT2auQ3xTKAr80325fCPO1CQtBGj0CBcfgHrDsYYCi
 Ujig==
X-Gm-Message-State: AOAM531cSNSl+lJFi7z8rBb5o9E2NtDa48cmdsMS8RyYpOs3P3dE5WHq
 JZ0XrcLfam1pMESHHU9LZ08RQiQwR4M=
X-Google-Smtp-Source: ABdhPJx0WooC4p6cM+SEq3uDKbvDIwzZqsoAYtD+4pnCEKJhkClsQoOF5ZBnFrDdKi747bGEpf+pwg==
X-Received: by 2002:a5d:4cc6:: with SMTP id c6mr2020629wrt.108.1632772311939; 
 Mon, 27 Sep 2021 12:51:51 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:51 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:31 +0300
Message-Id: <20210927195136.549542-7-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-decorator: bump to version
 5.1.0
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

The pacakge doesn't support python2 anymore. Therefore, we can remove
host-python3-decorator and add a host variant for python-decorator.
As a consequence of that, the python-networkx dependency was renamed from
host-python3-decorator to host-python-decorator.

In addition, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-decorator/Config.in             |  1 +
 package/python-decorator/python-decorator.hash |  6 +++---
 package/python-decorator/python-decorator.mk   |  6 +++---
 package/python-networkx/python-networkx.mk     |  2 +-
 .../python3-decorator/python3-decorator.hash   |  1 -
 package/python3-decorator/python3-decorator.mk | 18 ------------------
 6 files changed, 8 insertions(+), 26 deletions(-)
 delete mode 120000 package/python3-decorator/python3-decorator.hash
 delete mode 100644 package/python3-decorator/python3-decorator.mk

diff --git a/package/python-decorator/Config.in b/package/python-decorator/Config.in
index e7ec00cd69..0e84840657 100644
--- a/package/python-decorator/Config.in
+++ b/package/python-decorator/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DECORATOR
 	bool "python-decorator"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  Better living through Python with decorators
 
diff --git a/package/python-decorator/python-decorator.hash b/package/python-decorator/python-decorator.hash
index 77b48d84cd..46ff7206d7 100644
--- a/package/python-decorator/python-decorator.hash
+++ b/package/python-decorator/python-decorator.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/decorator/json
-md5	933981f288c4230816b5beee8d40e6ea decorator-4.4.1.tar.gz
-sha256	54c38050039232e1db4ad7375cfce6748d7b41c29e95a081c8a6d2c30364a2ce decorator-4.4.1.tar.gz
+md5  d01585c3ea5b36a209747fcc978a98c8  decorator-5.1.0.tar.gz
+sha256  e59913af105b9860aa2c8d3272d9de5a56a4e608db9a2f167a8480b323d529a7  decorator-5.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
+sha256  fd11660cabf0532082c45706862fafc294907ec7f8e217818240a4999806782e  LICENSE.txt
diff --git a/package/python-decorator/python-decorator.mk b/package/python-decorator/python-decorator.mk
index 7c4b353aaa..a61f045e2a 100644
--- a/package/python-decorator/python-decorator.mk
+++ b/package/python-decorator/python-decorator.mk
@@ -4,10 +4,9 @@
 #
 ################################################################################
 
-# Please keep in sync with package/python3-decorator/python3-decorator.mk
-PYTHON_DECORATOR_VERSION = 4.4.1
-PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
+PYTHON_DECORATOR_VERSION = 5.1.0
 PYTHON_DECORATOR_SOURCE = decorator-$(PYTHON_DECORATOR_VERSION).tar.gz
+PYTHON_DECORATOR_SITE = https://files.pythonhosted.org/packages/92/3c/34f8448b61809968052882b830f7d8d9a8e1c07048f70deb039ae599f73c
 PYTHON_DECORATOR_LICENSE = BSD-2-Clause
 PYTHON_DECORATOR_LICENSE_FILES = LICENSE.txt
 PYTHON_DECORATOR_CPE_ID_VENDOR = python
@@ -15,3 +14,4 @@ PYTHON_DECORATOR_CPE_ID_PRODUCT = decorator
 PYTHON_DECORATOR_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
+$(eval $(host-python-package))
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 8ebbc84bde..c7ec98d8ff 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -12,7 +12,7 @@ PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
 PYTHON_NETWORKX_CPE_ID_PRODUCT = networkx
 PYTHON_NETWORKX_SETUP_TYPE = setuptools
-HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python3-decorator
+HOST_PYTHON_NETWORKX_DEPENDENCIES = host-python-decorator
 HOST_PYTHON_NETWORKX_NEEDS_HOST_PYTHON = python3
 
 $(eval $(python-package))
diff --git a/package/python3-decorator/python3-decorator.hash b/package/python3-decorator/python3-decorator.hash
deleted file mode 120000
index f515d3133b..0000000000
--- a/package/python3-decorator/python3-decorator.hash
+++ /dev/null
@@ -1 +0,0 @@
-../python-decorator/python-decorator.hash
\ No newline at end of file
diff --git a/package/python3-decorator/python3-decorator.mk b/package/python3-decorator/python3-decorator.mk
deleted file mode 100644
index ed6d86fe3a..0000000000
--- a/package/python3-decorator/python3-decorator.mk
+++ /dev/null
@@ -1,18 +0,0 @@
-################################################################################
-#
-# python3-decorator
-#
-################################################################################
-
-# Please keep in sync with package/python-decorator/python-decorator.mk
-PYTHON3_DECORATOR_VERSION = 4.4.1
-PYTHON3_DECORATOR_SITE = https://files.pythonhosted.org/packages/dc/c3/9d378af09f5737cfd524b844cd2fbb0d2263a35c11d712043daab290144d
-PYTHON3_DECORATOR_SOURCE = decorator-$(PYTHON3_DECORATOR_VERSION).tar.gz
-PYTHON3_DECORATOR_LICENSE = BSD-2-Clause
-PYTHON3_DECORATOR_LICENSE_FILES = LICENSE.txt
-PYTHON3_DECORATOR_CPE_ID_VENDOR = python
-PYTHON3_DECORATOR_CPE_ID_PRODUCT = decorator
-PYTHON3_DECORATOR_SETUP_TYPE = setuptools
-HOST_PYTHON3_DECORATOR_NEEDS_HOST_PYTHON = python3
-
-$(eval $(host-python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
