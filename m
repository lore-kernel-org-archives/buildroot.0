Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D15A7C4332F
	for <buildroot@archiver.kernel.org>; Sun,  5 Nov 2023 02:54:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 73483821A2;
	Sun,  5 Nov 2023 02:54:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 73483821A2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 98psYoD-hluB; Sun,  5 Nov 2023 02:54:24 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A8F8A821AD;
	Sun,  5 Nov 2023 02:54:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A8F8A821AD
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1E89D1BF267
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:54:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E7D10821AD
 for <buildroot@lists.busybox.net>; Sun,  5 Nov 2023 02:54:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E7D10821AD
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RC7ItYCl1WbQ for <buildroot@lists.busybox.net>;
 Sun,  5 Nov 2023 02:54:20 +0000 (UTC)
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com
 [IPv6:2607:f8b0:4864:20::d29])
 by smtp1.osuosl.org (Postfix) with ESMTPS id A9637821A2
 for <buildroot@buildroot.org>; Sun,  5 Nov 2023 02:54:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A9637821A2
Received: by mail-io1-xd29.google.com with SMTP id
 ca18e2360f4ac-7aca968a063so126275939f.0
 for <buildroot@buildroot.org>; Sat, 04 Nov 2023 19:54:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699152859; x=1699757659;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7YozVSxZZpdFcwXNN03AZ4r7vOi1o7TbZ12mi5XjqsY=;
 b=rfTkFXQ1ZXxZqvLX1kd15IfkEraosNsMT8nojf/AKo4e4vaeClGQcdEq4kd6Xvlxoo
 HcPgmIYPV5874aR2f2sQujoMQysMpjFHbJLumd5bUK460eHSOyKsKxO6Yjarl+ZZlCKE
 OrIqT70NVsAHwtKRchDiLWroe03e0m//wM0QzZHrIk0yo5DGV5fA+LtRvufIwEcYYH3/
 qM72RpJqyUZXJ0EzZlcWEdq0hu38jJIxz3UCbvMWgKRcoiG12F7ZtecuOUWiHY8hGwJL
 KAjX6yeplWvZYTfAP5Hbmcwa96yJ2YXoPu/IXyFa+k3a+uDwQNtebLNApEG0VZ9Og76P
 0gGA==
X-Gm-Message-State: AOJu0YwW2UiGsMuIzXUugXbdKBtCSRmNCGhy3XGMcZK91b40dq0VqmkJ
 OeLgI10rrKu59tHPVdNJbqUvGWbHaC8=
X-Google-Smtp-Source: AGHT+IGfw7HrO+K8CBrQj+daOCt2Nrwj5Vafr5ki/V63mOsDosgIEhQJSoJM2gynzgVYtWF+naolnQ==
X-Received: by 2002:a05:6602:29cf:b0:7a9:9513:755 with SMTP id
 z15-20020a05660229cf00b007a995130755mr30839018ioq.11.1699152859210; 
 Sat, 04 Nov 2023 19:54:19 -0700 (PDT)
Received: from james-x399.localdomain (71-33-131-93.hlrn.qwest.net.
 [71.33.131.93]) by smtp.gmail.com with ESMTPSA id
 u12-20020a02cbcc000000b0043cee9b7f86sm1313377jaq.77.2023.11.04.19.54.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 04 Nov 2023 19:54:18 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  4 Nov 2023 20:54:17 -0600
Message-Id: <20231105025417.2767070-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1699152859; x=1699757659; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7YozVSxZZpdFcwXNN03AZ4r7vOi1o7TbZ12mi5XjqsY=;
 b=dSykBX5v7+hU1Lub+qEr6T9yvLfZd1sbDweEoLCR4HKBqoBES5yvTc1iuCnva8XEX5
 1TjI6qwrO1LBxI7fzYEJcaYRw2XRnE+MrIq2UQ844n+upysYKzrJNnP5i8h91WqrvOaK
 SUGubgTE0bvE1g8654KwE217rpR4ohVM9obuv6rv6gL04SITBkpsck4IeOwbORsMgidk
 fjWK0iAdqiqTOyJc2i6JKBeS6wxWRyJQgUU5QSeU1Jei21eyt5YUl/CATwCDRTqbuA7c
 fI6qBMwbLpR+KZVyaCPtifdHiyRUfG9VZTUCcB7tx6UOeT9Sa+IeppNh7dfnFyg/+lGT
 5nrA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=dSykBX5v
Subject: [Buildroot] [PATCH 1/1] package/python-charset-normalizer: bump to
 version 3.3.2
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
Cc: James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 .../python-charset-normalizer/python-charset-normalizer.hash  | 4 ++--
 .../python-charset-normalizer/python-charset-normalizer.mk    | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-charset-normalizer/python-charset-normalizer.hash b/package/python-charset-normalizer/python-charset-normalizer.hash
index 05e52fe2a6..8ef0e3fed0 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.hash
+++ b/package/python-charset-normalizer/python-charset-normalizer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/charset-normalizer/json
-md5  dbb8c5b745beddbaae67d06dce0b7c29  charset-normalizer-3.2.0.tar.gz
-sha256  3bb3d25a8e6c0aedd251753a79ae98a093c7e7b471faa3aa9a93a81431987ace  charset-normalizer-3.2.0.tar.gz
+md5  0a4019908d9e50ff13138e8a794d9e2b  charset-normalizer-3.3.2.tar.gz
+sha256  f30c3cb33b24454a82faecaf01b19c18562b1e89558fb6c56de4d9118a032fd5  charset-normalizer-3.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  eb31a0c5a4fb09b8a4e32055d25c1e5f9c358a2752fef3cd720213d1ccfee241  LICENSE
diff --git a/package/python-charset-normalizer/python-charset-normalizer.mk b/package/python-charset-normalizer/python-charset-normalizer.mk
index 46f8530b5f..914b96eb69 100644
--- a/package/python-charset-normalizer/python-charset-normalizer.mk
+++ b/package/python-charset-normalizer/python-charset-normalizer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CHARSET_NORMALIZER_VERSION = 3.2.0
+PYTHON_CHARSET_NORMALIZER_VERSION = 3.3.2
 PYTHON_CHARSET_NORMALIZER_SOURCE = charset-normalizer-$(PYTHON_CHARSET_NORMALIZER_VERSION).tar.gz
-PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/2a/53/cf0a48de1bdcf6ff6e1c9a023f5f523dfe303e4024f216feac64b6eb7f67
+PYTHON_CHARSET_NORMALIZER_SITE = https://files.pythonhosted.org/packages/63/09/c1bc53dab74b1816a00d8d030de5bf98f724c52c1635e07681d312f20be8
 PYTHON_CHARSET_NORMALIZER_SETUP_TYPE = setuptools
 PYTHON_CHARSET_NORMALIZER_LICENSE = MIT
 PYTHON_CHARSET_NORMALIZER_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
