Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC7E8C433FE
	for <buildroot@archiver.kernel.org>; Sun, 23 Oct 2022 20:47:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 300C040180;
	Sun, 23 Oct 2022 20:47:29 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 300C040180
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JaGZuWG5n9NK; Sun, 23 Oct 2022 20:47:28 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 5C7C740112;
	Sun, 23 Oct 2022 20:47:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5C7C740112
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 12B891BF38D
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:47:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DCCF14031E
 for <buildroot@lists.busybox.net>; Sun, 23 Oct 2022 20:47:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DCCF14031E
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id zZJqFzPgKgPI for <buildroot@lists.busybox.net>;
 Sun, 23 Oct 2022 20:47:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 808FC4030F
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 808FC4030F
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 20:47:24 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id v1so12995534wrt.11
 for <buildroot@buildroot.org>; Sun, 23 Oct 2022 13:47:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=zwkzbzFuPtdDu2dLnigZUF3s59QYl9devpSLj6yD1SA=;
 b=WruWMBTHex/0m9xNLafrcAJroEDwU1adv0QwiJXgWPiM5croP4VFIgQMk8A2mnqtpg
 2nhusLuBbkiY89Mtu4fDOAZGef7UXBQ2G/bi+EMfolkFmplg/isf2MC949SoX5Ty+fXr
 xpVqeViJqqt7CJh8wldwOk8CP9g3BV9pIwTQnHmGxPkRsLLQLYG5KAZVe1zfSUjxKtYz
 UoiJHBkh+qVE8Ho4FAkl9NyN2doh5dxTLolACarQmxATS42X/HfwTW3JavAji8he4whT
 Nu50i1x0n60TwPkNrCD1FEr+A77jqxVxMDvrIr8Z/cFE1rui+SlVmLR31nBWkublg3Ft
 rHAA==
X-Gm-Message-State: ACrzQf1siSLGqx7yohdCYS6BnDyFcCmguwXLVzuA6tUf7peiq7CjtItQ
 rZuTUgozElD7fYtv8BUh0dadBn2O3Dw=
X-Google-Smtp-Source: AMsMyM4oSJFZBBhmfse706L73IvhZGZIGEhH1IK8m191SRM7EfWQryhJrdhOplLArYJL2ug6tLmuLg==
X-Received: by 2002:a05:6000:144d:b0:231:5786:f763 with SMTP id
 v13-20020a056000144d00b002315786f763mr18983829wrx.313.1666558042339; 
 Sun, 23 Oct 2022 13:47:22 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2140-123.w92-167.abo.wanadoo.fr.
 [92.167.219.123]) by smtp.gmail.com with ESMTPSA id
 n18-20020a7bc5d2000000b003c6c3fb3cf6sm8847682wmk.18.2022.10.23.13.47.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 23 Oct 2022 13:47:21 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Sun, 23 Oct 2022 22:47:19 +0200
Message-Id: <20221023204719.31316-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=zwkzbzFuPtdDu2dLnigZUF3s59QYl9devpSLj6yD1SA=;
 b=PeXOtesHJtBWqTQgUfplNAcYYnxycja4Vh+hMVZ25A5SQy+0p1PNavyiyA9jOXGJHr
 tc/mIvn9oeIsi0gsXzu0LAdGY8umKKKsdpb7USbf7bjfDUy35Srrq5OsigMWxv4Arekk
 /e2WFjI6Sj8kJM4xDKkHEHbtb0VDSO84oy0bmqOmhktN9E5WI+1PvRj3Pk6GQLi/FOM2
 9hy8B3qXJgKt23ElaHQM1Ohevk2cJ523rJ493XTdRLcV/7v0AmjpjF0fWRBPRh/eJFH2
 JldjeNkbVYG68YBxK+bCJ0Ec1qp81ykX6jtByw3QYpL9oFEUaw6QtctP9JAmfrdf9PJy
 32aA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=PeXOtesH
Subject: [Buildroot] [PATCH 1/1] package/libpng: bump to version 1.6.38
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
Cc: Bernd Kuhls <bernd.kuhls@t-online.de>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Version 1.6.38 [September 14, 2022]
  Added configurations and scripts for continuous integration.
  Fixed various errors in the handling of tRNS, hIST and eXIf.
  Implemented many stability improvements across all platforms.
  Updated the internal documentation.

Update hash of LICENSE file (update in year with
https://sourceforge.net/p/libpng/code/ci/723b2d9f2e2bb65c605274ee052f9773e594a5aa)

https://sourceforge.net/p/libpng/code/ci/v1.6.38/tree/CHANGES

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/libpng/libpng.hash | 10 +++++-----
 package/libpng/libpng.mk   |  2 +-
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/libpng/libpng.hash b/package/libpng/libpng.hash
index b57b1251a0..34b0a8a8b6 100644
--- a/package/libpng/libpng.hash
+++ b/package/libpng/libpng.hash
@@ -1,6 +1,6 @@
-# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.37/
-md5  015e8e15db1eecde5f2eb9eb5b6e59e9  libpng-1.6.37.tar.xz
-sha1  3ab93fabbf4c27e1c4724371df408d9a1bd3f656  libpng-1.6.37.tar.xz
+# From https://sourceforge.net/projects/libpng/files/libpng16/1.6.38/
+md5  122e6b7837811698563083b352bc8ca2  libpng-1.6.38.tar.xz
+sha1  60960ed110094843e5efa221df6a7d21614a4dba  libpng-1.6.38.tar.xz
 # Locally computed:
-sha256  505e70834d35383537b6491e7ae8641f1a4bed1876dbfe361201fc80868d88ca  libpng-1.6.37.tar.xz
-sha256  bf5e22b9dce8464064ae17a48ea1133c3369ac9e1d80ef9e320e5219aa14ea9b  LICENSE
+sha256  b3683e8b8111ebf6f1ac004ebb6b0c975cd310ec469d98364388e9cedbfa68be  libpng-1.6.38.tar.xz
+sha256  dfe5a536b0e5a531f844fb9c101a3089aca60772a503893b8e15f9457e369960  LICENSE
diff --git a/package/libpng/libpng.mk b/package/libpng/libpng.mk
index e4e629bbb5..43b4f373f1 100644
--- a/package/libpng/libpng.mk
+++ b/package/libpng/libpng.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBPNG_VERSION = 1.6.37
+LIBPNG_VERSION = 1.6.38
 LIBPNG_SERIES = 16
 LIBPNG_SOURCE = libpng-$(LIBPNG_VERSION).tar.xz
 LIBPNG_SITE = http://downloads.sourceforge.net/project/libpng/libpng$(LIBPNG_SERIES)/$(LIBPNG_VERSION)
-- 
2.35.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
