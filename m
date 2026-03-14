Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E49D10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:11:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36EE9407D6;
	Sat, 14 Mar 2026 14:11:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IwVjIHO9yB1c; Sat, 14 Mar 2026 14:11:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A4EB406B9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497512;
	bh=xPpYUwbBCI6tbFnx+Mz9yqwZAsjok7nBf50jW+vQB/s=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=C6EBviENqh/T3Bxl5aJoCSRGUQpaFy1SDMMVYuImapDTtBQOU1MfSK0U9kNhzcf+X
	 hQHbrOMsdlBUYmRFn8ZyeBETyZGBmRHEtzejI7190W5+lRyhjjEEg26EVZBOTYT3uj
	 cfkvAiBC/wNN5UYp93M/M235afMBf0wfUjCeJjiRVn4GfSQlh64wmUFiOBHnSKFdCK
	 D7K8gFt1r+oCUfZpduh67qSBWlOGNcA0FLpiMPx1z33E9Uzd9r1AgFPeHlwH5zxIEJ
	 GEUWJlNcJAqRcNQSwVCfJIwJnoDifCaeDJg9Wqpdduu2DEW48CX0BwHFjhGY/OGlY2
	 vCckL/BP75Qyw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4A4EB406B9;
	Sat, 14 Mar 2026 14:11:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 4FEBD201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 41D81407CA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BelFOcp20JKa for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:11:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org BB886406A8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BB886406A8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id BB886406A8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:11:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9BFD5A4C1453;
 Sat, 14 Mar 2026 15:06:50 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-3MP5;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:12 +0100
Message-ID: <20260314140633.2967249-76-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497210;
 bh=q2FlO5VJlzhy4gpRRriD2eLP8ZuV+nA3GYzCzW5l5Ak=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DMHs0qmCyYD+f/hYDretJkMZkBfYWA3ddyVMr+6VYzfxNEWAmp5poi0liyWud1dcs
 m9zvHyTNe/0OXhvC2mlFbqLQ0bSzo6ba2KhKm3w6RLqVnv/18PuqLkoABkbw+JMHIA
 aemwFqbHHOXPGR/Jmb8bkTlkjs32KyKB+zOTw2/VacxhYvsrSN5k9hjSEfwRnzJqhh
 ldt9Lt03DzoDzjIKxjTxoUsNzj24UDzDtuas/DktzOxZGs+33t+ZfRZjFwKumWEw6H
 MEm47Z+kex7+h149pqC7aQ9wHbXVL0Op/vIoMHAHuI+AYHaG78QY0HtG5WoTJbFtkU
 t1p5XcswsiWuA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DMHs0qmC
Subject: [Buildroot] [PATCH 76/96] package/python-tornado: security bump
 version to 6.5.5
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/tornadoweb/tornado/blob/v6.5.5/docs/releases/v6.5.5.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tornado/python-tornado.hash | 4 ++--
 package/python-tornado/python-tornado.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tornado/python-tornado.hash b/package/python-tornado/python-tornado.hash
index 53972feb09..1eebd20284 100644
--- a/package/python-tornado/python-tornado.hash
+++ b/package/python-tornado/python-tornado.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tornado/json
-md5  bf697c5e3cfb0a572192abf062e83e32  tornado-6.5.4.tar.gz
-sha256  a22fa9047405d03260b483980635f0b041989d8bcc9a313f8fe18b411d84b1d7  tornado-6.5.4.tar.gz
+md5  765aacc9cb8931aa66c8f3a83050120c  tornado-6.5.5.tar.gz
+sha256  192b8f3ea91bd7f1f50c06955416ed76c6b72f96779b962f07f911b91e8d30e9  tornado-6.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-tornado/python-tornado.mk b/package/python-tornado/python-tornado.mk
index ab2dd3a334..7b1759bbb6 100644
--- a/package/python-tornado/python-tornado.mk
+++ b/package/python-tornado/python-tornado.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORNADO_VERSION = 6.5.4
+PYTHON_TORNADO_VERSION = 6.5.5
 PYTHON_TORNADO_SOURCE = tornado-$(PYTHON_TORNADO_VERSION).tar.gz
-PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/37/1d/0a336abf618272d53f62ebe274f712e213f5a03c0b2339575430b8362ef2
+PYTHON_TORNADO_SITE = https://files.pythonhosted.org/packages/f8/f1/3173dfa4a18db4a9b03e5d55325559dab51ee653763bb8745a75af491286
 PYTHON_TORNADO_LICENSE = Apache-2.0
 PYTHON_TORNADO_LICENSE_FILES = LICENSE
 PYTHON_TORNADO_CPE_ID_VENDOR = tornadoweb
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
