Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 21E14CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:43:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id EAE2B6F7A8;
	Fri,  1 May 2026 12:43:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4sFk4cx2rKQ; Fri,  1 May 2026 12:43:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 5037B6F76B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639419;
	bh=ASw5/rvGmoNaOe0TXdx0Qh3BJxruVYjU9H2cdHx5deg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=cwkkziK9O8D+dFdYy6DZ0IhaGXMCrnt3+lycP6naptqIu17AH9pPdvQzIf354E1t4
	 bCYpxyhBN93RE1hJJIgfiq4s5EuFkshmEE6TKZFpC+nzzyukJ0Mipj+yVQ2hUxIlcp
	 72CCjlOU5BrBcJrHWk2Py343/rmbh7noblZfg2he0zdS5CV2cAO8JU2usgAMq8Z/V6
	 5YSH9qnD0o6LRQeWGca5JdE5BmQ6lz9+XORZkm93qxRfLmsE65ea1rBQ/J9CQBSPEM
	 GI8xTQNiJZW+KH5IfuEwotd2sFpCtvM/2ekcI49qpkCoAYCIBhxnwaShv6mdoUeY3W
	 ufelFqXANBHHw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5037B6F76B;
	Fri,  1 May 2026 12:43:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id DE66A127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C4DCE4272B
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id o8qi2La0ZP31 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:43:37 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B7BAE4299D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B7BAE4299D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B7BAE4299D
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF84EA4C3050;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-15Dx;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:49 +0200
Message-ID: <20260501123100.1918951-64-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=wmh3gtCx6zV909bZb3J+dQAP1cCH6qQDAkaMvd0JZ7A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=cwUUFIewRf9WEv33vakRKRw8QvWK4p3LDDh4Vv4yb0ZUsJVoGHvOxWfynaLxjpdSF
 KrfereHSUv5ov+5t/YJQWNnDktQx/z8AndINpEgJcirC+dqmQZzP97bCtd6UD/Bo8G
 WBztOUh72/8Xqy7yKgo2pLm2hvr6PjKX2DndBHi+9JJMfScUkWkunPUqIQ9Rvgt4Zp
 EdK+e/WipAeK3okV6wlA9MrZrRtCpjJIceibbBEtpf4sGkTJgkoNnFHDdDCWeLW97U
 Qwp6KjC6Avq2QAuWufEzwJVJ+yykYK2ufsHd6w4LFhPIvAR8YCUKhl3xHzdMeXh9mc
 D/sapxo+kiiPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=cwUUFIew
Subject: [Buildroot] [PATCH 64/75] package/python-tortoise-orm: bump version
 to 1.1.7
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

https://github.com/tortoise/tortoise-orm/blob/1.1.7/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-tortoise-orm/python-tortoise-orm.hash | 4 ++--
 package/python-tortoise-orm/python-tortoise-orm.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-tortoise-orm/python-tortoise-orm.hash b/package/python-tortoise-orm/python-tortoise-orm.hash
index 77144495f8..ca76cc9219 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.hash
+++ b/package/python-tortoise-orm/python-tortoise-orm.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/tortoise-orm/json
-md5  c3278bf834e12f7bcfef071ba52c0dbd  tortoise_orm-1.1.6.tar.gz
-sha256  30095a77aa7c3eb3ede1baf4b390a66b994dc7c4d0d06a609d23a16c50e55d0c  tortoise_orm-1.1.6.tar.gz
+md5  0c980e5e003b197f22c271da5fd72875  tortoise_orm-1.1.7.tar.gz
+sha256  a0f0f27f9c92547739f0a3f0862c257ab64d8baadbc0e548cbcfa2d70bcbe275  tortoise_orm-1.1.7.tar.gz
 # Locally computed sha256 checksums
 sha256  f955d347b975d5867ee364f978476b3012878a706d468571b9758cac74de6041  LICENSE.txt
diff --git a/package/python-tortoise-orm/python-tortoise-orm.mk b/package/python-tortoise-orm/python-tortoise-orm.mk
index e0190eb9ff..48a7e84e6d 100644
--- a/package/python-tortoise-orm/python-tortoise-orm.mk
+++ b/package/python-tortoise-orm/python-tortoise-orm.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TORTOISE_ORM_VERSION = 1.1.6
+PYTHON_TORTOISE_ORM_VERSION = 1.1.7
 PYTHON_TORTOISE_ORM_SOURCE = tortoise_orm-$(PYTHON_TORTOISE_ORM_VERSION).tar.gz
-PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/40/76/629a5d69c170605dbdc10f3f3416d124fae05836860686ccd9e06726810c
+PYTHON_TORTOISE_ORM_SITE = https://files.pythonhosted.org/packages/1d/55/e75d3ae0dd2c96cf961bf068f465fb62ec481d802beb65f406620bfd40a0
 PYTHON_TORTOISE_ORM_SETUP_TYPE = pep517
 PYTHON_TORTOISE_ORM_LICENSE = Apache-2.0
 PYTHON_TORTOISE_ORM_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
