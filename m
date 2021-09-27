Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BB9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 0A82160560
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 06:39:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 0A82160560
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D1CAB6072C;
	Mon, 27 Sep 2021 06:39:09 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lIgXhWPV-DIz; Mon, 27 Sep 2021 06:39:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1B16D60790;
	Mon, 27 Sep 2021 06:39:08 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7D7171BF307
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 6C57540489
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 06:38:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp2.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wiVPKBya8qSr for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 06:38:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 4CAEF404B0
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 06:38:22 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id v17so5752766wrv.9
 for <buildroot@buildroot.org>; Sun, 26 Sep 2021 23:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Wi+zvhtJgdZ/hje+lmGjST18j2pvPPDDem9h9yzWYEw=;
 b=HyGgHIoT7QFaaDoAz5WNJfGmZbMiyHCldlkKcOttPlhCDtop22QBg7IMdTeTiBp921
 PCJeGZoNIXLVbmd8v32C/5Q7gTZTVvI46CDr3T84g4bubWGVIo7qcdlvYmQkq711HjTB
 Cx6XuCxFndIBY6YIhOJhPqnTM41gbZxTb2/EZTQ621/DgVms2NfJaVDyVh2U5TgtEvH5
 +el18ASf6IucJGvw3TLgggP4WjCmvaRQeiZLvXOyMsx07MGbqQxIeRtIuk7AdSkUBE3y
 rvokYU1cZ7VboHfQ+vQQsZVhdpWrCcIYxvMYnGNiUFoOhmhVmmoxnF9NmsgVFSC/XVVM
 H6pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Wi+zvhtJgdZ/hje+lmGjST18j2pvPPDDem9h9yzWYEw=;
 b=C3876Lzw0cdbMP+XsiGjMdQ0Zoa7P2bmvUENgyuRxInf52ng8W4+uAs2bjsqRMWWIn
 dyBnRZVMbMezNoe0XpgyTncWRmVnlYS6pwZq6VJLmYXGe8MDf01zLIaCq1Vxiq21tiPN
 AxWzrR2u4g3YF+Xxje/z1W79AuzO5eFu4pUZBYA40uCuwMtjmOOTWlmv0S5Pjvpadkdc
 nxYsAl7W7e8IH7UZhpkQrLm23ezr23WkVLeb/hjvVT/S4NIGg/B4dMrhI7ZBBv8fwPqV
 24HNyH62XXP6vYqkNGUqyUlcR3Y/YvrW5uOzXNsPbNEaM0TUFbnvye3TXYhYQjxzSJqz
 Sq2g==
X-Gm-Message-State: AOAM530neUyqPEHFmrqPZFcX2l9o8B1g+vDQSsR6gIoDe0m5yCk24Wvu
 +kArk3ZXxL5hpOPTlxpWoJe4MNh69JU=
X-Google-Smtp-Source: ABdhPJx2XwPmxGrzL4k95zqkajfqmthddXfKk+m7w7BnwLF78mvzu4BuwtCcX5ygdoJYmsfm4z+Ihg==
X-Received: by 2002:adf:fa0d:: with SMTP id m13mr3762182wrr.418.1632724700397; 
 Sun, 26 Sep 2021 23:38:20 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:424d:6143:cd4e:c1e])
 by smtp.gmail.com with ESMTPSA id t13sm5061135wro.76.2021.09.26.23.38.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 26 Sep 2021 23:38:20 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 09:38:07 +0300
Message-Id: <20210927063809.505480-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927063809.505480-1-asafka7@gmail.com>
References: <20210927063809.505480-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-traitlets: bump to version
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

The package is now standalone (no dependencies) and supports
only python3.
Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-traitlets/Config.in             | 5 +----
 package/python-traitlets/python-traitlets.hash | 6 +++---
 package/python-traitlets/python-traitlets.mk   | 4 ++--
 3 files changed, 6 insertions(+), 9 deletions(-)

diff --git a/package/python-traitlets/Config.in b/package/python-traitlets/Config.in
index f1804e55be..6515cdf8d1 100644
--- a/package/python-traitlets/Config.in
+++ b/package/python-traitlets/Config.in
@@ -1,9 +1,6 @@
 config BR2_PACKAGE_PYTHON_TRAITLETS
 	bool "python-traitlets"
-	select BR2_PACKAGE_PYTHON_ENUM34 if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON_SIX  # runtime
-	select BR2_PACKAGE_PYTHON_IPYTHON_GENUTILS  # runtime
-	select BR2_PACKAGE_PYTHON_DECORATOR  # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A configuration system for Python applications.
 
diff --git a/package/python-traitlets/python-traitlets.hash b/package/python-traitlets/python-traitlets.hash
index 068db553c3..01e2bf8e30 100644
--- a/package/python-traitlets/python-traitlets.hash
+++ b/package/python-traitlets/python-traitlets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/traitlets/json
-md5	3a4f263af65d3d79f1c279f0247077ef  traitlets-4.3.3.tar.gz
-sha256	d023ee369ddd2763310e4c3eae1ff649689440d4ae59d7485eb4cfbbe3e359f7  traitlets-4.3.3.tar.gz
+md5  19483ec0685e837912cff128209aa845  traitlets-5.1.0.tar.gz
+sha256  bd382d7ea181fbbcce157c133db9a829ce06edffe097bcf3ab945b435452b46d  traitlets-5.1.0.tar.gz
 # Locally computed sha256 checksums
-sha256	71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
+sha256  71c89129039b870cc92309466c4fbe8f285a82fa0ea36f0e840fa83979cbe31f  COPYING.md
diff --git a/package/python-traitlets/python-traitlets.mk b/package/python-traitlets/python-traitlets.mk
index 5973caf3bb..5f41f6ee8f 100644
--- a/package/python-traitlets/python-traitlets.mk
+++ b/package/python-traitlets/python-traitlets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TRAITLETS_VERSION = 4.3.3
+PYTHON_TRAITLETS_VERSION = 5.1.0
 PYTHON_TRAITLETS_SOURCE = traitlets-$(PYTHON_TRAITLETS_VERSION).tar.gz
-PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/75/b0/43deb021bc943f18f07cbe3dac1d681626a48997b7ffa1e7fb14ef922b21
+PYTHON_TRAITLETS_SITE = https://files.pythonhosted.org/packages/d5/bc/37d490908e7ac949614d62767db3c86f37bc5adb6129d378c35859a75b87
 PYTHON_TRAITLETS_LICENSE = BSD-3-Clause
 PYTHON_TRAITLETS_LICENSE_FILES = COPYING.md
 PYTHON_TRAITLETS_SETUP_TYPE = distutils
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
