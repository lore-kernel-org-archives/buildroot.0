Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55E1BE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:35:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1A7A181D68;
	Sun, 21 Dec 2025 22:35:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jdpp9jqEdlEU; Sun, 21 Dec 2025 22:34:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A033C81C18
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356498;
	bh=d1Yu+CtOdTXu1OPFRcLYSDL5RnHGHXVQDHNV+InsR1I=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Yg7CEY8q5o8CgouAqPlFY90c66/YGZ4q+SopXf9I7swo2HsEVqm1GaEjrZI0pqrU5
	 rd+pthfgUlAW0byyNEGLj8oWEmRX6MrtdyJxcQ0UJzPDBuatDZ3GbjBUnavJcvVV+M
	 6Y09j7kmYWw5yS/i60EsawBhWWepPR6vR2l9p5vsfOLIbLIA1WyZos2btUSYNQqLIM
	 jT3G0JJ7MU53H3zG8Fwqdt7Hwa8zSKVGT4gx2hqhDTUQc7bpUJ+FQIoCzBkLXtNZbK
	 6k4xBEENIoi+JLrrDNr0jEgwZrjzRJJE4fJjnuwgbd2lbW25o8tTF0vEygwDsvwaqF
	 pMCe72GWqFslg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id A033C81C18;
	Sun, 21 Dec 2025 22:34:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 52AC3119
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:34:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 38A5760810
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:34:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dpkgbsIlicB1 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:34:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 28148607F3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 28148607F3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 28148607F3
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:34:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A456A4C4468;
 Sun, 21 Dec 2025 23:34:42 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0f-000000005pH-25X9;
 Sun, 21 Dec 2025 22:34:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:21 +0100
Message-ID: <20251221223441.185169-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356482;
 bh=yxLQBlJPOnI7gP3KNMeKHcAiSxwcizr1cODnOccckq8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=o9uMVc6J7cWBnIoqKCKtpkmgQu4EtnKQeB+kjZFMRERTbSsrHCfVyKgDg25e2Y9bB
 i7g0db1gzmzlBTseFUk2xapwVPeLXVLxmomAUat+LaqIzvYHVTotJAp6mIiBEUSOii
 aPHUVEY3OJXyfq6Q+AbeveK1j37nu51a1ngHFpfwQELGi1ThCNvqwOBaQqOjGKfv26
 0WpT2yNfxEujV+Y/RxMUeQPSqZoQSoMdhZRVWUPEgHiDc8NGQSC/gsItE2qRy7Y9JW
 G34Rs5cCLZd42mjU3n2grXk+4O+po4Mz7n5udPhHuDYCMwYQFPbHs5bEIz7866a6gf
 GYTiu3PctO98A==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=o9uMVc6J
Subject: [Buildroot] [PATCH v2 03/23] package/python-crc16: switch SITE to
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
 package/python-crc16/python-crc16.hash | 6 ++++--
 package/python-crc16/python-crc16.mk   | 3 ++-
 2 files changed, 6 insertions(+), 3 deletions(-)

diff --git a/package/python-crc16/python-crc16.hash b/package/python-crc16/python-crc16.hash
index 4576a907ec..5244e400fa 100644
--- a/package/python-crc16/python-crc16.hash
+++ b/package/python-crc16/python-crc16.hash
@@ -1,3 +1,5 @@
-# locally computed
-sha256  10aeda70fbe8b284874b3b1b8f74b9c1f6d5e8dee20ac8f9d5bc49f45f12a42a  python-crc16-0.1.1.tar.gz
+# md5, sha256 from https://pypi.org/pypi/crc16/json
+md5  3cb6a4f5fd10a58c09792e321cc467e5  crc16-0.1.1.tar.gz
+sha256  c1f86aa0390f4baf07d2631b16b979580eae1d9a973a826ce45353a22ee8d396  crc16-0.1.1.tar.gz
+# Locally computed sha256 checksums
 sha256  ea7d049c7705dc13afc202dd18e1827f3484f8212fd3fa7b82fc4a0c363432c9  COPYING.txt
diff --git a/package/python-crc16/python-crc16.mk b/package/python-crc16/python-crc16.mk
index 86e6f2ecf2..7a773eaf8e 100644
--- a/package/python-crc16/python-crc16.mk
+++ b/package/python-crc16/python-crc16.mk
@@ -5,7 +5,8 @@
 ################################################################################
 
 PYTHON_CRC16_VERSION = 0.1.1
-PYTHON_CRC16_SITE = $(call github,gennady,pycrc16,v$(PYTHON_CRC16_VERSION))
+PYTHON_CRC16_SOURCE = crc16-$(PYTHON_CRC16_VERSION).tar.gz
+PYTHON_CRC16_SITE = https://files.pythonhosted.org/packages/a6/e0/70a44c4385f2b33df82e518005aae16b5c1feaf082c73c0acebe3426fc0a
 PYTHON_CRC16_LICENSE = LGPL-3.0+
 PYTHON_CRC16_LICENSE_FILES = COPYING.txt
 PYTHON_CRC16_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
