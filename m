Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 50865C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:12:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EF28961019
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 06:12:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EF28961019
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C68A5403D4;
	Mon, 20 Sep 2021 06:12:24 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZQRIfjCapDfY; Mon, 20 Sep 2021 06:12:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 18D63403C1;
	Mon, 20 Sep 2021 06:12:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 57DC31BF3DC
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 479E482496
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 06:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id xeO-UdS5AEkl for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 06:11:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com
 [IPv6:2a00:1450:4864:20::32f])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 39CC98248F
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 06:11:38 +0000 (UTC)
Received: by mail-wm1-x32f.google.com with SMTP id v127so1602934wme.5
 for <buildroot@buildroot.org>; Sun, 19 Sep 2021 23:11:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=K8dYOfCwqYtghmwFRMnDrKy7T6SCDTWU3t2R0butoyI=;
 b=gIu8p+8Ol3JWRzeh7nm7ua99wY2wdkW9F4sPTqovg0bjt2EQi6zl1tUh3NwuSdAocB
 NXvQ054iFmdMk/ZWShnCXB6i5tjvTmsO3IRrvccNCsm/qcpXV7u0dwgZl2n5I0pY4Kjx
 SqvfviuUxBQpxINy8TQjNHG9rMJlbV2tm7sgLueD5+K4EWK8l0jfKPoqhHYQLWB3yUZ4
 NwIOYDtYbhNZtoKOgtE+hg8szj743Q/A0rOO9IrB74vnQ63ImXy0ibf/EMlDjz3lDXQ+
 MB3ee8A/urqmBGTIHtT3HcF5rPVGtK5EwhK4RtcEob5lV2l4I2mk0+HG7beDwZFGKBuF
 hSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=K8dYOfCwqYtghmwFRMnDrKy7T6SCDTWU3t2R0butoyI=;
 b=i0Wn+TusCJIwLWLBodqepeUztzOW9mqFLu6xvlaZIjtUbHpCGfQuLzRZUxl0+Sg+zd
 Y4yICu1FztjtENBiwN8aH99lKfWR7aMnslTYJkWEeIAJ5U95x17XPaLjnjm2evsUC8wO
 rG0Yv+cxcvRcMdo96YUeUiBg9spO0LtrLJPeFOs3O7+gaCd++9l1Ex5HZmDJm+DlToVY
 H7ro2aCJQNWYhhnygsk3MOsal2ehdVjQJjNxm0xLfo9uwsULro1X4QqpyFWq9I6TztV5
 wBix4L2SkdtRZ09gOf1qme4ZHy+ANsmpYl4itM+V0+PSILgoYY1CWxljbckIq9tOKNXE
 gZCw==
X-Gm-Message-State: AOAM532u5kKqX1r8D9xf/DxZbv/r34tmNHylcfb0NBkNBqsAMCEyITVD
 RNE2b/sUFqylM7SiE7NzsBhh0bIqZas=
X-Google-Smtp-Source: ABdhPJw+q6Lcozrerqqn7rastDr5T3l1qMkkT73zNHflKdwYutsbmDG8rZvYPyZmhx3bdDTRgDpZNg==
X-Received: by 2002:a7b:c959:: with SMTP id i25mr23040780wml.55.1632118296401; 
 Sun, 19 Sep 2021 23:11:36 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:72db:d93a:e4a7:fd06])
 by smtp.gmail.com with ESMTPSA id o1sm14622480wru.91.2021.09.19.23.11.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Sep 2021 23:11:36 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 09:11:25 +0300
Message-Id: <20210920061125.221541-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920061125.221541-1-asafka7@gmail.com>
References: <20210920061125.221541-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dominate: bump to version
 2.6.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-dominate/python-dominate.hash | 6 +++---
 package/python-dominate/python-dominate.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-dominate/python-dominate.hash b/package/python-dominate/python-dominate.hash
index 168e56e740..2e77d72a2e 100644
--- a/package/python-dominate/python-dominate.hash
+++ b/package/python-dominate/python-dominate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dominate/json
-md5	27d3aa7e0d67902c505e248e705e5e2e  dominate-2.4.0.tar.gz
-sha256	a92474b4312bd8b4c1789792f3ec8c571cd8afa8e7502a2b1c64dd48cd67e59c  dominate-2.4.0.tar.gz
+md5  9f714324ca99eee98bb3c3cdbe838de6  dominate-2.6.0.tar.gz
+sha256  76ec2cde23700a6fc4fee098168b9dee43b99c2f1dd0ca6a711f683e8eb7e1e4  dominate-2.6.0.tar.gz
 # Locally computed sha256 checksums
-sha256	9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
+sha256  9ccf26cfe845e0eb8bb58053e47366e7ab6b697ae010f7650978d4b71b7d1fc1  LICENSE.txt
diff --git a/package/python-dominate/python-dominate.mk b/package/python-dominate/python-dominate.mk
index e87b6842dd..79fc058737 100644
--- a/package/python-dominate/python-dominate.mk
+++ b/package/python-dominate/python-dominate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DOMINATE_VERSION = 2.4.0
+PYTHON_DOMINATE_VERSION = 2.6.0
 PYTHON_DOMINATE_SOURCE = dominate-$(PYTHON_DOMINATE_VERSION).tar.gz
-PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/46/dd/0fde17069c908951941475eee110c84467591caa1cd8ca30136294c26621
+PYTHON_DOMINATE_SITE = https://files.pythonhosted.org/packages/29/23/edf8e470f1053245c1aa99d92c8a3da9e83f6c7d3eb39205486965425be5
 PYTHON_DOMINATE_SETUP_TYPE = setuptools
 PYTHON_DOMINATE_LICENSE = LGPL-3.0+
 PYTHON_DOMINATE_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
