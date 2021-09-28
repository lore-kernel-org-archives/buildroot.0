Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9FC15C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3C24760FF2
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 06:44:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3C24760FF2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 09205402A2;
	Tue, 28 Sep 2021 06:44:58 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id tmTy_TTJ-jwb; Tue, 28 Sep 2021 06:44:57 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 134D340229;
	Tue, 28 Sep 2021 06:44:56 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 3A1C11BF40A
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 2749F402A2
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 06:44:14 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id p6EXsGO0LtAX for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 06:44:13 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp2.osuosl.org (Postfix) with ESMTPS id F264440229
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 06:44:12 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id w29so55940805wra.8
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 23:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OkzNSAfwoD7fqr8lK3oCRBv7JaDGwpHE6i9exaLQNuE=;
 b=ZFWCPdbU1D66yicycASQJndA5J4NblhuY/XPhbKBXpOT4rEVQd/0KMSXv9eVpqRMOm
 zjQoP4/V9EJ4Zgbvfxk/gRBZz3yxQopoKmSqzx2wsXBmhCWwEc/6B2QvFPRxf8VOkD8B
 ah0QFtqaFoGwcDip6nTy3KIlWJXS3dDvjrzYFk3AMkX/o8sGYAP+H118iW19rENgqn48
 xiyBfJT1j+S8QCHE+Uwis3ANvOM7f38jV+9NlgRJLkpymxYuwWONx6F3McqwroauNzGt
 8I01EVFYejM9Ck4A07uMZZJF+Izt6y9NLltjSDvbS1eo/lTcek/1irPOFhsbAa6MPV7o
 UNbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OkzNSAfwoD7fqr8lK3oCRBv7JaDGwpHE6i9exaLQNuE=;
 b=JKHfKhSlexYzAi42dAQiS2u2K/XCjfKUEQI6HWB9K2P62wI1ULoy0bQL8MVoTEMZLr
 dSmikwIux45AlLZJgBj3Q8v+tT5XuF+o9kvLW5TcAAVUGHv8+M7wGNPMm7Zf/LsG3hBR
 mlNIxHra4QhtRjlG/k3zbWI9i/VtdtD39PriLDoz83pd6VWmugCMk5Lnm6nJJ1eGB4GA
 LeGCMI4bHlzBXsc/EH04RqaM/LmQ0rdhgSK1HG/XbJr0uxqLGIhoXlsLLVKybWO8sh+S
 6d4K7lksw44vzyutEpQ3BE1I1ExbrGBtVM1pjUT04Z+zWBNoKAlu4Mw8xwP3hASY4Cqm
 BHAA==
X-Gm-Message-State: AOAM530EueivbJ/ZHVc5NDuK8192dK2MSDAKBzAnqIorCd2FOjIr3RkS
 ggFS9SVB+Ej0Lxdvskhig5fGv09LAfE=
X-Google-Smtp-Source: ABdhPJy3P62d5bsW9ScJ5u3cHZsOFBAmGDVhMj4hq1533GxkioOmGwp+OW+zRuIsroeR/HY+JMaTGw==
X-Received: by 2002:adf:e449:: with SMTP id t9mr4537711wrm.201.1632811450864; 
 Mon, 27 Sep 2021 23:44:10 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:7b33:8acc:211c:62ed])
 by smtp.gmail.com with ESMTPSA id 1sm1923428wms.0.2021.09.27.23.44.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 23:44:10 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 09:43:59 +0300
Message-Id: <20210928064400.573159-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928064400.573159-1-asafka7@gmail.com>
References: <20210928064400.573159-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-mutagen: bump to version
 1.45.1
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

* The package doesn't support python2 anymore.
* SETUP_TYPE was changed to setuptools.
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-mutagen/Config.in           | 7 +++----
 package/python-mutagen/python-mutagen.hash | 9 +++++----
 package/python-mutagen/python-mutagen.mk   | 6 +++---
 3 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/package/python-mutagen/Config.in b/package/python-mutagen/Config.in
index 3c95e37447..655562893f 100644
--- a/package/python-mutagen/Config.in
+++ b/package/python-mutagen/Config.in
@@ -1,9 +1,8 @@
 config BR2_PACKAGE_PYTHON_MUTAGEN
 	bool "python-mutagen"
-	select BR2_PACKAGE_PYTHON_PYEXPAT if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_PYEXPAT if BR2_PACKAGE_PYTHON3 # runtime
-	select BR2_PACKAGE_PYTHON_ZLIB if BR2_PACKAGE_PYTHON # runtime
-	select BR2_PACKAGE_PYTHON3_ZLIB if BR2_PACKAGE_PYTHON3 # runtime
+	depends on BR2_PACKAGE_PYTHON3
+	select BR2_PACKAGE_PYTHON3_PYEXPAT # runtime
+	select BR2_PACKAGE_PYTHON3_ZLIB # runtime
 	help
 	  Mutagen is a Python module to handle audio metadata.  It
 	  supports ASF, FLAC, MP4, Monkey's Audio, MP3, Musepack, Ogg
diff --git a/package/python-mutagen/python-mutagen.hash b/package/python-mutagen/python-mutagen.hash
index 5ee8ed17c7..0cf25fd5fe 100644
--- a/package/python-mutagen/python-mutagen.hash
+++ b/package/python-mutagen/python-mutagen.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/mutagen/json, sha256 locally computed
-md5 3729218f974c3a79ee9972ffa5ca5d12 mutagen-1.42.0.tar.gz
-sha256 bb61e2456f59a9a4a259fbc08def6d01ba45a42da8eeaa97d00633b0ec5de71c mutagen-1.42.0.tar.gz
-sha256 8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643 COPYING
+# md5, sha256 from https://pypi.org/pypi/mutagen/json
+md5  76e1f7fc2386813c0ff2716695fb06e1  mutagen-1.45.1.tar.gz
+sha256  6397602efb3c2d7baebd2166ed85731ae1c1d475abca22090b7141ff5034b3e1  mutagen-1.45.1.tar.gz
+# Locally computed sha256 checksums
+sha256  8177f97513213526df2cf6184d8ff986c675afb514d4e68a404010521b880643  COPYING
diff --git a/package/python-mutagen/python-mutagen.mk b/package/python-mutagen/python-mutagen.mk
index 5477d6f4c8..627ec70e96 100644
--- a/package/python-mutagen/python-mutagen.mk
+++ b/package/python-mutagen/python-mutagen.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_MUTAGEN_VERSION = 1.42.0
+PYTHON_MUTAGEN_VERSION = 1.45.1
 PYTHON_MUTAGEN_SOURCE = mutagen-$(PYTHON_MUTAGEN_VERSION).tar.gz
-PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/30/4c/5ad1a6e1ccbcfaf6462db727989c302d9d721beedd9b09c11e6f0c7065b0
+PYTHON_MUTAGEN_SITE = https://files.pythonhosted.org/packages/f3/d9/2232a4cb9a98e2d2501f7e58d193bc49c956ef23756d7423ba1bd87e386d
 PYTHON_MUTAGEN_LICENSE = GPL-2.0
 PYTHON_MUTAGEN_LICENSE_FILES = COPYING
-PYTHON_MUTAGEN_SETUP_TYPE = distutils
+PYTHON_MUTAGEN_SETUP_TYPE = setuptools
 
 $(eval $(python-package))
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
