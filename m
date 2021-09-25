Return-Path: <SRS0=vewd=OP=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65D44C433EF
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:23 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3346061279
	for <buildroot@archiver.kernel.org>; Sat, 25 Sep 2021 09:47:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3346061279
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0E8B683332;
	Sat, 25 Sep 2021 09:47:23 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id xXY84oGRN0gm; Sat, 25 Sep 2021 09:47:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 67A988349A;
	Sat, 25 Sep 2021 09:47:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0A1D21BF29E
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EDE956070B
 for <buildroot@lists.busybox.net>; Sat, 25 Sep 2021 09:46:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gnv-8zq-WVE0 for <buildroot@lists.busybox.net>;
 Sat, 25 Sep 2021 09:46:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42a.google.com (mail-wr1-x42a.google.com
 [IPv6:2a00:1450:4864:20::42a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1F53A60644
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 09:46:37 +0000 (UTC)
Received: by mail-wr1-x42a.google.com with SMTP id g16so34907378wrb.3
 for <buildroot@buildroot.org>; Sat, 25 Sep 2021 02:46:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Ku7tb/zkSdzGX02CTR5gJcWql1M060IZ9VaZ9PHQr1o=;
 b=mC5NhQwj7gYbyy3DTIHBlIFYSLS9itwT3HYGRomnV64CuzUJiATxm9K6felKKTUwJn
 v3IZzuWncIfrAWu+4jT3Gv2YEyFdblpZr58fMNN6sJHWW9LpALoHiuInq7w26oUJAVI5
 uTl0ylKQII9qE4XzZMuk6HmdJ3DA3iH10b8mlFor9qEmv2vzx7IaDQy6DieOcouTd1YI
 sm7lEKXsXDj4t1ryJH0unnD49RRmBEk+aAq1hd4b0toRjLD/7QENrpK9fkI4M0ZI76pP
 dRhWSCORwy6V3X82R6vJTwY4HMHkEZ9dU1gamntwTGqmxlr9MMQnE2kGiix/kV7WYooM
 hHPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Ku7tb/zkSdzGX02CTR5gJcWql1M060IZ9VaZ9PHQr1o=;
 b=tiBrvCjZGstakwNbg6YUvQ0QfCkSvvxPvMdThBMaynFAUNJ9vUBktx1uL+fYZ1nqZF
 yutwTqDb3BUiA3gVtY8rtm0DLtAHBjwFdnHDkPfMWUjinc5DfHmNk7S2UO50KAHN02eQ
 6VRB4wZKBpGWSDNu5h22dzx8b8t+9dvLFkoHEVEaDvc8+LjXzQDaQ215srKB7G0iZemK
 p0RsYmdjuFveCsdLKGDOV3aDg04nHcXNDhmhNExUY+g2e2MB6rAIpekQQI00NG9wx5cs
 f/li/KPoPW68Y3mQNlw5xQFXXvfHim/HyDMhNog0slh6z1/dPkMtlYLqdGdr5IpHqH4E
 YzNg==
X-Gm-Message-State: AOAM531JM3FMPRTQXLgK3iaZi8BXzgxURcLhEGYedlJz+mMtniSH6YzY
 v0IjqnhE8usNT82XPYu0vMqspPhg5xo=
X-Google-Smtp-Source: ABdhPJx5lVKA3tDd5BzxhFxPTwd84H7M9qejarvJ6awNKxv2biG8BEJzbynOa31CfRysj45ujrkibQ==
X-Received: by 2002:adf:f789:: with SMTP id q9mr16629552wrp.367.1632563196236; 
 Sat, 25 Sep 2021 02:46:36 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7829:fae8:ae6e:81f0])
 by smtp.gmail.com with ESMTPSA id d2sm10297194wrc.32.2021.09.25.02.46.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 25 Sep 2021 02:46:35 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 25 Sep 2021 12:46:25 +0300
Message-Id: <20210925094626.365400-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210925094626.365400-1-asafka7@gmail.com>
References: <20210925094626.365400-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-psycopg2: bump to version
 2.9.1
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

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-psycopg2/python-psycopg2.hash | 4 ++--
 package/python-psycopg2/python-psycopg2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-psycopg2/python-psycopg2.hash b/package/python-psycopg2/python-psycopg2.hash
index bf73f8ad25..d02ffc2ec8 100644
--- a/package/python-psycopg2/python-psycopg2.hash
+++ b/package/python-psycopg2/python-psycopg2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/psycopg2/json
-md5  c232ff3e3bfee35e1a0e15bc089cb294  psycopg2-2.8.5.tar.gz
-sha256  f7d46240f7a1ae1dd95aab38bd74f7428d46531f69219954266d669da60c0818  psycopg2-2.8.5.tar.gz
+md5  182e3e8cf3381c254f65f70cad4976e5  psycopg2-2.9.1.tar.gz
+sha256  de5303a6f1d0a7a34b9d40e4d3bef684ccc44a49bbe3eb85e3c0bffb4a131b7c  psycopg2-2.9.1.tar.gz
 # Locally computed sha256 checksums
 sha256  9614b85dfc9a72c5b2ca33144c1d7e1ed3b1c297459d9fb28a6a5762c2e8d71b  LICENSE
diff --git a/package/python-psycopg2/python-psycopg2.mk b/package/python-psycopg2/python-psycopg2.mk
index b6f1f6ab70..de466e2c59 100644
--- a/package/python-psycopg2/python-psycopg2.mk
+++ b/package/python-psycopg2/python-psycopg2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PSYCOPG2_VERSION = 2.8.5
+PYTHON_PSYCOPG2_VERSION = 2.9.1
 PYTHON_PSYCOPG2_SOURCE = psycopg2-$(PYTHON_PSYCOPG2_VERSION).tar.gz
-PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/a8/8f/1c5690eebf148d1d1554fc00ccf9101e134636553dbb75bdfef4f85d7647
+PYTHON_PSYCOPG2_SITE = https://files.pythonhosted.org/packages/aa/8a/7c80e7e44fb1b4277e89bd9ca509aefdd4dd1b2c547c6f293afe9f7ffd04
 PYTHON_PSYCOPG2_SETUP_TYPE = setuptools
 PYTHON_PSYCOPG2_LICENSE = LGPL-3.0+
 PYTHON_PSYCOPG2_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
