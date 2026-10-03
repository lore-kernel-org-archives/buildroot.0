Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9332CCA5FE3
	for <buildroot@archiver.kernel.org>; Sat,  3 Oct 2026 04:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 4BAC580D1E;
	Sat,  3 Oct 2026 04:03:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0yrYLiGKZTdc; Sat,  3 Oct 2026 04:03:05 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp1.osuosl.org 69A0280D50
Authentication-Results: smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
ARC-Seal: i=2; d=osuosl.org; s=arc; a=rsa-sha256; cv=fail; t=1791000185;
	b=FHxpkK4zahlVladSgBThuUNyS+TbLMgpp7Aamtm6162obammwOw/jF/P2L5t3SepLJH7
	 IZwf5M2d8FTKcl/86NYaoWGpEs1MTy429A4y0aRoOwusVYYGmb5jZAL0lEi0/qJMydBmj
	 IivD8Zxgkhug09lzopCtgv+oaIB4fu9nXnOLRxFmILPkMpuEpSjz/sVV/hzWRtMIV0UCT
	 hPiLdcmgOLys8jijB4z1uTNgJSDeLJesbpIadyKdOxQxbL6gGVazsDVrbq/iIuvEFMZi3
	 4h/M4t1lrjo1ncFUEBTSQ1IanbnLUyAdwurXAOGD3PBzM8qBYhIAlCv0MAZio5DoOqg==
ARC-Message-Signature: i=2; d=osuosl.org; s=arc; a=rsa-sha256;
	c=relaxed/relaxed; t=1791000185;
	h=X-Comment:DKIM-Signature:X-Original-To:Delivered-To:Received:
	 Received:X-Virus-Scanned:X-Spam-Flag:X-Spam-Score:X-Spam-Level:
	 X-Spam-Status:Received:ARC-Filter:Received-SPF:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:Received:From:To:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Subject:X-BeenThere:X-Mailman-Version:
	 Precedence:List-Id:List-Unsubscribe:List-Archive:List-Post:List-Help:
	 List-Subscribe:Cc:Content-Type:Content-Transfer-Encoding:Errors-To:
	 Sender;
	bh=n/zdMcaJOgRCvtRzMRCstAb/nfZf5zHn54vSj68fNnM=;
	b=WvNKJ7Htc9Z3B3KPzTUw/ATZc12aNrlxKrdxtr02S5hRydDtc4ziBHzCNcPHvSDHAoVq
	 BxuLLZBn4Ob7Y2kTNyy/JpxKqQXKRGsya9lpVFz5Fz4mNdmkvHOKfVw4k++YZHD23XuPs
	 YOHwlXyNcSjqO7Mjppt6L8DQQ4wnfGAt2dgaDNj8gtXelHBqJoJB/7F+77y08rwLVSP5C
	 cRzwIl0M5sGl7KokWUrtYAsCrgWHvAsxN2d181qoeSKNW+07wcc8KjUgaKsnT9kej3Lev
	 ZYkCO74mxFSH57UkXyz0ar9k2zGLGoGTvdx0vLpYNVAos1+jCtZbux5Iylm9LvPkV+w==
ARC-Authentication-Results: i=2; smtp1.osuosl.org; arc=fail smtp.remote-ip=140.211.166.142
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1791000185;
	bh=n/zdMcaJOgRCvtRzMRCstAb/nfZf5zHn54vSj68fNnM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mVDrwfgMzwVxOZKEOBBz6rD5WJoEYYsJxIY16muC7Q3I9iDjT8bjA5BSn52FgCDoX
	 GaOyU4i+4KXOzKRBatQ5dgE4sPj/zNyw0H+7Z3IqzJkeVe0tDdd+hJXX3qJ2UXQbmo
	 +l2kw6WWxpsMNJREKHr3RmIf1zQnkVwlvu+52kq/ognA4+K4cjD6BhnKKpzQ2e24Wi
	 9wGIP3GaroPpuB7LHFvjQGi2ddrrG2TPy1qd2PR+d0Vxl5CD0ZW0gptgRNpi7IQyfK
	 TkHfszB1SamekqFk5ow4XspsS8D6NUh1zzfIBB4BP8j41gRVTAHgkovIXbuVubtvRm
	 BVJ2Ivf2DIUKQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 69A0280D50;
	Sat,  3 Oct 2026 04:03:05 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 19D11263
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 04:03:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0B2A8400E6
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 04:03:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DDjrnHFYfFM5 for <buildroot@buildroot.org>;
 Sat,  3 Oct 2026 04:03:03 +0000 (UTC)
ARC-Filter: OpenARC Filter v1.3.0 smtp2.osuosl.org 0710A400C7
Authentication-Results: smtp2.osuosl.org;
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
ARC-Seal: i=1; d=osuosl.org; s=arc; a=rsa-sha256; cv=none; t=1791000183;
 b=XdXAABUWqAQkH8BIGihlc5by/vZMwCzyRuHnJwWZJ5JU9QEorqxFEIv2Uxz7ENKZPN3u
 neoTIZ/8p6hS4n7wkxseCxdxFCr2TOHppz7L1jTOIQAWJoHXERj7UIWvQFY0wkfxMG+sa
 z9Ir0OKPgnjevs0kYI8LyBdOep45F454wNaDHijdSf1mW+Q0Iw8HB1fHsO44ihgtKwplH
 lvGbsHuJPco4+XNh7/ytdTZGzQQ39lvQ2bPu0+PJtUx5GOebVlqlA5fA1EG7c2BeOXtx+
 ExKVDXnvjPRrKPebd8xcf/mt9x0Ycu4eudRWWJAFZmBTENduBgvKHMBGCv2UYKSJnpA==
ARC-Message-Signature: i=1; d=osuosl.org; s=arc; a=rsa-sha256;
 c=relaxed/relaxed; t=1791000183;
 h=Received-SPF:Received:DKIM-Signature:X-Google-DKIM-Signature:
 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
 Content-Transfer-Encoding;
 bh=hn5Bpp90ciBrt7K3L1+tLUXTbufUJuBwsSQF5Yy4FfM=;
 b=A2R8jT84XaSWFtBqDH8yb8Oq78dD6LIBKCXSgkiNV6BMVJthtd5I/YcppPPG5OPOplxU
 VUew5OFIj5mTrYcWXvDqSEBYFx6VlYo1j9POm52WN2OkXMt32t0Z1J30lItrJ9TkQqBRC
 /q1T8HLvRv11CyZbt1h0XPP41ewsBQtG7bkf8dTQ8lmA9H1qWwTRQi6wUTZguXO/uz/ms
 GBWx6WB2Ik84fhauIhHGXJJdIbudI4qn5jlh9ArTEYssUdWu1BDmD7Fw/lRp75gvoBvTy
 fzHYHiC30wGmxvrDxzIYPSvXAqorGGzN8rJWwmJhoMGi8IUNPmjgeUx1pvzfA/aGakg==
ARC-Authentication-Results: i=1; smtp2.osuosl.org;
 dmarc=pass header.from=gmail.com; 
 dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256
 header.s=20251104 header.b=sTlwslLs; 
 arc=none smtp.remote-ip="2607:f8b0:4864:20::329"
Received-SPF: Pass (mailfrom) identity=mailfrom;
 client-ip=2607:f8b0:4864:20::329; helo=mail-ot1-x329.google.com;
 envelope-from=james.hilliard1@gmail.com; receiver=<UNKNOWN> 
Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com
 header.a=rsa-sha256 header.s=20251104 header.b=sTlwslLs
Received: from mail-ot1-x329.google.com (mail-ot1-x329.google.com
 [IPv6:2607:f8b0:4864:20::329])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0710A400C7
 for <buildroot@buildroot.org>; Sat,  3 Oct 2026 04:03:02 +0000 (UTC)
Received: by mail-ot1-x329.google.com with SMTP id
 46e09a7af769-81b5f0c5fd1so335916a34.2
 for <buildroot@buildroot.org>; Fri, 02 Oct 2026 21:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20251104; t=1791000181; x=1791604981; darn=buildroot.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to:content-type;
 bh=hn5Bpp90ciBrt7K3L1+tLUXTbufUJuBwsSQF5Yy4FfM=;
 b=sTlwslLs0zaxY4dvaQJZEz4vfYbvNnBbdQEsVCryXuM6QWZl7Ds7hsORMMg3QkNXYa
 7HdLosY8D/yXXhSR231XzHH1CP5D2/cLk3li17mlsx9kgg7RRbPCBp66NXtfnVsEmu5Q
 Q1uO0VhkgKPuzmIjb6l9+E54JhAxkUdE3P8wmsoIwvnUDqW2HMDD4UleFjNADcrbeVzV
 JfJv9zvHcipWXgvkVymt+ofPTOvUuNRs5iFr347DYMtbANnlMh/JctARWe8Etdvsz9Lu
 bnhfb29OBa/zDYGB7EH3GXLJ98atZslzff3nEuvz1570tTuYqeryw1I0JwjoHI6DIYTR
 1PbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20260707; t=1791000181; x=1791604981;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to:content-type;
 bh=hn5Bpp90ciBrt7K3L1+tLUXTbufUJuBwsSQF5Yy4FfM=;
 b=TYjP7h5PhD1UIi4eQPajxqgcVl8JDA3Wocap1EuYltWppHgYtoenOCaLoB2vUYFsXp
 4sMRxzN9vIDKZ2/9t+h77olj/tcKZVOMulr9cqHquPeaZRBMw3dFQO5BXTRSHpGO1phD
 IvBnBdkMZnGK+ZRRI1IYmdi1JtOAIsi8aDZZqOFUiQQ8jxOy4oq+m4RMoHMN2tKnW/ss
 Vd6meiWZXOAZYGkhFlNANP5RcgOPGzrhD2Eib5AeQqjk0wfqi5WtUyECf/HLDF7/m59M
 phtNfxBZay6djrkj1fcr3Y64oJsB64XXo2egMy/NZ2Ajy/pvt7+DGOipcO/LHPJPzpCC
 4lUg==
X-Gm-Message-State: AFuF++lMQnzl1QFq6uRC/96d0BfWgtr+vmXZYiOig9oof3MwB4oa9chA
 YP8AWnnlKs/YGDAUpPxXcWhRPPpcyRhe11to7tKvFYTJjkhHEqCLpNMA+p/8DQ==
X-Gm-Gg: AYBFou05/yOUYC22FBzuifOT+19n8tjIyv/DQCdmkqaOM/e7iOm/ceuWv53d1SLs68X
 qP+x+LvFdwnjzHXUP4mug00WY/ZK6yrz7c2V5yFuFDeNrtzgqPj3Vo0mihsN/mwbAxZZq1yfvIh
 6kgKYL/gyO88gVlmQ9/TyL/iAWCbNCegQhuylwsbgZkzqG4svnPod/7EWe0Iuq8qoby+ody7ZEa
 NwYKiOrw6fxcT9dLli4nJnHQkOHmpfZbDTyvlpKzu+Dz57xwa5e0Ldz2iz53m0eFIr0S6vNWr3q
 pbcdinRfJzzI9e22CbswsIXhkLmaLmaGOhhRhWQo0C19Vlv+yIf3B6EcjY6rVkCrEnUJl9OGEDH
 acTdxoks+Ukvuq65PYM7Qglohptk61V7mNUiPVjdpm22t2pX8iodQjZ8am5RYBKyTvAzhXpWMV0
 e3x2AsharLnpB8uKThocZdYrRPIY0wmM0sabZZeSrMu4ObbPcVAcpwpAJ+7ILiaJ3rD2bSp2HNR
 5yBkW1AN6GoHRyxCmTYu8XCh31iOOydSh9BNaPpI9fWMrdWycJn+QQ16PP10f19Ll0to4Qakv9u
 cdnm7BVZ0hMbZvyyGZgJN1B3T0gQgm/cVuS8HEZSKCl90vAq8FHowfJvl/vD9G3y55dcUT3pSJZ
 DesObExTYqHpT6S3B7Pp7w2B4WUyiDk5bdl87a2ikBpriqtWX5Znf5Q==
X-Received: by 2002:a05:6820:2d09:b0:6dd:6d12:22d2 with SMTP id
 006d021491bc7-6e099d4decbmr1006878eaf.7.1791000181629; 
 Fri, 02 Oct 2026 21:03:01 -0700 (PDT)
Received: from james-x399.tailafd1a.ts.net (174-29-1-49.hlrn.qwest.net.
 [174.29.1.49]) by smtp.gmail.com with ESMTPSA id
 46e09a7af769-8227a06d935sm5227575a34.17.2026.10.02.21.03.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 02 Oct 2026 21:03:01 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Fri,  2 Oct 2026 22:02:54 -0600
Message-ID: <20261003040254.464487-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261003040254.464487-1-james.hilliard1@gmail.com>
References: <20261003040254.464487-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-setuptools-scm: bump to
 version 10.3.4
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add new host-python-vcs-versioning dependency.

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-setuptools-scm/python-setuptools-scm.hash | 4 ++--
 package/python-setuptools-scm/python-setuptools-scm.mk   | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-setuptools-scm/python-setuptools-scm.hash b/package/python-setuptools-scm/python-setuptools-scm.hash
index eaed490fc7..ea27f06b74 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.hash
+++ b/package/python-setuptools-scm/python-setuptools-scm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/setuptools-scm/json
-md5  72975fc3ec40a1ae06bb2d86ca8ac48d  setuptools_scm-9.2.2.tar.gz
-sha256  1c674ab4665686a0887d7e24c03ab25f24201c213e82ea689d2f3e169ef7ef57  setuptools_scm-9.2.2.tar.gz
+md5  048be3394d065d8d6404d07b0161f1b3  setuptools_scm-10.3.4.tar.gz
+sha256  a69f28bfc245608781205e912faae437c2b2165773afa4e7b979d77447a69dd2  setuptools_scm-10.3.4.tar.gz
 # Locally computed sha256 checksums
 sha256  89807acf2309bd285f033404ee78581602f3cd9b819a16ac2f0e5f60ff4a473e  LICENSE
diff --git a/package/python-setuptools-scm/python-setuptools-scm.mk b/package/python-setuptools-scm/python-setuptools-scm.mk
index 8c74a55335..9b751447fe 100644
--- a/package/python-setuptools-scm/python-setuptools-scm.mk
+++ b/package/python-setuptools-scm/python-setuptools-scm.mk
@@ -4,15 +4,16 @@
 #
 ################################################################################
 
-PYTHON_SETUPTOOLS_SCM_VERSION = 9.2.2
+PYTHON_SETUPTOOLS_SCM_VERSION = 10.3.4
 PYTHON_SETUPTOOLS_SCM_SOURCE = setuptools_scm-$(PYTHON_SETUPTOOLS_SCM_VERSION).tar.gz
-PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/7b/b1/19587742aad604f1988a8a362e660e8c3ac03adccdb71c96d86526e5eb62
+PYTHON_SETUPTOOLS_SCM_SITE = https://files.pythonhosted.org/packages/85/d8/fc143f88819ccf10ba2388ba86732ee2de193e578234e25a783f6cc14bf7
 PYTHON_SETUPTOOLS_SCM_LICENSE = MIT
 PYTHON_SETUPTOOLS_SCM_LICENSE_FILES = LICENSE
 PYTHON_SETUPTOOLS_SCM_SETUP_TYPE = pep517
 
 HOST_PYTHON_SETUPTOOLS_SCM_DEPENDENCIES = \
 	host-python-packaging \
-	host-python-setuptools
+	host-python-setuptools \
+	host-python-vcs-versioning
 
 $(eval $(host-python-package))
-- 
2.53.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
