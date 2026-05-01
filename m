Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD446CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:31:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8039284F78;
	Fri,  1 May 2026 12:31:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5iF2bAkpNJE2; Fri,  1 May 2026 12:31:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9E17884F7F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638692;
	bh=SeOBisz0gN4x1QnGe2w6f4/9/DPUt3Ul/xXSwYOPmNE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=E1BeuP0lZXldbEBRXUANC4J7l2HbpbeBSFF09CGYmokCjEIRG4/Oh7BfxeO36PNLe
	 jxTlvXCmEjsXCTyoZBKSDw9N+NM9Nh/1RjRNH0YiRfGVTIeHGpw6lj/GAk2jDOoeiV
	 EZdF/V7CqmO5ZHFyN/UPNB0wVjxdi43PCVSzG8Y3j8i7in0BxBTLYoq/c08sTgYjEw
	 WujecG+8WSTKHU6o1UzWzk0HdOp0FZ1hVNSB4qt7eTBgxMdBXpi6a4xQjnseMmPKnI
	 OD/WPdDRwXAw+6+UvZTFoezGD1SEBgVaPTXDjsqevvZm8lPS1sx6mfLzLIz57QoypM
	 eeb1fEQiWTnEA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9E17884F7F;
	Fri,  1 May 2026 12:31:32 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id DF76B127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id C564541DDD
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gEjJ6kjImMb6 for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:31:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 61A9D41DB2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61A9D41DB2
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 61A9D41DB2
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:31:30 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E34EFA4C256D;
 Fri,  1 May 2026 14:31:00 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1I-000000008NC-3hAR;
 Fri, 01 May 2026 12:31:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:47 +0200
Message-ID: <20260501123100.1918951-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638660;
 bh=BykWMpfRVZkSO+Rgy45z6TVvhX2uVHjDwLqftt8fH8A=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Jgp7AxAkQ8CsB2nqYYkHbfmtkzG+TjNiG1KFug9B8aFW03fHLUuEDSNJJwScQyDh6
 26X5EnzZI+lInmVBBYo+FeNfA7caugEUTm8e1OHjwOzsSX1/2yAMbPCtg3vZ8507mm
 Z/rUtz4UKzQyjl+66uhREqBrlQyXyjzRH4ehzWgRt96sHQfx8l/QrWwVhGu0MqIWsK
 OiHeSF7vszKCXQar4i8ApaQPmMY/jJdso87AqF0ZeyaX2pFuhrvNaloBH/CS0Qg4Bj
 3WloBUlFt2icfw3M9efFI4hnd7rHZm+n7zgRieFxW/Jsiw9cbroa4QhNCDlbtQyQEu
 WOAqS993Ut/jA==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=Jgp7AxAk
Subject: [Buildroot] [PATCH 02/75] package/python-anyio: bump to 4.13.0
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

https://anyio.readthedocs.io/en/stable/versionhistory.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-anyio/python-anyio.hash | 4 ++--
 package/python-anyio/python-anyio.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-anyio/python-anyio.hash b/package/python-anyio/python-anyio.hash
index d25c1a2bad..8bd80e86fb 100644
--- a/package/python-anyio/python-anyio.hash
+++ b/package/python-anyio/python-anyio.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/anyio/json
-md5  10e3ba7d02402b6605d834a1e4881a1d  anyio-4.12.1.tar.gz
-sha256  41cfcc3a4c85d3f05c932da7c26d0201ac36f72abd4435ba90d0464a3ffed703  anyio-4.12.1.tar.gz
+md5  790c9bef76fdeac4c2e4e4ea757e14ab  anyio-4.13.0.tar.gz
+sha256  334b70e641fd2221c1505b3890c69882fe4a2df910cba14d97019b90b24439dc  anyio-4.13.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5361ac9dc58f2ef5fd2e9b09c68297c17f04950909bbc8023bdb82eacf22c2b0  LICENSE
diff --git a/package/python-anyio/python-anyio.mk b/package/python-anyio/python-anyio.mk
index 32b4a84ef1..4cd435e265 100644
--- a/package/python-anyio/python-anyio.mk
+++ b/package/python-anyio/python-anyio.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ANYIO_VERSION = 4.12.1
+PYTHON_ANYIO_VERSION = 4.13.0
 PYTHON_ANYIO_SOURCE = anyio-$(PYTHON_ANYIO_VERSION).tar.gz
-PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/96/f0/5eb65b2bb0d09ac6776f2eb54adee6abe8228ea05b20a5ad0e4945de8aac
+PYTHON_ANYIO_SITE = https://files.pythonhosted.org/packages/19/14/2c5dd9f512b66549ae92767a9c7b330ae88e1932ca57876909410251fe13
 PYTHON_ANYIO_SETUP_TYPE = setuptools
 PYTHON_ANYIO_LICENSE = MIT
 PYTHON_ANYIO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
