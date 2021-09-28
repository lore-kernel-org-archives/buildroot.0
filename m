Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC488C433FE
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:55:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 87B55611C3
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:55:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 87B55611C3
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5A0AA80EFC;
	Tue, 28 Sep 2021 08:55:10 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id MSP8n89u_5Be; Tue, 28 Sep 2021 08:55:09 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B449E80EC1;
	Tue, 28 Sep 2021 08:55:08 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 255C01BF298
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:54:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2270D80EB3
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ZNIGp4aSqj6v for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 08:54:46 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 24C9D80EA5
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 08:54:46 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id s24so2814917wmh.4
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 01:54:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=EXfXgdH4R4aE9CHeM+50uBPOkAiG7zih66Jq7tfh/Jw=;
 b=BF+BXVZZsuydziggxtZIyd2DbZZdW5qhMRe44/eId2RE3jYdjRVjpY63BZzmvlEIFT
 NGAbLAWYpC+fITjs4StVTDPNpBsNIqzwhr1r3uWzEucZx4fRzJ6wpkzh9NhSxXEIj7zr
 fFi/cCVPDZWgdLOm6KUOFpR1d9XS/t/GQhSamFs5XlhBIkfGvqUmuKWC7KHIZ6cZEH89
 epU9pGW0AWvBmZ0yxmjdJmbVKAOFonTicwooTvzfoZIbo+45iBD0A/mq0VQQacy3OpuX
 W7vQTxjXkO4Ntdgb5YazJoSTh4StiV2k2BeBQS7vsOXhljtIT05m3Aw5VRz0+p7cVgvr
 w19Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=EXfXgdH4R4aE9CHeM+50uBPOkAiG7zih66Jq7tfh/Jw=;
 b=xO7XEGWtjNc8UTQRqz6nOC0EZqE82doJUBTvyLjZhOP/qRP+C+UrXZw19l6/yY+3mz
 Y+Ij4UGJA80eSAcQZdmUujlB/Ki1DgicpavfAtudOVnA1gVDuRNGzfsdPdFYW4YdGl0f
 q8z6DmvavsP676wdK4/HmOkiuxcvm6B5jMvJ9KbKO52Z3t9wsWm+Bxc3lqk75OTwgP4o
 WF59pxhYCfDoGRM+KAkwaBGFOl4iZMY7x3KftYTKE8hN2eqXFQYWPtaNBoCpU56W+Wl8
 sT0zFuk0hieYE0anwWCgbSSfSXsPsEuZRCzJxSIwQ8W3KwnvEP0CWisB5rIitWX8+20Y
 FLOg==
X-Gm-Message-State: AOAM532Ll6Xm+9C5A8nBQXmPx970TYNUObMFe5JitEoD78qZIM+c2OvM
 /WGUvKuDhFaPbUOcmvMArnokQMEZ6yQ=
X-Google-Smtp-Source: ABdhPJyRvTNq+wty1w06buMTPJ8ia/+1UE/QFFFA9t1mhTdhvcbV7EONbeNt2FrtdPM+mMsRGqtwwA==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr3505996wmk.141.1632819284297; 
 Tue, 28 Sep 2021 01:54:44 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:e3c1:c62:a1cb:8d22])
 by smtp.gmail.com with ESMTPSA id r26sm1947360wmh.35.2021.09.28.01.54.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 01:54:44 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 11:54:36 +0300
Message-Id: <20210928085436.583218-3-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210928085436.583218-1-asafka7@gmail.com>
References: <20210928085436.583218-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-pathvalidate: bump to
 version 2.5.0
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
* Indent with two spaces in the hash file.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-pathvalidate/Config.in                | 1 +
 package/python-pathvalidate/python-pathvalidate.hash | 6 +++---
 package/python-pathvalidate/python-pathvalidate.mk   | 4 ++--
 3 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-pathvalidate/Config.in b/package/python-pathvalidate/Config.in
index 8606696e1b..564c3a0913 100644
--- a/package/python-pathvalidate/Config.in
+++ b/package/python-pathvalidate/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_PATHVALIDATE
 	bool "python-pathvalidate"
+	depends on BR2_PACKAGE_PYHON3
 	help
 	  pathvalidate is a python library to validate/sanitize a string
 	  such as filename/variable-name.
diff --git a/package/python-pathvalidate/python-pathvalidate.hash b/package/python-pathvalidate/python-pathvalidate.hash
index db1190fc77..adf1a75dca 100644
--- a/package/python-pathvalidate/python-pathvalidate.hash
+++ b/package/python-pathvalidate/python-pathvalidate.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pathvalidate/json
-md5	b0a8242d124a9e760ca2d084a4f8fa75  pathvalidate-0.29.0.tar.gz
-sha256	bf250828f40d94881df764950cffca14bb3fa83783d9f239125a6b5e23a5646e  pathvalidate-0.29.0.tar.gz
+md5  afc0343cd8c4ad732431a8b860d73330  pathvalidate-2.5.0.tar.gz
+sha256  119ba36be7e9a405d704c7b7aea4b871c757c53c9adc0ed64f40be1ed8da2781  pathvalidate-2.5.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
+sha256  a93d75bcb0774e2990106380cadad6dcb2de193c55d435ffc56ba345a08b1dc2  LICENSE
diff --git a/package/python-pathvalidate/python-pathvalidate.mk b/package/python-pathvalidate/python-pathvalidate.mk
index ee707e4e25..bb434f3662 100644
--- a/package/python-pathvalidate/python-pathvalidate.mk
+++ b/package/python-pathvalidate/python-pathvalidate.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PATHVALIDATE_VERSION = 0.29.0
+PYTHON_PATHVALIDATE_VERSION = 2.5.0
 PYTHON_PATHVALIDATE_SOURCE = pathvalidate-$(PYTHON_PATHVALIDATE_VERSION).tar.gz
-PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/fc/3f/7a96e26d36b7e99abc9c236ff6db2de2d98e59fed45f9932eb0d17d48473
+PYTHON_PATHVALIDATE_SITE = https://files.pythonhosted.org/packages/2e/89/7853a1ea323e848ab1e90c8930733bc19e35a935deb80d78b572c36ea33f
 PYTHON_PATHVALIDATE_SETUP_TYPE = setuptools
 PYTHON_PATHVALIDATE_LICENSE = MIT
 PYTHON_PATHVALIDATE_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
