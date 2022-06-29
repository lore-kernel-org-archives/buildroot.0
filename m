Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA7D5C433EF
	for <buildroot@archiver.kernel.org>; Wed, 29 Jun 2022 12:27:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A96A41599;
	Wed, 29 Jun 2022 12:27:27 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6A96A41599
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LGug1btyVp3d; Wed, 29 Jun 2022 12:27:26 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 50BAA4158C;
	Wed, 29 Jun 2022 12:27:25 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 50BAA4158C
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 487961BF407
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:27:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 147904159F
 for <buildroot@lists.busybox.net>; Wed, 29 Jun 2022 12:27:24 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 147904159F
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 2gtwdBgkCf0Z for <buildroot@lists.busybox.net>;
 Wed, 29 Jun 2022 12:27:22 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF0C84158C
Received: from mail-io1-xd2f.google.com (mail-io1-xd2f.google.com
 [IPv6:2607:f8b0:4864:20::d2f])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF0C84158C
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 12:27:22 +0000 (UTC)
Received: by mail-io1-xd2f.google.com with SMTP id v185so9097160ioe.11
 for <buildroot@buildroot.org>; Wed, 29 Jun 2022 05:27:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQCZkmVQLScXjqyELtTr9o6Bo2rkQ4EFtXOdsKSAU80=;
 b=ziYf1UM/ZqckAXhclIRxfjzvVCV8HCdD2B0QCJRp31PCF9IpaidO+nalhIAqL10Qn3
 3r8i+Gi9cagCHskEJo2n8ztLNOM8HcAgi7Ar4JNttq3HoKC4UWy5/M6a4egd3pTlVq6Y
 9utfp733Dx2/pELDwYPDLN1ToF4xYS4xIbNMTUdk1QSbFMM07NoVZENrGLTcqS66hP6Q
 R9Oiff+0lFGmCG3zdeueETfAB8EzKarqgAyDxWXfXFLVB/r1Lq2ZHs4kSigVrxI67zuw
 A0lYG5i5RVH0nE5hVbYGAny1qqbivLhQnCXw5+RsaY+iLMj6iGjZqcXOYT2RxwEjtD4V
 Ll5Q==
X-Gm-Message-State: AJIora9PVNId2EkRGQctG4Ylb3VGY8C3qCAOetnr33YNes3LP6Vnt/l2
 Z5KJOoDCpp5kg0+X+C/NfG56kL+NJ3w=
X-Google-Smtp-Source: AGRyM1vYsbwEXd+7pJMzTBxiAUv0IoH0qwLYGlvnMBmQNJVjGiJ21iESt95u24FrgW4hJ5Z6Jd/DNw==
X-Received: by 2002:a05:6638:160f:b0:33c:ad8e:bcc0 with SMTP id
 x15-20020a056638160f00b0033cad8ebcc0mr1822449jas.299.1656505641776; 
 Wed, 29 Jun 2022 05:27:21 -0700 (PDT)
Received: from james-x399.localdomain (71-218-105-112.hlrn.qwest.net.
 [71.218.105.112]) by smtp.gmail.com with ESMTPSA id
 y19-20020a056638229300b00339d244c4a6sm7226706jas.23.2022.06.29.05.27.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Jun 2022 05:27:21 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 29 Jun 2022 06:27:13 -0600
Message-Id: <20220629122713.2410136-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xQCZkmVQLScXjqyELtTr9o6Bo2rkQ4EFtXOdsKSAU80=;
 b=LcRrnQNrb9MTxWR6UjkwTUaW3/pdTjKIMqssPVaMs8F4EZC+YEWNgM2bKnP5D98ry/
 +wXLLDE9Wo9EKVmBrne3NY2WpRxSrbVgvShfO+PPyCO3N8KGhsENvJ0VoxWzEo/Tvgju
 1R/4FRULm8KSBo+CWhJ2+Y6ivAezpQqv4ogT3W3mG3JIjQ0ARvXyk+iuA7T+vhXLTBXv
 9zvoJ2yy0iJKLBqC8XE1+bguAC6q68lX2OAvmUOiDIbKE/OBhrd6QXjE9cUBVH5ZUryc
 LeZXKpaaioYayPHPA6rmmNPLff56qD7PKdVbrbgQv8Ve5z4r0yof6b6le4D7eYhEbRn3
 kw8w==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20210112 header.b=LcRrnQNr
Subject: [Buildroot] [PATCH 1/1] package/python-setuptools: bump to version
 62.6.0
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
 package/python-setuptools/python-setuptools.hash | 4 ++--
 package/python-setuptools/python-setuptools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-setuptools/python-setuptools.hash b/package/python-setuptools/python-setuptools.hash
index d4a9ba3d88..bb7d6e5587 100644
--- a/package/python-setuptools/python-setuptools.hash
+++ b/package/python-setuptools/python-setuptools.hash
@@ -1,4 +1,4 @@
 # From https://pypi.org/pypi/setuptools/json
-md5  95f4924aacd634ab579f17fc71f79fb1  setuptools-62.1.0.tar.gz
-sha256  47c7b0c0f8fc10eec4cf1e71c6fdadf8decaa74ffa087e68cd1c20db7ad6a592  setuptools-62.1.0.tar.gz
+md5  cfa521312f6ac49b2fda5640df4f8f6d  setuptools-62.6.0.tar.gz
+sha256  990a4f7861b31532871ab72331e755b5f14efbe52d336ea7f6118144dd478741  setuptools-62.6.0.tar.gz
 sha256  db3f0246b1f9278f15845b99fec478b8b506eb76487993722f8c6e254285faf8  LICENSE
diff --git a/package/python-setuptools/python-setuptools.mk b/package/python-setuptools/python-setuptools.mk
index c6a2137e1d..e49cfbc022 100644
--- a/package/python-setuptools/python-setuptools.mk
+++ b/package/python-setuptools/python-setuptools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_VERSION = 62.1.0
+PYTHON_SETUPTOOLS_VERSION = 62.6.0
 PYTHON_SETUPTOOLS_SOURCE = setuptools-$(PYTHON_SETUPTOOLS_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/ea/a3/3d3cbbb7150f90c4cf554048e1dceb7c6ab330e4b9138a40e130a4cc79e1
+PYTHON_SETUPTOOLS_SITE = https://files.pythonhosted.org/packages/dc/73/88920663229023b724a854d1ab7e3e50a1a28b63eeec399a604ba30f9242
 PYTHON_SETUPTOOLS_LICENSE = MIT
 PYTHON_SETUPTOOLS_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
