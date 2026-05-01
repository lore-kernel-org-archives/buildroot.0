Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5070BCD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:40:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B92C42737;
	Fri,  1 May 2026 12:40:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id kBEYiywls1yO; Fri,  1 May 2026 12:40:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 58BDE42723
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639250;
	bh=OWpnF3Aje93gXJ+QP6vbjUTWjWQAKDmbaRNgg8+vCiY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=b6y8xGMy4zuOFhbsTPjHXP6oxSCzuCH/1+4xmPCGg5wkARCJ8GHDfyhitUWK+LXB6
	 nf9K6p5aD0jVcgYdXqSdNlhGKckA5zYkQ1WZaFFoXjgzMa7PWr479UurwFQ1bDfKrF
	 2fqqYyhXCD0NR+Lpfcb5FMbscDubkpWuh9bnYYANkIWZMmdJBeMgqFIuSKzRJWUqOb
	 QzG7HQYxwEg9RjNceX1iEVDHIrEL1gbyELTwldeEsEnd2uZvYCF4IBOr/vg2rLY5Oh
	 123ozZ8bEP1+Fz6ikgyyZ7CfOldf8MuUH70TxwoypeUpqqrfY1fngE406Nx+LQpVwA
	 lgw4ozHyHgZqg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 58BDE42723;
	Fri,  1 May 2026 12:40:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 54FE7293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3B15784D95
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X4OjHFF_kUON for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:40:47 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 3434884D76
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 3434884D76
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 3434884D76
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:47 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9198AA4C2EFB;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1K-000000008NC-1Ozo;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:04 +0200
Message-ID: <20260501123100.1918951-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++++++++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=tEExRxTSbYfFoLsF/MD4J2mCXf+XHAIKUGk0BjD8U0w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ROJ0pUaP0WhJVQSxcV+sfaOaqwiJo5T3XR4hT9ZwGjwsUlpmsj0XY7ymHPnCqiVNw
 WSxVdqwej8enI7CVe7muHQSSkImQbI/yZmx6OqwgLBqt0I0+pjEN2UJ1rgfvZQwogU
 b5X0azy9VLpNX2JOK+M0F/lyRnxmbPh7wRlxxexX8zVns33dIHeBQ5LRAzPy2Z1d6G
 KV/eVZQ9n40PteGQm9vIfcNKelDLkTYe2D9j0nMNNyYjrf8nO6nPIyGA9bukA78A9T
 Rcbfu0E4iYvzcvrdsIWZFRw9X9553dSHU/5mlkwqK4iELp5M5BSQO+zHB4gwUbGceT
 S5niCdIsc+lug==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ROJ0pUaP
Subject: [Buildroot] [PATCH 19/75] package/python-flask-wtf: bump version to
 1.3.0
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

https://github.com/pallets-eco/flask-wtf/releases/tag/v1.3.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-flask-wtf/python-flask-wtf.hash | 4 ++--
 package/python-flask-wtf/python-flask-wtf.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-flask-wtf/python-flask-wtf.hash b/package/python-flask-wtf/python-flask-wtf.hash
index 082db8a7d8..329d25104d 100644
--- a/package/python-flask-wtf/python-flask-wtf.hash
+++ b/package/python-flask-wtf/python-flask-wtf.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/flask-wtf/json
-md5  4582b41cf00556f226e0256404310cfa  flask_wtf-1.2.2.tar.gz
-sha256  79d2ee1e436cf570bccb7d916533fa18757a2f18c290accffab1b9a0b684666b  flask_wtf-1.2.2.tar.gz
+md5  cf980f2b80f63c09ba6fcfac24d14099  flask_wtf-1.3.0.tar.gz
+sha256  61d5dabc50c3df885c297dcbd80810443a5d632106c8a69cab8ce740f0cdd7cc  flask_wtf-1.3.0.tar.gz
 # Locally computed sha256 checksums
 sha256  d5f19036451578cb36eeef04c99ebf7d7ca2e70dcf043636519bc420e15a7c62  LICENSE.rst
diff --git a/package/python-flask-wtf/python-flask-wtf.mk b/package/python-flask-wtf/python-flask-wtf.mk
index 787029639b..5a52c9d4c9 100644
--- a/package/python-flask-wtf/python-flask-wtf.mk
+++ b/package/python-flask-wtf/python-flask-wtf.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FLASK_WTF_VERSION = 1.2.2
+PYTHON_FLASK_WTF_VERSION = 1.3.0
 PYTHON_FLASK_WTF_SOURCE = flask_wtf-$(PYTHON_FLASK_WTF_VERSION).tar.gz
-PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/80/9b/f1cd6e41bbf874f3436368f2c7ee3216c1e82d666ff90d1d800e20eb1317
+PYTHON_FLASK_WTF_SITE = https://files.pythonhosted.org/packages/91/f1/605a56d4ea217b307f3e6f4d663e0351253d85d841edc93ba559f0648e19
 PYTHON_FLASK_WTF_LICENSE = BSD-3-Clause
 PYTHON_FLASK_WTF_LICENSE_FILES = LICENSE.rst
 PYTHON_FLASK_WTF_SETUP_TYPE = hatch
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
