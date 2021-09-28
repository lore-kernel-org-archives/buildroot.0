Return-Path: <SRS0=iTAH=OS=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42EA5C433F5
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:54:48 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id D34486113E
	for <buildroot@archiver.kernel.org>; Tue, 28 Sep 2021 08:54:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org D34486113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A320160ADA;
	Tue, 28 Sep 2021 08:54:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bSspgfTQY9q7; Tue, 28 Sep 2021 08:54:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id ED259606C4;
	Tue, 28 Sep 2021 08:54:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id C32491BF298
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:54:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BC3E680EB3
 for <buildroot@lists.busybox.net>; Tue, 28 Sep 2021 08:54:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9zuqLA-mzuEW for <buildroot@lists.busybox.net>;
 Tue, 28 Sep 2021 08:54:43 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com
 [IPv6:2a00:1450:4864:20::32b])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B34BD80EA5
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 08:54:43 +0000 (UTC)
Received: by mail-wm1-x32b.google.com with SMTP id v127so2820515wme.5
 for <buildroot@buildroot.org>; Tue, 28 Sep 2021 01:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDyKr0LVKvsGS8iQ35TeTnHXPSiLX8WsftngLmsc/94=;
 b=QWo9PjBLt+MbB9aukyRiQwRFPuVJgbAhnGcPTSDx93acTcWf9UNtlG9Xw8k2tgpDpv
 Xyp5DywOdfEGPqAznqts7kGI1ZoNkr4twmDdEouhNF8RZugf0VFIRJsd/rgl3K1nF+0h
 4VBt5XQjm4p1xTQeCGCH1uEQi8Ubq4bb8xVi6F4kfl3euGRVE7FpqIrvfSvuldaoWM6X
 JTTXIYoGNqJ2Jlb7RsGiT6y+gox8o75hnTwEEqStMHrQih0U8h1ks4iAjnn+wkpqw6Ft
 zUjyqMBHB6jlh4IsnK6vvMNjxKug8wOimq4NpTJIyDnsrUenw2hCmgbWAavsj4nxUnqR
 37Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ZDyKr0LVKvsGS8iQ35TeTnHXPSiLX8WsftngLmsc/94=;
 b=1EA2qKL5EYn0dBoV2BC+bgY4qkmPFmi8f0iMsot0uWw/f/DrErsTUdkaG4AeTDzsdk
 f5Q4ka/3W7LY8tO8r66ATk2EUHeoETtDZvGZsz/5FsV5xPNm08Hc+N6Q/GmeH1nMJ0cx
 ZyQ2GZ9vYOVzCc4t9W0UbHdZJrD5glmG+LdrpPqfDvGJGM+UpwfOkoDq9hvpaxYbvtB+
 zGKBEkxRfqDR/wCDLyNBaTP+/BPIj4bS8cuLeHdQA+N218yfAzFyOx6ekUz+HVhdrWGa
 QKALr/DJmKrQQXrf2mHRs2NWipgnBw8hj1g1mmhrt8MkZrapfF7PcSAWSYSkXZZ18GXl
 LtZg==
X-Gm-Message-State: AOAM531RTuL7H+07GNSoNchzgfknhFsc0KTXxCdx/6xDQ4KxOg9WIVGI
 JBkW6XyhQDOlAXZWQfMXmuKZBNx9Gu0=
X-Google-Smtp-Source: ABdhPJz7hAAba5WAA3SHttzFmp3+3u0tqnDzK4x+tGUg4oVw4btuCbIJ6I2X5NHbmC08Vxi3Y/Bjbg==
X-Received: by 2002:a1c:a9c2:: with SMTP id s185mr3518379wme.83.1632819281675; 
 Tue, 28 Sep 2021 01:54:41 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:e3c1:c62:a1cb:8d22])
 by smtp.gmail.com with ESMTPSA id r26sm1947360wmh.35.2021.09.28.01.54.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Sep 2021 01:54:41 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Tue, 28 Sep 2021 11:54:34 +0300
Message-Id: <20210928085436.583218-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-networkx: bump to version
 2.6.3
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

* License was updated with a year bump.
* Added md5 from pypi and reformat indentation with two spaces.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-networkx/python-networkx.hash | 9 +++++----
 package/python-networkx/python-networkx.mk   | 4 ++--
 2 files changed, 7 insertions(+), 6 deletions(-)

diff --git a/package/python-networkx/python-networkx.hash b/package/python-networkx/python-networkx.hash
index 6c4b793e0d..ace5c6721a 100644
--- a/package/python-networkx/python-networkx.hash
+++ b/package/python-networkx/python-networkx.hash
@@ -1,4 +1,5 @@
-# From: https://pypi.org/project/networkx/
-sha256 f8f4ff0b6f96e4f9b16af6b84622597b5334bf9cae8cf9b2e42e7985d5c95c64 networkx-2.4.tar.gz
-# Locally computed
-sha256 f421f7c5d30022aa268174976e43e488b856ad953f32cdd13f0675630996d8c0 LICENSE.txt
+# md5, sha256 from https://pypi.org/pypi/networkx/json
+md5  407eb28c54e08725559754ca7ab185e0  networkx-2.6.3.tar.gz
+sha256  c0946ed31d71f1b732b5aaa6da5a0388a345019af232ce2f49c766e2d6795c51  networkx-2.6.3.tar.gz
+# Locally computed sha256 checksums
+sha256  f9c25c92ced5a264a3fe857231205d5eb625ae367935aaf8d61cdd5087dfb90e  LICENSE.txt
diff --git a/package/python-networkx/python-networkx.mk b/package/python-networkx/python-networkx.mk
index 8ebbc84bde..e84bddf86f 100644
--- a/package/python-networkx/python-networkx.mk
+++ b/package/python-networkx/python-networkx.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_NETWORKX_VERSION = 2.4
+PYTHON_NETWORKX_VERSION = 2.6.3
 PYTHON_NETWORKX_SOURCE = networkx-$(PYTHON_NETWORKX_VERSION).tar.gz
-PYTHON_NETWORKX_SITE = https://pypi.python.org/packages/bf/63/7b579dd3b1c49ce6b7fd8f6f864038f255201410905dd183cf7f4a3845cf
+PYTHON_NETWORKX_SITE = https://files.pythonhosted.org/packages/97/ae/7497bc5e1c84af95e585e3f98585c9f06c627fac6340984c4243053e8f44
 PYTHON_NETWORKX_LICENSE = BSD-3-Clause
 PYTHON_NETWORKX_LICENSE_FILES = LICENSE.txt
 PYTHON_NETWORKX_CPE_ID_VENDOR = python
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
