Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E119EE66891
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 22:45:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B5C3B40D11;
	Fri, 19 Dec 2025 22:45:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YEpYEidEQrVA; Fri, 19 Dec 2025 22:45:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E153340F05
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766184341;
	bh=k4dbci4Wqns5MLJMnyprSD0JgN2f8f2g1dM/3RkB+aA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=RuUE8EUMgYvedUg6Dlvw8JKVo12e6WEvqc9qayK+UQHaMhMqMmZhP7zm6LVSvFOXB
	 iejsyYTScTLRFjMSQ1KWEIAJSptpMf3M9afC8kLtlBqUJJSgFglCFBWFpyg5EAaSyR
	 KDiqI1bOfBD5T+9p8xT3OBSbYMlxxHGeFBgqr3qdVMsrRMnCajmFovC8nQYVdo1pzc
	 aOZRtOQR5Oa9/xvpN72kb/waJyJ3IQgpNtiJmohH5egcDTmz4MbTOYK4+CosjsNeSW
	 ypJv6FJcrR2W+7m85tKQReLXAuGA3HfbQtKOdcpy1IzWRQNVuJoiJMdJ6LlP117yJg
	 yF8OZrVefHzcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id E153340F05;
	Fri, 19 Dec 2025 22:45:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id BEAAC119
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:45:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A13D54007F
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:45:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6eGyxQSwir7m for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 22:45:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8FEE84003A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8FEE84003A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8FEE84003A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 22:45:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 295B1A4C48B3;
 Fri, 19 Dec 2025 23:41:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45868)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWjAP-000000002VW-3Tsc;
 Fri, 19 Dec 2025 22:41:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Simon Dawson <spdawson@gmail.com>
Date: Fri, 19 Dec 2025 23:41:39 +0100
Message-ID: <20251219224140.1318253-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219224140.1318253-1-bernd@kuhls.net>
References: <20251219224140.1318253-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766184114;
 bh=L9Kx/OqkbWXiaej6uEoz4HoDhzgoRKfnjBwcryfuXQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cfpiHA8XyV3Jpmg61hFU/CK827dHPH5FeVbjnwij27uI2QDfsBlghAvOK020GUzjA
 7kb0xTrxtnydnSEXpNCBtOIbOlEbmSgmNBn19xN8bMhuGGfx/mA3ebhqTvmcUhziAc
 DPS3OFArSlyptdhbtR5yQWkMK5ttZ3AkkvLMtOXwzcyixZYft7N9Ba7W7VqLXJDAM9
 Ln+wBQvVt0Ko/xntUqQFfbh19nMLRiBFRnWQz8JQigoLD8QFx1jOJQEfU3RuM1d3x0
 X69ViE4scIer4v4qjPg+TNRii+MoGpgnwDKmXqj6HiZ0i9MLWduNYtSWe/JKm0qVtA
 wOwu5EAZP9nVA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cfpiHA8X
Subject: [Buildroot] [PATCH v5 19/20] package/python-aioredis: remove package
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/aio-libs-abandoned/aioredis-py/blob/19be499015a8cf32580e937cbfd711fd48489eca/README.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy                             |  8 ++++++++
 package/Config.in                            |  1 -
 package/python-aioredis/Config.in            |  8 --------
 package/python-aioredis/python-aioredis.hash |  5 -----
 package/python-aioredis/python-aioredis.mk   | 14 --------------
 5 files changed, 8 insertions(+), 28 deletions(-)
 delete mode 100644 package/python-aioredis/Config.in
 delete mode 100644 package/python-aioredis/python-aioredis.hash
 delete mode 100644 package/python-aioredis/python-aioredis.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index 935faea7aa..6d3a85c94d 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,14 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_PYTHON_AIOREDIS
+	bool "python-aioredis has been removed"
+	select BR2_LEGACY
+	select BR2_PACKAGE_PYTHON_REDIS
+	help
+	  python-aioredis was abandoned upstream and replaced by
+	  python-redis
+
 config BR2_PACKAGE_LIBCUEFILE
 	bool "libcuefile has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 4c0225eb12..ced609b327 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -979,7 +979,6 @@ menu "External python modules"
 	source "package/python-aiomonitor/Config.in"
 	source "package/python-aiomqtt/Config.in"
 	source "package/python-aioprocessing/Config.in"
-	source "package/python-aioredis/Config.in"
 	source "package/python-aiorwlock/Config.in"
 	source "package/python-aiosignal/Config.in"
 	source "package/python-aiosqlite/Config.in"
diff --git a/package/python-aioredis/Config.in b/package/python-aioredis/Config.in
deleted file mode 100644
index 46ed2c7a46..0000000000
--- a/package/python-aioredis/Config.in
+++ /dev/null
@@ -1,8 +0,0 @@
-config BR2_PACKAGE_PYTHON_AIOREDIS
-	bool "python-aioredis"
-	select BR2_PACKAGE_PYTHON_ASYNC_TIMEOUT # runtime
-	select BR2_PACKAGE_PYTHON_HIREDIS # runtime
-	help
-	  Provides simple and clear interface to Redis based on asyncio.
-
-	  https://github.com/aio-libs/aioredis
diff --git a/package/python-aioredis/python-aioredis.hash b/package/python-aioredis/python-aioredis.hash
deleted file mode 100644
index 29e6361014..0000000000
--- a/package/python-aioredis/python-aioredis.hash
+++ /dev/null
@@ -1,5 +0,0 @@
-# md5, sha256 from https://pypi.org/pypi/aioredis/json
-md5  8f3547af83ef4b863b18c19f23166a9d  aioredis-2.0.1.tar.gz
-sha256  eaa51aaf993f2d71f54b70527c440437ba65340588afeb786cd87c55c89cd98e  aioredis-2.0.1.tar.gz
-# Locally computed sha256 checksums
-sha256  183b21f240e41af611c951d01d4f36793d470a82d5fd79efc21f25ae4cf68543  LICENSE
diff --git a/package/python-aioredis/python-aioredis.mk b/package/python-aioredis/python-aioredis.mk
deleted file mode 100644
index 798dbd0c3c..0000000000
--- a/package/python-aioredis/python-aioredis.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# python-aioredis
-#
-################################################################################
-
-PYTHON_AIOREDIS_VERSION = 2.0.1
-PYTHON_AIOREDIS_SOURCE = aioredis-$(PYTHON_AIOREDIS_VERSION).tar.gz
-PYTHON_AIOREDIS_SITE = https://files.pythonhosted.org/packages/2e/cf/9eb144a0b05809ffc5d29045c4b51039000ea275bc1268d0351c9e7dfc06
-PYTHON_AIOREDIS_SETUP_TYPE = setuptools
-PYTHON_AIOREDIS_LICENSE = MIT
-PYTHON_AIOREDIS_LICENSE_FILES = LICENSE
-
-$(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
