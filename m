Return-Path: <SRS0=LUVO=OU=buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9FA0C433EF
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:16 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 7313B615E5
	for <buildroot@archiver.kernel.org>; Thu, 30 Sep 2021 07:03:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 7313B615E5
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=pass smtp.mailfrom=buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 4388A613C4;
	Thu, 30 Sep 2021 07:03:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id WPyn2-8D2g1z; Thu, 30 Sep 2021 07:03:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 85897613B4;
	Thu, 30 Sep 2021 07:03:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 329EF1BF2B7
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 21821613AD
 for <buildroot@lists.busybox.net>; Thu, 30 Sep 2021 07:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yCijCPJYEy9u for <buildroot@lists.busybox.net>;
 Thu, 30 Sep 2021 07:01:15 +0000 (UTC)
X-Greylist: whitelisted by SQLgrey-1.8.0
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com
 [IPv6:2a00:1450:4864:20::431])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 33E6360715
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 07:01:15 +0000 (UTC)
Received: by mail-wr1-x431.google.com with SMTP id h15so6666443wrc.3
 for <buildroot@buildroot.org>; Thu, 30 Sep 2021 00:01:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=IxSS8OEMo+xB2MenFB3V0UFs9P48pgI6PcGVwZNmMCo=;
 b=Ik+6UXtazjTExFTzlzx9t1VacDqibS8gbp3/yrJDD/2G8G9hviMxnaSCwwN/hfEyyP
 WqcJEBDfZawUbgqiWkIbeMNTvt8zDX7AjKu0GMZIbDt4RjZCxLNrf1Bc8neUaxihvBwY
 SUczBlx7jULP6aWVHFm1jJ/8940aOfpu82GNw0YFuGqiiK3WbFE52brefy2bGc47cdeD
 E05/Qq8gLlRXBfEB8sfZbiORt9azmS65VK04seFKfc2mhUwjmsmFtQ04Yq9/4ZlZgX1T
 XnjJkf4E95LUG7Kz8fxXxeDc7HU+VeuojqueDL4TIGyNk6kTD/lD855RheLok5l6kODK
 TZRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=IxSS8OEMo+xB2MenFB3V0UFs9P48pgI6PcGVwZNmMCo=;
 b=FLowXwTDtvwg4IT7bJNFSdP2EogVVQ/DShMuuU7aiY0nyAjWsT2xSVThHdRbzazmqJ
 AvK1hv8LHXOoY/gCYNg5XvfvniLp6M5PxVGyPDEe5H3Ghi2/wswwq+9ApYW0A/Bu1EQ2
 odwqq1XffrVVlGm3fEr4OR8zolTJF3jwwXlN4AK2VfRTg6GdAmaln43qCVNOOohJWS8z
 Eds60qyM9HtNUK8xDCfdcnBoVM5+Z1E9MOJCY7CMG3nI4O4avLKTmgzlL9ra1lKPCKLE
 fBHToXwSlM/ftgNFAL/eiTpJdvGZL8yXhAk18CkgWYBAevmwTjhbeD7CO7G1GSgGSWsL
 lnKg==
X-Gm-Message-State: AOAM532ZLuSDZCCuZM0tvRtMMHOh0R1BPFPO8GpC4p/7dzZrMU/88MGL
 zPv2Vn2qXEfjQIlCFxQRjpJdZa3cd7U=
X-Google-Smtp-Source: ABdhPJzRxNwGvlRgLEGLNPZpNSa+J96DbZHwIpSXg7qZMtIvChQgN7eWeWWGm37I7YYv5lm3JayQYw==
X-Received: by 2002:a5d:47ad:: with SMTP id 13mr4007496wrb.385.1632985273282; 
 Thu, 30 Sep 2021 00:01:13 -0700 (PDT)
Received: from asaf.. ([2a10:8002:6b25:0:c4c3:c3e7:ea7f:250b])
 by smtp.gmail.com with ESMTPSA id n26sm3801088wmi.43.2021.09.30.00.01.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Sep 2021 00:01:13 -0700 (PDT)
From: Asaf Kahlon <asafka7@gmail.com>
To: buildroot@buildroot.org
Date: Thu, 30 Sep 2021 10:00:48 +0300
Message-Id: <20210930070051.40361-12-asafka7@gmail.com>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210930070051.40361-1-asafka7@gmail.com>
References: <20210930070051.40361-1-asafka7@gmail.com>
MIME-Version: 1.0
Subject: [Buildroot] [PATCH 1/1] package/python-websockets: bump to version
 10.0
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

* Indent with two spaces in the hash file.
* License change was a year bump.

Signed-off-by: Asaf Kahlon <asafka7@gmail.com>
---
 package/python-websockets/python-websockets.hash | 6 +++---
 package/python-websockets/python-websockets.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-websockets/python-websockets.hash b/package/python-websockets/python-websockets.hash
index ec387c9ab7..cec1d1599c 100644
--- a/package/python-websockets/python-websockets.hash
+++ b/package/python-websockets/python-websockets.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/websockets/json
-md5	a37f0e22c3aa5f1cf12a6a3ae22b36ca  websockets-8.0.2.tar.gz
-sha256	882a7266fa867a2ebb2c0baaa0f9159cabf131cf18c1b4270d79ad42f9208dc5  websockets-8.0.2.tar.gz
+md5  ebb9e4930bf2c35cd3723be0dfa83d89  websockets-10.0.tar.gz
+sha256  c4fc9a1d242317892590abe5b61a9127f1a61740477bfb121743f290b8054002  websockets-10.0.tar.gz
 # Locally computed sha256 checksums
-sha256	8a88960c0d6aa8b38faa6ee614597dbf18e0ea22ba20884ef3dd31d34b2a6d09  LICENSE
+sha256  daeca11bf3608da35e546ea0c32be18958a8be1441fa3de9cbd20e4c8bc718e6  LICENSE
diff --git a/package/python-websockets/python-websockets.mk b/package/python-websockets/python-websockets.mk
index 013881f95a..9f4c5f1da7 100644
--- a/package/python-websockets/python-websockets.mk
+++ b/package/python-websockets/python-websockets.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEBSOCKETS_VERSION = 8.0.2
+PYTHON_WEBSOCKETS_VERSION = 10.0
 PYTHON_WEBSOCKETS_SOURCE = websockets-$(PYTHON_WEBSOCKETS_VERSION).tar.gz
-PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/79/78/17e97a159dc55308b1468a638c7267f19765281f6205ec9c15253c154022
+PYTHON_WEBSOCKETS_SITE = https://files.pythonhosted.org/packages/1c/f4/61aee1eb4baadf8477fb7f3bc6b04a50fe683ef8ad2f60282806821e4b3b
 PYTHON_WEBSOCKETS_SETUP_TYPE = setuptools
 PYTHON_WEBSOCKETS_LICENSE = BSD-3-Clause
 PYTHON_WEBSOCKETS_LICENSE_FILES = LICENSE
-- 
2.33.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
