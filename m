Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0209C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 6B54E60184
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:52:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 6B54E60184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 341F560AC2;
	Mon, 27 Sep 2021 19:52:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id QAhqi6m69oPs; Mon, 27 Sep 2021 19:52:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8B86660AC0;
	Mon, 27 Sep 2021 19:52:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8D9D71BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7D2B180FE8
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9u2klygUVbfC for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 923D580F81
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:49 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 l18-20020a05600c4f1200b002f8cf606262so30321wmq.1
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tXGXNlmUmyqKot9RZnPt6K76/5NlDEJOjBN3+nRixaE=;
 b=XQlxXzHwe0kNWzDQiMZVrT8NFSUA0o0iBS44ggbI+Cv1YyKUwuYuVbVfz41/pRWFH/
 JKEFA/vkA0x+QD9RVq6+2My7VvoMEKRThuQ2ooULariBoF3pGedu/Wbc7k0uFRZWwc+q
 3IqAcwEcoLUwP8xYq34UfGlgpG4Jfmf9l7K6cOkpldPCZ98Qi1aRN2uUjDrBOwfgGnQi
 saFE0eDSFfxSeJ1S+9GkKKodJmcvj/mvKxc4ygVxUYmXXKer5Cymc0PBR+6dZGgSR97H
 K6+C3Ms3WW5rLn2c6G3xSUgKQ0t3NS2RPEzq457Vsv280FBGE8QJ4s5RxEhHdV5JmG3y
 pngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tXGXNlmUmyqKot9RZnPt6K76/5NlDEJOjBN3+nRixaE=;
 b=HctgvvKIAFGMZUEuEplnzfC5uUwO6bVq6pe/OKYXfTLd4mZ6oL7xmdxyHeaHvGOLzS
 +eszKTOQHwgBudNNs9NSAidhUC7wofOt4hrzUieQ+9me7ktj85EBY4qsc8uJCEZJAJ8B
 Jdb9XfwZ+0MoUVMtH1mWf4/35bKoQ7vobz7nocJHwS0gmnefr7aXYII4P6HSVVOwXwxQ
 5npQMlh5apYKhp7t7HrxYC1/IPBe7uoAjq7wT+/F1ViAMh4+5O/ES7U6mWn9QycGlNzI
 mP98NI9Znwi9Ys/usYBdFbMMD30xwRr6yNaUSZatxW2O9PmHrtS3x2sj+TOR/dvp/k/M
 1xAQ==
X-Gm-Message-State: AOAM532VyLskxvuhytJ2qlsPglMai9UrU2TboRB62vetY1CUYWUlkGnV
 tgTVelDqQVvIUSYA+uOGvAFuOCn8Ptc=
X-Google-Smtp-Source: ABdhPJwhahkDFWXt0tCiwt3lJGjKfNu7G/N/X7h16ug0CHQ31v29x6P1C4pFGu9jhoW42oaDXtxKbA==
X-Received: by 2002:a05:600c:510a:: with SMTP id
 o10mr874372wms.81.1632772307481; 
 Mon, 27 Sep 2021 12:51:47 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:47 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:28 +0300
Message-Id: <20210927195136.549542-4-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-botocore: bump to version
 1.21.48
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

* The package doesn't support python2 anymore.
* Sort select alphabetically.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-botocore/Config.in            | 3 ++-
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-botocore/Config.in b/package/python-botocore/Config.in
index f34d774f95..4df82f614c 100644
--- a/package/python-botocore/Config.in
+++ b/package/python-botocore/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_BOTOCORE
 	bool "python-botocore"
-	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
+	select BR2_PACKAGE_PYTHON_JMESPATH # runtime
 	select BR2_PACKAGE_PYTHON_URLLIB3 # runtime
 	help
 	  Low-level, data-driven core of boto 3.
diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index afaac12bde..31dd58de0a 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  870be84c9b418430ad9d0cb5640e76ef  botocore-1.12.210.tar.gz
-sha256  b954c596f8bdf31d5fdf1eff8a2296bde8094e1e22961a79b83bb62ddeba8a49  botocore-1.19.48.tar.gz
+md5  31ec9358b9b92d2d7cdba7fa448c4eed  botocore-1.21.48.tar.gz
+sha256  2c25a76f09223b2f00ad578df34492b7b84cd4828fc90c08ccbdd1d70abbd7eb  botocore-1.21.48.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 76c59d0a2d..d86ed5cb93 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.19.48
+PYTHON_BOTOCORE_VERSION = 1.21.48
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/35/73/c6fe3fafb74cc86a2a9ddf565a2b8956777e668c6248927e6d76b66f61a4
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/24/53/2d383e61b24637197ba213eb7891230b8d2a7f6ac8c44153943b4a760991
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
