Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1F2DE66884
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:55:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE56B612FE;
	Fri, 19 Dec 2025 17:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SRc49L7YHcha; Fri, 19 Dec 2025 17:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AD061612D3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166940;
	bh=k4dbci4Wqns5MLJMnyprSD0JgN2f8f2g1dM/3RkB+aA=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=CAUwhOkMxi6lst8O+kPg444ldW43Zd8ANbjSDIeWiZ8hsbse+Vp4+dBgsTZ7kd/QR
	 Ikk7HGEHxRAM3De2ceYWtGjDXMsh45iSI3fEo5xj3vlHy/781kXDs+MpJNR5BgPO/0
	 RGfP74orfs9XJKhMu5UqJ36+1Vn/7IXvxEnV0UYanfMatav4UpL+IWGcTcH7qEkZnr
	 ZkG4ApY83zvUxNab1yOv4WXjjCS/wAjMRZS2O8uS+zgVWz3Ar7NPuNTRfE9TM4i+AU
	 qIjjqkBQIZ5+sI7aS3V5S5ziHr9b0PtOp8XdmFeNW83Ou9ps8Oigpw2Dv7sBDbXSot
	 4idVrX1k2Pf3w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id AD061612D3;
	Fri, 19 Dec 2025 17:55:40 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 1406A293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 064AA419F6
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nMZmaIT7ZOdQ for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org ED6FE4010A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org ED6FE4010A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id ED6FE4010A
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:55:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B4FADA4C4BE7;
 Fri, 19 Dec 2025 18:52:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWedr-000000002KQ-2KEH;
 Fri, 19 Dec 2025 17:51:51 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Simon Dawson <spdawson@gmail.com>
Date: Fri, 19 Dec 2025 18:51:38 +0100
Message-ID: <20251219175141.1907408-20-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219175141.1907408-1-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766166722;
 bh=L9Kx/OqkbWXiaej6uEoz4HoDhzgoRKfnjBwcryfuXQQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=YjP4Wgyc5vnjUGM+9OvmXv17brn3WL0BrAvh1AzAAQ5G73ZwQnF7Z48sjdENGFv0I
 ADDLOkAxCq+LL4Q9eO1dzbvTIwQXxUn6vMnElI374AvYsElEwg/MMql36Eg5ROgj67
 ahkSTre9tI8r4OlPrqFsftRaoYOuj6iFbZQwWNlA9sVaiUEx8olzz5fcQixlBJLGJf
 BNtVtTpcysKX5qC0Dp2pHv4Eyy8c4VIgJZDGfE4l9id9tkyAeLqj2EgixW+phmnl7I
 guAwNbifbpAD/7E8oqQzzThH594PeZomBaIWHtOmuGXcblr27ynplwDy6u+r3sDDAr
 pdrHeDykypO7A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=YjP4Wgyc
Subject: [Buildroot] [PATCH v4 19/20] package/python-aioredis: remove package
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
