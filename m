Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5109DE66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2722A80DCC;
	Sun, 21 Dec 2025 22:36:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xuUdK0iruXSh; Sun, 21 Dec 2025 22:36:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5206B8122D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356582;
	bh=9QBBmPpj5A4fU2DoGaAyuAHWpB9BRD3vEkprLAUsEDw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=RtfEqnZ+JcsDc4dKaXxBhstFOu3kBKehXB21U8gfpoPHMxuOg3b0Q8ViXz/3VcRhg
	 yQTG21KbI1irUQtWhqyqt8vEXuyIetNyiiCusOiQiUzMI2lmmXldwTAey1DmulMErr
	 KT9Ma2B26gyl3DCkGRM1x50asY6D75nrKkhY8V17wbDGwlAkC8B2JxU7YUWFaR0fJC
	 t4iSh4tAC/Vj2Gqr+hRfMhJTa+gwSGBN4OxM4+dPhQTAqDTqB/sIhF22mO8M9OEtZd
	 0r99bC3VlhGvjgciilTGwWGuhZpzlZha2EEnFJvs2cOPK14irOKiLjzxdc6SighrFN
	 9uSXTBfeYKZ+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5206B8122D;
	Sun, 21 Dec 2025 22:36:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id A4778195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9561740382
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5v8W-p4M05fw for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:36:20 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 7E2A54037A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7E2A54037A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 7E2A54037A
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:20 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 182F4A4C4E14;
 Sun, 21 Dec 2025 23:35:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-0CT0;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:29 +0100
Message-ID: <20251221223441.185169-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356504;
 bh=iVwrVccmLlzQG2s+y1OUMo2MYlwWfU1h/WsGY/RwYLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=eNhLEUX1wzxaCnFapr5bBPDUI0R6tu34zdKpz5YZIRCCIArNCz8z32rWeTbBGJ6FJ
 bhIHMJfjKqjXPO/Lp5GSTxg6XwZqBk/I7sUWCMndEI49GcnqLA3bSuoQoOXGCtYL4N
 +L26E86UXsWVJRJsLllHR9EUDNWSxL2bRoCeXGViBKJ7Fi6VvRbmV/r/hTGJt6clRv
 ACskvhb1PfSojb9FoCw1hTzv8Y95HrwXXJbpq4+EBfj42KPENpj4iTp7VkJ4smVC1z
 rwsdcQghn0Tu5zsM6wrvlvYgxiDKIFSESEMaP75kPBrusjYpPqWQENLEYy4cbE5KAb
 z7RR3qWD4oLvA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=eNhLEUX1
Subject: [Buildroot] [PATCH v2 11/23] package/python-ipython-genutils:
 update tarball URL
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
 package/python-ipython-genutils/python-ipython-genutils.hash | 4 ++--
 package/python-ipython-genutils/python-ipython-genutils.mk   | 2 +-
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/python-ipython-genutils/python-ipython-genutils.hash b/package/python-ipython-genutils/python-ipython-genutils.hash
index fd719c93a0..c368272f07 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.hash
+++ b/package/python-ipython-genutils/python-ipython-genutils.hash
@@ -1,5 +1,5 @@
-# md5 from https://pypi.python.org/pypi/ipython_genutils/json
+# md5, sha256 from https://pypi.org/pypi/ipython-genutils/json
 md5  5a4f9781f78466da0ea1a648f3e1f79f  ipython_genutils-0.2.0.tar.gz
-# Locally computed
 sha256  eb2e116e75ecef9d4d228fdc66af54269afa26ab4463042e33785b887c628ba8  ipython_genutils-0.2.0.tar.gz
+# Locally computed
 sha256  f09da6c0f4971485f6fbd6c630d0d6cdd012bfe128b2ebbd014de2f6c7c7e2a6  COPYING.md
diff --git a/package/python-ipython-genutils/python-ipython-genutils.mk b/package/python-ipython-genutils/python-ipython-genutils.mk
index 08a0b8ba9a..847279b6b4 100644
--- a/package/python-ipython-genutils/python-ipython-genutils.mk
+++ b/package/python-ipython-genutils/python-ipython-genutils.mk
@@ -6,7 +6,7 @@
 
 PYTHON_IPYTHON_GENUTILS_VERSION = 0.2.0
 PYTHON_IPYTHON_GENUTILS_SOURCE = ipython_genutils-$(PYTHON_IPYTHON_GENUTILS_VERSION).tar.gz
-PYTHON_IPYTHON_GENUTILS_SITE = https://pypi.python.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
+PYTHON_IPYTHON_GENUTILS_SITE = https://files.pythonhosted.org/packages/e8/69/fbeffffc05236398ebfcfb512b6d2511c622871dca1746361006da310399
 PYTHON_IPYTHON_GENUTILS_LICENSE = BSD-3-Clause
 PYTHON_IPYTHON_GENUTILS_LICENSE_FILES = COPYING.md
 PYTHON_IPYTHON_GENUTILS_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
