Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADC6C3DA6E
	for <buildroot@archiver.kernel.org>; Wed, 10 Jan 2024 05:03:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3411B81307;
	Wed, 10 Jan 2024 05:03:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3411B81307
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9egxcrdVyTzU; Wed, 10 Jan 2024 05:03:44 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 77D08812FB;
	Wed, 10 Jan 2024 05:03:43 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 77D08812FB
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 46D3A1BF5F5
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D75D409D8
 for <buildroot@lists.busybox.net>; Wed, 10 Jan 2024 05:03:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1D75D409D8
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 98gY8oWPBrd9 for <buildroot@lists.busybox.net>;
 Wed, 10 Jan 2024 05:03:41 +0000 (UTC)
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com
 [IPv6:2607:f8b0:4864:20::d2e])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C9950409C2
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 05:03:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C9950409C2
Received: by mail-io1-xd2e.google.com with SMTP id
 ca18e2360f4ac-7bee328027bso41673239f.1
 for <buildroot@buildroot.org>; Tue, 09 Jan 2024 21:03:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704863019; x=1705467819;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=We6ogqC+hvKu6YJLTr8q1abWs7/vWEzzkvCS228wpvc=;
 b=pOQlnGIlh6QZpYCpCzCVzh6+z6avXAAVux++9djiCS98XaTjrRE5SJ4xbr/NEl13r+
 y18FGBHJcuXg+F9uX2GSromiSsYBmHAP3UC+uHR0q/qOYYNWUpSgXkKYlSTdLQei/MV7
 oqcJ+LyHoXncykjEuozhYAJRes2FINNqi02uunxvUIbjatcAKO5cNVO0VMbC22NMYjz/
 CtACcG7t16CfWFtMYcVr9WW0FxrJ18exCyaxsB2pg0LXdOkxt9Yq0nSeafjkOK23RyD7
 Qv5xCeKtmt6lMhwTs54gZ4jmZHvLNjLZWssvzYFs/ICxgpg93+uOGIFHFsFTsQooRGmf
 uzrA==
X-Gm-Message-State: AOJu0Yxe5VYMep395zVMecVMYsUPSYBxO3fqG4tuzZS/Uq6Q+shM+1u2
 e2EDP0iXJqTtflq/RDwAUDoWQXLIiSeb8A==
X-Google-Smtp-Source: AGHT+IF2evC0uMIoYeSqVn+qJ+6k5Y9+cZqf0HJPWLqNgXNzUSs2kgyBSydXufYhnTcMcjW9Au1Pkg==
X-Received: by 2002:a05:6e02:34a1:b0:360:a1c2:14c4 with SMTP id
 bp33-20020a056e0234a100b00360a1c214c4mr838241ilb.26.1704863019373; 
 Tue, 09 Jan 2024 21:03:39 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 e16-20020a056638021000b0046dfa6dc8ddsm1105068jaq.80.2024.01.09.21.03.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 21:03:38 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  9 Jan 2024 22:03:37 -0700
Message-Id: <20240110050337.1106376-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704863019; x=1705467819; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=We6ogqC+hvKu6YJLTr8q1abWs7/vWEzzkvCS228wpvc=;
 b=EOi3qJdM47WHaG0+7pMHXch6HTDVyR37JL/9SG/KbLA2gBMEz2A0lRW9ElVh3nM6GS
 6PQ/85BqnyBk8jYpYnBbLaLc3XAvlfXH5uKYnXNUAtOf159tGT0au1pYutlm0SvJILRc
 fjEVJfnx4mRrws4Xgs26HyyDREy8Katzy6yfxWkGMgsTniJvHdyVjq3GGuTmIo61GPFT
 KtxRDeRtgQIFC9V4lTaRPBO2VT9HzS2Eh7ehM0URUO6YcaYHD53L1jKUcnX0cSQvN0WA
 mvlEXu/5curwHF7pK1HgQ5inypCXYkg+z5o+y9um5Qbu7f8fU0+VS6qT5UsHU79ImKbc
 fpvg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=EOi3qJdM
Subject: [Buildroot] [PATCH 1/1] package/python-pygments: bump to version
 2.17.2
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
Cc: Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>, Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Migrate from setuptools to hatchling pep517 build backend.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-pygments/python-pygments.hash | 4 ++--
 package/python-pygments/python-pygments.mk   | 9 +++++----
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-pygments/python-pygments.hash b/package/python-pygments/python-pygments.hash
index 9714fd2ea0..a742a05e52 100644
--- a/package/python-pygments/python-pygments.hash
+++ b/package/python-pygments/python-pygments.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pygments/json
-md5  e40631bb812bbd15954027c23b23013a  Pygments-2.15.1.tar.gz
-sha256  8ace4d3c1dd481894b2005f560ead0f9f19ee64fe983366be1a21e171d12775c  Pygments-2.15.1.tar.gz
+md5  7c059773b0f4808f9402eb0650de6bd4  pygments-2.17.2.tar.gz
+sha256  da46cec9fd2de5be3a8a784f434e4c4ab670b4ff54d605c4c2717e9d49c4c367  pygments-2.17.2.tar.gz
 # Locally computed sha256 checksums
 sha256  a9d66f1d526df02e29dce73436d34e56e8632f46c275bbdffc70569e882f9f17  LICENSE
diff --git a/package/python-pygments/python-pygments.mk b/package/python-pygments/python-pygments.mk
index f151f0061b..e42f613cf1 100644
--- a/package/python-pygments/python-pygments.mk
+++ b/package/python-pygments/python-pygments.mk
@@ -4,13 +4,14 @@
 #
 ################################################################################
 
-PYTHON_PYGMENTS_VERSION = 2.15.1
-PYTHON_PYGMENTS_SOURCE = Pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
-PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/89/6b/2114e54b290824197006e41be3f9bbe1a26e9c39d1f5fa20a6d62945a0b3
+PYTHON_PYGMENTS_VERSION = 2.17.2
+PYTHON_PYGMENTS_SOURCE = pygments-$(PYTHON_PYGMENTS_VERSION).tar.gz
+PYTHON_PYGMENTS_SITE = https://files.pythonhosted.org/packages/55/59/8bccf4157baf25e4aa5a0bb7fa3ba8600907de105ebc22b0c78cfbf6f565
 PYTHON_PYGMENTS_LICENSE = BSD-2-Clause
 PYTHON_PYGMENTS_LICENSE_FILES = LICENSE
 PYTHON_PYGMENTS_CPE_ID_VENDOR = pygments
 PYTHON_PYGMENTS_CPE_ID_PRODUCT = pygments
-PYTHON_PYGMENTS_SETUP_TYPE = setuptools
+PYTHON_PYGMENTS_SETUP_TYPE = pep517
+PYTHON_PYGMENTS_DEPENDENCIES = host-python-hatchling
 
 $(eval $(python-package))
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
