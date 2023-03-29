Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E0D0C761AF
	for <buildroot@archiver.kernel.org>; Wed, 29 Mar 2023 15:58:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 984F784216;
	Wed, 29 Mar 2023 15:58:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 984F784216
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fr000bBeWQgQ; Wed, 29 Mar 2023 15:58:11 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id E549484210;
	Wed, 29 Mar 2023 15:58:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E549484210
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0C7BE1BF3C3
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 15:58:09 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E611561509
 for <buildroot@lists.busybox.net>; Wed, 29 Mar 2023 15:58:08 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E611561509
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8idIEmmmMLaB for <buildroot@lists.busybox.net>;
 Wed, 29 Mar 2023 15:58:08 +0000 (UTC)
X-Greylist: delayed 00:06:07 by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1290D60B9C
Received: from sender4-of-o54.zoho.com (sender4-of-o54.zoho.com
 [136.143.188.54])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 1290D60B9C
 for <buildroot@buildroot.org>; Wed, 29 Mar 2023 15:58:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; t=1680105118; cv=none; 
 d=zohomail.com; s=zohoarc; 
 b=ZCze5VbRYiQpB2BIIw69TOkAr8o0qrCSrn8MHIrz8v2t3AZz++di8LC9AsImsJI0bN+HHJmdeB0B3Y/eMHjYwwxubF8iQekXDlmm5DXh6s2GyWJk0MekWkeXAafk0WleuBNAXhzIEGgytYKvmmgWKwv5r6mQDhXzpjl7UtUKu6M=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com;
 s=zohoarc; t=1680105118;
 h=Content-Transfer-Encoding:Cc:Date:From:MIME-Version:Message-ID:Subject:To; 
 bh=FclrrKS+AfN+FEt/zTjpDUSq5aTJE99MjfhpnUoeCoA=; 
 b=GTMBnRvxOW/bfDujARBXA47ZSvu6MEZOKxIbnquf+j1b9m6OEKiefdHNla1mvyqe6v3Dd48giMT4nWD/ngGkbEfi9M5DSfMut5RCFk7QbDpwIb6gkPFtVhmF+NF1vcKcPY1niKVEv/k+BWT/CVw5LajIDDpvX13hVOBGbCxng18=
ARC-Authentication-Results: i=1; mx.zohomail.com;
 dkim=pass  header.i=bubbl-tek.com;
 spf=pass  smtp.mailfrom=aaron@bubbl-tek.com;
 dmarc=pass header.from=<aaron@bubbl-tek.com>
Received: from localhost.localdomain (147-219-179-164.res.spectrum.com
 [147.219.179.164]) by mx.zohomail.com
 with SMTPS id 1680105117038998.416964027715;
 Wed, 29 Mar 2023 08:51:57 -0700 (PDT)
From: Aaron Sierra <aaron@bubbl-tek.com>
To: buildroot@buildroot.org
Date: Wed, 29 Mar 2023 10:51:54 -0500
Message-Id: <20230329155154.75895-1-aaron@bubbl-tek.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-ZohoMailClient: External
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; t=1680105118; 
 s=zmail; d=bubbl-tek.com; i=aaron@bubbl-tek.com;
 h=From:From:To:To:Cc:Cc:Subject:Subject:Date:Date:Message-Id:Message-Id:MIME-Version:Content-Transfer-Encoding:Reply-To;
 bh=FclrrKS+AfN+FEt/zTjpDUSq5aTJE99MjfhpnUoeCoA=;
 b=hP4ks3/1c9jf4qbiwp5NNREbQAR0GaXroXO7f0ejSj+sQ0KqNtTs8YUUL/0QzvYw
 GnITEXjIOFrtLJl6mJD3+1f1MFHEV1RJ18WV5HrK62x4RgcDFgVnMIJzl9M2245qntH
 iOfnBqlsygTH0qjUY42eNQsWJ+oBxAGwwFrQLZLc=
Subject: [Buildroot] [PATCH 1/1] package/python-requests: bump to version
 2.28.2
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
Cc: Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Get explicit compatibility with charset-normalizer 3.x

Signed-off-by: Aaron Sierra <aaron@bubbl-tek.com>
---
 package/python-requests/python-requests.hash | 4 ++--
 package/python-requests/python-requests.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-requests/python-requests.hash b/package/python-requests/python-requests.hash
index 1383e680d5..b6f696000b 100644
--- a/package/python-requests/python-requests.hash
+++ b/package/python-requests/python-requests.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/requests/json
-md5  796ea875cdae283529c03b9203d9c454  requests-2.28.1.tar.gz
-sha256  7c5599b102feddaa661c826c56ab4fee28bfd17f5abca1ebbe3e7f19d7c97983  requests-2.28.1.tar.gz
+md5  09b752e0b0a672d805ae54455c128d42  requests-2.28.2.tar.gz
+sha256  98b1b2782e3c6c4904938b84c0eb932721069dfdb9134313beff7c83c2df24bf  requests-2.28.2.tar.gz
 # Locally computed sha256 checksums
 sha256  09e8a9bcec8067104652c168685ab0931e7868f9c8284b66f5ae6edae5f1130b  LICENSE
diff --git a/package/python-requests/python-requests.mk b/package/python-requests/python-requests.mk
index 7a21cca52c..8f9f4b2db4 100644
--- a/package/python-requests/python-requests.mk
+++ b/package/python-requests/python-requests.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REQUESTS_VERSION = 2.28.1
+PYTHON_REQUESTS_VERSION = 2.28.2
 PYTHON_REQUESTS_SOURCE = requests-$(PYTHON_REQUESTS_VERSION).tar.gz
-PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/a5/61/a867851fd5ab77277495a8709ddda0861b28163c4613b011bc00228cc724
+PYTHON_REQUESTS_SITE = https://files.pythonhosted.org/packages/9d/ee/391076f5937f0a8cdf5e53b701ffc91753e87b07d66bae4a09aa671897bf
 PYTHON_REQUESTS_SETUP_TYPE = setuptools
 PYTHON_REQUESTS_LICENSE = Apache-2.0
 PYTHON_REQUESTS_LICENSE_FILES = LICENSE
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
