Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07470E668BC
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:40:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id C5B6D81EC4;
	Sat, 20 Dec 2025 21:40:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2RgQIq-LJjBk; Sat, 20 Dec 2025 21:40:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6ED6D81E82
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766266831;
	bh=C3o4dBe21PVjP34pP3e7lJwBAYhQnRXdo6jCkplro6E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C6GJb4xNyn8GA8IOcvkXQa/AEqGWYwLHrBOaU4Za3C+wNhUwt5Pe34XF0udFOsa6J
	 bBkxNTRQ/MUFSE+8pVgtFgmiGml0IiOZACXblv9ZaClowN6x88QpBWttds3qPMA02p
	 uLLOMCwukAc38wLwX9fp+IbxW8EG8o2JsQeaCwmSyvtqTv6g9nfiNiYPysSqSaQ1Wl
	 mLxIqvP4WKWew0M2oRRSolIjwUSgxqbSIIJrMeOHfMTGIOs/4jEDQ/vgyOMVpza6xy
	 0AiDpBrFuppGiymHlbQtsfpes6vmwzpe8S41RcJiqjcgo7duf06TqM1csASAPPymxA
	 TGD2RnGoqJDMA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6ED6D81E82;
	Sat, 20 Dec 2025 21:40:31 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5590C119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 47D0381E7E
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Zfc5slgNGFTN for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:40:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 404BD81E3D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 404BD81E3D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 404BD81E3D
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:40:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 535B8A4C4D0C;
 Sat, 20 Dec 2025 22:39:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57228)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4fz-000000001mj-1yHD;
 Sat, 20 Dec 2025 21:39:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:39:43 +0100
Message-ID: <20251220213946.1088820-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220213946.1088820-1-bernd@kuhls.net>
References: <20251220213946.1088820-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266795;
 bh=74AJmXgavrsXwKa+OISWT0Sl7VJB4glyIUS8/lpuXWs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vfFAY9UbA98jZe7XQ8rSKeTDoTydO5026rWmAd83S8Re/YA4FUzLZHbvpCgCSRkCH
 QX1GXzIQb/MehzhuYKdSTD4bYywGZB4vvEbg8g572WD1SQPl5lcSMkDwxrqtjasC7y
 lFo8kBZSFqQOKFOXlsUWxfuMTL0jzK8VuVFLJd+VuMYU1tva+m49/ZHiY7v8ascHqq
 iJeYJ9f6wt4mDEaYiNx4XqIhEAkkzk4ltgNuS6DHHJzkqjcOjjc4eyyNJx8HdMtUN6
 U6ECUxrpL165mcDQhjPURAegl2W38KgXP7/4yyEVfCwWnz0qmNWuHezPZsZMo1Bsnq
 tFOgQxDQYNLIg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vfFAY9Ub
Subject: [Buildroot] [PATCH 12/15] package/python-json-schema-validator:
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
