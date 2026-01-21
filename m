Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58D57D262B0
	for <buildroot@archiver.kernel.org>; Wed, 21 Jan 2026 05:16:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 66F0260DE2;
	Wed, 21 Jan 2026 05:16:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Mo-931CNlywv; Wed, 21 Jan 2026 05:16:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BD4B860DD9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1768972576;
	bh=uYINpEm9zd70r2lC7HiogH06YhQD78ba7BMKl4QWxxY=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=e2K1AMkxoyDbHZC6IaGxBMf3Q+/SHlPJ9qmQNqVqegFl94TRy/dYbqj5cWvamehZp
	 HbhfRk+wHWr6xqBr5TudexuvrFxzJaP9ahKCmfSq4I4HDm017wPTBOhevdaEOHqQFI
	 SmjR95/TZzCCvlgkj0oNkR4+tw3EgmBZj3G12821PR6frmoZKeyZvvmMwD3ia8nnPW
	 6q90bIFUOGVaO3HCgOojbAGEWMQ2tYJut98HaViQOdY/7UxVx0VRJ3I7E3P9qgrOzc
	 Y8l2qGb+0IJgSq1Ckd8rOwSWFF+dK1loLYwtbNotaxbs/JiohFQmpu5ELGLUVSRyV5
	 LpzRqSsMoiayw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BD4B860DD9;
	Wed, 21 Jan 2026 05:16:16 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2770F169
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 05:16:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 163CD4052B
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 05:16:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qo_ZkHjWixZY for <buildroot@buildroot.org>;
 Wed, 21 Jan 2026 05:16:15 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::631; helo=mail-pl1-x631.google.com;
 envelope-from=daniel.crowe@maxmine.com.au; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B623940528
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B623940528
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com
 [IPv6:2607:f8b0:4864:20::631])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B623940528
 for <buildroot@buildroot.org>; Wed, 21 Jan 2026 05:16:14 +0000 (UTC)
Received: by mail-pl1-x631.google.com with SMTP id
 d9443c01a7336-2a0c20ee83dso55003355ad.2
 for <buildroot@buildroot.org>; Tue, 20 Jan 2026 21:16:14 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768972573; x=1769577373;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qvDjBmmnCAvkSeLYGU3oYbCo6UWIs7ocln2YHAIpoW0=;
 b=V5F6a0pxQs1iL9YC9pfmfGrWtcPas8n+QIrhHsz48HDVW1jOOeXjHoLmLnny7R0LGr
 ciaInnfODbD/hZJm/sZyxCvS5T/UnyWjiQLWRu6JOYeQuuQ4HZ2fgv/N1u7g/MGyKTOj
 fj6uPRxw7Tn+q1okqoVgHdehZtD24s3Cl9t5Z9G/wrtHhq8uUHvRb19LeEfleRsez5BP
 F4xZu/qZflwKiDwyYNIML/DX0VQWhGSCVZEuZAotmEL/sCrSbYvzgTkzp1Sqm8dEcnd7
 GLBBO2qOoI6P1Twj/Wjpaeh/Nvwm/7Q16vmZsj20jKUfXwyrCGKpIi0eYIpgS9Kl6mFY
 6fJg==
X-Gm-Message-State: AOJu0YwOixZoU2ASd22p5NwPpPylOYIH5wvmUUHDXIcA0LLAfEK6Pjzs
 n+ZsoVsSR9ykWIexhpnXJoAPieFdDXTyh2gSklZuw/UKeTtzc4QwKradqIsjv86OQaCjmYZ6W9k
 z5nry
X-Gm-Gg: AZuq6aJ74hUL2AgBZyELzXe7FEawyO6wnDRj484YVvieWtPzYk2Kt12vi9YXISI0QdI
 D3Wf05VXbEBYaJCC44bA1r7SkiGA4PUVUsS5x1XtwNlSY5LCDjn0Te6kprZzaZeF29MSybATApA
 q0Bj+5yMTSk+3Vvc7OFzqk1YmqhJRlnv/v6+hbRWwmwtQCi8CQMu+J3X/ePbUXwzcQmNFHW/T2f
 xQUKEjkdwj0Y4DjdmN/DNgup45the0kbXgHDxxSLdx72hdD9VVWJhussCXQxfUw1evwq0ROIrp9
 PSssucQEUWG17pDLWdCVsvEipTfpIzMn0MgVbCHrkqAzTeB2+x0x8V0MT3S8BjpHY45uCp5/MZA
 jW4UytTc7JAKmkoNoYMHTQDZvvQSsgl7nOCE9llV7D8T+WpgYks29xlmwbJ9/YP/3sx/RuThvSk
 OgZbSFkLFG39NoVPEStpa6t4KUr0KaTFNEHErBDEXd3aV79hOobRlTmyAvDPI=
X-Received: by 2002:a17:903:41d2:b0:2a0:c1be:f436 with SMTP id
 d9443c01a7336-2a7177c9673mr181055065ad.59.1768972573269; 
 Tue, 20 Jan 2026 21:16:13 -0800 (PST)
Received: from res-0346.adl.internal.resolution.systems ([103.211.209.15])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2a7193dc83dsm140887925ad.50.2026.01.20.21.16.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jan 2026 21:16:12 -0800 (PST)
From: Daniel Crowe <daniel.crowe@maxmine.com.au>
To: buildroot@buildroot.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Daniel Crowe <daniel.crowe@maxmine.com.au>
Date: Wed, 21 Jan 2026 15:45:56 +1030
Message-ID: <20260121051556.2884162-1-daniel.crowe@maxmine.com.au>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=maxmine-com-au.20230601.gappssmtp.com; s=20230601; t=1768972573; x=1769577373;
 darn=buildroot.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=qvDjBmmnCAvkSeLYGU3oYbCo6UWIs7ocln2YHAIpoW0=;
 b=rvTzxIrH/nxb4db4FxMx0/OVj4FAFzKjDs1RUYTWbfjRIZq2nJQim+bOvHPM1Ux7Yr
 POfJJZi1MsZeRVK2qO/0cfsWekQ2H9BYZlBJxuKqZ1+KJAbbhKlO4bULN5JB8JWxjz4+
 zPLnIt8vxZyG8wjlYD+1CLN3o6lBD4Aih2UHPH0rng1M6pfdqEaqqnw0lq1bz6z40XOl
 PK73weJjbvzwbIYBvfsPRGDxctLri8Z3EVou6/vTXOSmU96MC+BnRwi3IeceeH6WJGtb
 hKiAoc74Xl2C06T/2sPgiCpvWamlx/8PrnEW2gNWPq04vWmTXMBFjq7kbc1uyw76eLpI
 MmNQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=maxmine.com.au
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=maxmine-com-au.20230601.gappssmtp.com
 header.i=@maxmine-com-au.20230601.gappssmtp.com header.a=rsa-sha256
 header.s=20230601 header.b=rvTzxIrH
Subject: [Buildroot] [PATCH 1/1] package/monit: bump version to 5.35.2
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
---
 ...configure.ac-fixes-missing-config-macro-dir.patch | 12 +++++++-----
 package/monit/monit.hash                             |  6 +++---
 package/monit/monit.mk                               |  2 +-
 3 files changed, 11 insertions(+), 9 deletions(-)

diff --git a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
index 9ed49e5797..6fa370dbea 100644
--- a/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
+++ b/package/monit/0002-configure.ac-fixes-missing-config-macro-dir.patch
@@ -1,4 +1,4 @@
-From 99b466f5448951a83a0d763e633906b28c30fc0a Mon Sep 17 00:00:00 2001
+From 347e94149e3caa038d66ee34d79bdb312d36cc49 Mon Sep 17 00:00:00 2001
 From: Jens Maus <mail@jens-maus.de>
 Date: Fri, 22 Sep 2023 21:32:18 +0200
 Subject: [PATCH] configure.ac: fixes missing config macro dir
@@ -12,18 +12,20 @@ Signed-off-by: Jens Maus <mail@jens-maus.de>
 Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
 [Bernd: rebased against 5.34.2]
 Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+[Daniel: rebased against 5.35.2]
+Signed-off-by: Daniel Crowe <daniel.crowe@maxmine.com.au>
 ---
  configure.ac          | 2 +-
  libmonit/configure.ac | 2 +-
  2 files changed, 2 insertions(+), 2 deletions(-)
 
 diff --git a/configure.ac b/configure.ac
-index b4f2a14c..41a8c1a5 100644
+index 3a6cf4e6..477cdbaa 100644
 --- a/configure.ac
 +++ b/configure.ac
 @@ -8,7 +8,7 @@ AC_PREREQ([2.53])
  # Example: 5.0_beta2
- AC_INIT([monit], [5.34.3], [monit-general@nongnu.org])
+ AC_INIT([monit], [5.35.2], [monit-general@nongnu.org])
  AC_CONFIG_AUX_DIR(config)
 -AC_CONFIG_MACRO_DIR([m4])
 +AC_CONFIG_MACRO_DIRS([m4 config])
@@ -31,7 +33,7 @@ index b4f2a14c..41a8c1a5 100644
  AC_CONFIG_SRCDIR([src/monit.c])
  AC_CONFIG_SUBDIRS([libmonit])
 diff --git a/libmonit/configure.ac b/libmonit/configure.ac
-index 800ebf83..03101a6b 100644
+index 84c1217c..c9d10fe2 100644
 --- a/libmonit/configure.ac
 +++ b/libmonit/configure.ac
 @@ -4,7 +4,7 @@ AC_PREREQ([2.53])
@@ -44,5 +46,5 @@ index 800ebf83..03101a6b 100644
  AC_CONFIG_SRCDIR([src])
  
 -- 
-2.47.0
+2.43.0
 
diff --git a/package/monit/monit.hash b/package/monit/monit.hash
index 2c2956afa3..0f54aa08dd 100644
--- a/package/monit/monit.hash
+++ b/package/monit/monit.hash
@@ -1,4 +1,4 @@
-# From https://mmonit.com/monit/dist/monit-5.34.3.tar.gz.sha256
-sha256  669d8b95ddec124d1444ba5264f67fdeae8e90e53b2929719f4750fc5ff3ba60  monit-5.34.3.tar.gz
+# From https://mmonit.com/monit/dist/monit-5.35.2.tar.gz.sha256
+sha256  4dfef54329e63d9772a9e1c36ac99bc41173b79963dc0d8235f2c32f4b9e078f  monit-5.35.2.tar.gz
 # Locally computed
-sha256  d5a4f52b1a5e1e7fe14e01a76aac8b08dc6bbea15466058f271456c97aac1ada  COPYING
+sha256  772cd55fbcb4e52a99f9440cb483cd348db05b7d0712c28023e36d9d5caf0b0f  COPYING
diff --git a/package/monit/monit.mk b/package/monit/monit.mk
index 7d78597c25..bb38d8245b 100644
--- a/package/monit/monit.mk
+++ b/package/monit/monit.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-MONIT_VERSION = 5.34.3
+MONIT_VERSION = 5.35.2
 MONIT_SITE = https://mmonit.com/monit/dist
 MONIT_LICENSE = AGPL-3.0 with OpenSSL exception
 MONIT_LICENSE_FILES = COPYING
-- 
2.43.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
