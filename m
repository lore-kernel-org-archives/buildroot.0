Return-Path: <SRS0=GPX0=OK=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0 tests=BAYES_00,
	DKIM_ADSP_CUSTOM_MED,DKIM_INVALID,DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34338C433F5
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:23:22 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id F0C9A610A0
	for <buildroot@archiver.kernel.org>; Mon, 20 Sep 2021 14:23:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org F0C9A610A0
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id C0BDA404AF;
	Mon, 20 Sep 2021 14:23:21 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 5Ht8UFyfj-I8; Mon, 20 Sep 2021 14:23:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id D2D554048E;
	Mon, 20 Sep 2021 14:23:19 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A030D1BF289
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9CEDF403D8
 for <buildroot@lists.busybox.net>; Mon, 20 Sep 2021 14:22:39 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id gLA3Fp2TpRlc for <buildroot@lists.busybox.net>;
 Mon, 20 Sep 2021 14:22:38 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9477D403CB
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 14:22:38 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w17so22079465wrv.10
 for <buildroot@buildroot.org>; Mon, 20 Sep 2021 07:22:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sRr9jJGM2OFHQoB2kr6qCCw0wTB0JpuPJw2TcPNDzx4=;
 b=lUQTmAnluy97z2DtiaOfSgA4JshLweNEX2N9Nh6S94QPsIFloHd4x96IFlts9Qcs32
 l4qCLhhOA+/j9uc2KAX2vVEkNEZ5lX0STvb+dxqXxqWtj8GCugl6wSTLWSdAIqByEP0+
 6bphKn2wd89iRpKItc85PBDGsI1ILWktyFJr3C6Sn6GuMj6luV1IJc0iKxgnuVcnjFVa
 Ij5bGRBrHTGs5v+HwfTfMbmt/DTNT6f1HTXljwWkAhiSmV4iiBm55TNRjuVBMkwoQcL/
 KQEzD8/3nqAgD+glkRwwEw9PsjNgs8kHm0dKn1deJAzjmDacRARcsDbmYHDCiJjw2hgV
 J06g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sRr9jJGM2OFHQoB2kr6qCCw0wTB0JpuPJw2TcPNDzx4=;
 b=wKJMromV5FqE4VZvZUtVkHqonhseHv3A5J7ODLtBv7ohjDi24xeVGA9b/hw88syK+M
 LPipBvUpz77x4OEnFCEx/XmFEdYw/Q+if6qomb6GKSOJOxZGQNo6TVbERVf8voee8FPx
 nUc+6RD/YJKEvYCSmJ8Zhh0P21dM80t07DkKznWOiCMyLoGeihWLpZNZPsm7Lkoo7g4s
 NnbKyfvezbwYnXrb2cM36pzauQwNeysrgFlYZV2w6o1r/sbcpvTNwOxgOQDK2+/0HIbp
 19YdnsqpkarCl/9iyy8a9HzZgyQVcx/AbZEA6GByNxgJuaH0vIW//lLpWUZrUxUuq8ko
 CZEA==
X-Gm-Message-State: AOAM5325XEmFT6UtovBcfeB8B4nHrxnoP0NSWniCkGgyUOjANl5zBmIC
 R3lmn6u5/tM45BBUAddxSdD3QTEY/A4=
X-Google-Smtp-Source: ABdhPJwcbzX+/o9SjbD2/QBfsuQub70bORCiAssMLbTkLp71vSfHgGQCmGkDh0rSLWERYRemWY1jqg==
X-Received: by 2002:a1c:7304:: with SMTP id d4mr19547090wmb.125.1632147753668; 
 Mon, 20 Sep 2021 07:22:33 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:ed43:881f:d7cd:d42d])
 by smtp.gmail.com with ESMTPSA id e2sm16295494wra.40.2021.09.20.07.22.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Sep 2021 07:22:33 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Mon, 20 Sep 2021 17:22:21 +0300
Message-Id: <20210920142221.299817-5-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210920142221.299817-1-asafka7@gmail.com>
References: <20210920142221.299817-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-zope-interface: bump to
 version 5.4.0
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-zope-interface/python-zope-interface.hash | 4 ++--
 package/python-zope-interface/python-zope-interface.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-zope-interface/python-zope-interface.hash b/package/python-zope-interface/python-zope-interface.hash
index 6c2f75303d..f7fa673e24 100644
--- a/package/python-zope-interface/python-zope-interface.hash
+++ b/package/python-zope-interface/python-zope-interface.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/zope-interface/json
-md5  291fd76bd83dda946674af1526b6c2cd  zope.interface-5.3.0.tar.gz
-sha256  b18a855f8504743e0a2d8b75d008c7720d44e4c76687e13f959e35d9a13eb397  zope.interface-5.3.0.tar.gz
+md5  c58b31da83449631efb499de13c68c6a  zope.interface-5.4.0.tar.gz
+sha256  5dba5f530fec3f0988d83b78cc591b58c0b6eb8431a85edd1569a0539a8a5a0e  zope.interface-5.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3e671db11df687516cc1db5b3d65e4aa383eaca3c20cea3faf53a0f7335d0a3c  LICENSE.txt
diff --git a/package/python-zope-interface/python-zope-interface.mk b/package/python-zope-interface/python-zope-interface.mk
index db0739405d..beacfb4f5e 100644
--- a/package/python-zope-interface/python-zope-interface.mk
+++ b/package/python-zope-interface/python-zope-interface.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ZOPE_INTERFACE_VERSION = 5.3.0
+PYTHON_ZOPE_INTERFACE_VERSION = 5.4.0
 PYTHON_ZOPE_INTERFACE_SOURCE = zope.interface-$(PYTHON_ZOPE_INTERFACE_VERSION).tar.gz
-PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/b1/f8/aa59109d5345ece4820e8e7a05a97203ef21a0ac2c0460c6c929ea5be889
+PYTHON_ZOPE_INTERFACE_SITE = https://files.pythonhosted.org/packages/ae/58/e0877f58daa69126a5fb325d6df92b20b77431cd281e189c5ec42b722f58
 PYTHON_ZOPE_INTERFACE_SETUP_TYPE = setuptools
 PYTHON_ZOPE_INTERFACE_LICENSE = ZPL-2.1
 PYTHON_ZOPE_INTERFACE_LICENSE_FILES = LICENSE.txt
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
