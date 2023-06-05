Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AACA5C7EE24
	for <buildroot@archiver.kernel.org>; Mon,  5 Jun 2023 07:45:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1D2568219D;
	Mon,  5 Jun 2023 07:45:07 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 1D2568219D
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 6_rS95cZ_jxp; Mon,  5 Jun 2023 07:45:06 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 45A6381FB4;
	Mon,  5 Jun 2023 07:45:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45A6381FB4
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 370801BF356
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:45:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C111941763
 for <buildroot@lists.busybox.net>; Mon,  5 Jun 2023 07:45:03 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C111941763
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id e0I3NewMdr5H for <buildroot@lists.busybox.net>;
 Mon,  5 Jun 2023 07:45:02 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F6964175D
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com
 [IPv6:2607:f8b0:4864:20::134])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 8F6964175D
 for <buildroot@buildroot.org>; Mon,  5 Jun 2023 07:45:02 +0000 (UTC)
Received: by mail-il1-x134.google.com with SMTP id
 e9e14a558f8ab-33b3f679cafso19623415ab.1
 for <buildroot@buildroot.org>; Mon, 05 Jun 2023 00:45:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685951101; x=1688543101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=8uszT4kMRaaL0zuROthLlp3wrf5b3GxlgSDaoiiTBe0=;
 b=aH/QZch8KkHjTixKOIois4dTbSqRXcVydmCTFsojwPXCyqHE1xDVQbnV1XVegY39ue
 8u6ce3xRWY8OiEhq+l7GFOJMF529OGMPQIj1wIWm6TZax7ANgO7kgdth1sRewfmkj6rl
 Ta34YXOICgL4N3MtUGp4cT58BklaZ6Qav4yBqlVQv6dY2nDLWEqePsLM6a0Op19nZX9d
 Z6LWVipn2mu06IVnGlXl0YRMI9baQIJYxk/trJpjG4OxxNoZLmQefksK+8c0YFl1DPkP
 Mcc3dXOC+Dt1+2so3Nv+0DXkSFWhR2e39JYBsXKL9P3yxBek0Efva58YX00JpFF7gaa5
 0DjQ==
X-Gm-Message-State: AC+VfDzc4Kuyo8q8HEsXCDWfMyzTRAE41pMMv3z70PSlpN1odjiBC9cQ
 jXfcLTxYujm4IrOMoxy3/b7eSnQzuhEAIA==
X-Google-Smtp-Source: ACHHUZ4Dc/ZkM7JYFyASACzXwDnkFnx1LBTaT5r8eWJNQ2hVkKmPPH3CPq6qisqRNbGp+vbWoBhxyA==
X-Received: by 2002:a05:6e02:6c3:b0:331:773f:e67a with SMTP id
 p3-20020a056e0206c300b00331773fe67amr12322755ils.31.1685951101484; 
 Mon, 05 Jun 2023 00:45:01 -0700 (PDT)
Received: from james-x399.localdomain (71-33-129-69.hlrn.qwest.net.
 [71.33.129.69]) by smtp.gmail.com with ESMTPSA id
 q21-20020a02a315000000b004167a9e0ff3sm2080720jai.61.2023.06.05.00.45.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 05 Jun 2023 00:45:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Mon,  5 Jun 2023 01:44:59 -0600
Message-Id: <20230605074459.1897572-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685951101; x=1688543101;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=8uszT4kMRaaL0zuROthLlp3wrf5b3GxlgSDaoiiTBe0=;
 b=bgKGeueNMaZj7+kGqIdBEjZqx+JjK0V2VXN3wZy9RNT1WdSo91Plxh8w7Qdo1cjVt1
 M/lkd4WJPIa4e8M3xgK9E8ky8ZskbT9qt8PmHyGgoot8tumCOboY7WeAtSO2cwDO5kjb
 9wjVCN4MKYPwkNfFS6tXTP+Q18WKb7rc/XufKv4mVjOpPgHxgWpb0CVIhieE8mBiUR4s
 ADhjvtwDlGeD2Fpj30QZzVl7emnys/6E3z1lr/6jnGYjkZVXZIEmcL6V9vSywrx4L0Lk
 h/zkMafsiJGNuD5P3UxbMG8zrPex4aLCXC85G4wli3JuzliYYDLOZEJEHHLCO0uZTSGs
 /plQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20221208 header.b=bgKGeueN
Subject: [Buildroot] [PATCH 1/1] package/python-pydyf: bump to version 0.6.0
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
 package/python-pydyf/python-pydyf.hash | 4 ++--
 package/python-pydyf/python-pydyf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydyf/python-pydyf.hash b/package/python-pydyf/python-pydyf.hash
index 1b37e90e73..c01270be50 100644
--- a/package/python-pydyf/python-pydyf.hash
+++ b/package/python-pydyf/python-pydyf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydyf/json
-md5  6b2a02162a3f4be9464d7b4043953d33  pydyf-0.5.0.tar.gz
-sha256  51e751ae1504037c1fc1f4815119137b011802cd5f6c3539db066c455b14a7e1  pydyf-0.5.0.tar.gz
+md5  6f06b2c08717e25f17de043a02b71062  pydyf-0.6.0.tar.gz
+sha256  b44a38855d7e47b740b3cd31ab63a2f5b9b2793931d50b0ccaed3bb7b86912fc  pydyf-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  75461e438973e1ba0f93a7de9e3fe5b2f49e1ab49251d392878a9cdae8ce7e47  LICENSE
diff --git a/package/python-pydyf/python-pydyf.mk b/package/python-pydyf/python-pydyf.mk
index 6327a3efe2..8d8cf56889 100644
--- a/package/python-pydyf/python-pydyf.mk
+++ b/package/python-pydyf/python-pydyf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDYF_VERSION = 0.5.0
+PYTHON_PYDYF_VERSION = 0.6.0
 PYTHON_PYDYF_SOURCE = pydyf-$(PYTHON_PYDYF_VERSION).tar.gz
-PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/f4/4c/6d31b36a46714d8206b8ca84b8dc9aaf42093415b1f50471538552abe501
+PYTHON_PYDYF_SITE = https://files.pythonhosted.org/packages/9d/c5/d5e4536968c36c0838459b5c482b9228e9aae839847837623d0d04576ba0
 PYTHON_PYDYF_SETUP_TYPE = flit
 PYTHON_PYDYF_LICENSE = BSD-3-Clause
 PYTHON_PYDYF_LICENSE_FILES = LICENSE
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
