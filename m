Return-Path: <SRS0=drHZ=PV=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD38C433F5
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 07:47:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 267CA604D2
	for <buildroot@archiver.kernel.org>; Tue,  2 Nov 2021 07:47:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 267CA604D2
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id DDA8160727;
	Tue,  2 Nov 2021 07:47:30 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oagVV9H2w2dR; Tue,  2 Nov 2021 07:47:30 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 34FE8605EB;
	Tue,  2 Nov 2021 07:47:29 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 9DF0F1BF5EA
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 07:47:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9AC27402D1
 for <buildroot@lists.busybox.net>; Tue,  2 Nov 2021 07:47:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Authentication-Results: smtp4.osuosl.org (amavisd-new);
 dkim=pass (2048-bit key) header.d=gmail.com
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Z9nAUSJ9xZMI for <buildroot@lists.busybox.net>;
 Tue,  2 Nov 2021 07:47:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com
 [IPv6:2607:f8b0:4864:20::22f])
 by smtp4.osuosl.org (Postfix) with ESMTPS id C3A5C402B5
 for <buildroot@buildroot.org>; Tue,  2 Nov 2021 07:47:15 +0000 (UTC)
Received: by mail-oi1-x22f.google.com with SMTP id bo10so1880259oib.5
 for <buildroot@buildroot.org>; Tue, 02 Nov 2021 00:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=pN0jXbHmzaXBzg1y/HxcE+QJJNCyQRH/cW7rgXhSYcA=;
 b=LydoE3Z99GYhk2CEmML1My6pC0pjkl6+v931JyycxU+8qp11k62l0K+7fxReQHB9xp
 Vw0SrSfgSotM50ixppbJyOiFj0vtFPZIC9vTgKFd7j+1sXL93FS8CxsXwKLyU9uFnYUb
 4BIb1HZ3EYQopoNMi6m+ksYRPtZyrrJDXUAQzg9SBnpjhC4EwTU3XFL2UiacGZN2sN6u
 etoBaH7M0luprJElHyFkZWegtg7cTZw85rYZNTxmIb74atpgvwr9+snxPnBukCYgJjSh
 6uUrbnsYSlvapOvNuNtw84Ko9PuYOT/v6Lcj4cczK3hyaiJ59SpGrL7POPT/edBOyLAc
 CzVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=pN0jXbHmzaXBzg1y/HxcE+QJJNCyQRH/cW7rgXhSYcA=;
 b=LNWAEIDOqoAWDqB+Pbi8z/3IuSw2UdrCv2QL3riFN8MbH6K0AqZLLL6CWqhrO6VeLF
 0+QbQQXQs1EVhEHK+SpFuJ1UjfujKg6Rl5lz4ws2ptaZx98K3cfZaRG24/qwEpgBUmgz
 nyew5Ovl7+GjWpGpIeD3lWF6L0vzD5oUPmJpoLoq4qnqx55OWL+oVG6HTw7jSJTJ+qhd
 39mb1ibOS0jmnaZ1mx2H4qFminrOajD3BQFyc1P1Za7SJ7uLm3LYoRmugYjZB3M04SWZ
 MAu9wOeAQmRq09SyLBB4SPGcrviK5Y2orjcBNIB+exNrPQBj/ZTm2RgmJZ77GP/Z188x
 tnHQ==
X-Gm-Message-State: AOAM5303K9HGWbZLkRDfzPRVetLxCv0Yo01bBq+pl3u7cCRrHD1uekZb
 LlkDONL63O/+t2qmIvFQyKuhN3/yKtw=
X-Google-Smtp-Source: ABdhPJzSxdRlz8x+JyAoZs3Wgzh+EVACiW7Yfag6PyIX0oLCFzKv4VNcNQAXDPc+J+NyW2TXlkQqyQ==
X-Received: by 2002:a05:6808:1487:: with SMTP id
 e7mr3726947oiw.78.1635839234621; 
 Tue, 02 Nov 2021 00:47:14 -0700 (PDT)
Received: from james-x399.localdomain (71-218-115-49.hlrn.qwest.net.
 [71.218.115.49])
 by smtp.gmail.com with ESMTPSA id g15sm4993488oiy.8.2021.11.02.00.47.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Nov 2021 00:47:14 -0700 (PDT)
From: James Hilliard <james.hilliard1@gmail.com>
To: buildroot@buildroot.org
Date: Tue,  2 Nov 2021 01:47:07 -0600
Message-Id: <20211102074707.3457972-2-james.hilliard1@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211102074707.3457972-1-james.hilliard1@gmail.com>
References: <20211102074707.3457972-1-james.hilliard1@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 2/2] package/python-aiohttp: bump to version
 3.8.0
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Asaf Kahlon <asafka7@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

License hash change due to removal of license full text:
https://github.com/aio-libs/aiohttp/commit/aca2c99f822af1b149c212c6566d8f116d8314d6

Signed-off-by: James Hilliard <james.hilliard1@gmail.com>
---
 package/python-aiohttp/python-aiohttp.hash | 6 +++---
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index bdcb72a695..90dbd75994 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  7052a8e9877921d73da98d2b18c9a145  aiohttp-3.7.4.post0.tar.gz
-sha256  493d3299ebe5f5a7c66b9819eacdcfbbaaf1a8e84911ddffcdc48888497afecf  aiohttp-3.7.4.post0.tar.gz
+md5  4743950052dbaf5ce5c3622754ebceae  aiohttp-3.8.0.tar.gz
+sha256  d3b19d8d183bcfd68b25beebab8dc3308282fe2ca3d6ea3cb4cd101b3c279f8d  aiohttp-3.8.0.tar.gz
 # Locally computed sha256 checksums
-sha256  96627bed0ad08e9b2efa9f4e04e80837cd0550e7694a0fec33b1dab2550282ab  LICENSE.txt
+sha256  383c70c090b60ae81e035fe4fafed689b45c4421cd3bc355f1bd41ac208ccf3f  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index ef0ce8b635..03501a7527 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.7.4.post0
+PYTHON_AIOHTTP_VERSION = 3.8.0
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/99/f5/90ede947a3ce2d6de1614799f5fea4e93c19b6520a59dc5d2f64123b032f
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/48/1a/ba9542a545aed4b0b6ef128561f68dd3c2812ff5abfa9ed5b96547a728ea
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.25.1

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
