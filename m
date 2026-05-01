Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AF19CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:40:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E79A76117C;
	Fri,  1 May 2026 12:40:14 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0OL1BgSWl9Ji; Fri,  1 May 2026 12:40:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 09985611F7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639214;
	bh=oUNDwJonteSC5QxxLt0BEjTZQUYqTISb2CqoorzkKi4=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HY7zj0la+WxnKXexi44U+4xsiwDYwN9nNnaAW/UAMHj15S2/4eOnc0K5jG6Y1gT/g
	 BTULjOcn3GMHYSRzCuhEag+5AXTjjPQTxCKNlhv5qoLdS5zwomQx91af+ohZvqBRie
	 D3cWx7mLgmvRT2fQ/y4qAqeQPfR1zyC/r7wUmjtqqteBx1gAipxoHznP38vY3YJoZ5
	 M/3qs8C4GIV8Q6XAbdp8WKiu3oydD+3TdDl7K2TgvoSXJreXR0b0Kue6SqPKayA4Sh
	 Ego4I/MeYfiP46l2qe6jTYFL5mUF+ajD5ZRm0ZIDUjfLySX1QhnQ80IrkFPwHspF5M
	 djWoyiH2VO0dA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 09985611F7;
	Fri,  1 May 2026 12:40:14 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id AB0D5293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 91A8041550
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KH9uJWJMgcRW for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:40:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 80DF241465
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 80DF241465
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 80DF241465
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 395F6A4C2EEC;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1M-000000008NC-3Gxj;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:32 +0200
Message-ID: <20260501123100.1918951-47-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=7nfjtvoakmZZsnRvbJrLrh6zGDbHkK4eHTKu6Yk57l0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Gbp5BVlCvI6KCc3N0DmL0frXpQuANfOIyRNW0Axtl8IYMd9aw1SzkvvL1VN5Z4c8B
 n4m6yj/z3TI+XbhRQnUcnAMyR/NITJ0uqaY/utRLC//prgZfEhfga4gHbJpFsSZCbd
 29Px7NETNiDNrWbEIcOnFvIhKY1cOJ3CoIC5VrBCmIQperpFK/oU8YDRqgMHvHeN/t
 GQu/PXDwvKjRgWpw+N3KB2MNSVCU1RnJ/UaIQ748GDx9BYF4xasAWCVj9V0QW4EpeZ
 r9fvUtuY6em5RB7foayqp+TtP2MkbQNV9nJ2+mqWB8M92a/QnsqMDzmnAqD/7CNzIa
 lEC9PbCgpaYvw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Gbp5BVlC
Subject: [Buildroot] [PATCH 47/75] package/python-pytest: security bump
 version to 9.0.3
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

https://github.com/pytest-dev/pytest/blob/9.0.3/doc/en/changelog.rst

Fixes CVE-2025-71176.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pytest/python-pytest.hash | 4 ++--
 package/python-pytest/python-pytest.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pytest/python-pytest.hash b/package/python-pytest/python-pytest.hash
index 09644dbdba..cdfab80acc 100644
--- a/package/python-pytest/python-pytest.hash
+++ b/package/python-pytest/python-pytest.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pytest/json
-md5  ce26088b3b97ab8fed58c8883de23241  pytest-9.0.2.tar.gz
-sha256  75186651a92bd89611d1d9fc20f0b4345fd827c41ccd5c299a868a05d70edf11  pytest-9.0.2.tar.gz
+md5  0cd1c357553d2e3eb850d71843b375d1  pytest-9.0.3.tar.gz
+sha256  b86ada508af81d19edeb213c681b1d48246c1a91d304c6c81a427674c17eb91c  pytest-9.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  ca836a5f9ecca3b2f350230faa20a48fb8b145653b5568d784862df864706b9b  LICENSE
diff --git a/package/python-pytest/python-pytest.mk b/package/python-pytest/python-pytest.mk
index 427936c69e..e949eff8a4 100644
--- a/package/python-pytest/python-pytest.mk
+++ b/package/python-pytest/python-pytest.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTEST_VERSION = 9.0.2
+PYTHON_PYTEST_VERSION = 9.0.3
 PYTHON_PYTEST_SOURCE = pytest-$(PYTHON_PYTEST_VERSION).tar.gz
-PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/d1/db/7ef3487e0fb0049ddb5ce41d3a49c235bf9ad299b6a25d5780a89f19230f
+PYTHON_PYTEST_SITE = https://files.pythonhosted.org/packages/7d/0d/549bd94f1a0a402dc8cf64563a117c0f3765662e2e668477624baeec44d5
 PYTHON_PYTEST_SETUP_TYPE = setuptools
 PYTHON_PYTEST_LICENSE = MIT
 PYTHON_PYTEST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
