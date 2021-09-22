Return-Path: <SRS0=bh6H=OM=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 776B5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:19:36 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 1FAF661168
	for <buildroot@archiver.kernel.org>; Wed, 22 Sep 2021 07:19:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 1FAF661168
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id DC1D2401C3;
	Wed, 22 Sep 2021 07:19:35 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Pnqg55kPvAG; Wed, 22 Sep 2021 07:19:34 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id EDBEA40418;
	Wed, 22 Sep 2021 07:19:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0ED6F1BF3FD
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:19:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0B7BE613A7
 for <buildroot@lists.busybox.net>; Wed, 22 Sep 2021 07:19:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id oVlJ-8RaZdet for <buildroot@lists.busybox.net>;
 Wed, 22 Sep 2021 07:19:30 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-il1-x12e.google.com (mail-il1-x12e.google.com
 [IPv6:2607:f8b0:4864:20::12e])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C8C8260B61
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 07:19:30 +0000 (UTC)
Received: by mail-il1-x12e.google.com with SMTP id q14so1722578ils.5
 for <buildroot@buildroot.org>; Wed, 22 Sep 2021 00:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnYhtHMThJNpX0HyNUgH+xRObu6uyaEHju2PA0bJSCw=;
 b=netmfDGoCh0/oktVt5hmiLuFSuQJT2GS+re6VAbHJDHDiIx7/TmvG2zxVvxXdv/3lF
 JhUxYyXtRLkq9a4khl0DFNThZ+gClXR5Ipp5VJXsCXwaq1SxyUg5aGcy3vZ2h6XRVMN0
 KjIUpwJ7KDEMapvB18datNAzYiQ98qzcFXIYZj29+2eFGkBXMKNpUtGa8whSzYG9YnM1
 amlbku7Khq4BKfoaW4eZeH/DVNfrKlWXIUYc9QMPK2vaVFDqyRP7p0fc4EK3HOgjoiiq
 80modD9Qo8+8lXI01Mu01QAxTwKbxxmSqSlvCYzIvIX9t72k4dw2FhCu4Oyx/HQ78Vzf
 EJ4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LnYhtHMThJNpX0HyNUgH+xRObu6uyaEHju2PA0bJSCw=;
 b=0rsECdlavJkr++fkUpnMQeU8+iywM8jEvuLF1ik28qEfgNVlegIBPsZFArmda8KSfv
 ZsvCT7h/7IrWdQppIn9HEfZ0G5xbD3CrOhaPtXZAJ1FDg5YwxESs6T59nOX8u5z9AcPQ
 c9Lbv/l/E6bjKpMfruW+JQW0+eZwh63FhgvM1suu/7CnV/1QjBusj22v+KNAaz6Hi+r1
 gHNmcITqn4SOuLC1EdR1ICiawQupr5jMH6fLGDSwZUqEUC9VYHlbMrq63PlyuWPcWKZf
 zepAWnsvAYSB13gN+fe0rYWereAdAHP+NlE0rJVMFh4H/j4gG3HeYXFfVl5GSRQi+BOD
 DpmA==
X-Gm-Message-State: AOAM530J2SuPdyPMZ8i6zkqJDCeNwE314GbXGn0cx6c4YLU4+XlmjqPD
 KDK81vle/0ORItBsGl/HtAcR4yKpXcA=
X-Google-Smtp-Source: ABdhPJx3JUdrMhn4IJxt4x8m0WsWhUgvSyDO8omcdQhGtMd3ZdRK1zTBOdGh7ervhwJP2di30FNSbA==
X-Received: by 2002:a05:6e02:12c4:: with SMTP id
 i4mr19434284ilm.211.1632295169750; 
 Wed, 22 Sep 2021 00:19:29 -0700 (PDT)
Received: from james-x399.localdomain (71-33-146-72.hlrn.qwest.net.
 [71.33.146.72])
 by smtp.gmail.com with ESMTPSA id d10sm678566ilu.54.2021.09.22.00.19.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 Sep 2021 00:19:29 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 22 Sep 2021 01:19:27 -0600
Message-Id: <20210922071927.1002620-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ujson: bump to version 4.1.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Add license hash.

Add new host-python-setuptools-scm dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ujson/python-ujson.hash | 8 +++++---
 package/python-ujson/python-ujson.mk   | 8 +++++---
 2 files changed, 10 insertions(+), 6 deletions(-)

diff --git a/package/python-ujson/python-ujson.hash b/package/python-ujson/python-ujson.hash
index 21320346a1..8dd52fd6fa 100644
--- a/package/python-ujson/python-ujson.hash
+++ b/package/python-ujson/python-ujson.hash
@@ -1,3 +1,5 @@
-# md5 from https://pypi.python.org/pypi?:action=show_md5&digest=42f77b0cce686dfa4da2e68480b1dd24,sha256 locally computed.
-md5	42f77b0cce686dfa4da2e68480b1dd24  ujson-1.35.tar.gz
-sha256	f66073e5506e91d204ab0c614a148d5aa938bdbf104751be66f8ad7a222f5f86  ujson-1.35.tar.gz
+# md5, sha256 from https://pypi.org/pypi/ujson/json
+md5  f8223127259c6a1f7d0e750fc88d19fd  ujson-4.1.0.tar.gz
+sha256  22b63ec4409f0d2f2c4c9d5aa331997e02470b7a15a3233f3cc32f2f9b92d58c  ujson-4.1.0.tar.gz
+# Locally computed sha256 checksums
+sha256  6a00a8f8b4050303368b694147bde1aed9c96bdff869c181dbbf3ccb784a1501  LICENSE.txt
diff --git a/package/python-ujson/python-ujson.mk b/package/python-ujson/python-ujson.mk
index 60a4ecf841..88e220b1a7 100644
--- a/package/python-ujson/python-ujson.mk
+++ b/package/python-ujson/python-ujson.mk
@@ -4,10 +4,12 @@
 #
 ################################################################################
 
-PYTHON_UJSON_VERSION = 1.35
+PYTHON_UJSON_VERSION = 4.1.0
 PYTHON_UJSON_SOURCE = ujson-$(PYTHON_UJSON_VERSION).tar.gz
-PYTHON_UJSON_SITE = https://pypi.python.org/packages/source/u/ujson
-PYTHON_UJSON_LICENSE = BSD-3-Clause
+PYTHON_UJSON_SITE = https://files.pythonhosted.org/packages/2c/8d/63b4afe82d646a606cef838855a6110c7a3a012622e656bd29fb2d15f1d1
 PYTHON_UJSON_SETUP_TYPE = setuptools
+PYTHON_UJSON_LICENSE = BSD-3-Clause
+PYTHON_UJSON_LICENSE_FILES = LICENSE.txt
+PYTHON_UJSON_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
