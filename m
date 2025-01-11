Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CC20E7719A
	for <buildroot@archiver.kernel.org>; Sat, 11 Jan 2025 18:51:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2942C607D6;
	Sat, 11 Jan 2025 18:51:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aV1zmz15Lg97; Sat, 11 Jan 2025 18:51:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 424D260819
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 424D260819;
	Sat, 11 Jan 2025 18:51:23 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 44776942
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:51:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3F9BB60819
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:51:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KMj9Kac9e3t9 for <buildroot@buildroot.org>;
 Sat, 11 Jan 2025 18:51:21 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::d36; helo=mail-io1-xd36.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 5BCD8607D6
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5BCD8607D6
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com
 [IPv6:2607:f8b0:4864:20::d36])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 5BCD8607D6
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 18:51:21 +0000 (UTC)
Received: by mail-io1-xd36.google.com with SMTP id
 ca18e2360f4ac-844ee166150so98407239f.2
 for <buildroot@buildroot.org>; Sat, 11 Jan 2025 10:51:21 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736621480; x=1737226280;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=NfntJJzZlBwlN6m67qdkiqhtoxP2vJ21wtC9m1aLBf0=;
 b=Vp99oKvBAzJnGDo+UOCWHu+EIugoEsipDpEDYbOjVgQisoFeteIl5WWyYm+cpnWPno
 ALYJ1K5Q5mRluV8LnVF9qrkYrNgfxDZpvye3e96RD2yLfnEE6Hl1ZsRsZgji4rFiEfQK
 TsfgrIV3+4IvA8jFFfLyILuMNe+gtc4Rvdf4s5s/kf/pGY1vyJKhirtX90w25oOkwz2D
 MZ++YodbsTP/lWLPSgrjAe3mTdeM+SaZVHHcPB9MrtC4WmmQ/3FkVZBb0+ztVKmwtN4V
 shMc/IdFadv6gqtvhi9BpuNj9+YEhrjcmIJPOUBywIvn5WKSgkitdOkKWVrd4iHw2qbH
 +iJw==
X-Gm-Message-State: AOJu0YwM6JFjEenHt93lQIIVL+9Kbm2836x3c9t6kBEZaR1gDsmeXq2Q
 AmW7w1bdHHEExY2quyOyjRNq8yO8AE26hnpVm3sKcE5KHMq59lp+ccdxHll4RgA=
X-Gm-Gg: ASbGncs9vPsAeF7j1D0swoDtEA7Hvlxg3K/1A3P+XuaFf8q9jlIDlj07ODx3wwCuyo7
 qVMfQZffaHtpzlP+cXpO7JXqTEPcWt4OCsyjRYQ13oAN0CHcH4f+f6DXmPAP3TjmunDgzAZr1sH
 0ezud0X29/mEZ1g/+/sYcRnj/fihajvmFa0W55NurCksyiTkgd44CX+XkpIS/Gb6OF6CjK240XC
 jJUdVN5oe9tuFgbziP4rrOZN8EkH0HKkitzond0EK/fKD4xExU/sKtUcOfSf38wtBBLtwt+nleg
 CduGinYZdtu5sZCP6aVMe7nY5NeTvGs=
X-Google-Smtp-Source: AGHT+IE6tXZRepQ4fuTTfAP2kYGyuIfQglDSx1KM6HTNb8Bv5O4Tg0c0hQNtBwwjSQ6lBLL4A7cTbw==
X-Received: by 2002:a05:6e02:23c8:b0:3a7:a3a4:2d4b with SMTP id
 e9e14a558f8ab-3ce3a9d07fdmr113862235ab.14.1736621480226; 
 Sat, 11 Jan 2025 10:51:20 -0800 (PST)
Received: from james-x399.localdomain (71-218-115-58.hlrn.qwest.net.
 [71.218.115.58]) by smtp.gmail.com with ESMTPSA id
 8926c6da1cb9f-4ea1b7463f6sm1653940173.136.2025.01.11.10.51.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Jan 2025 10:51:19 -0800 (PST)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Sat, 11 Jan 2025 11:51:18 -0700
Message-Id: <20250111185118.2953073-1-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1736621480; x=1737226280; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=NfntJJzZlBwlN6m67qdkiqhtoxP2vJ21wtC9m1aLBf0=;
 b=hmopZMiKT0YN/Wfwg8kD9fP7nQTRclYDZp/FnGFgvqOtSe0EHOWc91nzZBNX0athCx
 Q2uFMyE14QaSU+A5/OvJuT+Q3+4OtdUNtfAlOdTeGODnXG+bfEdpCk6BdeCetC3iY32T
 C7svrPfC5CDsvbpjzmf7aLbYGJhe0z6WmloDtAr24CoNa7XTBS+iPkVyRTGVPD/8d9uU
 nlQrHw/96Xn2BMLpK4E+T19IJ8sMPT0PHxK+dsU/rCfsKb1nUB3GFFzE+t2GI0RPHdVa
 9pUoxM9fC6Irnv9d6TYfjzXAJz4ChmreYuwV6syiQ7Af4pJ5YDcekJHtWOS0SI8sHQl2
 +/2w==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=gmail.com
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20230601 header.b=hmopZMiK
Subject: [Buildroot] [PATCH 1/1] package/python-urllib3: bump to version
 2.3.0
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-urllib3/python-urllib3.hash | 4 ++--
 package/python-urllib3/python-urllib3.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-urllib3/python-urllib3.hash b/package/python-urllib3/python-urllib3.hash
index 7f4a7505a9..f80ed6eafc 100644
--- a/package/python-urllib3/python-urllib3.hash
+++ b/package/python-urllib3/python-urllib3.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/urllib3/json
-md5  d65de4f0effae2b52669246f0aab0a91  urllib3-2.2.3.tar.gz
-sha256  e7d814a81dad81e6caf2ec9fdedb284ecc9c73076b62654547cc64ccdcae26e9  urllib3-2.2.3.tar.gz
+md5  6388afd062cf2e1ef27843738629dbc1  urllib3-2.3.0.tar.gz
+sha256  f8c5449b3cf0861679ce7e0503c7b44b5ec981bec0d1d3795a07f1ba96f0204d  urllib3-2.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  130e3a64d5fdd5d096a752694634a7d9df284469de86e5732100268041e3d686  LICENSE.txt
diff --git a/package/python-urllib3/python-urllib3.mk b/package/python-urllib3/python-urllib3.mk
index fdd75317d4..911ccab445 100644
--- a/package/python-urllib3/python-urllib3.mk
+++ b/package/python-urllib3/python-urllib3.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_URLLIB3_VERSION = 2.2.3
+PYTHON_URLLIB3_VERSION = 2.3.0
 PYTHON_URLLIB3_SOURCE = urllib3-$(PYTHON_URLLIB3_VERSION).tar.gz
-PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/ed/63/22ba4ebfe7430b76388e7cd448d5478814d3032121827c12a2cc287e2260
+PYTHON_URLLIB3_SITE = https://files.pythonhosted.org/packages/aa/63/e53da845320b757bf29ef6a9062f5c669fe997973f966045cb019c3f4b66
 PYTHON_URLLIB3_LICENSE = MIT
 PYTHON_URLLIB3_LICENSE_FILES = LICENSE.txt
 PYTHON_URLLIB3_CPE_ID_VENDOR = python
-- 
2.34.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
