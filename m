Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77F34C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id E348B61159
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org E348B61159
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B46B080EE8;
	Tue, 28 Sep 2021 06:44:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id K-ydHBCieEho; Tue, 28 Sep 2021 06:44:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 053DA80D40;
	Tue, 28 Sep 2021 06:44:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 5124C1BF40A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 410DF80D40
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yHUvz_Bs0Z2B for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 06:44:10 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 2C10880D6A
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 06:44:09 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id d6so55897833wrc.11
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 23:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OskyM8FsBCLW8n91V8vHUBkNYGiUE1J6L9pMYoFfARU=;
 b=mC7BH1ttWx89FT96ma07/vG19fkIie2IQeOnKyx8GjLLWGICSPPZnbyoIIC1qVVAez
 p4CJQbzs0lIVSV73cIZIhpMFyP0X7pxrIez04b/KhAtLMGD852KVK4kIk+JblBltyWwt
 9GJMNVbyPMqq++4PLlU7z7eFXqrdcSNmI7tXy6timFEF7qukTPzcTX7cj7sQJ8jwk3q4
 3N2ICMFa2ZatAm0/U5N1jJIa/6yAtWK4ZfGNiwnRKmsQs2F4xmV2SgqZ0VPskWlfJYT2
 86FDh4DQpJvD4RaPiJ4+B9E9+o3am6EBqoKRIAwCZ08q3AavjksE/EuoFB/gbecm7FML
 xdcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OskyM8FsBCLW8n91V8vHUBkNYGiUE1J6L9pMYoFfARU=;
 b=7RwpGrjGHF2zjs7HmrZwIXQcimeAB4emrQYBJF4tsGx83ixoxm3nHxr5CupOXMFj6y
 vGpoP1EGhQDiHHTiSXJP8Bo/ZHBhmVn6nGa+0JCWNsbOHIc3QeT3+LZV+vNBXn/SRXsI
 CL2kzP42F26I7wWUVx2+fvjmH6rpkVSF6ZZUqmDACHQwAbFm/o9mWI0msEMIkL8/i/bd
 GOjFZeTkYTQ1N4zXqQhrN+G5wzID1EVV6ePjkKRntjht6wofH5ywMIGwpa+5FLXwuUw1
 iUakPUxsBVEbkFRNRhlM8V1hi1RDCEcs18PIQcltJEiIaYr4lCY6UIinfuPClFwMWb/a
 Utwg==
X-Gm-Message-State: AOAM530L5f1ptSU1FALIJiB8tAWisEl/DEGfXAKbuCkrSgmy7UzLia72
 IIwyG5J0gUSY24E01Cuxhv87jfRccm4=
X-Google-Smtp-Source: ABdhPJyiUVxN4A2lptHYcYOpBHEcbmeYQ13IKmmp+/SAkrpgPqV3L8G/BTitCgnAflz7CcXTWuSfBg==
X-Received: by 2002:a5d:4a46:: with SMTP id v6mr4446449wrs.262.1632811447997; 
 Mon, 27 Sep 2021 23:44:07 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7b33:8acc:211c:62ed])
 by smtp.gmail.com with ESMTPSA id 1sm1923428wms.0.2021.09.27.23.44.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 23:44:07 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 09:43:57 +0300
Message-Id: <20210928064400.573159-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928064400.573159-1-asafka7@gmail.com>
References: <20210928064400.573159-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-meld3: bump to version 2.0.1
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Plus, indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-meld3/python-meld3.hash | 8 ++++----
 package/python-meld3/python-meld3.mk   | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-meld3/python-meld3.hash b/package/python-meld3/python-meld3.hash
index f423b0bf19..69b303e60e 100644
--- a/package/python-meld3/python-meld3.hash
+++ b/package/python-meld3/python-meld3.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/meld3/json
-md5	56fff5d6599efeefc81cf2d3b8cf6b4e  meld3-2.0.0.tar.gz
-sha256	1efda676264490db2e30bfb81b27a918cc6d9c2de6d609491aa43410b9537eb9  meld3-2.0.0.tar.gz
+md5  1add16caefc9e6b82ef4f40532cb4918  meld3-2.0.1.tar.gz
+sha256  3ea266994f1aa83507679a67b493b852c232a7905e29440a6b868558cad5e775  meld3-2.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256	5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
-sha256	2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
+sha256  5fe11cd858707131b6ec1338b5c2cd68dd1fdb875e3ec967149bc6fea858ecec  LICENSE.txt
+sha256  2422945b49554688d529e1f8d4ac6e0ab77a817e8889158e1e56cf963ecf5c4d  COPYRIGHT.txt
diff --git a/package/python-meld3/python-meld3.mk b/package/python-meld3/python-meld3.mk
index f67172e6f8..c7973d9c71 100644
--- a/package/python-meld3/python-meld3.mk
+++ b/package/python-meld3/python-meld3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MELD3_VERSION = 2.0.0
+PYTHON_MELD3_VERSION = 2.0.1
 PYTHON_MELD3_SOURCE = meld3-$(PYTHON_MELD3_VERSION).tar.gz
-PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/00/3b/023446ddc1bf0b519c369cbe88269c30c6a64bd10af4817c73f560c302f7
+PYTHON_MELD3_SITE = https://files.pythonhosted.org/packages/53/af/5b8b67d04a36980de03505446d35db39c7b2a01b9bac1cb673434769ddb8
 PYTHON_MELD3_LICENSE = ZPL-2.1
 PYTHON_MELD3_LICENSE_FILES = COPYRIGHT.txt LICENSE.txt
 PYTHON_MELD3_SETUP_TYPE = setuptools
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
