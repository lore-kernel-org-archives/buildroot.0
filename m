Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7ADEACD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:34:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 52C8D61B25;
	Fri,  1 May 2026 12:34:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1b0idq2Xva7w; Fri,  1 May 2026 12:34:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 743E56F5E0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638851;
	bh=xsDzu+5M/LKNnVaQMXlkR/zM3ypZ+JkEa+yjBkVelpI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=OGalUct943wQBoJyjsw5QIimv5TJQvy8w6nAmRuOXjC1NSn2ZhnUqWtA4S4NRvbXK
	 hJ0xPwx/n3GBuFPZJhp2o6vj23iEcg1n3LLqbj9SHBVvuGZ0N+9/emSEHu4MSAdYZ2
	 5l9fAvEBtp7Yvmw7BREwRNcbslB89TBvQ9F1HSVPbF0Uo73wEZa7UEpK0DdSa1rkz8
	 rR8mZoMfOzszTHBGm9P/7x9QLV9M5ApJ/KZigQU6l8RaTheC0waBuvy1rs03DEZ5rA
	 EeUUqLpgjPtELpjbce/MRcpeqUc5lwGlTIWeysanYlfLK4GXFvdS3YQm3Hjt/r8xsQ
	 U3sDQYeMPmkuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 743E56F5E0;
	Fri,  1 May 2026 12:34:11 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 13820127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0562D423C7
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id rXRhjxKGzsXU for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:34:09 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 00320422F2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 00320422F2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 00320422F2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:34:08 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E76AFA4C2E94;
 Fri,  1 May 2026 14:31:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-0KT4;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:01 +0200
Message-ID: <20260501123100.1918951-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638663;
 bh=AIhGTvhSD3rj2DXXtiWHlmp0uIhqkZr0fEbApX3a/BA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=sdeyGZ1DCFgeZsaYxAt25M053FykX7Dfb/RZWRNaSLjF7sej0KMtbyd5GtqtCtu7R
 uGgdkgw98yGDejx+ItBybRIebw/PsB9uYV68u20gEsZVhqd2MkUhg2XIqbrA1ip5sJ
 CeYL6m+z8nGxGsy1Sab6+94jYSWmtcWjECJXzwnjFr/0BMJzItM4DhbMlXOJJ7G/hT
 TFVIznZAKl9lm2LQWCGno8D+6z9ffF+eftiN9BdrYasj7ba8R1g1I2HvixB+EOnjiB
 nRflGldlsyAzqWMbBB4bd7w2kl1rIeXn4Awg9acyfR+9yQ1k1g21Qbkm82rFTAyKGv
 mwQJPrPOHybXw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=sdeyGZ1D
Subject: [Buildroot] [PATCH 16/75] package/python-fastapi: bump to version
 0.136.1
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

https://fastapi.tiangolo.com/release-notes/#01361-2026-04-23

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 30be9955fa..35988ef77c 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  470ab99de13de14ea88d7071257944f5  fastapi-0.136.0.tar.gz
-sha256  cf08e067cc66e106e102d9ba659463abfac245200752f8a5b7b1e813de4ff73e  fastapi-0.136.0.tar.gz
+md5  ce568586b56db35b344df5c23d130ada  fastapi-0.136.1.tar.gz
+sha256  7af665ad7acfa0a3baf8983d393b6b471b9da10ede59c60045f49fbc89a0fa7f  fastapi-0.136.1.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index b1775eff88..d99a55c754 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.136.0
+PYTHON_FASTAPI_VERSION = 0.136.1
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/4e/d9/e66315807e41e69e7f6a1b42a162dada2f249c5f06ad3f1a95f84ab336ef
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/5d/45/c130091c2dfa061bbfe3150f2a5091ef1adf149f2a8d2ae769ecaf6e99a2
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
