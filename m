Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C99C433FE
	for <buildroot@archiver.kernel.org>; Thu,  3 Nov 2022 20:13:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0846781F03;
	Thu,  3 Nov 2022 20:13:59 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0846781F03
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id on9pEmx6X8HD; Thu,  3 Nov 2022 20:13:58 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 22EF281E89;
	Thu,  3 Nov 2022 20:13:57 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 22EF281E89
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 005C11BF2F2
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:13:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DD36981E89
 for <buildroot@lists.busybox.net>; Thu,  3 Nov 2022 20:13:55 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DD36981E89
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dxI0k2d_7gSD for <buildroot@lists.busybox.net>;
 Thu,  3 Nov 2022 20:13:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E220281E76
Received: from mail-il1-x12a.google.com (mail-il1-x12a.google.com
 [IPv6:2607:f8b0:4864:20::12a])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E220281E76
 for <buildroot@buildroot.org>; Thu,  3 Nov 2022 20:13:54 +0000 (UTC)
Received: by mail-il1-x12a.google.com with SMTP id x16so1653517ilm.5
 for <buildroot@buildroot.org>; Thu, 03 Nov 2022 13:13:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ecFB0GMyJYRN7L3oksLfczbGXSXCJjhCRBZttk8NgWs=;
 b=ki/wfScEKd3yEO6MhyXGxMLMonGZ8txsALR5FMUaH+BpYHfwwUye1nRODcjJLvd4ff
 uOrycpwKqlM6kZtcMkMafrSIvgj6WfI7OA8oPDnjALQbtRqeJnR4CloPtrpzmy9QAEYD
 tf6b2pvswVP4+1cST8yj1owl3WDvDNFwyjdzq8NHIt6Sps/0+DaTVeOWDZBc8g36Hc5d
 jP4uPxQPkVRv4RNsvE47+Rkhpy5j2Dswjj285zjslgnGdlPqu725d9FAHG6HwpoVAmlB
 he1k//MRUiA+Ie3YVRo48kTHNkMyisKiisprELKdRhK30TXC5VBELairT8UuiNO3iHw1
 s/mQ==
X-Gm-Message-State: ACrzQf31PFikXff4xHqPd4Iqi44qo6d6LWGz2de0Std9wDhrklDH5KVJ
 ZnBE4nPoBvNuiCQ0+apb1SvdOHry1DJO2T8s
X-Google-Smtp-Source: AMsMyM6bE+qz3KZC7y/vs5ZgfhW9GkrctpIbnUePv8xjhuPkF1RS7ppqnfjHHUEwS1DcULAdy58rnw==
X-Received: by 2002:a92:c206:0:b0:300:9c1e:c56a with SMTP id
 j6-20020a92c206000000b003009c1ec56amr17814332ilo.170.1667506433643; 
 Thu, 03 Nov 2022 13:13:53 -0700 (PDT)
Received: from james-x399.localdomain (71-218-240-5.hlrn.qwest.net.
 [71.218.240.5]) by smtp.gmail.com with ESMTPSA id
 t12-20020a92d14c000000b002f611806ae9sm610796ilg.60.2022.11.03.13.13.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Nov 2022 13:13:53 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  3 Nov 2022 14:13:51 -0600
Message-Id: <20221103201351.3446271-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ecFB0GMyJYRN7L3oksLfczbGXSXCJjhCRBZttk8NgWs=;
 b=RcduVY5WXzLbfd/AVPU0Gw0vjBwvhMKUO/90ON8ZKcCd2O/x/x1CJevZuIwnERtmG4
 FFhIiSPO+7vHQOMWnHivl2ft+51ofHnJvnyw5UH4qOdsCUxijRIuy5u+jueHv0SnGEda
 qyXjL+db9e6XBXQ1UsCF9ayY0v7b3hlDElZ5No+hydm+1hbJJ6iHQoDgrP7FIdwQJS2U
 8Jht4Z3j9KCjibnmpjnCddaut87qdL/91eCu5MiFjwvWiWHWPMCo48uAUbEgGpoTSgc0
 ZRbAAtmX2b1IfiTGj8EtrYKP1gOBZY9dx/ukKXy4W60rRpajsPSvSw9yiYsJdgwd4RrJ
 RFVQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=RcduVY5W
Subject: [Buildroot] [PATCH 1/1] package/python-tqdm: bump to version 4.64.1
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-setuptools-scm build dependency.

License has changed due to file->project word change:
https://github.com/tqdm/tqdm/commit/5df32ae36013ed056619aa0b90f7d249d04087fa

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-tqdm/python-tqdm.hash | 6 +++---
 package/python-tqdm/python-tqdm.mk   | 5 +++--
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-tqdm/python-tqdm.hash b/package/python-tqdm/python-tqdm.hash
index 8251ae48d2..4be54de7de 100644
--- a/package/python-tqdm/python-tqdm.hash
+++ b/package/python-tqdm/python-tqdm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/project/tqdm
-md5  285af1f905f4c375f03a86a667047950  tqdm-4.40.1.tar.gz
-sha256  e405d16c98fcf30725d0c9d493ed07302a18846b5452de5253030ccd18996f87  tqdm-4.40.1.tar.gz
+md5  5822af464d77ea156ad1167c23e1bdac  tqdm-4.64.1.tar.gz
+sha256  5f4f682a004951c1b450bc753c710e9280c5746ce6ffedee253ddbcbf54cf1e4  tqdm-4.64.1.tar.gz
 # Locally computed sha256 checksums
-sha256  1bbf12d09d437844527b3cdaba01d379dac651b5cbb5ebb0d764274684d2680b  LICENCE
+sha256  a0fc1785a8f2a200a3124d703d49550601b7741ccffc861713c2ddaa07a537dd  LICENCE
diff --git a/package/python-tqdm/python-tqdm.mk b/package/python-tqdm/python-tqdm.mk
index 5ceddde14c..a6296bd0f5 100644
--- a/package/python-tqdm/python-tqdm.mk
+++ b/package/python-tqdm/python-tqdm.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_TQDM_VERSION = 4.40.1
+PYTHON_TQDM_VERSION = 4.64.1
 PYTHON_TQDM_SOURCE = tqdm-$(PYTHON_TQDM_VERSION).tar.gz
-PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/4c/45/830c5c4bfaba60ef7d356a53c7751a86c81d148a16fda0daf3ac5ca8e288
+PYTHON_TQDM_SITE = https://files.pythonhosted.org/packages/c1/c2/d8a40e5363fb01806870e444fc1d066282743292ff32a9da54af51ce36a2
 PYTHON_TQDM_SETUP_TYPE = setuptools
 PYTHON_TQDM_LICENSE = MPL-2.0, MIT
 PYTHON_TQDM_LICENSE_FILES = LICENCE
 PYTHON_TQDM_CPE_ID_VENDOR = tqdm_project
 PYTHON_TQDM_CPE_ID_PRODUCT = tqdm
+PYTHON_TQDM_DEPENDENCIES = host-python-setuptools-scm
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
