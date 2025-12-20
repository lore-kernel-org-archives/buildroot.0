Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B22DE668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:40:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2D8D960E23;
	Sat, 20 Dec 2025 21:40:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Tc2TreyfcZBk; Sat, 20 Dec 2025 21:40:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3697660E0F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266806;
	bh=VwHGOrrSyn5SFe32XiOWUaFymdwYLKCGOim5mIPJUK0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=JiyIPgI0V4JM26xjeb8PSTjjgFK8gIBDpxTlplbpoQvXsOEtPwS81fql98LxNrwV6
	 4YC7gww/YQkxhEzLYG/nMa2bPP4R0V7J+XTgt8DaKOsGIJhW/Yw2csCYNygtzT7g1z
	 fuoCrQBOgTfHBcs9PWbDELlW322Nc3UTOZlvUwNQojkOVmTwEiDPO2bcv1VKL5T7mv
	 IlP9imIe10kkymZ3sJu5YIW7ncWIzFPvullBdeb5/5bOpoOtLaTYRTRKpzrjh9Z5li
	 jGmqAi8zlCDct4M4EA1nHPxQSuia/mf4/X3igoal+2J9jGeObfVdTQPSeD5twFzJSw
	 b4sJWMKFmjwLQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3697660E0F;
	Sat, 20 Dec 2025 21:40:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id C14E723D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A7F3A406D5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vEHJjxZBFnMd for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:40:03 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 8EC38405A3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8EC38405A3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 8EC38405A3
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:03 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E64FCA4C4B96;
 Sat, 20 Dec 2025 22:39:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fy-000000001mj-3854;
 Sat, 20 Dec 2025 21:39:46 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:33 +0100
Message-ID: <20251220213946.1088820-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266786;
 bh=FeQc6eE4eZ3yPGqLi4tFORH1TBtIIMNIFae0O/uGEv8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=paVrhmw2CHJT5ifxRiETqYRouZeWhAE/s3OTnXhKztI5dXjhBQPRC9cnOlHMnFRVA
 yLG/js70Rz72ZjpwAb4nvMDmY4kIGE4Et+8GxGlH7NC2lP8aJPfA0DqWnkAQZ+DlSx
 E8fvKBEnH7CnRrxajFNeqc8r5YgTqG1FJpZHUEWbM3FUi9D3hIQ+ffFoQvVz3mqwsE
 GJynl6TEZuNoCpC8ovd3tO7188Jw5oL6IFnSSuvGh03rgCzVpR13PIF7c7f3d3X3vT
 vs1UXo0CcxEOHk7yR9zECNBsXKWQE1TsEyAAUMubDXiYZ3IgZ7ntzcwwKWCBPKdNLy
 61VeHureS9TxA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=paVrhmw2
Subject: [Buildroot] [PATCH 02/15] package/python-colorzero: switch SITE to
 pypi.org
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
Cc: Zoltan Gyarmati <mr.zoltan.gyarmati@gmail.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-colorzero/python-colorzero.hash | 7 ++++---
 package/python-colorzero/python-colorzero.mk   | 3 ++-
 2 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/package/python-colorzero/python-colorzero.hash b/package/python-colorzero/python-colorzero.hash
index fc2455c836..4a1b900453 100644
--- a/package/python-colorzero/python-colorzero.hash
+++ b/package/python-colorzero/python-colorzero.hash
@@ -1,4 +1,5 @@
-# Locally computed
-sha256  86c9933b004aec8ce1c476d1d1129e00325c7724df3c09aa353d5f8e883ed08d  python-colorzero-2.0.tar.gz
-# Locally computed
+# md5, sha256 from https://pypi.org/pypi/colorzero/json
+md5  e7f71e181b94754bcc5ca7c92c52c0d7  colorzero-2.0.tar.gz
+sha256  e7d5a5c26cd0dc37b164ebefc609f388de24f8593b659191e12d85f8f9d5eb58  colorzero-2.0.tar.gz
+# Locally computed sha256 checksums
 sha256  ee1c76f465410c34802ddf81d70e1ea7a4542cf58459425038498d8f4e36bb45  LICENSE.txt
diff --git a/package/python-colorzero/python-colorzero.mk b/package/python-colorzero/python-colorzero.mk
index f38c98a093..0ed6a90c61 100644
--- a/package/python-colorzero/python-colorzero.mk
+++ b/package/python-colorzero/python-colorzero.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_COLORZERO_VERSION = 2.0
-PYTHON_COLORZERO_SITE = $(call github,waveform80,colorzero,release-$(PYTHON_COLORZERO_VERSION))
+PYTHON_COLORZERO_SOURCE = colorzero-$(PYTHON_COLORZERO_VERSION).tar.gz
+PYTHON_COLORZERO_SITE = https://files.pythonhosted.org/packages/b3/ca/688824a06e8c4d04c7d2fd2af2d8da27bed51af20ee5f094154e1d680334
 PYTHON_COLORZERO_LICENSE = BSD-3-Clause
 PYTHON_COLORZERO_LICENSE_FILES = LICENSE.txt
 PYTHON_COLORZERO_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
