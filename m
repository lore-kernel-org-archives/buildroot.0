Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD2C5C4332F
	for <buildroot@archiver.kernel.org>; Sat, 10 Dec 2022 18:11:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 443D060ADE;
	Sat, 10 Dec 2022 18:11:28 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 443D060ADE
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id wqcJJjS8c-tf; Sat, 10 Dec 2022 18:11:27 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8316560AB3;
	Sat, 10 Dec 2022 18:11:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8316560AB3
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id D377B1BF2E4
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:11:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id AEC7F60AB3
 for <buildroot@lists.busybox.net>; Sat, 10 Dec 2022 18:11:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AEC7F60AB3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrmDNfX1cZL1 for <buildroot@lists.busybox.net>;
 Sat, 10 Dec 2022 18:11:24 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CFDAA60776
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com
 [IPv6:2607:f8b0:4864:20::d2a])
 by smtp3.osuosl.org (Postfix) with ESMTPS id CFDAA60776
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 18:11:23 +0000 (UTC)
Received: by mail-io1-xd2a.google.com with SMTP id z144so3749319iof.3
 for <buildroot@buildroot.org>; Sat, 10 Dec 2022 10:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PDACWHmzdid9Jpj66M/DrukUuoWluDlLEhzhVXj8/SQ=;
 b=GeIJ1sUceW0HAXfAVBDsKGhr8fMOcTM80SZJwJTmS+iBgIvEmltOOBegwm0e25Z425
 9JZEw5usraG5PXTc8kpCdq1C8HVInW5287mUz2d5urTg9dTeuklHcMrMuuRRCRn/ymch
 AP5dE9WFODvSl3JQ4NvyhJbupdx50sPI99ifImnP+3F3IMhXj3dXf36mT0RirwBboU4G
 Bys0f/aBkRRdBHOo0Gcty+Yw8rqZU9AFqwjTLNFUdaRMyESz4JzUtvNYg71FUg+5eE+a
 OsNez7usi63KXZYfJOftBZ8/NERdy71Za1UokYxIk/dZj+Z08dx/2iMCn2AcdTvkKpZl
 W9eg==
X-Gm-Message-State: ANoB5pl+uuvMier5K+IcYGB0lQg8X5yC/kqYhaWhM6TjvHIXT7SbUAGh
 vGBtB6LWlM/G4HZvvd2Qp84yUaCy7zUD2A==
X-Google-Smtp-Source: AA0mqf4duPjkPQWKXHd2l+pFqJtIoq/TK5jnO1xZyvNFN3wDn9hyv0kfiSNPGWEES1nl27XQ5lByUg==
X-Received: by 2002:a6b:d10f:0:b0:6cc:a195:ce91 with SMTP id
 l15-20020a6bd10f000000b006cca195ce91mr5670650iob.7.1670695882728; 
 Sat, 10 Dec 2022 10:11:22 -0800 (PST)
Received: from james-x399.localdomain (71-33-132-231.hlrn.qwest.net.
 [71.33.132.231]) by smtp.gmail.com with ESMTPSA id
 p25-20020a02b019000000b00363a4fcd3a8sm1570197jah.5.2022.12.10.10.11.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Dec 2022 10:11:22 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 10 Dec 2022 11:11:20 -0700
Message-Id: <20221210181120.2851513-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PDACWHmzdid9Jpj66M/DrukUuoWluDlLEhzhVXj8/SQ=;
 b=j5DJAsVVwMofKv3MmDiwFT/cSVzzK3dXtXgEBQvYmuRAXbFgVfNFkTqC+PKYbDb+38
 Y6pdfA+ly5lbhTL7QNmyCkd5Ht1oZdZlORs0K5t6dY1fv0mo33bgdd1QsFos20QFO/hL
 uk24Qh/Cp+YEFKuCO2w7WhnzWgbXMlFjttrw4ZzDwgsagSGTtsstSRVET3qh5LJ8B+FB
 FTKrHTpKr7v8AwXyMVN74A+PaGSqxxvZzVT2BvEK8HXMrGCIoCCkMAbu7oljFPpGGXzE
 YQNU4nErztU0435sL4ESHBcnCbIAPRdtLPWf0M8h0KQ6AY9V76ZU6l5bde2UajVeF00t
 ftjQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=j5DJAsVV
Subject: [Buildroot] [PATCH 1/1] package/python-ipython: bump to version
 8.7.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-ipython/python-ipython.hash | 4 ++--
 package/python-ipython/python-ipython.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-ipython/python-ipython.hash b/package/python-ipython/python-ipython.hash
index e61727e045..aae34f6f9b 100644
--- a/package/python-ipython/python-ipython.hash
+++ b/package/python-ipython/python-ipython.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/ipython/json
-md5  8c98f6def0622ea32975cb779247c3d7  ipython-8.6.0.tar.gz
-sha256  7c959e3dedbf7ed81f9b9d8833df252c430610e2a4a6464ec13cd20975ce20a5  ipython-8.6.0.tar.gz
+md5  3adf9fca317512e5b3516a9ac25b3442  ipython-8.7.0.tar.gz
+sha256  882899fe78d5417a0aa07f995db298fa28b58faeba2112d2e3a4c95fe14bb738  ipython-8.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  341afcbd729887b7046fe7b98fc4f4edff3aed8d38f06eefd9b30670f043df17  COPYING.rst
 sha256  e0e390748ed440ab893ca1f135a88a920aaf5409dbb90a5b427c75c5e51268fb  LICENSE
diff --git a/package/python-ipython/python-ipython.mk b/package/python-ipython/python-ipython.mk
index f3aac75db1..1af1081741 100644
--- a/package/python-ipython/python-ipython.mk
+++ b/package/python-ipython/python-ipython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_IPYTHON_VERSION = 8.6.0
+PYTHON_IPYTHON_VERSION = 8.7.0
 PYTHON_IPYTHON_SOURCE = ipython-$(PYTHON_IPYTHON_VERSION).tar.gz
-PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/7f/59/05e94e067afb61460f0d5229a1edb800e2f65b8436085fad9cd262d80d45
+PYTHON_IPYTHON_SITE = https://files.pythonhosted.org/packages/82/2b/026af47da09998404f51064d328f5f1f68c78829082d2945be489343fde6
 PYTHON_IPYTHON_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_LICENSE_FILES = COPYING.rst LICENSE
 PYTHON_IPYTHON_CPE_ID_VENDOR = ipython
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
