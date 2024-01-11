Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73535C47073
	for <buildroot@archiver.kernel.org>; Thu, 11 Jan 2024 01:59:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 1355343791;
	Thu, 11 Jan 2024 01:59:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1355343791
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id v5plRKeXATPG; Thu, 11 Jan 2024 01:59:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 06343437A7;
	Thu, 11 Jan 2024 01:59:02 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 06343437A7
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 2C2621BF38D
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 01:59:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 061BE41522
 for <buildroot@lists.busybox.net>; Thu, 11 Jan 2024 01:59:00 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 061BE41522
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0X6q7-T5AHwP for <buildroot@lists.busybox.net>;
 Thu, 11 Jan 2024 01:58:59 +0000 (UTC)
Received: from mail-io1-xd2d.google.com (mail-io1-xd2d.google.com
 [IPv6:2607:f8b0:4864:20::d2d])
 by smtp4.osuosl.org (Postfix) with ESMTPS id D2C7940A00
 for <buildroot@buildroot.org>; Thu, 11 Jan 2024 01:58:58 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D2C7940A00
Received: by mail-io1-xd2d.google.com with SMTP id
 ca18e2360f4ac-7beff81df32so23549939f.1
 for <buildroot@buildroot.org>; Wed, 10 Jan 2024 17:58:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704938337; x=1705543137;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=XwKIF/wfJeGlbUcxSVylysdnJyMHuOO6T52Khncn5/4=;
 b=YoH1yxqWdXk/e62H9UyeFZjgNhJy6+KCnDzlxZK/9KbQu2ZearffSt8w8Wf0POCp8u
 enUeDpxCiTnFa00JsDegbU0D6Jy7Y35wDlpHn8Uz0m3iYlC06CoLOhA4JQ4vYNn9Va2K
 8kBtwvJM888M1uJXh6e8LVWGGK5XRbLKcnEcl1cNUJoIPaGFgwvNxMa2VoPDFydK6sjF
 g/bZOW6aL77uMttBIPOL61MhCFY4QpEVpwMJrdvqJoYv2/HbMDG3XU5ioAXh07eqArZz
 xhY1GM3s9/8CEQXgjsbUzbpy/XblOA12r941g5wZ5WyI0WIP7G3lct9adKCgtGafM/58
 mkgA==
X-Gm-Message-State: AOJu0YzeQP1//hr9IgfwY+SnJkVPnrOyl7py1KGmsbHH2GtG7fTULWuu
 ONmYVFvjnGKWu0yorPrOZ7tKYlLB5rCfbA==
X-Google-Smtp-Source: AGHT+IFLzc/aJdyNVw8FarYGhIR1fEVwDDiLDDscRVfSyRfr8lyX0ya0mcSr8rK41408YMVxtDTHkw==
X-Received: by 2002:a6b:90a:0:b0:7bc:3b23:4f44 with SMTP id
 t10-20020a6b090a000000b007bc3b234f44mr673075ioi.9.1704938337456; 
 Wed, 10 Jan 2024 17:58:57 -0800 (PST)
Received: from james-x399.localdomain (71-218-103-119.hlrn.qwest.net.
 [71.218.103.119]) by smtp.gmail.com with ESMTPSA id
 ca15-20020a0566381c0f00b0046e33e82782sm26220jab.135.2024.01.10.17.58.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jan 2024 17:58:56 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Wed, 10 Jan 2024 18:58:55 -0700
Message-Id: <20240111015855.2645577-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1704938337; x=1705543137; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=XwKIF/wfJeGlbUcxSVylysdnJyMHuOO6T52Khncn5/4=;
 b=XJyYOtl1iLO4axpo2Zw3XlFKuWf8XYx2cgiN8p9hHkXopE7bczFVvoE9JHG44Vhp+W
 +DvnE1RHCabzOtqa9civensobpuThzTv5vDMNYh5Y9mpq+T5kL8pCq5viX6xrZl3NWMF
 +xZ/BO5eYO0LsNplcnZYft+mM1PCsOGBLAkiqPqkakLE4unb4yM5cjQZQjTq/2zheNQ6
 +e/aLJ9EllvI3eVc0EdwAVqpoizmlnjEskc49dRUfmQwPrqsdxFQsll03UEK0QHbWyJn
 23lzFytJHRK8f8v6E6JAygQeMOk1AsxoDPHopNHq4HQA4xLJtyyP6Whj11DedXoD5N85
 u+3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=XJyYOtl1
Subject: [Buildroot] [PATCH 1/1] package/python-pyopenssl: bump to version
 23.3.0
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
 package/python-pyopenssl/python-pyopenssl.hash | 4 ++--
 package/python-pyopenssl/python-pyopenssl.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyopenssl/python-pyopenssl.hash b/package/python-pyopenssl/python-pyopenssl.hash
index f9b1e4a86b..fb5f75db96 100644
--- a/package/python-pyopenssl/python-pyopenssl.hash
+++ b/package/python-pyopenssl/python-pyopenssl.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyopenssl/json
-md5  1be2c02bf3c0c4e5e7c51b9ac90ebd72  pyOpenSSL-23.0.0.tar.gz
-sha256  c1cc5f86bcacefc84dada7d31175cae1b1518d5f60d3d0bb595a67822a868a6f  pyOpenSSL-23.0.0.tar.gz
+md5  4c4f6f9e1c731b8ee7adcd9fbeccec62  pyOpenSSL-23.3.0.tar.gz
+sha256  6b2cba5cc46e822750ec3e5a81ee12819850b11303630d575e98108a079c2b12  pyOpenSSL-23.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-pyopenssl/python-pyopenssl.mk b/package/python-pyopenssl/python-pyopenssl.mk
index 1d89f5b696..9865f2bb00 100644
--- a/package/python-pyopenssl/python-pyopenssl.mk
+++ b/package/python-pyopenssl/python-pyopenssl.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYOPENSSL_VERSION = 23.0.0
+PYTHON_PYOPENSSL_VERSION = 23.3.0
 PYTHON_PYOPENSSL_SOURCE = pyOpenSSL-$(PYTHON_PYOPENSSL_VERSION).tar.gz
-PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/af/6e/0706d5e0eac08fcff586366f5198c9bf0a8b46f0f45b1858324e0d94c295
+PYTHON_PYOPENSSL_SITE = https://files.pythonhosted.org/packages/bf/a0/e667c3c43b65a188cc3041fa00c50655315b93be45182b2c94d185a2610e
 PYTHON_PYOPENSSL_LICENSE = Apache-2.0
 PYTHON_PYOPENSSL_LICENSE_FILES = LICENSE
 PYTHON_PYOPENSSL_CPE_ID_VENDOR = pyopenssl
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
