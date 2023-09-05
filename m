Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19BFDC83F3E
	for <buildroot@archiver.kernel.org>; Tue,  5 Sep 2023 18:06:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6111D4189A;
	Tue,  5 Sep 2023 18:06:23 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6111D4189A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id os6Vmodj25X0; Tue,  5 Sep 2023 18:06:22 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 46C4F4189E;
	Tue,  5 Sep 2023 18:06:21 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 46C4F4189E
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF07A1BF318
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A808960BEC
 for <buildroot@lists.busybox.net>; Tue,  5 Sep 2023 18:06:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A808960BEC
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id vhnYgwDmax3p for <buildroot@lists.busybox.net>;
 Tue,  5 Sep 2023 18:06:17 +0000 (UTC)
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 7CDBB60BDD
 for <buildroot@buildroot.org>; Tue,  5 Sep 2023 18:06:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7CDBB60BDD
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1bee82fad0fso17811625ad.2
 for <buildroot@buildroot.org>; Tue, 05 Sep 2023 11:06:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693937176; x=1694541976;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uwvs7HRAD4NlSLf1QQua69w9tTUJtJtuk9ZEzv8OAVI=;
 b=e4tTFSufIdbf4Q3AhnTtYEFwz3q711J4J6HHbJ7oO8+nu/bpPwuqRPXEJXmuCSRJob
 61nehotdF5Lq6GEK75xV/2mo5/EFL8jtx4uHTqWg71m2B9/0/Nm0JveeZ1MoPQWhNnoS
 M1JfZ5YPOrAt2w2AQVpZVJVWPxcq2VQnN8PCMmPXcdYYrXPF1xs8k/2Ymj38lympE3jN
 KPbVSk7mAMM+rZ7S3q5fW3+A0FyUeCo/FzSXsEb+KKcZp4XG2w0sYyonq/U74UImgzAB
 DzQYf86eKddmvQtGteYpfV16hErJW/iwNOfze7cuqkWDAZwe9uZz3yf32RfnNCpefhXC
 zf5w==
X-Gm-Message-State: AOJu0Yy378A/S9klxj4GwmZSJeH6C8s0x83HBsBpt6cNuDCbMyi9VR7L
 ayUcIZ71Pw7t0aRE4u3lLOMpQCy9L84=
X-Google-Smtp-Source: AGHT+IGPcJ0JdUk8STCpG+SR//T1S5ImauOIR1718jA2E5TF42WVtnUP4Ef/u/+w3SWwotERXIz4zw==
X-Received: by 2002:a17:902:d48e:b0:1bd:ccee:8f26 with SMTP id
 c14-20020a170902d48e00b001bdccee8f26mr13326273plg.15.1693937176279; 
 Tue, 05 Sep 2023 11:06:16 -0700 (PDT)
Received: from Adam-laptop.lan ([172.56.200.156])
 by smtp.gmail.com with ESMTPSA id
 ix21-20020a170902f81500b001bba7aab826sm9658143plb.163.2023.09.05.11.06.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Sep 2023 11:06:15 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  5 Sep 2023 12:06:01 -0600
Message-Id: <20230905180610.1610778-1-aduskett@gmail.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1693937176; x=1694541976; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=uwvs7HRAD4NlSLf1QQua69w9tTUJtJtuk9ZEzv8OAVI=;
 b=p/Mzw37H/nWSUDwS9qVOdCienWFN1+YKdDEygZsCwsvlMI9j5R2dmNF5Qa/m87QbVP
 uXfq93bemlxEtvMWxyvHbKmeq6KFArnyrN3K6138Sg0WgsUcyK+6WoQjvQbB9g+T6uX5
 rcCTCW+Uw0ZA3qkpHfrIsndv9wvV/UIJOi9xD3nXpOVT913495W3XNGZy+lYxMQtASOn
 yYlt2HJAb5s+VHiHuolazUIaBL7M5am5Fr71YM6mVR2Dj3rqVXZ/XCPYVDtob2mb20fX
 1nZj/njSe0bVc8PZicLHQbwEZGncHt867cDf5ymXuDol8ZsVJSUOTnMnZJxA+6dELQF6
 FGDw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=p/Mzw37H
Subject: [Buildroot] [PATCH 01/10] package/php: bump version to 8.2.10
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
Cc: =?UTF-8?q?Herv=C3=A9=20Codina?= <herve.codina@bootlin.com>,
 Bernd Kuhls <bernd@kuhls.net>, Adam Duskett <aduskett@gmail.comm>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

From: Adam Duskett <aduskett@gmail.comm>

Signed-off-by: Adam Duskett <aduskett@gmail.comm>
---
 package/php/0003-configure-disable-the-phar-tool.patch | 2 +-
 package/php/php.hash                                   | 2 +-
 package/php/php.mk                                     | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/php/0003-configure-disable-the-phar-tool.patch b/package/php/0003-configure-disable-the-phar-tool.patch
index ab3aecdaa3..6bfaf6640f 100644
--- a/package/php/0003-configure-disable-the-phar-tool.patch
+++ b/package/php/0003-configure-disable-the-phar-tool.patch
@@ -22,7 +22,7 @@ diff --git a/configure.ac b/configure.ac
 index 0dfab302..6026fb66 100644
 --- a/configure.ac
 +++ b/configure.ac
-@@ -1566,13 +1566,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
+@@ -1638,13 +1638,8 @@ CFLAGS_CLEAN="$CFLAGS \$(PROF_FLAGS)"
  CFLAGS="\$(CFLAGS_CLEAN) $standard_libtool_flag"
  CXXFLAGS="$CXXFLAGS $standard_libtool_flag \$(PROF_FLAGS)"
  
diff --git a/package/php/php.hash b/package/php/php.hash
index 9fb4aebec1..b8ff7ccc5c 100644
--- a/package/php/php.hash
+++ b/package/php/php.hash
@@ -1,5 +1,5 @@
 # From https://www.php.net/downloads.php
-sha256  cfe1055fbcd486de7d3312da6146949aae577365808790af6018205567609801  php-8.2.8.tar.xz
+sha256  561dc4acd5386e47f25be76f2c8df6ae854756469159248313bcf276e282fbb3  php-8.2.10.tar.xz
 
 # License file
 sha256  080d0d0cca64181ef8bf1df9fba0c6f0c485f78f79540c479a45b593bb3b33b5  LICENSE
diff --git a/package/php/php.mk b/package/php/php.mk
index 691436926b..ede0980629 100644
--- a/package/php/php.mk
+++ b/package/php/php.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-PHP_VERSION = 8.2.8
+PHP_VERSION = 8.2.10
 PHP_SITE = https://www.php.net/distributions
 PHP_SOURCE = php-$(PHP_VERSION).tar.xz
 PHP_INSTALL_STAGING = YES
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
