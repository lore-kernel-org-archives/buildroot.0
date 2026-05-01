Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34D6BCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:40:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0D9FA42229;
	Fri,  1 May 2026 12:40:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xcK97jEZGsir; Fri,  1 May 2026 12:40:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 24E1642233
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639237;
	bh=JP2hxuQWiBiqr/Bay5fgxEi5agRxRwJOhlm0Dgtk088=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=bJ9LF+t+mp1EShtXwJGRNsl6DRJiupzgU8SfLQG0jv/avEU8+HZnTA2MUPahgB0E4
	 3/0sN3DasgIzO+aUHw/49hSdLRlP8pPmVTzEc7v/zhFTCQITM9f7kbvgHYYFCK6EJa
	 JvChgIv7DfvUKT+jGn/ceJKUqyoQ8ege2/jC8uswDM2Por99Wp+jGp4hnEklyiWUf8
	 1eHXcSKgLNxrqQ3itKCP/kpf0ozbn36oiZyMInzjr8WdFWiHHt0wZD+6MsgENPW/GM
	 /By6A9Kxhd9HImYztGtQXT1GyOGAtkMqw24MlqwyQofiwrRcWo1xxJTsxxnErnOZOK
	 zCuHA7KV+7W9A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 24E1642233;
	Fri,  1 May 2026 12:40:37 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0ABB2127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id F0DB6403DA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k4bAet1bN5SR for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:40:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org DF2D6401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org DF2D6401CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id DF2D6401CA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 74EB3A4C2EEE;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1M-000000008NC-3dSM;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:33 +0200
Message-ID: <20260501123100.1918951-48-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=MvTFDzG76G1FeSL2N+rbDdbMaWlczcF96LkCKynrbjY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Jk/4wgXm2nHLjGfaUWRfbKE2jIHe+RMixUGkxho1rR0IZXfX6ulfoN6UyoxDM0cLb
 OJFXRSJxXnbbR8CL3li38U2/Ewi3Rv/Fnf/w0iPMaoYepcPCrlTvBpv0ZXlXvuaZ+h
 4VDLO7oMCtPjUlbx4HhPrYPaKl6m0nsWjINjlZVjtur6NAvYbb10fsFXGMM9bRX0dT
 Qm/rEQFfJoqJj9pw6rt6wrv3ieoXaTqq5s6WF8o3knVz+G25oQ0RSzghDMQ6O2mPrM
 Awzp9/fUOeyIYkLabr/0571JeQXpFyLORNLZpkcqtqjX1FXXbDohU0P4ZImKp3r8Wm
 8VgV14RAjWQaQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Jk/4wgXm
Subject: [Buildroot] [PATCH 48/75] package/python-redis: bump version to
 7.4.0
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

https://github.com/redis/redis-py/releases/tag/v7.4.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-redis/python-redis.hash | 4 ++--
 package/python-redis/python-redis.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-redis/python-redis.hash b/package/python-redis/python-redis.hash
index ac284e56f0..583cb74bfd 100644
--- a/package/python-redis/python-redis.hash
+++ b/package/python-redis/python-redis.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/redis/json
-md5  fbec5721d85318b31ba62d11e4b08022  redis-7.3.0.tar.gz
-sha256  4d1b768aafcf41b01022410b3cc4f15a07d9b3d6fe0c66fc967da2c88e551034  redis-7.3.0.tar.gz
+md5  f7c1c7b3f4d163d2d424150d0498a35b  redis-7.4.0.tar.gz
+sha256  64a6ea7bf567ad43c964d2c30d82853f8df927c5c9017766c55a1d1ed95d18ad  redis-7.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  a57b250a5bf03d7afe55b74063313f2adb7b00d546c0ab149a89398333fe3cc8  LICENSE
diff --git a/package/python-redis/python-redis.mk b/package/python-redis/python-redis.mk
index ca2e165948..21dd6f1994 100644
--- a/package/python-redis/python-redis.mk
+++ b/package/python-redis/python-redis.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REDIS_VERSION = 7.3.0
+PYTHON_REDIS_VERSION = 7.4.0
 PYTHON_REDIS_SOURCE = redis-$(PYTHON_REDIS_VERSION).tar.gz
-PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/da/82/4d1a5279f6c1251d3d2a603a798a1137c657de9b12cfc1fba4858232c4d2
+PYTHON_REDIS_SITE = https://files.pythonhosted.org/packages/7b/7f/3759b1d0d72b7c92f0d70ffd9dc962b7b7b5ee74e135f9d7d8ab06b8a318
 PYTHON_REDIS_SETUP_TYPE = hatch
 PYTHON_REDIS_LICENSE = MIT
 PYTHON_REDIS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
