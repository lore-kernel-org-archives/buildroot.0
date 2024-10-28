Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B21AD13591
	for <buildroot@archiver.kernel.org>; Mon, 28 Oct 2024 01:35:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CD70881416;
	Mon, 28 Oct 2024 01:35:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id y9ZueZLWOikS; Mon, 28 Oct 2024 01:35:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 90B38813DB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 90B38813DB;
	Mon, 28 Oct 2024 01:35:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id F3BCA4EC0
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:35:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4C93404FC
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:35:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NOcNdHmfeiNl for <buildroot@buildroot.org>;
 Mon, 28 Oct 2024 01:35:42 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d2e; helo=mail-io1-xd2e.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8E4AE404E2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8E4AE404E2
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8E4AE404E2
 for <buildroot@buildroot.org>; Mon, 28 Oct 2024 01:35:42 +0000 (UTC)
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-83abcfb9fd4so141400439f.3
 for <buildroot@buildroot.org>; Sun, 27 Oct 2024 18:35:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730079341; x=1730684141;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=stCRo5Diqm0FSyg0AKKn9rIsRgkz6N9QNKt++erxPUo=;
 b=NomoqeZcIYHO3PPOp3H9t6yil396fS6CxUHGUNebhh3D/ccn+ya3AILlXtAOZly46N
 xBxu/XysElW+8CK25+qAbT3KuJ8HvI7rNaeWOX0YJRkLV95i8JYUC7aEXSziv9vk0QuV
 PfS8UFhNvGdyYekIjnG+Mdjmcj2hbVvMD8RPhU+55Tv9o2nBfnr42zseEpa5XlGHkis/
 23EUEWCSkUQW1E3Hd7+NWvE6oKRnJ6qgK6YUIFuMBqP2J8YIj38FQGaeXNiWs8MODRhm
 qg9ELC9jXpB/d4VNOe6KI1IuDMS8H9TvlTZHbbSMQzA3asSDOPDbzYMKEDafV7+2Nyw3
 dWDA==
X-Gm-Message-State: AOJu0YzxNVaH1jeimqLk8A8T1y7BH6CgXcnKfQY6CiJoI46r86A5nG06
 r3zNH88jGM9txwH3Cr+4rM72mBGkvoyMKnH2vjamylKHHLiB/YN5SlrJWw==
X-Google-Smtp-Source: AGHT+IEdzGakJoX9nsfr/6ZUSRvvLCwg5bcmzImj8A8duD1R/fmDGTBMzrY4t/ISUCKTV2v7XoH1Dg==
X-Received: by 2002:a05:6602:2b86:b0:834:f2ff:ad66 with SMTP id
 ca18e2360f4ac-83b1c3edc46mr672484639f.5.1730079341209; 
 Sun, 27 Oct 2024 18:35:41 -0700 (PDT)
Received: from james-x399.localdomain (97-118-131-57.hlrn.qwest.net.
 [97.118.131.57]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4dc725eb58esm1409721173.27.2024.10.27.18.35.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 27 Oct 2024 18:35:40 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 27 Oct 2024 19:35:37 -0600
Message-Id: <20241028013537.4137391-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241028013537.4137391-1-james.hilliard1@gmail.com>
References: <20241028013537.4137391-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730079341; x=1730684141; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=stCRo5Diqm0FSyg0AKKn9rIsRgkz6N9QNKt++erxPUo=;
 b=JXlzdlhnSsQi2+HamN6sI01zl6kCXXrLoRrc9vqa27FWmwCcq5KFWdo9mKyXdu8Ntj
 p8lg9YDqGblTIpoSPE8eH8m9pWowdIaH9JDai6opklOwHgvClsf9fO/YsK1Yv0CIoTI/
 g6DzdGexOQmd16txmlhrdll2ZmLw5UsIEEa1uLzgdGqddnOPbtpcrJN+2kDBgDqmktbD
 5ny7YgxuJL4PHiVY9qhomMkZH4M9BMZ5eFhuNY1lvTzDQWEWNJ0ZHsXqn7cCm5WCJ9NG
 FUN7tQlqWfuSbRSLz5NOIXYJ8lNMLiwLDnZJvu1jzayQh47ch9TUV7ZYfenwJ7Ku7IgG
 JBWg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20230601 header.b=JXlzdlhn
Subject: [Buildroot] [PATCH 2/2] package/python-yarl: bump to version 1.16.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new python-propcache runtime dependency.

Add new host-python-cython build dependency.

Add new host-python-expandvars build dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-yarl/Config.in        | 5 +++--
 package/python-yarl/python-yarl.hash | 4 ++--
 package/python-yarl/python-yarl.mk   | 7 +++++--
 3 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-yarl/Config.in b/package/python-yarl/Config.in
index 84e14ce92e..48ed07cfde 100644
--- a/package/python-yarl/Config.in
+++ b/package/python-yarl/Config.in
@@ -1,7 +1,8 @@
 config BR2_PACKAGE_PYTHON_YARL
 	bool "python-yarl"
-	select BR2_PACKAGE_PYTHON_MULTIDICT
-	select BR2_PACKAGE_PYTHON_IDNA
+	select BR2_PACKAGE_PYTHON_IDNA # runtime
+	select BR2_PACKAGE_PYTHON_MULTIDICT # runtime
+	select BR2_PACKAGE_PYTHON_PROPCACHE # runtime
 	help
 	  Yet another URL library.
 
diff --git a/package/python-yarl/python-yarl.hash b/package/python-yarl/python-yarl.hash
index 624297aeba..766541bc94 100644
--- a/package/python-yarl/python-yarl.hash
+++ b/package/python-yarl/python-yarl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/yarl/json
-md5  4e46a0c7078d34d9734a7c5d182dee92  yarl-1.9.2.tar.gz
-sha256  04ab9d4b9f587c06d801c2abfe9317b77cdf996c65a90d5e84ecc45010823571  yarl-1.9.2.tar.gz
+md5  23595f461eb3eeba689e3567f60cd07a  yarl-1.16.0.tar.gz
+sha256  b6f687ced5510a9a2474bbae96a4352e5ace5fa34dc44a217b0537fec1db00b4  yarl-1.16.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-yarl/python-yarl.mk b/package/python-yarl/python-yarl.mk
index e4424ff577..78f5082bce 100644
--- a/package/python-yarl/python-yarl.mk
+++ b/package/python-yarl/python-yarl.mk
@@ -4,11 +4,14 @@
 #
 ################################################################################
 
-PYTHON_YARL_VERSION = 1.9.2
+PYTHON_YARL_VERSION = 1.16.0
 PYTHON_YARL_SOURCE = yarl-$(PYTHON_YARL_VERSION).tar.gz
-PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/5f/3f/04b3c5e57844fb9c034b09c5cb6d2b43de5d64a093c30529fd233e16cf09
+PYTHON_YARL_SITE = https://files.pythonhosted.org/packages/23/52/e9766cc6c2eab7dd1e9749c52c9879317500b46fb97d4105223f86679f93
 PYTHON_YARL_LICENSE = Apache-2.0
 PYTHON_YARL_LICENSE_FILES = LICENSE
 PYTHON_YARL_SETUP_TYPE = setuptools
+PYTHON_YARL_DEPENDENCIES = \
+	host-python-cython \
+	host-python-expandvars
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
