Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C97C7E66886
	for <buildroot@archiver.kernel.org>; Sun, 21 Dec 2025 22:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9F714821DD;
	Sun, 21 Dec 2025 22:37:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id di4xpPtAJb1V; Sun, 21 Dec 2025 22:36:59 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 66BAE821DC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766356619;
	bh=C3o4dBe21PVjP34pP3e7lJwBAYhQnRXdo6jCkplro6E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=VrLQbpbPxBMjPeQwLPt4r3jWMzmBET1arQfhdd+/OowOMB49GPRK1zze8YiDhDlDA
	 kN6yVUV5XGfcRXFswmPB8yx2E/bW89uben/w9M6inYCUkO0W6RYlLRuopEsx0rJa47
	 Sil6i5smUkYiBhC2qlBjSxZHyxMCpPlLWL2Hq3YXwyrSOhoUjB8hbNEeLefwJjjBcl
	 h/wCAngy+josh21gaUsJ+Iv9Vtlv6WmIXBtYmh0ZvVF89NyGNEN0oR6On1MlLGyy9/
	 zfaW7sZ5+nmN2C7IOgO/nIEpO3als0GM18zwL9BwriX3g5ohyqC3W2GVW+eQp2HhVG
	 RvhKa+pEwahVA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 66BAE821DC;
	Sun, 21 Dec 2025 22:36:59 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 898E8195
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 70A744074D
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nQtLxqYQ-Op9 for <buildroot@buildroot.org>;
 Sun, 21 Dec 2025 22:36:56 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 657FA4074C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 657FA4074C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 657FA4074C
 for <buildroot@buildroot.org>; Sun, 21 Dec 2025 22:36:56 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B401EA4C4E38;
 Sun, 21 Dec 2025 23:35:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60652)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vXS0g-000000005pH-0W8E;
 Sun, 21 Dec 2025 22:34:42 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 21 Dec 2025 23:34:30 +0100
Message-ID: <20251221223441.185169-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251221223441.185169-1-bernd@kuhls.net>
References: <20251221223441.185169-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766356504;
 bh=74AJmXgavrsXwKa+OISWT0Sl7VJB4glyIUS8/lpuXWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pH6ydeLtWc/9cC89Fot5HnS7jBpb3J/j7NEx4JxOYYnkVgbmpJcfrMIS3DJXtvvl1
 al3Vpstlnn1EKyJdeevvFRaL9vzHVymI8IktXVNH+PSua9twrwgwCWLp97xIPY3gax
 r5pwVd9LHyi7Av21uX7QQSNvMDsvxgSGMMCD/m/J/I1zWrzLGVOzkud51jAVAcfexQ
 cHQ+f4uwqd2/6ZXWBUAtEsOGDu6FzcMZHVdB5Vj9zqEt1V5jJUyKPYpWSgntlbQ8mR
 0ju7Vze9kMTfEsqXOhuqwBuA4QDOLyJQJRf1O3/BUDR8UkBo+K8CXCn+tlpqPUOVH5
 giStEP+CtEQ0w==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pH6ydeLt
Subject: [Buildroot] [PATCH v2 12/23] package/python-json-schema-validator:
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
 .../python-json-schema-validator.mk                             | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/python-json-schema-validator/python-json-schema-validator.mk b/package/python-json-schema-validator/python-json-schema-validator.mk
index c0a335cbd7..017d5a3ec5 100644
--- a/package/python-json-schema-validator/python-json-schema-validator.mk
+++ b/package/python-json-schema-validator/python-json-schema-validator.mk
@@ -6,7 +6,7 @@
 
 PYTHON_JSON_SCHEMA_VALIDATOR_VERSION = 2.4.1
 PYTHON_JSON_SCHEMA_VALIDATOR_SOURCE = json-schema-validator-$(PYTHON_JSON_SCHEMA_VALIDATOR_VERSION).tar.gz
-PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://pypi.python.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
+PYTHON_JSON_SCHEMA_VALIDATOR_SITE = https://files.pythonhosted.org/packages/70/46/ba39cb7efad1898cfc89bf3588b8612f24d128f1c25b761994f524a59cef
 PYTHON_JSON_SCHEMA_VALIDATOR_LICENSE = LGPL-3.0
 PYTHON_JSON_SCHEMA_VALIDATOR_SETUP_TYPE = setuptools
 PYTHON_JSON_SCHEMA_VALIDATOR_DEPENDENCIES = host-python-versiontools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
