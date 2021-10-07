Return-Path: <SRS0=EluJ=O3=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0AA59C433F5
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:55:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 5AE556113E
	for <buildroot@archiver.kernel.org>; Thu,  7 Oct 2021 18:55:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 5AE556113E
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2AD1A40A42;
	Thu,  7 Oct 2021 18:55:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 7zShoM0NwgDN; Thu,  7 Oct 2021 18:55:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 71AAD409C2;
	Thu,  7 Oct 2021 18:55:29 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 37F521BF870
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:55:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 272EE842B3
 for <buildroot@lists.busybox.net>; Thu,  7 Oct 2021 18:55:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp1.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id GLVfnR6w_cqe for <buildroot@lists.busybox.net>;
 Thu,  7 Oct 2021 18:55:26 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5D91D84265
 for <buildroot@buildroot.org>; Thu,  7 Oct 2021 18:55:26 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id r10so22086452wra.12
 for <buildroot@buildroot.org>; Thu, 07 Oct 2021 11:55:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P+TS9yo+noVOk05YdoQECeKPv5I6a4EGivVeUQ5vYJk=;
 b=dRXLZg9hLBGoHnq6Rqbrb5+QnuA8lkBHnGIE9PtXvi5CYudjpOnSp+ET7C8nU6DbgA
 nFdhtulBM/bLginMPFFo9CXrSauB8MFe2Yc8KySVefCsxj6C4oS0w9Gn99SVsxSizfXY
 RUUP8t6ynQrNKI1gszTldktjLEO5L6m5ImtQospZvrXquZx16EN+juVpWMyzipH8N0+P
 9yeHIUTIjW341j9Q1qD6dx7PktdlPvYktDa0AfyaBiI6FO0foXwcaXgagRLtfMdUCS4e
 gS3VJQKzkTutuWLts/tkIRdCWaSRicy3pX8l4oMkg2SL0/H1aRK1WsBugvPa9fu67n9a
 gb/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=P+TS9yo+noVOk05YdoQECeKPv5I6a4EGivVeUQ5vYJk=;
 b=7nhkXYmbtGuQ/ioztohb46qHoAD9zBqkzWnleOFw5bkBO6LnarUYs7p60v0bOw8kBH
 H2yht830IHzJw1nf7yxuMnOTX8TdWdAwQq+MTm2qm/q4x8sLQfMBWGouo8EbIVCcA8fZ
 WjOrHMdgTgLihXpsFKHxSeGRX7NQ87CO1z2AYjD5uLONeQAtPxy10R4oXa7Ewh300cSa
 DFuuOWfFnwoVaXb2sGkOzRUKjeHqno5Bl/yTysA68IOFQwOL4bzRvTOSExOpVWSJBVtP
 fgHs0OKnGLR3NpYQ7mHaxkmbOM5vc+1rGjC/5hAjU1qZXJUnBBLoYmBnaZPBueEvN3gj
 9BWw==
X-Gm-Message-State: AOAM5326DeBZMgCYWtHhu9guyy5HVanDV6TwqnlDEqyKIExWbz9Ikofw
 mJpMWF71/fLXIFhNmZu8T4L8biw7Hzo=
X-Google-Smtp-Source: ABdhPJyg+nVdFnFu9pydq786oevBON36hiFEaecQ2Ybxdz4hDFloFG8oZPoFfZ9V+wNZrSHona+Z4Q==
X-Received: by 2002:a05:6000:15c6:: with SMTP id
 y6mr7489786wry.210.1633632924521; 
 Thu, 07 Oct 2021 11:55:24 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:ac35:1014:de7e:b539])
 by smtp.gmail.com with ESMTPSA id f1sm217614wri.43.2021.10.07.11.55.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Oct 2021 11:55:24 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu,  7 Oct 2021 21:55:17 +0300
Message-Id: <20211007185517.108626-1-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-arrow: bump to version 1.2.0
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
* License file was updated to fully fit the Apache license format
  (see: https://github.com/arrow-py/arrow/pull/679)

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-arrow/Config.in         | 3 +--
 package/python-arrow/python-arrow.hash | 6 +++---
 package/python-arrow/python-arrow.mk   | 4 ++--
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/package/python-arrow/Config.in b/package/python-arrow/Config.in
index 1458556830..aed9a682ff 100644
--- a/package/python-arrow/Config.in
+++ b/package/python-arrow/Config.in
@@ -1,8 +1,7 @@
 config BR2_PACKAGE_PYTHON_ARROW
 	bool "python-arrow"
+	depends on BR2_PACKAGE_PYTHON3
 	select BR2_PACKAGE_PYTHON_DATEUTIL # runtime
-	select BR2_PACKAGE_PYTHON_BACKPORTS_FUNCTOOLS_LRU_CACHE \
-	       if BR2_PACKAGE_PYTHON # runtime
 	help
 	  Better dates and times for Python.
 
diff --git a/package/python-arrow/python-arrow.hash b/package/python-arrow/python-arrow.hash
index 90e0533232..9216e1c26c 100644
--- a/package/python-arrow/python-arrow.hash
+++ b/package/python-arrow/python-arrow.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/arrow/json
-md5	554f18b0e23182ee0e8cb2a882d2f607  arrow-0.15.2.tar.gz
-sha256	10257c5daba1a88db34afa284823382f4963feca7733b9107956bed041aff24f  arrow-0.15.2.tar.gz
+md5  608682052926c7e5636285af0618ef38  arrow-1.2.0.tar.gz
+sha256  16fc29bbd9e425e3eb0fef3018297910a0f4568f21116fc31771e2760a50e074  arrow-1.2.0.tar.gz
 # Locally computed sha256 checksums
-sha256	a4b7601be50569c2c96a9818fc809b0149410c84c99714d60c9d4fb0ae861fa2  LICENSE
+sha256  40d6e1255d7151f5f041a514725d3c94ffa8c1881e5a0c29b6bea93f03e2e3bb  LICENSE
diff --git a/package/python-arrow/python-arrow.mk b/package/python-arrow/python-arrow.mk
index f8326288b2..a20ac8dbc7 100644
--- a/package/python-arrow/python-arrow.mk
+++ b/package/python-arrow/python-arrow.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ARROW_VERSION = 0.15.2
+PYTHON_ARROW_VERSION = 1.2.0
 PYTHON_ARROW_SOURCE = arrow-$(PYTHON_ARROW_VERSION).tar.gz
-PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/43/0e/47416c54ad7742981bf77fdfc405987551ab14b181a6140c8cd2a5823872
+PYTHON_ARROW_SITE = https://files.pythonhosted.org/packages/dc/bd/2565b8533bb8cf66e10a9e68a1d489ad839799b2050f0635039e614e3b1a
 PYTHON_ARROW_SETUP_TYPE = setuptools
 PYTHON_ARROW_LICENSE = Apache-2.0
 PYTHON_ARROW_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
