Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0CEDDD5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:15:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D3A8B40792;
	Mon, 15 Dec 2025 19:15:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ELVm6EZXikzJ; Mon, 15 Dec 2025 19:15:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 07EF840A24
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826127;
	bh=dFdRfLoZYjbQKLigHcJJ/4VOkmx3Pr3RwCmd3RUXXFs=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=CnGsLPQK+tMZxYx9uV1Avh4KjPX7IdaoMPJFSpHxBPOenc/oPAq2WEhn9YWnaaPqa
	 tA3LYnhhJ+qHpV8nVdaMHmmI+Dzh6DF5XgJ/CNjReJC++oqttH3HAkTFXK74WrbiM0
	 AEoVaqXjFDw0+pI6tZpqpUfhF8nQu9hSwYzyA1QCi/AsNjS7osJP9aaNzWTe2ibBDa
	 jfhYEshtuMJu4K6gfZO8UbexaNJxB25IXWSxCC5aUdzjL560lZu7OKcrg2dtGVrdfJ
	 lpE5AxtBbqQFzzC8/k3/NQkFh5fUw/Fhb3kDCK2r++ROePcw3/JkI5PtIR1VyYZT1b
	 4bfT4ykbknz5g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 07EF840A24;
	Mon, 15 Dec 2025 19:15:27 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id C3EB9151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B5EC4407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Fcvo48F-Nhvb for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:15:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 9FB374046A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9FB374046A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 9FB374046A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:15:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 90530A4C427E;
 Mon, 15 Dec 2025 20:14:26 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-3G8y;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:56 +0100
Message-ID: <20251215191416.421755-7-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826066;
 bh=68UhuvMlQFpapyj1MSy2JyiCpfGKmzGZhJ7yFmnLCGo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=UJxiLoDOC5G5RbZmDYzo58uCoC/pjF6NOj09kv+NS25riBI0Qt9bxxCc9GIWORXz9
 dU8y5PO9lGvdIIfuk/AfkBzK1bvQFiSEC+5cTkS3GG2a9YS4TlcSnyPG5pDB42ZM02
 QNS60NOUjNeSDZIOD2hO8Ut9OE66GGiYXvy4Zkc11vGH4yU8k3e9b5K6ei2/pBhblq
 n2jdBCmVIsQSyMUBzMEyyBPfG/NU3lHJDRIBRt7sE01VX2GsIYjeKwpsAA7g2oTtAX
 qlTehDA4XWyY0YdamMKdeeTmpG6btrOiH2MzDGddzwg8uickx9f5JEmH6JCCFxbNpr
 o1E3L3FU1wcEg==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=UJxiLoDO
Subject: [Buildroot] [PATCH 07/27] package/python-pydal: bump version to
 20251207.1
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pydal/python-pydal.hash | 4 ++--
 package/python-pydal/python-pydal.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pydal/python-pydal.hash b/package/python-pydal/python-pydal.hash
index d5934d2099..9e9828aa9d 100644
--- a/package/python-pydal/python-pydal.hash
+++ b/package/python-pydal/python-pydal.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pydal/json
-md5  f596df168df88de7599b5b6721d2e1e9  pydal-20250922.1.tar.gz
-sha256  b88a0fad430ff62f840d32576e819d692541bd9edaaa05578b134bb2cd251727  pydal-20250922.1.tar.gz
+md5  21dcb22b0ec8f15e607bd5c6137fb1ff  pydal-20251207.1.tar.gz
+sha256  571966ef15b1ae826e0338e3a24ab95bca5029755723ab1a79eb64337082e18b  pydal-20251207.1.tar.gz
 # Locally computed sha256 checksums
 sha256  1f711e93f1e0c2eec576e2e60597dc2ed6f0a661e4749c6b8a39f0d4a72be468  LICENSE.txt
diff --git a/package/python-pydal/python-pydal.mk b/package/python-pydal/python-pydal.mk
index 006f4ed346..86a7df6783 100644
--- a/package/python-pydal/python-pydal.mk
+++ b/package/python-pydal/python-pydal.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYDAL_VERSION = 20250922.1
+PYTHON_PYDAL_VERSION = 20251207.1
 PYTHON_PYDAL_SOURCE = pydal-$(PYTHON_PYDAL_VERSION).tar.gz
-PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/f9/94/bf35afe3eaf94e2c411be204b8421b3abb34a24a260513fd9bc0e45c05e4
+PYTHON_PYDAL_SITE = https://files.pythonhosted.org/packages/53/8f/f22822372765bf06a8b2aa9b0246a2f3b6abe21742b3608aa71939900cfe
 PYTHON_PYDAL_LICENSE = BSD-3-Clause
 PYTHON_PYDAL_LICENSE_FILES = LICENSE.txt
 PYTHON_PYDAL_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
