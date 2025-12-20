Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026F7E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:42:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id CA37A819B8;
	Sat, 20 Dec 2025 21:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DKaaWaVajpd0; Sat, 20 Dec 2025 21:42:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8DF478199D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266928;
	bh=9QBBmPpj5A4fU2DoGaAyuAHWpB9BRD3vEkprLAUsEDw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QuwoNK5ACz3itISUqkizZtOIynKLQx0MJJ1SLdmcoA+JV9P7pDz1vi30MZokRIRvi
	 isdbX5UYTN+oMPT0ICzaKLFYKH/AQWCOczwjy38nUXmlDCC8iRo0zcCO+o3Ym0lbkA
	 4HzRIYVS8YULrshQQzuOp3rjoBUepkejcuyBhIXkz97y11L3caeCDu5Kk+RyXXjyQa
	 M668TXpB8EnBEnsP+qTEVIoUI0dr8E4T96i8QdrDOAIS75U2+g8Ilmyqs38qT4wFVp
	 J6kxqONDrZ4AzoB+hSJxUyBLOeXNX3n5I7211et8uEgwd3oTXvbAv4jxTSGjUL3+2/
	 PmIoThkTUfcDQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8DF478199D;
	Sat, 20 Dec 2025 21:42:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id CC702119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B343140896
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jQfyba9Os90H for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:42:05 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 997504088C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 997504088C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 997504088C
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:42:05 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E7B98A4C4D94;
 Sat, 20 Dec 2025 22:39:56 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-1dKq;
 Sat, 20 Dec 2025 21:39:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:42 +0100
Message-ID: <20251220213946.1088820-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266796;
 bh=iVwrVccmLlzQG2s+y1OUMo2MYlwWfU1h/WsGY/RwYLk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Tlkhx06gKj0GoTUThWXcq84zr04a2Iko1loPJqE4hOpxAAvhhbxskAM1wxrlTugJr
 OPyRC+tnd72193UvYY+QPBiX7zmWbeJdSsjYF/6Ynzp6Rz2QTf4fbiVjiEvc9SZXWi
 xDo3J+y/7hCfdgY/r221YySWX28QoJWRJiN+zF8bK9Mc9brG9nGGmyxrXBZwolcGZU
 HxlKGgJRyfNPNpRPmSogD1wH33h/oKQ+UQgeAcZvqRkN9iOETU56fjvg+fITARC/FK
 PFsNLJODfPWj2rw/IaT7Ekx9RXrZLsOtp9EpBjP/iDvZWsaqrq4PruxfvL/XX2oSWb
 noyvm/u+NMthA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Tlkhx06g
Subject: [Buildroot] [PATCH 11/15] package/python-ipython-genutils: update
 tarball URL
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
