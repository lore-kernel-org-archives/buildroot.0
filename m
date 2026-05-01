Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C807ECD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:31:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A194741DD8;
	Fri,  1 May 2026 12:31:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bn-VQznENM12; Fri,  1 May 2026 12:31:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9DB741DE6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638717;
	bh=cm73MANU+kyYVyKymJvt+YwMTLc+fTI0n26+HKGFy1s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gZTab49/dH4OMPD9/njJSniX/Vy8CbvGUdNn2BPmdw9kYigFCVg87Srw3CErXu2m5
	 4IkQW7FhhnKv/LDfPUultCkHr1RWEWrLgFx9B9IB0yCpmqXHkzwlYHmRswry69+13e
	 n/z/ZgMGl6OgVbmGyVf+7JZrdMiXGBuEzcO2Ij1p03Yz8VtSUj+u6FWgHGCewSFsyQ
	 pzxnqHF90MrA+q3H/87zPP82rNXWN5/+5aAskW3F/c0YTtZdOClmI9GD+VAnhWG+fI
	 orQ2TP6syH/iuJqb2HNcSPpdNSsJpVgvFbZB7/npHp+biH8ZMh484gptBr/QQtuF+k
	 oqfQbD8o/AFcg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9DB741DE6;
	Fri,  1 May 2026 12:31:57 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 24774127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A36E61AC7
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qmGcovN2mpLP for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:31:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org EE2ED61684
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EE2ED61684
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id EE2ED61684
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:54 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 83C86A4C2E83;
 Fri,  1 May 2026 14:31:02 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-0svW;
 Fri, 01 May 2026 12:31:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:51 +0200
Message-ID: <20260501123100.1918951-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638662;
 bh=WqRNnk9F4VZgN4gY24T0QHqLMxkaR01XGcVc+99aFIs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jsdi4hFx+Yo1L0RZPHIWD8Dmh379BWaAIZ+0osfTmhN9aonVp/mdP2PQxzUkTHDpq
 PaXZGBWkfS0b0Pjnx0YevDF/qLgK1S2juanMfgLOeLM/T1cEK9J5/Qpk3m+7RUuaZd
 909EwFn6g6yVTPumATk6WuxtX2DhJL/+u6MxtxVWhzUPoCzkvcKZyCTJ0ULmPqLegX
 zN8DYHoEfQNTC6i4j9IqThbh9MxFV1gYJJabP2vhZtcltgjNyuKe13oq3nQtX7IHQh
 cT26JNqffCj2ldyK397WaNkHW9tmAKPFF2gjHCx21RtZXxsBDJExwDkhKslIcKJR1T
 3a6Oxd8tmTuRQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=jsdi4hFx
Subject: [Buildroot] [PATCH 06/75] package/python-bleak: bump version to
 3.0.1
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

https://github.com/hbldh/bleak/blob/v3.0.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bleak/python-bleak.hash | 4 ++--
 package/python-bleak/python-bleak.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-bleak/python-bleak.hash b/package/python-bleak/python-bleak.hash
index c9af5ebfb7..abc75d6917 100644
--- a/package/python-bleak/python-bleak.hash
+++ b/package/python-bleak/python-bleak.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bleak/json
-md5  e757918dbfcba6bdfcb69e82048fc3a9  bleak-2.1.1.tar.gz
-sha256  4600cc5852f2392ce886547e127623f188e689489c5946d422172adf80635cf9  bleak-2.1.1.tar.gz
+md5  513384cf6ed28ebcad27ed829c4ad3a2  bleak-3.0.1.tar.gz
+sha256  c8ff077519f8c30a972fd0d22f47a54b981184b2f2a0886d02e55acadbc1045d  bleak-3.0.1.tar.gz
 # Locally computed sha256 checksums
 sha256  c4029a2b63b3824ab68be841f414addbdde20cb79cdbe272fa80c0b2abe65374  LICENSE
diff --git a/package/python-bleak/python-bleak.mk b/package/python-bleak/python-bleak.mk
index abb556e348..e873d1234f 100644
--- a/package/python-bleak/python-bleak.mk
+++ b/package/python-bleak/python-bleak.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BLEAK_VERSION = 2.1.1
+PYTHON_BLEAK_VERSION = 3.0.1
 PYTHON_BLEAK_SOURCE = bleak-$(PYTHON_BLEAK_VERSION).tar.gz
-PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/45/8a/5acbd4da6a5a301fab56ff6d6e9e6b6945e6e4a2d1d213898c21b1d3a19b
+PYTHON_BLEAK_SITE = https://files.pythonhosted.org/packages/87/9f/dd19d92309e4a37823210827f0f42460e69603254309b99499622b511294
 PYTHON_BLEAK_SETUP_TYPE = poetry
 PYTHON_BLEAK_LICENSE = MIT
 PYTHON_BLEAK_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
