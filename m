Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73357C433EF
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:12 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0DDDF61159
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0DDDF61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A72C540688;
	Tue, 28 Sep 2021 06:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id s0dVqATZjmoa; Tue, 28 Sep 2021 06:44:10 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0F44440555;
	Tue, 28 Sep 2021 06:44:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id A76721BF40A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8A48F80D40
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id sZtar45Zd52B for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 06:44:07 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com
 [IPv6:2a00:1450:4864:20::432])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FE9580D36
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 06:44:07 +0000 (UTC)
Received: by mail-wr1-x432.google.com with SMTP id w29so55940394wra.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 23:44:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffmKXRDdDisRw6YBe8FSAdLQmLUsdKU71FRzpEHcPy8=;
 b=bUTN/rJXJ9T57f7w40E4e6icZ2gcHPLmp2NIoFrWY0joW8t6Rh4SraW3akXLQTf9p9
 EvYWANhF/eUKg3+PCXviueqziwqRMZg1tp8Fi50rHmhRsIbiEGrQ5FTR1JBzcAnME4+v
 8+MmwCK5PxeWN34wJzPnm/+0jJBPM/3M1ipSN9bxJO2L7AGQofooQwgVcuZeSylAdtmE
 jqZGFaeT0W75tX11SKFALMROnrdT61/cScoIu7JNBaoSFqnPXWTT2QKXtGR1KdYD9iDd
 XL5NbuQQyM5rdsEwcSUN23bxHVrEUKw85Kq7U/14T8vVTN4dpNhLPlPqdoold20lXI47
 m46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ffmKXRDdDisRw6YBe8FSAdLQmLUsdKU71FRzpEHcPy8=;
 b=l7+H9ofLy8OtFoPCR5n4cbrLSTXNUr1+qgT/iTQTQb78MvuqPDhTQm3Yg6x6nQpBm6
 w2UB+K4w1k779T/XlniJzghspT0crddTcc6z1+9lofLsOTZW/itNa+1udF21QrRgfTKE
 Z0bz7yrEI44SmxClR2ucl9ycXIo9xr8wCVDtVvsqNmXRHSuSeZfkSHtovj+HobrU7yDi
 2ABz0FqfhX8IuvuDzNZMeLJjE0WpHmpdRWRo9fnh/6U6EhUiX5hRu3VS6URk1T5d4xAd
 Sx2rEyjfCD4LwJNL4xy30DlT1BwAY/VFAJ9PgVGRUbkQ1fkE5ci7uh3x59WnO7L6pWrL
 egjg==
X-Gm-Message-State: AOAM532jhcHieZNRYxbmd3lqy9Mh747fDv84++PACXU2TtwJJ3s2zz9N
 V0tX4KUD4djCZ0TQrC6XCk2z4mc01Oc=
X-Google-Smtp-Source: ABdhPJxGyt8IFssfxpxLhGjRJG+Bn/IXMRuEUSxbZVWN3FkYCa2UDxWWfjRQKqhwkuGuz+6uYmqndg==
X-Received: by 2002:a5d:6da9:: with SMTP id u9mr4380873wrs.155.1632811445306; 
 Mon, 27 Sep 2021 23:44:05 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7b33:8acc:211c:62ed])
 by smtp.gmail.com with ESMTPSA id 1sm1923428wms.0.2021.09.27.23.44.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 23:44:05 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 09:43:55 +0300
Message-Id: <20210928064400.573159-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-incremental: bump to
 versioni 21.3.0
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

* Update URL on Config.in
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-incremental/Config.in               | 2 +-
 package/python-incremental/python-incremental.hash | 8 ++++----
 package/python-incremental/python-incremental.mk   | 4 ++--
 3 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/package/python-incremental/Config.in b/package/python-incremental/Config.in
index 64f8623354..c895e820c5 100644
--- a/package/python-incremental/Config.in
+++ b/package/python-incremental/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_INCREMENTAL
 	help
 	  A library for versioning your Python projects.
 
-	  https://github.com/hawkowl/incremental
+	  https://github.com/twisted/incremental
diff --git a/package/python-incremental/python-incremental.hash b/package/python-incremental/python-incremental.hash
index c897f6e495..47af832f39 100644
--- a/package/python-incremental/python-incremental.hash
+++ b/package/python-incremental/python-incremental.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/incremental/json
-md5	602746e0d438e075a5a9e0678140bba2  incremental-17.5.0.tar.gz
-sha256	7b751696aaf36eebfab537e458929e194460051ccad279c72b755a167eebd4b3  incremental-17.5.0.tar.gz
-# Locally computed sha256
-sha256	d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
+md5  9f7ad12e0c05a12cee52a7350976c4e3  incremental-21.3.0.tar.gz
+sha256  02f5de5aff48f6b9f665d99d48bfc7ec03b6e3943210de7cfc88856d755d6f57  incremental-21.3.0.tar.gz
+# Locally computed sha256 checksums
+sha256  d043bc8899b4695de1f4511d8f507b927e11723b981ce600fa3ef7b73954afa5  LICENSE
diff --git a/package/python-incremental/python-incremental.mk b/package/python-incremental/python-incremental.mk
index 9c9d3a4405..7c6b2a547c 100644
--- a/package/python-incremental/python-incremental.mk
+++ b/package/python-incremental/python-incremental.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_INCREMENTAL_VERSION = 17.5.0
+PYTHON_INCREMENTAL_VERSION = 21.3.0
 PYTHON_INCREMENTAL_SOURCE = incremental-$(PYTHON_INCREMENTAL_VERSION).tar.gz
-PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/8f/26/02c4016aa95f45479eea37c90c34f8fab6775732ae62587a874b619ca097
+PYTHON_INCREMENTAL_SITE = https://files.pythonhosted.org/packages/4f/c5/430765c697afc217c8491785de321a21fa4d983dda14bcd82feb965b0593
 PYTHON_INCREMENTAL_SETUP_TYPE = setuptools
 PYTHON_INCREMENTAL_LICENSE = MIT
 PYTHON_INCREMENTAL_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
