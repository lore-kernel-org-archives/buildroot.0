Return-Path: <SRS0=gEIP=ND=busybox.net=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42F40C432BE
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 14:18:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 46769610FC
	for <buildroot@archiver.kernel.org>; Thu, 12 Aug 2021 14:18:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 46769610FC
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=busybox.net
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id EF3CA40762;
	Thu, 12 Aug 2021 14:18:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id acmLaVSczhZV; Thu, 12 Aug 2021 14:18:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 48FF240764;
	Thu, 12 Aug 2021 14:18:12 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id ED44B1BF3A8
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 14:18:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DC2478299D
 for <buildroot@lists.busybox.net>; Thu, 12 Aug 2021 14:18:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (1024-bit key) header.d=amarulasolutions.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9St29qoPBklb for <buildroot@lists.busybox.net>;
 Thu, 12 Aug 2021 14:18:06 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BBC0482861
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 14:18:05 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 k5-20020a05600c1c85b02902e699a4d20cso4710500wms.2
 for <buildroot@buildroot.org>; Thu, 12 Aug 2021 07:18:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=amarulasolutions.com; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8jP36PRZ6Q+UkiDHwsehfZghoQ6eJ1so70f4QyCbIM=;
 b=L9k+Y43LO8uARMHSrnSfng2krtrYqyNWuVtOwlssQRdNi8ThcCAnpFFyoW5UbM0XCG
 FcAMHexe50sYTnvahD0Ho+rRQLU60RHKtvL/Wpnj4XsRdyvykSUCiQ+iSEB2B2izEVVU
 64BAIt+ejszi7ZMn+/m8w9Tsu/+vbqQRFH/o8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y8jP36PRZ6Q+UkiDHwsehfZghoQ6eJ1so70f4QyCbIM=;
 b=lnGb2QhrZjnGI+qfo+9JCZvLefeTR/NjMKKWgAy9H5+TbmaOTE3prpF8meE7h7mY1v
 LZ5ndsNCEIkx97+XPinr+t2I0vLWrEd6fqyxE8dWryXyet0mzoY89FEcMzM4Ng3Jjftr
 fbpypTeOdIhh+M2kyfyF7EG1w7fCMJV09yURdY6GQX7wnmdELVh130EN2nOuWdlqvyiu
 oM3SayYoQyKcOFHiZmH4q/HonNdJz0ZVQnZgh3IgDq1IH/I/Gkwby9z3aGz5tZcWBaRi
 t2YVh9ltSd0CA3J9CEvVWJJB/el5FLxhxBdYjhCBkBDhbCrdoXscLP9C4zexTm9jJ2Pr
 pCNw==
X-Gm-Message-State: AOAM533Ovcu48yTZ/6cyQqbq7aYBEnLA01Q9zWAioy1A+F6WMP4m0hEo
 9PyM88f1HVrlUq9LO5M+AzP+KD3vLyrr2w==
X-Google-Smtp-Source: ABdhPJyWhfzzTOZd8xlVZVRMY8FeKia4H7DqYcewpmPcrJ02tKWt1mOtznkxxpB38iEHcMeIizfynA==
X-Received: by 2002:a7b:c92e:: with SMTP id h14mr4381515wml.82.1628777883854; 
 Thu, 12 Aug 2021 07:18:03 -0700 (PDT)
Received: from localhost.localdomain ([37.160.45.80])
 by smtp.gmail.com with ESMTPSA id 19sm3186953wmj.23.2021.08.12.07.18.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Aug 2021 07:18:03 -0700 (PDT)
From: Angelo Compagnucci <angelo@amarulasolutions.com>
To: buildroot@buildroot.org
Date: Thu, 12 Aug 2021 16:18:00 +0200
Message-Id: <20210812141801.959504-1-angelo@amarulasolutions.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/2] package/python-pydal: bump to version
 v20200321.1
X-BeenThere: buildroot@busybox.net
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.busybox.net>
List-Unsubscribe: <http://lists.busybox.net/mailman/options/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=unsubscribe>
List-Archive: <http://lists.busybox.net/pipermail/buildroot/>
List-Post: <mailto:buildroot@busybox.net>
List-Help: <mailto:buildroot-request@busybox.net?subject=help>
List-Subscribe: <http://lists.busybox.net/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@busybox.net?subject=subscribe>
Cc: Angelo Compagnucci <angelo@amarulasolutions.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@busybox.net
Sender: "buildroot" <buildroot-bounces@busybox.net>

Signed-off-by: Angelo Compagnucci <angelo@amarulasolutions.com>
---
 package/python-pydal/python-pydal.hash | 2 +-
 package/python-pydal/python-pydal.mk   | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index 224f32856f..911734c8bf 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,3 +1,3 @@
 # sha256 locally computed
-sha256  df54be164bcdab8ffc8db88cb72333cc4b27997ce58c302dd8ade36462d799ea  python-pydal-20200910.1.tar.gz
+sha256  32faf0b7123bc19b5f70da654fc99a22f4ce6fb20f5e4b38aba819e0ab4060aa  python-pydal-20200321.1.tar.gz
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 2cac839a9e..2aeade322e 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20200910.1
+PYTHON_PYDAL_VERSION = 20200321.1
 PYTHON_PYDAL_SITE = $(call github,web2py,pydal,v$(PYTHON_PYDAL_VERSION))
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@busybox.net
http://lists.busybox.net/mailman/listinfo/buildroot
