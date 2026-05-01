Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89FFECD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:44:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61D37429ED;
	Fri,  1 May 2026 12:44:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0UakQaQLd4F9; Fri,  1 May 2026 12:44:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 85672429BD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639468;
	bh=YH3GCUmnEpWtG8Qbd88yVaUYdCSKnuQNZhfN3u0J1VA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=PLJLNF65TU8k95TxmAaBPi0ZPoYH9sqVlRpSxxYT4MrhZnounQ+79/YCGElZvOB2q
	 ZAh6jKah98D6Prr6AdoYohy8iTPBoF3FgFi4HuoxocpZk2FuzYf0oUlD6Y+GUV6QoW
	 6OALUSWRphg4s26A+LROQKlZHKy0cvnvECpXUCxId5fia61V4618/c7Zc/6tAaPBf/
	 IZd/i7REBqVMa64INGd9xZLZ98MB0cZOW2lGbBUZug3o5aUsDw7S7GaXP8K0PaHN0w
	 ojLf4NlvMNzPUEpN4ulBdVFjjLQmhl0Vfm43Nk8yCwponl3J9j0+fCV7tSQTD8kDHY
	 8UnzKQKyRM2rw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 85672429BD;
	Fri,  1 May 2026 12:44:28 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 8C3B3293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7DB00403E9
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C6zQ9yMKXPaA for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:44:25 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6F463401CA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6F463401CA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6F463401CA
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:44:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 24659A4C306A;
 Fri,  1 May 2026 14:31:10 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-2lVb;
 Fri, 01 May 2026 12:31:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:53 +0200
Message-ID: <20260501123100.1918951-68-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638670;
 bh=lyYoXwrP9IttsbmDWRzY7rv+F92az/TloOOm4G3Z3po=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Bg7EjeIid0JbtAGifeT6a1AiaJz8+j/R2yFN/xzqdMslvoR9TUnxckGLj8BBOKOFc
 qn1e3WRy5YHH90Bfb12BccI+JpruW7mSFmx3CdBudxAneKKMaP6fLnYgK3lOAeYrJF
 EK6FaPs6zFxldf771tAWtCqHaKvRNSI2df6jXUDQG8+9AbWM9ZKHcAQSujKrOSia3x
 nEktNdG+aMBsG213oj62wkIXUxFxRc/HrGaB6+49YEFT8p6ajJAWmXJ+Vhnn7wtG60
 TiYvE5ijMJVjOlbJt2An0jZQApK6BtQpQIDiXdiz4mCKKuTGTOcE3yqa+TVj+jkmqr
 eswZGf9iN815g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Bg7EjeIi
Subject: [Buildroot] [PATCH 68/75] package/python-uswid: bump version to
 0.6.0
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

https://github.com/hughsie/python-uswid/blob/0.6.0/docs/source/versionhistory.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-uswid/python-uswid.hash | 4 ++--
 package/python-uswid/python-uswid.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-uswid/python-uswid.hash b/package/python-uswid/python-uswid.hash
index 3385fc58a0..d9b890913a 100644
--- a/package/python-uswid/python-uswid.hash
+++ b/package/python-uswid/python-uswid.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/uswid/json
-md5  3d4295821faf35512528381716126c03  uswid-0.5.2.tar.gz
-sha256  1d6c53acf160edc9b42e4ba535343b3567f2f341d289b9e63ca6a84372c2c518  uswid-0.5.2.tar.gz
+md5  9dad3f374739448c3aaff9cedb1810df  uswid-0.6.0.tar.gz
+sha256  98b04b2750aa7ca97fc83c65cb24808174c3cd5f7e99d96727161034963137bf  uswid-0.6.0.tar.gz
 # Locally computed sha256 checksums
 sha256  98bc07f3fb70d05b01ff740e8191b9f29c080159f01588991fbd872c611236f9  LICENSE
diff --git a/package/python-uswid/python-uswid.mk b/package/python-uswid/python-uswid.mk
index 8596307938..3ba20ef476 100644
--- a/package/python-uswid/python-uswid.mk
+++ b/package/python-uswid/python-uswid.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_USWID_VERSION = 0.5.2
+PYTHON_USWID_VERSION = 0.6.0
 PYTHON_USWID_SOURCE = uswid-$(PYTHON_USWID_VERSION).tar.gz
-PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/15/64/d200424bf8f87ef25b516d438d745b03aa4ec381756d86cc3ff6bf29393c
+PYTHON_USWID_SITE = https://files.pythonhosted.org/packages/5b/4b/4eb0e287c6587f55212e87eaf24d262d21d47a56d034dfae11649eff613f
 PYTHON_USWID_SETUP_TYPE = setuptools
 PYTHON_USWID_LICENSE = BSD-2-Clause-Patent
 PYTHON_USWID_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
