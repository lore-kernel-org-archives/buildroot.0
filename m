Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E985BC43334
	for <buildroot@archiver.kernel.org>; Fri, 22 Jul 2022 08:55:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 79292421CB;
	Fri, 22 Jul 2022 08:55:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 79292421CB
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id o6sHndoe37kc; Fri, 22 Jul 2022 08:55:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B14341B3A;
	Fri, 22 Jul 2022 08:55:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B14341B3A
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CD3C81BF34F
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A84FB846DF
 for <buildroot@lists.busybox.net>; Fri, 22 Jul 2022 08:54:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A84FB846DF
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id QDrKwg4qkenF for <buildroot@lists.busybox.net>;
 Fri, 22 Jul 2022 08:54:42 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93B178417C
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93B178417C
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 08:54:42 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id j22so7481435ejs.2
 for <buildroot@buildroot.org>; Fri, 22 Jul 2022 01:54:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=6GIlrIprTuxd2f5V/nT4pycSVIvG0DtHiml3JERKZmk=;
 b=6ayM63RxhD9beNkR2HDnU3mS0EOSxhQ3gyXqfAfBx5f2euYSkWwifIpbQLQmsNHSzM
 rN+InTvjts+n88LBCjE4P13GhedmVuy44s9qvKdhjY7n67rJWkbeOuD9b5cith2lbk9G
 937N+6v5/WO+9rzUjX6TTTOOWrCgzpE5mK4HGZzxZ3UJVCr2qxiJDwETXJI5rjhq/2cy
 HSqxVXTRu/OFC7eDQY5tQkPjzGgt4FtC5/N2T/SyR7oAtoj8x9GAGB5KAudp2N5iMGql
 vjxTuWdcgtDMRks58Le+ns5K1K3O0QqiLl/TizauSLQIu3Md2RcKtI3R/B3/g0oKjNf6
 tjaQ==
X-Gm-Message-State: AJIora8ME6iQ5UFaXYMu6jyNRAfGKGniPFiRcmrE8VMMX4aSeIpgYPXJ
 soAPALRW4HHpJOhnTdbe45GYQv3yRuWKG7jS
X-Google-Smtp-Source: AGRyM1tozQZ8kgolRRGK7tkVd6Uf/W9IaUB3bbzkwbHySwqTn+4hV+hJnnwhkro3pgACwFNjxPlQGQ==
X-Received: by 2002:a17:907:87b0:b0:72b:9f0d:3f89 with SMTP id
 qv48-20020a17090787b000b0072b9f0d3f89mr2248568ejc.734.1658480080143; 
 Fri, 22 Jul 2022 01:54:40 -0700 (PDT)
Received: from lmecxl1178.lme.st.com
 ([2a04:cec0:10fe:4180:33f2:cfe8:3447:ab97])
 by smtp.gmail.com with ESMTPSA id
 t25-20020aa7d719000000b0043a6c9e50f4sm2205718edq.29.2022.07.22.01.54.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Jul 2022 01:54:39 -0700 (PDT)
From: Etienne Carriere <etienne.carriere@linaro.org>
To: buildroot@buildroot.org
Date: Fri, 22 Jul 2022 10:53:46 +0200
Message-Id: <20220722085348.645793-3-etienne.carriere@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220722085348.645793-1-etienne.carriere@linaro.org>
References: <20220722085348.645793-1-etienne.carriere@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=6GIlrIprTuxd2f5V/nT4pycSVIvG0DtHiml3JERKZmk=;
 b=sECGmLRmxYGqpI4+49PHMS1DoEcRpiFFlkaD04MHSyQp1GwtXD+9CLfmYafbRGD2pj
 XY7ZvAR0+F/kyeLyGt9OhF1p9GeZKDZ7ttIBUSq6o9EqZMTW3agMWnxYWtxGGBpAf/iG
 rcrWgvTMicpW+LgIEV9+GzPrNcSvVrWZvhnjA2QY9FjGjImkaIN8YRt8C3dF+oFK4+Le
 ODowyaWoMwpyjnzvC3uqjCgTHV/iFlin4vR+tT/8CBb72B2VJS/PH8ipzflnwLe4gDnG
 MpDVis/bSCbz++wBbOr69v9oNSAVQndmCGC/Sn50wvSwZzultZ81u4SLAyX637pyt7w9
 Amsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org
 header.a=rsa-sha256 header.s=google header.b=sECGmLRm
Subject: [Buildroot] [PATCH 3/5] package/optee-test: bump to version 3.18.0
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
Cc: Etienne Carriere <etienne.carriere@linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Bumps OP-TEE test package version to OP-TEE release 3.18.0.

Signed-off-by: Etienne Carriere <etienne.carriere@linaro.org>
---
 package/optee-test/optee-test.hash | 4 ++--
 package/optee-test/optee-test.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/optee-test/optee-test.hash b/package/optee-test/optee-test.hash
index 7f2c4110db..2af1768155 100644
--- a/package/optee-test/optee-test.hash
+++ b/package/optee-test/optee-test.hash
@@ -1,4 +1,4 @@
-# From https://github.com/OP-TEE/optee_test/archive/3.17.0/optee-test-3.17.0.tar.gz
-sha256  5b0555b6fef926f8a0a471285cb4c264407c9be32461836240b3c412bf7933bb  optee-test-3.17.0.tar.gz
+# From https://github.com/OP-TEE/optee_test/archive/3.18.0/optee-test-3.18.0.tar.gz
+sha256  cc36a9afb99bd299a3d3769ad634ab7d5cb0e27c84ad04e14c0ff593db0f3faf  optee-test-3.18.0.tar.gz
 # Locally computed
 sha256  6e6810981f0ddab9e0d44399d0700a15d9f760a3c2843cc866659c2074139ae7  LICENSE.md
diff --git a/package/optee-test/optee-test.mk b/package/optee-test/optee-test.mk
index 3a5670d26b..d522bb3300 100644
--- a/package/optee-test/optee-test.mk
+++ b/package/optee-test/optee-test.mk
@@ -4,7 +4,7 @@
 #
 ################################################################################
 
-OPTEE_TEST_VERSION = 3.17.0
+OPTEE_TEST_VERSION = 3.18.0
 OPTEE_TEST_SITE = $(call github,OP-TEE,optee_test,$(OPTEE_TEST_VERSION))
 OPTEE_TEST_LICENSE = GPL-2.0, BSD-2-Clause,
 OPTEE_TEST_LICENSE_FILES = LICENSE.md
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
