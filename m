Return-Path: <SRS0=V1ZZ=OR=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B158C433EF
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 256A260FD7
	for <buildroot@archiver.kernel.org>; Mon, 27 Sep 2021 19:53:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 256A260FD7
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id F3B1581008;
	Mon, 27 Sep 2021 19:53:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id IVe67TWC6bSO; Mon, 27 Sep 2021 19:53:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5521980F81;
	Mon, 27 Sep 2021 19:53:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 490D71BF379
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 392C040261
 for <buildroot@lists.busybox.net>; Mon, 27 Sep 2021 19:51:59 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ovbZhU9ByHOk for <buildroot@lists.busybox.net>;
 Mon, 27 Sep 2021 19:51:58 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wm1-x336.google.com (mail-wm1-x336.google.com
 [IPv6:2a00:1450:4864:20::336])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 47F4440251
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 19:51:58 +0000 (UTC)
Received: by mail-wm1-x336.google.com with SMTP id
 b204-20020a1c80d5000000b0030cd967c674so640854wmd.0
 for <buildroot@buildroot.org>; Mon, 27 Sep 2021 12:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=clt2Z25OMWYNsRrCm5xONGd2woetOvo7E9v60yFq/j8=;
 b=lxFmTZRxFgjjl3s1o9KOdvCDPwRW8cYk/sU2pIKFUMq7QmV3TxacH9290KlbNMqMks
 XVbw/GUVxLfM9RQktn/EY5g3jr0pRtF2eDnsZ/c7T8vlYVW0DTt2mMsLGkikh9MB6qeh
 NcNjmPQQFDvLfs9an1srp2zCNXuiASvPsSSfNEuk1duLmYEbDeObKNPPurUq+j8GTfkb
 h+b+FMqHcJ1VIdNw+NZFo/N6gvmYi8180fUWNfBgCDPN7Gs4hudOyuM/84Q9IksccSqR
 y8xc/F6uG/NRZxyW4SHV4bAe/viqBk5Zjm1AeTtpa8OlTN81VwKulxygL1n2PMgZHNnr
 gTaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=clt2Z25OMWYNsRrCm5xONGd2woetOvo7E9v60yFq/j8=;
 b=Kq2skq7KudpbCqxVRy4Nvxv//zWkwsvRyMUqTtbDEBji6WZ5iCP7PZeD/LV35gWPJv
 4IB3X/Yo4FQpnQSvGc3elNXH0GYhVgKH+AgJ9BQ0nsh3BXm2XVEvOy7NwlRchmi3Vonq
 9oxYvHyoCFfz0w/PndOJH2XbEsYQj/RXh6CZ8p4wspc6fUrwBDdyF7O34lNmKB56PJV5
 djhtEPmr2IJZTvDwva1YK7cpArPmGxIe/PwRPnwxdWLqBXGa0PMyfheodTcePmKlavBI
 pn3oTUMbZTaVwopbgCJ2v/Fbsa73DXJEFPZghNCZy0YyfcHUwaViyDC02dJh0NRSCUDy
 UQ2Q==
X-Gm-Message-State: AOAM530odoqIsOIOKGb1llz+Ccbz4YHZWKEtgZVnErhqtttQVoRlJFOC
 wP34L2fDOTQ7fFrnNqo2sEFU91Yq0Do=
X-Google-Smtp-Source: ABdhPJxGNG7iMj9ZIkN7UnZMw3SxB2vUoyyzTY4A/3omA2jL9mtrnAl26iDU4vZVBHV3H52qRGWYHQ==
X-Received: by 2002:a05:600c:350f:: with SMTP id
 h15mr906806wmq.144.1632772316397; 
 Mon, 27 Sep 2021 12:51:56 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:fc32:81cf:8e3a:84a0])
 by smtp.gmail.com with ESMTPSA id w23sm485359wmi.6.2021.09.27.12.51.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Sep 2021 12:51:56 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 27 Sep 2021 22:51:34 +0300
Message-Id: <20210927195136.549542-10-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210927195136.549542-1-asafka7@gmail.com>
References: <20210927195136.549542-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-ecdsa: bump to version 0.17.0
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

And correct the URL in Config.in.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-ecdsa/Config.in         | 2 +-
 package/python-ecdsa/python-ecdsa.hash | 4 ++--
 package/python-ecdsa/python-ecdsa.mk   | 4 ++--
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-ecdsa/Config.in b/package/python-ecdsa/Config.in
index eb0d65801f..54a363b367 100644
--- a/package/python-ecdsa/Config.in
+++ b/package/python-ecdsa/Config.in
@@ -4,4 +4,4 @@ config BR2_PACKAGE_PYTHON_ECDSA
 	help
 	  ECDSA cryptographic signature library (pure python).
 
-	  http://github.com/warner/python-ecdsa
+	  http://github.com/tlsfuzzer/python-ecdsa
diff --git a/package/python-ecdsa/python-ecdsa.hash b/package/python-ecdsa/python-ecdsa.hash
index fcb8093826..a082d30b0f 100644
--- a/package/python-ecdsa/python-ecdsa.hash
+++ b/package/python-ecdsa/python-ecdsa.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/ecdsa/json
-md5  98c0da4c046286e892fdba727f93edea  ecdsa-0.16.1.tar.gz
-sha256  cfc046a2ddd425adbd1a78b3c46f0d1325c657811c0f45ecc3a0a6236c1e50ff  ecdsa-0.16.1.tar.gz
+md5  d0dd59c43af0f640a60599551529f5d0  ecdsa-0.17.0.tar.gz
+sha256  b9f500bb439e4153d0330610f5d26baaf18d17b8ced1bc54410d189385ea68aa  ecdsa-0.17.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3eca9845773d2e5b8cc9d8c119d345f00a4806e4bd660d4a3d6cdf9c0e9d8bb2  LICENSE
diff --git a/package/python-ecdsa/python-ecdsa.mk b/package/python-ecdsa/python-ecdsa.mk
index 75c970518e..eda35616de 100644
--- a/package/python-ecdsa/python-ecdsa.mk
+++ b/package/python-ecdsa/python-ecdsa.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ECDSA_VERSION = 0.16.1
+PYTHON_ECDSA_VERSION = 0.17.0
 PYTHON_ECDSA_SOURCE = ecdsa-$(PYTHON_ECDSA_VERSION).tar.gz
-PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/1d/d4/0684a83b3c16a9d1446ace27a506cef1db9b23984ac7ed6aaf764fdd56e8
+PYTHON_ECDSA_SITE = https://files.pythonhosted.org/packages/bf/3d/3d909532ad541651390bf1321e097404cbd39d1d89c2046f42a460220fb3
 PYTHON_ECDSA_SETUP_TYPE = setuptools
 PYTHON_ECDSA_LICENSE = MIT
 PYTHON_ECDSA_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
