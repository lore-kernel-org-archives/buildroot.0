Return-Path: <SRS0=85Xw=OA=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9FE6C433EF
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:40:44 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 95921611F0
	for <buildroot@archiver.kernel.org>; Fri, 10 Sep 2021 21:40:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 95921611F0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C3EA4157C;
	Fri, 10 Sep 2021 21:40:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id OP196MKvQguE; Fri, 10 Sep 2021 21:40:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8A3EA4157A;
	Fri, 10 Sep 2021 21:40:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id D45C41BF38D
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:40:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C38094157A
 for <buildroot@lists.busybox.net>; Fri, 10 Sep 2021 21:40:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id BhDBEWFEEEx0 for <buildroot@lists.busybox.net>;
 Fri, 10 Sep 2021 21:40:39 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 6CA5B41579
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 21:40:39 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id
 196-20020a1c04cd000000b002fa489ffe1fso2395729wme.4
 for <buildroot@buildroot.org>; Fri, 10 Sep 2021 14:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLfUb3yJkjb4YE+GdQ1C+2A9qXItrI3aCZAqDh+gDos=;
 b=llOUlni7/teUIH1EpwH82EfmVfT3TNBiYOpdDsej37NDd12B4HQ0kc05CXcruotzqK
 Zk0+S6okgzT0PJD/3m1lzHsgNpiIr8/5KXDD8iNOn0tjJV2bo/E+gPi0867G0Sqvy1ea
 oiORhFndpm4q5PVdNCck9M9009ghrZHjZZc4fcfwwXX9sajstWL1sgJ9D0ChduQwyG/Y
 neIpasWMtvYuwkz3cjTffgpZR9UxtRXh1BcBiA4fAZbmtIl3w1D9i5pRMclhYq1ZK8AW
 i3YBUb+ezqOYv27anv36awSzBB2hSZrugWsbAruaHWO1g4VKrpL5+x/BNbMHggW92nIS
 p8Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=nLfUb3yJkjb4YE+GdQ1C+2A9qXItrI3aCZAqDh+gDos=;
 b=y1KV0fw/IOy+3zL9lZhlKvwyWNWPtbPh90wJUdYVQn6N23+TsXNjOzmSnuZ0p3SPw4
 b1ngy33m8utgQI4R4rGi5EYPwXmeSQxWU7+J1lr1dSQFgV7s2A91i3HBVthqNQjq2LkC
 bglKpkMafevou2UPnag678qa3sKSYvbucvcSLkVbeiEMj+K8xExSjtUqZl6452b4THPP
 YJ9XPAbeOojWP46kPgloYkH2UKRSglcODl+1dieOFIXkcTxS9YcuNS8mUdAcJFF4xVIp
 QOq8133dNS3lSMC9ZmRlHkMayYRXu6mIdZD656ZIxyAtqnVSCmFbT1iwyiltsvhEckYK
 s+Ww==
X-Gm-Message-State: AOAM533TO8L6YtsXeP83LEorMkRglHXK7VTu85uZO95bxSOH9t24wzA+
 QWan4KHYlLAz6UWGqWur2ChQ283eOII=
X-Google-Smtp-Source: ABdhPJwEZIRpS9ib1Bl5Z2QsEt6rKt1E2vDjeD67tZNpkKYj/m7RlH+fLt/m7n2/YzH8QhYy7HnlHA==
X-Received: by 2002:a1c:23cb:: with SMTP id j194mr10301012wmj.1.1631310037419; 
 Fri, 10 Sep 2021 14:40:37 -0700 (PDT)
Received: from kali.home (lfbn-ren-1-2139-166.w92-167.abo.wanadoo.fr.
 [92.167.218.166])
 by smtp.gmail.com with ESMTPSA id b24sm5090266wmj.43.2021.09.10.14.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Sep 2021 14:40:36 -0700 (PDT)
From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
To: buildroot@buildroot.org
Date: Fri, 10 Sep 2021 23:40:22 +0200
Message-Id: <20210910214022.640034-1-fontaine.fabrice@gmail.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/liblinear: bump to version 2.43
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
Cc: Romain Naour <romain.naour@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

- Update hash of COPYRIGHT (update in year:
  https://github.com/cjlin1/liblinear/commit/65115f742683b21ed10582c1664829e0146fcaec
  https://github.com/cjlin1/liblinear/commit/acf2f9caf166574a23912fe0e57e16187f74f5a6)
- Refresh second patch
- Update indentation in hash file (two spaces)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
---
 package/liblinear/0002-build-static-lib.patch | 12 +++++++-----
 package/liblinear/liblinear.hash              |  4 ++--
 package/liblinear/liblinear.mk                |  2 +-
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/liblinear/0002-build-static-lib.patch b/package/liblinear/0002-build-static-lib.patch
index 98657d3c82..f3497b767e 100644
--- a/package/liblinear/0002-build-static-lib.patch
+++ b/package/liblinear/0002-build-static-lib.patch
@@ -1,18 +1,20 @@
 Makefile: add a rule to build a static library
 
 Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
+[Fabrice: update for 2.43]
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
 diff -durN liblinear-1.96.orig/Makefile liblinear-1.96/Makefile
 --- liblinear-1.96.orig/Makefile	2014-11-15 07:50:23.000000000 +0100
 +++ liblinear-1.96/Makefile	2014-12-14 00:23:00.135893956 +0100
 @@ -16,6 +16,11 @@
  	fi; \
- 	$(CXX) $${SHARED_LIB_FLAG} linear.o tron.o blas/blas.a -o liblinear.so.$(SHVER)
+ 	$(CXX) $${SHARED_LIB_FLAG} linear.o newton.o blas/blas.a -o liblinear.so.$(SHVER)
  
 +# Keeping blas/blas.a as a pre-requisite, to ensure all .o files are built
-+static-lib: linear.o tron.o blas/blas.a
-+	$(AR) rcv liblinear.a linear.o tron.o blas/*.o
++static-lib: linear.o newton.o blas/blas.a
++	$(AR) rcv liblinear.a linear.o newton.o blas/*.o
 +	$(RANLIB) liblinear.a
 +
- train: tron.o linear.o train.c blas/blas.a
- 	$(CXX) $(CFLAGS) -o train train.c tron.o linear.o $(LIBS)
+ train: newton.o linear.o train.c blas/blas.a
+ 	$(CXX) $(CFLAGS) -o train train.c newton.o linear.o $(LIBS)
  
diff --git a/package/liblinear/liblinear.hash b/package/liblinear/liblinear.hash
index 4430d29989..a714b8bc4e 100644
--- a/package/liblinear/liblinear.hash
+++ b/package/liblinear/liblinear.hash
@@ -1,3 +1,3 @@
 # Locally calculated
-sha256 881c7039c6cf93119c781fb56263de91617b3eca8c3951f2c19a3797de95c6ac liblinear-2.30.tar.gz
-sha256 c366abf1cb3a003d8c6e6d9c111a23c432db1d001294f88d479b70b60d7c0af2 COPYRIGHT
+sha256  02bad43d745e2796f39a08ac9d117770e71939ef06b1ee7afc6ab7909e304807  liblinear-2.43.tar.gz
+sha256  c5c91211a0edaa4c77e352f6b27a8f9c6768afe27d48176d6094905c534eacb3  COPYRIGHT
diff --git a/package/liblinear/liblinear.mk b/package/liblinear/liblinear.mk
index 2d0fd0013c..3b137ed518 100644
--- a/package/liblinear/liblinear.mk
+++ b/package/liblinear/liblinear.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-LIBLINEAR_VERSION = 2.30
+LIBLINEAR_VERSION = 2.43
 LIBLINEAR_SITE = http://www.csie.ntu.edu.tw/~cjlin/liblinear
 LIBLINEAR_LICENSE = BSD-3-Clause
 LIBLINEAR_LICENSE_FILES = COPYRIGHT
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
