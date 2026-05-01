Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6FFBECD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:38:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 326D94242A;
	Fri,  1 May 2026 12:38:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id i6DSik4mdtWK; Fri,  1 May 2026 12:38:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4DC7C4264C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639117;
	bh=mbxW0AgLBcVlffHfFL3xKwViI+6aNlXNtbrHYM03MlU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AGAJUf+quDAQkUZZCpvCwXBoa6V+SAYCidH3RFb3+CK+5CAXpDQ7h45llTORam/sy
	 MsryFkDwK9VnJtC0t91Q2qY55ajFWY5a0vpEA5VBSSkT8pqwPndkXRN7OtgAoBSXRA
	 weQKkSzL70+a0TUXx736QgMMmlgvyDc6lCFTlEPoEQRWl+O/AEyErnuYFGse5JUnPy
	 bA+S/gqJEz5yBVFpVYEG7pvUJeBB1NvuVjtXkCFIybjk/uYAulH7uncVSgO0AZp82H
	 o2RYmZLmZyrbc5+8THOgsIuSV1s7p4/jU934qdzqUZAzcX/BsN3iqQzYS9+3QgtJJj
	 0iFxQKgayNN0g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4DC7C4264C;
	Fri,  1 May 2026 12:38:37 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id EA826127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id D0B60413B4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8iqy9bjEKGMW for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:38:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B9B7142668
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B9B7142668
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B9B7142668
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:38:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 31C8FA4C2EDE;
 Fri,  1 May 2026 14:31:07 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1M-000000008NC-0KuE;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:24 +0200
Message-ID: <20260501123100.1918951-39-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638667;
 bh=PUbrCmmmhytgVjnHYWsIauQGYLNN6NyWldstyTDrlhc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=A0WUJjmXnMvEfEdy4o0ap/sB6JqqUzulb1jKsg82bpn7oHVru+vAnNM6tg2WQ4A3G
 SXI2g963YepO7u9JR9k3trCTx/W1SsUEuRPlE/p+iBeq9n5vCy1pndb2YDzrqMrBIw
 XtXVQvc20Aw3p//NYUJ6HELL8ZXklOAdv+7uam0ukk64BsbAdbNtjF2ddgT/953B7G
 4YmyaIMYu/9AOml9prX6cp5uodF/koClUlbydDRKFglcMWc9p3ji9ZalI2o1A5zLCv
 oc+FcqKTjnVCBw5UtXdl+L8ScoTTcuznZH3u0rw4qEWkiaubSOywFu2nghlg7Jpqgo
 tVrvpgzDakBdA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=A0WUJjmX
Subject: [Buildroot] [PATCH 39/75] package/python-poetry-core: bump version
 to 2.3.2
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

https://github.com/python-poetry/poetry-core/blob/2.3.2/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-poetry-core/python-poetry-core.hash | 4 ++--
 package/python-poetry-core/python-poetry-core.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-poetry-core/python-poetry-core.hash b/package/python-poetry-core/python-poetry-core.hash
index 915a8900ce..9ea47dea69 100644
--- a/package/python-poetry-core/python-poetry-core.hash
+++ b/package/python-poetry-core/python-poetry-core.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/poetry-core/json
-md5  c2595d34582ba92b5c90df411f3ecddb  poetry_core-2.3.1.tar.gz
-sha256  96f791d5d7d4e040f3983d76779425cf9532690e2756a24fd5ca0f86af19ef82  poetry_core-2.3.1.tar.gz
+md5  75622eedc30fc131eb3947630aa622e6  poetry_core-2.3.2.tar.gz
+sha256  20cb71be27b774628da9f384effd9183dfceb53bcef84063248a8672aa47031f  poetry_core-2.3.2.tar.gz
 # Locally computed sha256 checksums
 sha256  f1978133782b90f4733bc308ddb19267c3fe04797c88d9ed3bc219032495a982  LICENSE
diff --git a/package/python-poetry-core/python-poetry-core.mk b/package/python-poetry-core/python-poetry-core.mk
index 0354c44822..a8db44e24d 100644
--- a/package/python-poetry-core/python-poetry-core.mk
+++ b/package/python-poetry-core/python-poetry-core.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_POETRY_CORE_VERSION = 2.3.1
+PYTHON_POETRY_CORE_VERSION = 2.3.2
 PYTHON_POETRY_CORE_SOURCE = poetry_core-$(PYTHON_POETRY_CORE_VERSION).tar.gz
-PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/39/46/7cc89b6ef47803528673585bfa40fa729a7050d9eaedeb7e7f5816300c88
+PYTHON_POETRY_CORE_SITE = https://files.pythonhosted.org/packages/10/48/5b4f344c252ee2f75051b6bf7dfb68ab53aa00a107f5f8e5cbf795701dad
 PYTHON_POETRY_CORE_SETUP_TYPE = pep517
 PYTHON_POETRY_CORE_LICENSE = MIT
 PYTHON_POETRY_CORE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
