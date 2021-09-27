Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DB4DC433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id EA0DC60F91
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org EA0DC60F91
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BDAB64041A;
	Mon, 27 Sep 2021 19:53:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5lBPPf64IyPC; Mon, 27 Sep 2021 19:53:53 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id F26524040C;
	Mon, 27 Sep 2021 19:53:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7DB981BF97F
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:52:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7AD2C40261
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:52:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id eHnIJZ5LAnjx for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:52:01 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com
 [IPv6:2a00:1450:4864:20::329])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7517B40251
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:52:01 +0000 (UTC)
Received: by mail-wm1-x329.google.com with SMTP id j27so1462354wms.0
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AkYyp1wbHKNG5iH7/GBA/Wm68Ip10cYtsaM3CZNO1tg=;
 b=UB8qndVzOZpXkFb2XVGVU0TJ94NAjZDiFQfU9p/BSpQxDH44tFg5E/XAXZpQTX7YnT
 VNr/iTqZEYOXKxD+LEG0yHzCE6ptR0116h3HVslsrISoymBbQB3j8uJien/3wqmQNQoT
 LHAsPvWNAFUqLfAm2MLDuFCaF2lB2h/N+n8znq8OshYBalnn+B7At+selxd9X0TqumLv
 yQMTtSPGHP8vsJ1EoF9ZpqmKJ5ir7b4m+shsk68Q5p73kepLB+DbzzDEI/FV3CnwBZQO
 LoiYC5ti1L3JQ7d12q8Xi3dIpOZP3j9PrnFfaqfF+fnFWJthbW0FXSLpBHTTB81R+v/b
 vI/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AkYyp1wbHKNG5iH7/GBA/Wm68Ip10cYtsaM3CZNO1tg=;
 b=UF0xwX9KCM2FFQFJGVs9E+ccjo+dpiFIOUijHT9/p+NkWxWTc2wXq3siK317PDZfeu
 spfytX9CjdUyKPiZ4zJ3GLE2JFSceRR5Jfcgm1CEtEA+NrQCLhc2PMMEB0hRUCIN2lC1
 e887IbDWMtosc35rhj8/sDTHZf9/CMpB2QIO6U6YZHsqg4LjDZjTJQNe6ablKHtQ25qS
 ab/pZqB3o4Qm/WNuKMHKxA4lDvz0o2C1guIcoQ6EhJdgFbHuhlEqNX+qz+IQ42UZB8Vz
 v06ZqDWtGpY2dwrAN/kgGrQ2HpSvm8VfOsvUMl6duOsaiVB/2DxbTqgcJ0ymnp0BZPFt
 7R0g==
X-Gm-Message-State: AOAM530oLuV1vZhi055xas6SZiSHv6QmfOERKq7R51R2h7GHg07D6icN
 t3T5OFlr1/k2dmohq1PhQmCqB+gybGg=
X-Google-Smtp-Source: ABdhPJwsWK9xNNGLHFO5q7n8wkgZPxBL+as+oZEP++yiy72AMCNYv++cvRXdrsz0YPp0WJvzYn/l2w==
X-Received: by 2002:a05:600c:2304:: with SMTP id 4mr932800wmo.57.1632772319545; 
 Mon, 27 Sep 2021 12:51:59 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:59 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:36 +0300
Message-Id: <20210927195136.549542-12-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-s3transfer: bump to version
 0.5.0
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
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

The package doesn't support python2 anymore.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-s3transfer/Config.in              | 3 +--
 package/python-s3transfer/python-s3transfer.hash | 4 ++--
 package/python-s3transfer/python-s3transfer.mk   | 4 ++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/package/python-s3transfer/Config.in b/package/python-s3transfer/Config.in
index 6587a5fe39..ad3a673938 100644
--- a/package/python-s3transfer/Config.in
+++ b/package/python-s3transfer/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_S3TRANSFER
 	bool "python-s3transfer"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_BOTOCORE # runtime
-	# runtime, not needed for python3:
-	select BR2_PACKAGE_PYTHON_FUTURES if BR2_PACKAGE_PYTHON
 	help
 	  An Amazon S3 Transfer Manager.
 
diff --git a/package/python-s3transfer/python-s3transfer.hash b/package/python-s3transfer/python-s3transfer.hash
index 496acc045c..b8f4a57ab8 100644
--- a/package/python-s3transfer/python-s3transfer.hash
+++ b/package/python-s3transfer/python-s3transfer.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/s3transfer/json
-md5  e351d246498fca53e2ca2bf75c550d60  s3transfer-0.3.3.tar.gz
-sha256  921a37e2aefc64145e7b73d50c71bb4f26f46e4c9f414dc648c6245ff92cf7db  s3transfer-0.3.3.tar.gz
+md5  9416d1c7d33506501a8627bb1f7baf66  s3transfer-0.5.0.tar.gz
+sha256  50ed823e1dc5868ad40c8dc92072f757aa0e653a192845c94a3b676f4a62da4c  s3transfer-0.5.0.tar.gz
 # Locally computed sha256 checksums
 sha256  8c6db340475136df3c1201d458fa5755698eace76e510471ecc9d857d6083dac  LICENSE.txt
diff --git a/package/python-s3transfer/python-s3transfer.mk b/package/python-s3transfer/python-s3transfer.mk
index 946be261a3..8b8e02db57 100644
--- a/package/python-s3transfer/python-s3transfer.mk
+++ b/package/python-s3transfer/python-s3transfer.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_S3TRANSFER_VERSION = 0.3.3
+PYTHON_S3TRANSFER_VERSION = 0.5.0
 PYTHON_S3TRANSFER_SOURCE = s3transfer-$(PYTHON_S3TRANSFER_VERSION).tar.gz
-PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/50/de/2b688c062107942486c81a739383b1432a72717d9a85a6a1a692f003c70c
+PYTHON_S3TRANSFER_SITE = https://files.pythonhosted.org/packages/88/ef/4d1b3f52ae20a7e72151fde5c9f254cd83f8a49047351f34006e517e1655
 PYTHON_S3TRANSFER_SETUP_TYPE = setuptools
 PYTHON_S3TRANSFER_LICENSE = Apache-2.0
 PYTHON_S3TRANSFER_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
