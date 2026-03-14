Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A5A510706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:09:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3CA8B4101E;
	Sat, 14 Mar 2026 14:09:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pZoIWgDtmfDC; Sat, 14 Mar 2026 14:09:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 62F22410B5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497353;
	bh=fL+64KpuiU8mUC5F9+4S7051fUqK4OQJXP5YkqNz9nI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DTr1GzT+bzC3MO7FXD5lZUa8CkCeDRmgjScscOlXhB4ZaJcFCo1MyHCzuD/Z5HAJT
	 BxM7shJzJAC2FUFg4HffSjrkpLzwp+e86danL0Zp9N2kvIqsWL129e8s06Dt4pIVcm
	 mVa5a3UsfbemkgwEi81z1oltSpdyNneNKlUEZ8+1dkGOne+B9GWuqwuJpfACjlxdOI
	 kcjmYGISFooiMtsCsk35go76mUgx/YqhcFHSWx3DqqHdat3ZKiiA4KN3GA/FUe9SL8
	 B+seyPKs4cZaj15zbdaCqZyhwCXOTBdw5GnrOgLv6hgs+5isLjtHE/3UZ33sSoB/ra
	 AT8CYwkWXe02A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 62F22410B5;
	Sat, 14 Mar 2026 14:09:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E632F3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CC2348225A
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:11 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EZeDeSFbBhuS for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:09:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BABA882258
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BABA882258
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BABA882258
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:09:10 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 85B31A4C141E;
 Sat, 14 Mar 2026 15:06:46 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-2X2y;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:59 +0100
Message-ID: <20260314140633.2967249-63-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497206;
 bh=JGqN5FbrsJ7n7eVM6rvJu761U4JCRf+WxGJtWnSIkWA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iUwB8tsI3B44cof1VsnxwqNxNbqIahrvG8wKPuuTgrp7n4Z4Z5Pta48F6DcN/tlFk
 wAooqQB49gaqpy2H033VBfI03g5XWlYXoR1+53XrVP+xbEvI+jVX/hIYeQyQoQr5On
 mmcW3mRtj9oT1tqKTO1mBUWYEuhKC3nXOs57FVDTlEg2Ep0KwSxDNU9G7xquwDQ+em
 FbKpsGgBVP9KdsePtngpqJyNDvuE+sAQkGmcQtD2vRphipQajcjY/myGjtUDDFQFvr
 9jZZZfMp10Y1s2jY7SRIkrF539gj09nF9LTwKj0vPH8MTi6tgRcUkS/U7cWrmQc4/3
 e80sbjJCxfVvA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iUwB8tsI
Subject: [Buildroot] [PATCH 63/96] package/python-redis: bump version to
 7.3.0
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

https://github.com/redis/redis-py/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index 007c1d79a8..ac284e56f0 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  cd185322335c0842a457bde1daf87fd0  redis-7.1.0.tar.gz
-sha256  b1cc3cfa5a2cb9c2ab3ba700864fb0ad75617b41f01352ce5779dabf6d5f9c3c  redis-7.1.0.tar.gz
+md5  fbec5721d85318b31ba62d11e4b08022  redis-7.3.0.tar.gz
+sha256  4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034  redis-7.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index a8d58c94c5..ca2e165948 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 7.1.0
+PYTHON_REDIS_VERSION = 7.3.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/43/c8/983d5c6579a411d8a99bc5823cc5712768859b5ce2c8afe1a65b37832c81
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/da/82/4d1a5279f6c1251d3d2a603a798a1137c657de9b12cfc1fba4858232c4d2
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
