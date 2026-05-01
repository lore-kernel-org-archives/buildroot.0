Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35921CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:42:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 10C07428B5;
	Fri,  1 May 2026 12:42:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VC5f2YLL4Zth; Fri,  1 May 2026 12:42:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 43D1642782
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639360;
	bh=+lRJ60qRq1irVtT6yrEyyDqdjvnS472RkN+K7Ld++Bw=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CC5WfY17Uki21lyzRnH/B//TNmz8J5ZlFY0GOvHoXp7PDFnYbBxTQ4+OvOZ8MibIx
	 CkArhBH7R/pHMKxKFgIkmQ1gOkg0uljLjLOvH3jtZc9Ihae/z8hONTr6Gy4eCVSbZb
	 YPMoNwS0xVEgsH5U8JvmVbGf4FDZb0wOh2PjeYouilXKFRzTgGFVRYn8HdQAOhWhpO
	 zmEMd06EQdKdC+meg091FbqkLKucLJTBRWYCyvt0dznQ9ywwH9WWKp/Fq4qmqXoBcr
	 w9y+VM/dPuPsWobEcE7wjc5KFYqVvy5MrCEOhLX3TAD/Vs1CB3EnkqzpdMyrt+/1J2
	 LLDi2xfMk6d+w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 43D1642782;
	Fri,  1 May 2026 12:42:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 54FD2127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4F467426ED
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ArBN969lk-Ql for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:42:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 44CB9426AB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 44CB9426AB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 44CB9426AB
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:36 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A162A4C2F1F;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-3A6Y;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:43 +0200
Message-ID: <20260501123100.1918951-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=LP39xWY83B0H7Hsowb+a57Z9QDK0fu5Btx7d6Ygdz00=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pHYO4xT6Oyl7neJvRg2yGbqJuK5SFv31B/YW4T7XmVBpNDUHLQRVigiYme4vXWk2S
 IIE2Ns7EgIu6sclY6OXRdxC/Az1bSoEpnk9I43qwrrJ36J4tt/R3vp0alUuMGAlvSr
 1wGOID74D9AG8p01ggKZRP1ED+hvIf7/kPYeCIydIN/TlC/6kOYbOmtB1B7cgXCdFl
 pf9uWuIkkNlDvG+VST8ey4m1nqJv9kqUBceEeZSQHsBz7m8kisKdDde6dl3Pig/jsU
 YqAj14HgfpM3oj+Ei9UDH4wS+WnYvOJjvtFdnVzPIyX5YvrpTPU2+aWR0tSwFbn6a/
 bNB4GzeY5ZHug==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pHYO4xT6
Subject: [Buildroot] [PATCH 58/75] package/python-smbus2: bump to version
 0.6.1
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

https://github.com/kplindegaard/smbus2/releases/tag/0.6.1

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-smbus2/python-smbus2.hash | 4 ++--
 package/python-smbus2/python-smbus2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-smbus2/python-smbus2.hash b/package/python-smbus2/python-smbus2.hash
index b0c9802204..223797c573 100644
--- a/package/python-smbus2/python-smbus2.hash
+++ b/package/python-smbus2/python-smbus2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/smbus2/json
-md5  d832ad65cbf7f58685c0e5647ecc6494  smbus2-0.6.0.tar.gz
-sha256  9b5ff1e998e114730f9dfe0c4babbef06c92468cfb61eaa684e30f225661b95b  smbus2-0.6.0.tar.gz
+md5  c401511f61d5296d4750ef7af4c121f2  smbus2-0.6.1.tar.gz
+sha256  2b043372abf8f6029a632c3aab36b641c5d5872b1cbad599fc68e17ac4fd90a5  smbus2-0.6.1.tar.gz
 # Locally computed sha256 checksums
 sha256  6ee9cf18c3a75dd76fb549a4b607ae34eedc31a796c48157895e2ad28d66ce79  LICENSE
diff --git a/package/python-smbus2/python-smbus2.mk b/package/python-smbus2/python-smbus2.mk
index fb1d4fc02c..9676670360 100644
--- a/package/python-smbus2/python-smbus2.mk
+++ b/package/python-smbus2/python-smbus2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SMBUS2_VERSION = 0.6.0
+PYTHON_SMBUS2_VERSION = 0.6.1
 PYTHON_SMBUS2_SOURCE = smbus2-$(PYTHON_SMBUS2_VERSION).tar.gz
-PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/4e/36/afafd43770caae69f04e21402552a8f94a072def46a002fab9357f4852ce
+PYTHON_SMBUS2_SITE = https://files.pythonhosted.org/packages/87/37/b3f7b501502c4915ba3819d1dc277bf3f5fae4a9d067caa4f502aaddd889
 PYTHON_SMBUS2_SETUP_TYPE = setuptools
 PYTHON_SMBUS2_LICENSE = MIT
 PYTHON_SMBUS2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
