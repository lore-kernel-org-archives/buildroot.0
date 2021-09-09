Return-Path: <SRS0=nSxO=N7=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11B8DC433F5
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 06:57:19 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 826AF61184
	for <buildroot@archiver.kernel.org>; Thu,  9 Sep 2021 06:57:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 826AF61184
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2BFAE60ACF;
	Thu,  9 Sep 2021 06:57:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UCJ_k4x1W_dY; Thu,  9 Sep 2021 06:57:17 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7217160ACC;
	Thu,  9 Sep 2021 06:57:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 69FE91BF86C
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 06:57:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 58AB160ACC
 for <buildroot@lists.busybox.net>; Thu,  9 Sep 2021 06:57:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gxwhh6xc5D6e for <buildroot@lists.busybox.net>;
 Thu,  9 Sep 2021 06:57:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com
 [IPv6:2a00:1450:4864:20::32d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3827560ACB
 for <buildroot@buildroot.org>; Thu,  9 Sep 2021 06:57:13 +0000 (UTC)
Received: by mail-wm1-x32d.google.com with SMTP id
 j17-20020a05600c1c1100b002e754875260so570426wms.4
 for <buildroot@buildroot.org>; Wed, 08 Sep 2021 23:57:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id;
 bh=pkxRt/jMyYBBinaculD5ku0J0oaAKYtl16hYAYql/94=;
 b=FghYDz/c1AQWsspvK2wpa85MuZQSkuPCyKmDzEqN9vS2axqEDd0oe6HEGJqnWfpObj
 nCnPmZegMAXbp4KGhFKeKa31CahFp4JE+1UIDqmK7oZcGgFt2XbYoWJ2jV9ksjh6vshi
 sJ7ibe1JUC10mthRqzog5DteJidhFFZO1uohWK7W8lDRDgry3FP8Jh4YAjS5AU/oquBw
 Qbxu6r0JZGYouDltYjsexfdr4+4JftCkMK9toJ8TUxKJAxq6LY2jVMLGuTqhBfq9QTGB
 vR2oJwTd6ffDfdpNQiuuFVyPbLbXz2m9jAznAHAfQuhcPtkoUgowbITHwg5jsoSXXLc6
 C/AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=pkxRt/jMyYBBinaculD5ku0J0oaAKYtl16hYAYql/94=;
 b=Xm9Y+IZLagsWG6sfUMSD9sYAQcvqUUum8mEd+7eWc6Y003qLKzddUNvlBNIQijkZlQ
 5zb0cVeoQndUqL7bFds2UgQt+RAnGcoaJhZgU1ukOvwwAZzEB8v/OMZFiGT2gPYLX6N7
 KaxQkh2pYDElzPdeQ+E1iNXJjyeJw1aDge9LSsCtLgjRyozONN0dLjqEw/n6BUSXF+mS
 C/GGs8dQm1hj5L+SwEyvEMLC3CEmSOGdMlxisQ9M/DlHH0g0HACysYRoC/CYpKiJsDRH
 V/8LH65nHSqNecKJICutRdS1n+t3H+MDROAtu7k2bbUjN5ywu+/fuZKYBV+Bhfq2bV5n
 AqVw==
X-Gm-Message-State: AOAM533UqNQDItUv+rtu5FVx9YONBQ7FykgcuxVfFD0/ayuW3rKqPmCL
 fvlIv5f5uXcbnbToVxizz/W8weipOZ9ljQ==
X-Google-Smtp-Source: ABdhPJwECJfB5gHggM1OGQk3lwxiBO12/zsLcOoRXDbloO9UgZf0Tz0fHbgepxUo9eVrpmJsiM9kJg==
X-Received: by 2002:a1c:984c:: with SMTP id a73mr1178441wme.171.1631170631157; 
 Wed, 08 Sep 2021 23:57:11 -0700 (PDT)
Received: from localhost.localdomain
 (pv372-h01-176-145-91-242.dsl.sta.abo.bbox.fr. [176.145.91.242])
 by smtp.gmail.com with ESMTPSA id c9sm833194wrf.77.2021.09.08.23.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Sep 2021 23:57:10 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
X-Google-Original-From: David GOUARIN <david.gouarin@thalesgroup.com>
To: buildroot@buildroot.org
Date: Thu,  9 Sep 2021 10:02:21 +0200
Message-Id: <20210909080221.6143-1-david.gouarin@thalesgroup.com>
X-Mailer: git-send-email 2.17.1
Subject: [Buildroot] [PATCH v2] package/libtalloc: bump to version 2.3.3
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
Cc: David GOUARIN <david.gouarin@thalesgroup.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

license is now LGPL-3.0+ for both talloc and pytalloc

Signed-off-by: David GOUARIN <david.gouarin@thalesgroup.com>
---
v1 -> v2
   update license informations
---
 package/libtalloc/libtalloc.hash | 6 +++---
 package/libtalloc/libtalloc.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/libtalloc/libtalloc.hash b/package/libtalloc/libtalloc.hash
index 9d48a965d0..84b0320df8 100644
--- a/package/libtalloc/libtalloc.hash
+++ b/package/libtalloc/libtalloc.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  ef4822d2fdafd2be8e0cabc3ec3c806ae29b8268e932c5e9a4cd5585f37f9f77  talloc-2.3.1.tar.gz
-sha256  15c2767545d1e43dc35832736253bde5be956f8ffec0474a6d0f70349b646ed3  talloc.h
-sha256  8742f2dad3aaf885c7b4b699c20bfa0e9edeab380689f91a88aa90af03e6947b  pytalloc.h
+sha256  6be95b2368bd0af1c4cd7a88146eb6ceea18e46c3ffc9330bf6262b40d1d8aaa  talloc-2.3.3.tar.gz
+sha256  f8340c449dd64a55c6605b02fcad2aec6f473612ac6026739a22995380a8043c  talloc.h
+sha256  cca17b31b2f00d7a737764b70e2be3a32f3b047ac8535c3b53759eb2946e5053  pytalloc.h
diff --git a/package/libtalloc/libtalloc.mk b/package/libtalloc/libtalloc.mk
index fb382cff76..03414a9f53 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_VERSION = 2.3.3
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
-LIBTALLOC_LICENSE = LGPL-3.0+, GPL-3.0+
+LIBTALLOC_LICENSE = LGPL-3.0+
 LIBTALLOC_LICENSE_FILES = talloc.h pytalloc.h
 LIBTALLOC_INSTALL_STAGING = YES
 
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
