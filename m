Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EABD4E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:35:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C089881F44;
	Sun, 21 Dec 2025 22:35:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0lWOB6emFXrS; Sun, 21 Dec 2025 22:35:23 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DA94881F82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356522;
	bh=ay4PDtisGfElhHLWgNmY4P7NOGOphP+m3TiiSDGFllQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mgwL5mcW/M9HH6Ep1hWPCxvR43lUT732i2CXYQW3rCluck+5fIHUMoAvZrv4+fl5R
	 JsasT04ltrO0omXl9dhmilR4lHt69FYSyuarrSp+kYxT5PDqePJY96OcI6JJ49gsmK
	 IjeCRJ71OHGBWIJjKmbZ69/BT/StVBI9Oxw5hpa1+H95FQPez3Wl1aRY0QcKcSgWsq
	 7+FLzQkGWFNhhuWNd4ekHjupF2zxBxbiA3pfVrQlDZDsNPt4Ym+F9by7Y8RPqiCsBE
	 NTxpIr0xRw0QLKPQtF31OKw6cOOj6aoEwx/xZt/JnMyloWPl8eJs9uW1TyJuMGB5Mb
	 ZLMT4wTwaNTww==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DA94881F82;
	Sun, 21 Dec 2025 22:35:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id AA819119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 915CE81E9E
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tHWr5WCkSx9O for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:35:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 83A6281CBA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 83A6281CBA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 83A6281CBA
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:35:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CB8B6A4C108E;
 Sun, 21 Dec 2025 23:35:01 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-45qJ;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:28 +0100
Message-ID: <20251221223441.185169-10-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356501;
 bh=LaM2srKBWOXXJOor5oiXSnJoAA7oT8mDO1f0q6jH0EE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sFYcfP0gN2M51eFK6NaXyizMeloJ98xzcld9/Z3iAj9CzpaUdMqTGiLGiKMbr/aMP
 B5uMmp7SdFWxn3fecRdRHxNB11neh5xB/N4gxSXfy1FXIdlxg07IBTRKlQKKNdg27M
 xMzZxj8AEwfLIAtQMTXSxZ3GE97JAWe2JDQJiEY2Bw4lNT68NlcgkMpL1VH6bR5qS6
 22caXN4/jRx8T/Ezy1qIseOs2tXYjuERhNZkxm9vRLdGig7QZDrU8TYtqbl0HjYSkm
 Pi9mVeKQIRfyvAIqs18cuJMbdNlCAiyNmK42fTEj4Lfse0n/pSGkUqlxgXIoafkvPA
 JBBjCwTAQW1oA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sFYcfP0g
Subject: [Buildroot] [PATCH v2 10/23] package/python-iowait: update tarball
 URL
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
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Andrey Smirnov <andrew.smirnov@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 James Hilliard <james.hilliard1@gmail.com>,
 Giulio Benetti <giulio.benetti@benettiengineering.com>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Updated package as computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-iowait/python-iowait.hash | 3 ++-
 package/python-iowait/python-iowait.mk   | 2 +-
 2 files changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/python-iowait/python-iowait.hash b/package/python-iowait/python-iowait.hash
index fc10e180f3..35ad91cb69 100644
--- a/package/python-iowait/python-iowait.hash
+++ b/package/python-iowait/python-iowait.hash
@@ -1,4 +1,5 @@
-# md5 from https://pypi.python.org/pypi/iowait/json, sha256 locally computed
+# md5, sha256 from https://pypi.org/pypi/iowait/json
 md5  f49ca7766fe4a67e03a731e575614f87  iowait-0.2.tar.gz
 sha256  ab1bc2eb84c22ccf61f17a0024f9fb6df781b39f1852764a66a7769d5adfb299  iowait-0.2.tar.gz
+# Locally computed sha256 checksums
 sha256  da7eabb7bafdf7d3ae5e9f223aa5bdc1eece45ac569dc21b3b037520b4464768  COPYING.LESSER
diff --git a/package/python-iowait/python-iowait.mk b/package/python-iowait/python-iowait.mk
index 028001d7f3..d7738c7eb4 100644
--- a/package/python-iowait/python-iowait.mk
+++ b/package/python-iowait/python-iowait.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IOWAIT_VERSION = 0.2
 PYTHON_IOWAIT_SOURCE = iowait-$(PYTHON_IOWAIT_VERSION).tar.gz
-PYTHON_IOWAIT_SITE = https://pypi.python.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
+PYTHON_IOWAIT_SITE = https://files.pythonhosted.org/packages/65/30/e953673fe9619938e9c74408401cf865f37716da89f61f6e5d9328c0f71e
 PYTHON_IOWAIT_SETUP_TYPE = setuptools
 PYTHON_IOWAIT_LICENSE = LGPL-3.0+
 PYTHON_IOWAIT_LICENSE_FILES = COPYING.LESSER
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
