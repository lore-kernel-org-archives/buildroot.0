Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A49C7C433F5
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 70E7E60FD7
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 70E7E60FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4C06760AC1;
	Mon, 27 Sep 2021 19:53:08 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id kYHqnzAAp1VQ; Mon, 27 Sep 2021 19:53:07 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9C7FC60ABD;
	Mon, 27 Sep 2021 19:53:06 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4FE5B1BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3D32940261
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:56 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 6T-rhAFqe1CL for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:55 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 3E87A40251
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:55 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 z184-20020a1c7ec1000000b003065f0bc631so60353wmc.0
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WTrF/VAbcio+u1cT7QqyuRgwGY6A0FFXLw0ds8n9Hes=;
 b=Lv/DbtyVAyMaR4MvPEe+SQZWKK+2p0HylOIhVZraRYlLIxjJ8M96TNMjmZnORi6fsM
 E1TPtIiKk0rHPbcMCzBLw/I8BrijFA0pQL9CoZwGxknSaDAi0EcgBuhEFjYLMOAGBIOW
 xU0n24u/PsV9Y0Uvr9HPcAPeS+qCsL8YtaEhmymIC5K5gYOND0cMOiVZ0CdiGT+3h3J0
 DLpIBlG1IqZ95qHcC+U3o49yZ0lz1fnr/n6ccL03LEniksVBNw1hnPuYI8mwZEqHAmK8
 CjYvz/wUxg82te3PMgy4vw4KCQVSoUd4wxGFvUtO+REksHPkgmPe5qGHt0q6/KrVaf3o
 giRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WTrF/VAbcio+u1cT7QqyuRgwGY6A0FFXLw0ds8n9Hes=;
 b=EYW9FWU7Sqx8+RIYqnxTWKFZj/CJZ1/1JxzLdSCh8EsbhgCjK21BEmt9QHOQ/Uvyr0
 BSqAriz62/uHL0hOYYzCLYcP2b+UV/FJaIdcMotUyVenzIzUn2SPMB/uXg9+S2NCkv0E
 UzWzmngpBY58RV9wFv1U5TjQkQ2aw1bFcI4VvwSRoffX0HyO3mF2Wkn0t4pGmmqLr+w2
 NF+o3QkHpW54axXkCieG5pe9+0fnZapubZbCKKzvF/Bay7Rq/DsaQo9X5GDLimxvbU4H
 IxaizoDPfvt761oz9NqTHaebb4Hv3/UugP0lMjEAi/RbxUFSPE6VdUgHAJ46ehaNwdcv
 Cs+Q==
X-Gm-Message-State: AOAM5339tDB4/t+9ni9ZnadRcc2xDfxI5LR/Mc0X++GN+HrGDXOtlZUu
 n5rCKyYKX0Zhmt0lALGexP4K1o+j4G8=
X-Google-Smtp-Source: ABdhPJzWrMkNUP9ULL4RQBS80ZgMDmFiNQG8a77nHlPpLnMoX12H1SRgsZBTFCLAgP+SzCb0XvVEOA==
X-Received: by 2002:a1c:48c:: with SMTP id 134mr857167wme.137.1632772313412;
 Mon, 27 Sep 2021 12:51:53 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:53 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:32 +0300
Message-Id: <20210927195136.549542-8-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-dnspython: bump to version
 2.1.0
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
 package/python-dnspython/Config.in             | 1 +
 package/python-dnspython/python-dnspython.hash | 4 ++--
 package/python-dnspython/python-dnspython.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-dnspython/Config.in b/package/python-dnspython/Config.in
index 99fd6a9a5f..da9b959366 100644
--- a/package/python-dnspython/Config.in
+++ b/package/python-dnspython/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_PYTHON_DNSPYTHON
 	bool "python-dnspython"
+	depends on BR2_PACKAGE_PYTHON3
 	help
 	  A powerful DNS toolkit for python.
 
diff --git a/package/python-dnspython/python-dnspython.hash b/package/python-dnspython/python-dnspython.hash
index af09d51cd5..c9c74c8d75 100644
--- a/package/python-dnspython/python-dnspython.hash
+++ b/package/python-dnspython/python-dnspython.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/dnspython/json
-md5	bc9ca3b3a82164667d5730ec6d5248a2  dnspython-1.16.0.zip
-sha256	36c5e8e38d4369a08b6780b7f27d790a292b2b08eea01607865bf0936c558e01  dnspython-1.16.0.zip
+md5  8a362d7b2358be3117683e2dbf9654fc  dnspython-2.1.0.zip
+sha256  e4a87f0b573201a0f3727fa18a516b055fd1107e0e5477cded4a2de497df1dd4  dnspython-2.1.0.zip
 # Locally computed sha256 checksums
 sha256  c3ea3ff5654b329c19d3bc5f7481af623c3dded4a6145585499f843ad3d741cd  LICENSE
diff --git a/package/python-dnspython/python-dnspython.mk b/package/python-dnspython/python-dnspython.mk
index ed11687291..77e6082807 100644
--- a/package/python-dnspython/python-dnspython.mk
+++ b/package/python-dnspython/python-dnspython.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_DNSPYTHON_VERSION = 1.16.0
+PYTHON_DNSPYTHON_VERSION = 2.1.0
 PYTHON_DNSPYTHON_SOURCE = dnspython-$(PYTHON_DNSPYTHON_VERSION).zip
-PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/ec/c5/14bcd63cb6d06092a004793399ec395405edf97c2301dfdc146dfbd5beed
+PYTHON_DNSPYTHON_SITE = https://files.pythonhosted.org/packages/13/27/5277de856f605f3429d752a39af3588e29d10181a3aa2e2ee471d817485a
 PYTHON_DNSPYTHON_LICENSE = ISC
 PYTHON_DNSPYTHON_LICENSE_FILES = LICENSE
 PYTHON_DNSPYTHON_SETUP_TYPE = setuptools
-- 
2.30.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
