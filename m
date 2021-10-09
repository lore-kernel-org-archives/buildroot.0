Return-Path: <SRS0=USZC=O5=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 366F1C433EF
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F14B660F5A
	for <buildroot@archiver.kernel.org>; Sat,  9 Oct 2021 20:57:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F14B660F5A
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CAC3C406FF;
	Sat,  9 Oct 2021 20:57:25 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DxUvtnOMWPfQ; Sat,  9 Oct 2021 20:57:25 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AF740785;
	Sat,  9 Oct 2021 20:57:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id C09EB1BF5A6
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id B0B6E6075D
 for <buildroot@lists.busybox.net>; Sat,  9 Oct 2021 20:55:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp3.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wd0SFRPjn-zM for <buildroot@lists.busybox.net>;
 Sat,  9 Oct 2021 20:55:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by smtp3.osuosl.org (Postfix) with ESMTPS id F21F06073A
 for <buildroot@buildroot.org>; Sat,  9 Oct 2021 20:55:37 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 oa12-20020a17090b1bcc00b0019f715462a8so10380721pjb.3
 for <buildroot@buildroot.org>; Sat, 09 Oct 2021 13:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=bi8j02sSALJHqG2ozaeWxkIVuxal13LKoOjvNnzYUnA=;
 b=YdOLXCkT6O7Ax9KLKbSF7b/aTppPLwUqPbJyGlgKX2i43Rt9UajSn5KAbBz7zz8w5Z
 kEbp1h4qBnYYZyJsflvaQsKomCCdiF40DbjvKM0S6jd12YLRWVrbeyYQi/3ZzLFynhDy
 G3MF+cYpp1+HQOa3THvaRqAUqXwUcmqmCUCElC4N6sR/ITdOyCRCNSeJEuF5N3KI6U6O
 QIg2ygeLE3oeyJpowryXLPO8ctvGWccC1MDICEeZJie9rTZLYyED45lJdeYTKZG8wn90
 Coibw+KdNaY/0qaW44ysTFTPfCuuG88s5VragRJxVQ2KpHYR1jxoFTOw3GG4EeS9N709
 AopA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=bi8j02sSALJHqG2ozaeWxkIVuxal13LKoOjvNnzYUnA=;
 b=5+6siO54Ol+RFykE9P8/m/+bfDYD3fXcdXV8hZjeRTDtP7S5bpBSg69n4agZohOKqD
 PyY8N2H35QkzwW/gjlJEkmwqYOl0YbtaeMV12sLf9CKybwrnUBg43hxVGAsnXcMyMZa0
 LoEMe3gKtke9zTt0VkTKiW+ol0yq+PeaiFNXPDTzFYE7pC3zhp/lJE0LDRMi0rsE2Iyd
 nwfMX6w/WffUiUfM6w7f48mRLuA/+IW6QBIHmCYAjIgI0ibtGJ83KCEulb3Fjq8omRgb
 2LKLXemmScQNmTfiBwVj61+0xuoMgJlCjEtbYODGX8Ds07cmwhvvFLBRarXYjjah2TtY
 kcEw==
X-Gm-Message-State: AOAM530xLM+OcInYwK6qYka7ienGKrqbk0Tc9iHS/FTxeux/PRdKqy8B
 l9YCezuvIJ6vbP+3+2ROONKouSEWgC5RIA==
X-Google-Smtp-Source: ABdhPJywxChF3H3XbPIbNEDiG1GamegsNT9ugpP0GAB4tv1Yg7XXyQSyGDpPo+d5zq+xFX3cSyJ8eg==
X-Received: by 2002:a17:90b:696:: with SMTP id
 m22mr18269611pjz.108.1633812937384; 
 Sat, 09 Oct 2021 13:55:37 -0700 (PDT)
Received: from adam.rai.com ([47.149.13.137])
 by smtp.gmail.com with ESMTPSA id qe17sm3125765pjb.39.2021.10.09.13.55.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 09 Oct 2021 13:55:37 -0700 (PDT)
From: Adam Duskett <aduskett@gmail.com>
To: buildroot@buildroot.org
Date: Sat,  9 Oct 2021 13:55:13 -0700
Message-Id: <20211009205523.3137859-11-aduskett@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20211009205523.3137859-1-aduskett@gmail.com>
References: <20211009205523.3137859-1-aduskett@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 10/20] package/python-pydantic: bump to version
 1.8.2
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
Cc: Jugurtha BELKALEM <jugurtha.belkalem@smile.fr>,
 Samuel Martin <s.martin49@gmail.com>,
 Philippe Proulx <eeppeliteloop@gmail.com>, Asaf Kahlon <asafka7@gmail.com>,
 Matt Weber <matthew.weber@collins.com>, Julien Olivain <ju.o@free.fr>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Mauro Condarelli <mc5686@mclink.it>, Oli Vogt <oli.vogt.pub01@gmail.com>,
 Adam Duskett <aduskett@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Add python-dataclasses and python-typing-extensions as runtime dependencies

Signed-off-by: Adam Duskett <aduskett@gmail.com>
---
 package/python-pydantic/Config.in            | 2 ++
 package/python-pydantic/python-pydantic.hash | 6 +++---
 package/python-pydantic/python-pydantic.mk   | 4 ++--
 3 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/package/python-pydantic/Config.in b/package/python-pydantic/Config.in
index 07b506a20f..f8a1504435 100644
--- a/package/python-pydantic/Config.in
+++ b/package/python-pydantic/Config.in
@@ -1,6 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYDANTIC
 	bool "python-pydantic"
 	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON_DATACLASSES # runtime
+	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
 	help
 	  Data validation and settings management using python 3.6
 	  type hinting.
diff --git a/package/python-pydantic/python-pydantic.hash b/package/python-pydantic/python-pydantic.hash
index 7bb076fe2f..215b5d1714 100644
--- a/package/python-pydantic/python-pydantic.hash
+++ b/package/python-pydantic/python-pydantic.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydantic/json
-md5	ce0c1824d1797bc7d67953428c4fe965  pydantic-1.3.tar.gz
-sha256	2eab7d548b0e530bf65bee7855ad8164c2f6a889975d5e9c4eefd1e7c98245dc  pydantic-1.3.tar.gz
+md5  7845d2f3c8fe8602f73f53ec5b6dfa29  pydantic-1.8.2.tar.gz
+sha256  26464e57ccaafe72b7ad156fdaa4e9b9ef051f69e175dbbb463283000c05ab7b  pydantic-1.8.2.tar.gz
 # Locally computed sha256 checksums
-sha256	66badbfe56618ec52ddcbfda62450e43752d16fe1e7cae78d346c7ed10a35306  LICENSE
+sha256  9e3946690ac88b6b73e8f001a0586af13568be8852fd514e4393f39761764387  LICENSE
diff --git a/package/python-pydantic/python-pydantic.mk b/package/python-pydantic/python-pydantic.mk
index 0f9dd66a6f..b282241506 100644
--- a/package/python-pydantic/python-pydantic.mk
+++ b/package/python-pydantic/python-pydantic.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDANTIC_VERSION = 1.3
+PYTHON_PYDANTIC_VERSION = 1.8.2
 PYTHON_PYDANTIC_SOURCE = pydantic-$(PYTHON_PYDANTIC_VERSION).tar.gz
-PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/3e/69/b22c0eb3157115e1e3d111f574a6a41552539f1e53b064121ef4e9ac1368
+PYTHON_PYDANTIC_SITE = https://files.pythonhosted.org/packages/b9/d2/12a808613937a6b98cd50d6467352f01322dc0d8ca9fb5b94441625d6684
 PYTHON_PYDANTIC_SETUP_TYPE = setuptools
 PYTHON_PYDANTIC_LICENSE = MIT
 PYTHON_PYDANTIC_LICENSE_FILES = LICENSE
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
