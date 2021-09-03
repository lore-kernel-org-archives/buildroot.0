Return-Path: <SRS0=/NXK=NZ=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EBFC433F5
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 14:33:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7881660295
	for <buildroot@archiver.kernel.org>; Fri,  3 Sep 2021 14:33:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7881660295
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id E0853407FB;
	Fri,  3 Sep 2021 14:33:01 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id js_b535kJ7Ww; Fri,  3 Sep 2021 14:33:01 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id CB49D4080A;
	Fri,  3 Sep 2021 14:32:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C3C141BF2BB
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 14:32:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C08E46061E
 for <buildroot@lists.busybox.net>; Fri,  3 Sep 2021 14:32:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id J8Tsv_TX4Q_J for <buildroot@lists.busybox.net>;
 Fri,  3 Sep 2021 14:32:49 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com
 [IPv6:2a00:1450:4864:20::42d])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BDC52605C8
 for <buildroot@buildroot.org>; Fri,  3 Sep 2021 14:32:48 +0000 (UTC)
Received: by mail-wr1-x42d.google.com with SMTP id b10so8576401wru.0
 for <buildroot@buildroot.org>; Fri, 03 Sep 2021 07:32:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=avBxoo1+15fmoDJ2EoaNyfs5cXjaA9NhoSOl90RRnC0=;
 b=VGfBfjc6s9uPzAz6Lnjqh62+Ratb6/PwJdb/9t1BmRKxD7r7UFAaB16b643EeHJiNG
 oBOA7PQDV8MmFZRwdscGUCGT+3JJkzzTQ2jDMc2rR0sQYmx0BS5zwhYsP/y2c2qShw0d
 kruZ9Wn/+5bsd/08GJjIDGlcsuGRqy93TyTZdh8r9hO40s3FkrPSRrYkomn9M1xpVk8B
 jNKHAgt9FvxkZifkwr0G319MjrqYa0rCsYnskEWcSJTxRjHEzQ1udPD4wMkP6LnfuWo5
 N1OEZPwtIuCUF2dk7NWhj33fbu1Hrp5/NoyPt7D7wbUSQPI32SnxZS812Qt/wQOTqK37
 PQzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=avBxoo1+15fmoDJ2EoaNyfs5cXjaA9NhoSOl90RRnC0=;
 b=o/o38xVn3q/5OAyfEFm4Ca53KhZH19KwrTw1AND+wA+vtoHKAc3nYNTZpNd/vqi4pA
 VhRthOpsSu4KYTTm+gtG4LJAlihxmCAOOM+pUvT0KzJZEKkTuiolXaz5l5SZgP6L0AgX
 FUUye73uT8iiXxNmK7O3npmUNha0WTFNDo6s5ZXL2yauxgwhcrrmLy6xhWJABtJEYzr6
 UQHOQqE8cclUKYCtzlwPDF2dx7e7BL5FGmI6bSyakigjrv0GDYHyNW33th9wg/Hsn/TN
 BCuMV82FGujBOQqj24ATwg+6HA+Ir5FxbvYCuvr2QaUXnSk7i/hw4vKE3s5qE/sTsV/R
 JOjw==
X-Gm-Message-State: AOAM533XwzfgO7AffJfNvAG96ShyXilhFj67TM3p8nDjeFAI3Lm77B53
 pDpcp+caVnYRVxhej7egBseCVSm4vy2zlg==
X-Google-Smtp-Source: ABdhPJx+zbhNA9tlqdTNd/Z9npJde4t1FtPVsx743j7PP6UkzzQg6ZAtHha/WnlsQic/ICwA9wuLXg==
X-Received: by 2002:a05:6000:352:: with SMTP id
 e18mr4503272wre.238.1630679566656; 
 Fri, 03 Sep 2021 07:32:46 -0700 (PDT)
Received: from localhost.localdomain
 (i19-lef01-ix2-176-180-89-7.ft.lns.abo.bbox.fr. [176.180.89.7])
 by smtp.gmail.com with ESMTPSA id n1sm4763439wrp.49.2021.09.03.07.32.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Sep 2021 07:32:45 -0700 (PDT)
From: David GOUARIN <dgouarin@gmail.com>
X-Google-Original-From: David GOUARIN <david.gouarin@thalesgroup.com>
To: buildroot@buildroot.org
Date: Fri,  3 Sep 2021 17:37:46 +0200
Message-Id: <20210903153746.19425-2-david.gouarin@thalesgroup.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210903153746.19425-1-david.gouarin@thalesgroup.com>
References: <20210903153746.19425-1-david.gouarin@thalesgroup.com>
Subject: [Buildroot] [PATCH] package/libtalloc: bump to version 2.3.3
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
Cc: David GOUARIN <dgouarin@gmail.com>,
 David GOUARIN <david.gouarin@thalesgroup.com>,
 Matt Weber <matthew.weber@collins.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

---
 package/libtalloc/libtalloc.hash | 6 +++---
 package/libtalloc/libtalloc.mk   | 2 +-
 2 files changed, 4 insertions(+), 4 deletions(-)

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
index fb382cff76..400cb909e7 100644
--- a/package/libtalloc/libtalloc.mk
+++ b/package/libtalloc/libtalloc.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBTALLOC_VERSION = 2.3.1
+LIBTALLOC_VERSION = 2.3.3
 LIBTALLOC_SOURCE = talloc-$(LIBTALLOC_VERSION).tar.gz
 LIBTALLOC_SITE = https://www.samba.org/ftp/talloc
 LIBTALLOC_LICENSE = LGPL-3.0+, GPL-3.0+
-- 
2.17.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
