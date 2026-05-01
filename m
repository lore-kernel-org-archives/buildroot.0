Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3828CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:38:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A46042628;
	Fri,  1 May 2026 12:38:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 7HHlyYCLu-FH; Fri,  1 May 2026 12:38:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 23E7D42402
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639081;
	bh=NY3lgo+bbqECteBO/ic1POeoU2bDbCLFQ5w/WNO0LuU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=rN/RZtR97FsE3FYKdZu+lZ+EB+JRn14h94q3X6zliKJu34O9eSMbEBqFk6M4pOrjG
	 OaujVhFZfx8fClOtvtFUg+H85/jTjlpB/eoBwmWzqcPIbeheeZ3A+4u7PdamAorqSP
	 Y3ygPrWGAPODDWFpr1NTEUz8zFWpDH7+Fgmfg4FnLFyw6hDtUXN6YWgQnzCC5D9mE7
	 L9zKosP21+F+5Vj4PDJ5Np/j4sv/TwLfk6lzjxgoWgU4Feuki0mu/E1YxwQVquVeX8
	 /3BaYB98oL7sU65Go4t5uNvDA8GIUGlPXq/vIychdG0Y2113LyzJjfY4q+6FaE1k9J
	 D0aOyVeb2BDYg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 23E7D42402;
	Fri,  1 May 2026 12:38:01 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C1439127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id B36964261F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jq_3msSwwG32 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:37:58 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A45ED41FF4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A45ED41FF4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A45ED41FF4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF524A4C2ED7;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-3Ro5;
 Fri, 01 May 2026 12:31:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:21 +0200
Message-ID: <20260501123100.1918951-36-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=VYx6wyZ/tOAhU85jjdcCjjNKEAQn1yPaUq0Df8lLA+U=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=O3Zr0ASeFAWkffIl0dHDzmwcmXkBMYhyU3FH/9x57/f7QwbhhF9uti1HtjcHlxGFb
 IBrUqMR9+gAhAvlrBeGTCjWePXwPRfoese1It3AlbM4A+6Q9VaOqyiO72llTfLJVdo
 sMA7GoGchRRQplQIg0dHA4xBwCuueApUUXtnnT1eV46rWUYeQpeqeMDuUOUJe9DQYF
 7ezU4wvALQAGtiMsl+2SNkZwWCnAXTcZ9le8WAsvMcA3ZsS9VfdpL/UxtrpcyjVqQM
 D2bUVD3gNM0cFs0d5OyjZJF8rihYhb4BFtbdOpjRjmi2YoIgkm6AjGOuNlYJ2cHrhK
 LYVSDkYoQ5xEA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=O3Zr0ASe
Subject: [Buildroot] [PATCH 36/75] package/python-pdm-backend: bump version
 to 2.4.8
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

https://github.com/pdm-project/pdm-backend/releases/tag/2.4.8

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pdm-backend/python-pdm-backend.hash | 4 ++--
 package/python-pdm-backend/python-pdm-backend.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pdm-backend/python-pdm-backend.hash b/package/python-pdm-backend/python-pdm-backend.hash
index c856d1e818..d9e1364adb 100644
--- a/package/python-pdm-backend/python-pdm-backend.hash
+++ b/package/python-pdm-backend/python-pdm-backend.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pdm-backend/json
-md5  f51ca7c104f47dac6b31dc51255fab19  pdm_backend-2.4.7.tar.gz
-sha256  a509d083850378ce919d41e7a2faddfc57a1764d376913c66731125d6b14110f  pdm_backend-2.4.7.tar.gz
+md5  20119cc4fe88d92eef4ac48ab18ff69e  pdm_backend-2.4.8.tar.gz
+sha256  d8ef85d2c4306ee67195412d701fae9983e84ec6574598e26798ae26b7b3c7e0  pdm_backend-2.4.8.tar.gz
 # Locally computed sha256 checksums
 sha256  1da058ed0440fea5df1765b19a1418800439b18fd6f1c13c7d429cb81e9c6d47  LICENSE
diff --git a/package/python-pdm-backend/python-pdm-backend.mk b/package/python-pdm-backend/python-pdm-backend.mk
index c3cfeb6f73..b02154128c 100644
--- a/package/python-pdm-backend/python-pdm-backend.mk
+++ b/package/python-pdm-backend/python-pdm-backend.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PDM_BACKEND_VERSION = 2.4.7
+PYTHON_PDM_BACKEND_VERSION = 2.4.8
 PYTHON_PDM_BACKEND_SOURCE = pdm_backend-$(PYTHON_PDM_BACKEND_VERSION).tar.gz
-PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/e2/38/d22c1050130b8cdf16fef76c99c59968086802744947f2813d45c69cca52
+PYTHON_PDM_BACKEND_SITE = https://files.pythonhosted.org/packages/7c/7e/6d441c8739a30820ec59517a88326789c201ae43a344b2ffb02fb2702d8e
 PYTHON_PDM_BACKEND_SETUP_TYPE = pep517
 PYTHON_PDM_BACKEND_LICENSE = MIT
 PYTHON_PDM_BACKEND_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
