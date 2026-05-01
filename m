Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD710CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:41:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 94DA4427E5;
	Fri,  1 May 2026 12:41:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QAxV4vlf8bGZ; Fri,  1 May 2026 12:41:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6164741E84
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639286;
	bh=mJZC1fjY+ii5iZFMeri04bJU3sqNKJxf5tKP7YyZcg4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gjkg4hwd+e4D9LGpH9VoXWsKfZY60dR/N8SUVPpKw5++q2XCAmi1NXZOBWe64Lvwc
	 2FL3IZQo2dkJCSCa7vhh93XbvW5FXtkJt0of2vtbukcXj+4HdhSxw1gou+aF5NfSyt
	 Xn2J3pz1PtNC1QBFgIyBWP4iL8bVsYi1JGetZ9IKZMErwmt+zXTeBdTcx63bLXv6zE
	 FY/lPuJrSFCgbTenVIIamFmIaGIpnsdV7PHxXgaewFRiKhvUovyUz/RfQBbcVu1PDC
	 bSMOhjVTB3I/nrlFsGhCYobwFe0Bfq54muPeLzTxnbDYdKCx9gXg3swwrWH6Xqhy3y
	 vksQa8E3LgMzw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6164741E84;
	Fri,  1 May 2026 12:41:26 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id C687B293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id ACCEF4267A
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WWVUCRycHOxl for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:41:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 9D5D04127D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D5D04127D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 9D5D04127D
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:41:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id CD3BCA4C2F03;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-1EF9;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:38 +0200
Message-ID: <20260501123100.1918951-53-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=LzepLCcy9kj1LJdIEwqjanGyBMTO3pyIkBfSVjfg+UU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=W+CtYbi/eYCkqJ4gEJfWKk+z/6Q7IkHjJ5z/3xTfhRHZiUAdmv3sjlDpqMNFC4ll5
 qp38+aBaoBPInFqRTjHmIOErjN45n8YqesJ+ztPISGea28ttMwQr8jMCJpRi8+nTIl
 /SwcXdE5CbMOdlhoffxDmZ5JaghGWew2Xi7b3xw7IQEjJLcG3Q5jafWJhOi978SzB2
 A7sLetURSSygTvf179k/NfCf6wyVVUbAB9lQiJ5IgZTN9REAJ1suQxAhKBpFoRvVFE
 FDC38bgHY9Iathlg1shapVMaziMzjAULKo0yhMVBNxi+slCtaGul5r78Jeggga0tN7
 hSKttS/K0Oy3g==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=W+CtYbi/
Subject: [Buildroot] [PATCH 53/75] package/python-scipy: bump version to
 1.17.1
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
Cc: Joseph Kogut <joseph.kogut@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Jagan Teki <jagan@amarulasolutions.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Fiona Klute <fiona.klute@gmx.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/scipy/scipy/releases/tag/v1.17.1
https://github.com/scipy/scipy/releases/tag/v1.17.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-scipy/python-scipy.hash | 4 ++--
 package/python-scipy/python-scipy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-scipy/python-scipy.hash b/package/python-scipy/python-scipy.hash
index 16c3af029d..27a72904d2 100644
--- a/package/python-scipy/python-scipy.hash
+++ b/package/python-scipy/python-scipy.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/scipy/json
-md5  db334c9cae4eeb9f306c342b3744d653  scipy-1.16.3.tar.gz
-sha256  01e87659402762f43bd2fee13370553a17ada367d42e7487800bf2916535aecb  scipy-1.16.3.tar.gz
+md5  d36aba61d4b01c50551efd38ca03752f  scipy-1.17.1.tar.gz
+sha256  95d8e012d8cb8816c226aef832200b1d45109ed4464303e997c5b13122b297c0  scipy-1.17.1.tar.gz
 # Locally computed sha256 checksums
 sha256  221e59f5e910fd7f94e44f0dac77436a11338c285c6346232e4a850a50da0e94  LICENSE.txt
 sha256  606209a000716c5f66e33e180ce08434b96ed17db4975ab9723c6b5fbcc89609  scipy/ndimage/LICENSE.txt
diff --git a/package/python-scipy/python-scipy.mk b/package/python-scipy/python-scipy.mk
index 4d8d7b398e..8c536df130 100644
--- a/package/python-scipy/python-scipy.mk
+++ b/package/python-scipy/python-scipy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SCIPY_VERSION = 1.16.3
+PYTHON_SCIPY_VERSION = 1.17.1
 PYTHON_SCIPY_SOURCE = scipy-$(PYTHON_SCIPY_VERSION).tar.gz
-PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/0a/ca/d8ace4f98322d01abcd52d381134344bf7b431eba7ed8b42bdea5a3c2ac9
+PYTHON_SCIPY_SITE = https://files.pythonhosted.org/packages/7a/97/5a3609c4f8d58b039179648e62dd220f89864f56f7357f5d4f45c29eb2cc
 PYTHON_SCIPY_LICENSE = \
 	BSD-3-Clause, \
 	BSD-2-Clause, \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
