Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E43C4332F
	for <buildroot@archiver.kernel.org>; Wed,  2 Nov 2022 17:50:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1B60B408D2;
	Wed,  2 Nov 2022 17:50:30 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1B60B408D2
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ka4mjLBkrKwo; Wed,  2 Nov 2022 17:50:29 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3B70B408BB;
	Wed,  2 Nov 2022 17:50:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3B70B408BB
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 8FD3B1BF294
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:50:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 77FAB81DF8
 for <buildroot@lists.busybox.net>; Wed,  2 Nov 2022 17:50:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77FAB81DF8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id r5N5l3VBYNuD for <buildroot@lists.busybox.net>;
 Wed,  2 Nov 2022 17:50:25 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 93A2481DF5
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 93A2481DF5
 for <buildroot@buildroot.org>; Wed,  2 Nov 2022 17:50:25 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id 63so15646606iov.8
 for <buildroot@buildroot.org>; Wed, 02 Nov 2022 10:50:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cKmHzO1yV+8i273n7yRKyaK76cTu86V0zoCs0S5sfu0=;
 b=4QAlBPccjtuUAuDFqq1yTBt+ZTf3C9vyiH5ZX6Dw+k1wJd+9D2YKuNOq7JDq2HY3o5
 hTdLCpzk0cOMvkMk81+LUw9sT2SFP62Vqa6YmYsE519n+4Ez/CnFM6BGOjjD1IFxxsYn
 7y6495fNTIeSkU5slCRUDdTigEoarbOlrJtYGk/CBYdAImWejV/zAbantbSn2nOyuDAn
 N21VVl+cqWR+RkBi5JOgz2uHGkWPVd7Fg3plAuELg501Y+zSzL9Q+N/bceUphbCdM6Tv
 MxkgI1ABWkmkLoX1eDSEZQ2GItMxXTdvu1ttIRgTFkcQf1gDzgbPmC0rmOy4qGwLRbJX
 coUg==
X-Gm-Message-State: ACrzQf0oWbNHxwh2H5EwB8HRxA2axly7M9cT8NZ5iWOVKtxSo9e62kDo
 EMh0/S2k8o37khihxvhEluxa6FMuu3qfzQ==
X-Google-Smtp-Source: AMsMyM495FIWginyM9mjLidv+O6p1jMWesr9EE0Qs/oq7POyTI0dp4kCLhldZCbghUA919CwErdSLw==
X-Received: by 2002:a02:3f5c:0:b0:375:4602:f639 with SMTP id
 c28-20020a023f5c000000b003754602f639mr16243101jaf.22.1667411424402; 
 Wed, 02 Nov 2022 10:50:24 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 x22-20020a0566380cb600b00363aad36b7dsm4993828jad.174.2022.11.02.10.50.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:50:23 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed,  2 Nov 2022 11:50:22 -0600
Message-Id: <20221102175022.2901437-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cKmHzO1yV+8i273n7yRKyaK76cTu86V0zoCs0S5sfu0=;
 b=AB+JqR1gREuRc/3PTCqry0RXsLLd5BxOETXkNqFtNIAgfisl04v6GxzG6vYlYwLftb
 PcypKgp+2pnvScR3BXgLDtAHa3aaeD1+Pu9WZfCQgWBJ6npXDgPN5qDfxnX74lil/5O2
 gPFVSDSPGjRFYjS5LkJKYoGuOBb7SSvzXgZEr4ivYVz/+5kPXg6ncb4L7tkEdBg4hJMZ
 V9k6vVqrwd60buZhAqtxPAydc2QlF4GrODFekCMWG573EcpBIFizVgDvqMaK+S8z40ql
 w0IeDRBlBeUzCxci7rxzVuVwpBxGTEDCSAdOFIXlySWholHVV25bQl+5wJ4wB5Pc9IP7
 igDQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=AB+JqR1g
Subject: [Buildroot] [PATCH 1/1] package/python-arrow: bump to version 1.2.3
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
 package/python-arrow/python-arrow.hash | 4 ++--
 package/python-arrow/python-arrow.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 9216e1c26c..30fb88e8c0 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5  608682052926c7e5636285af0618ef38  arrow-1.2.0.tar.gz
-sha256  16fc29bbd9e425e3eb0fef3018297910a0f4568f21116fc31771e2760a50e074  arrow-1.2.0.tar.gz
+md5  a964a7574e486b0642f3fbc02ef22773  arrow-1.2.3.tar.gz
+sha256  3934b30ca1b9f292376d9db15b19446088d12ec58629bc3f0da28fd55fb633a1  arrow-1.2.3.tar.gz
 # Locally computed sha256 checksums
 sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index a20ac8dbc7..1e34ef09c8 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 1.2.0
+PYTHON_ARROW_VERSION = 1.2.3
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/dc/bd/2565b8533bb8cf66e10a9e68a1d489ad839799b2050f0635039e614e3b1a
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/7f/c0/c601ea7811f422700ef809f167683899cdfddec5aa3f83597edf97349962
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
