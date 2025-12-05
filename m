Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84238D2F7E7
	for <buildroot@archiver.kernel.org>; Fri,  5 Dec 2025 12:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 942E984A0F;
	Fri,  5 Dec 2025 12:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ML3a2wn9_j7P; Fri,  5 Dec 2025 12:40:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 917BB843E5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1764938457;
	bh=FKdPWl0zW1Xr0qQ8qdKLB1UonWLLxs5gIbUl8DVOeA0=;
	h=To:Date:In-Reply-To:References:Subject:List-Id:List-Unsubscribe:
	 List-Archive:List-Post:List-Help:List-Subscribe:From:Reply-To:Cc:
	 From;
	b=JYlwkQrlq3Qv5btsQFHwwaU4zhrQyqh9qxjF4mjZMbAQmmQ7NAEnmdWDzEd1fbVEK
	 uNQJV3sChouVIttxPyZSLyC1A3sPPK1mLskj22w0JeWf6kF1LujTUT1rJscyRXxry1
	 McTHsoAQy2SzudAgJhi9X2+obH/GAj2FQduKS5zKx6Ky12eompUNnG3EiVcJabDtrA
	 4U7epeQYJDkq0LvP2t/IWhpC5dGfuTvLrt1mw0ISLp7HTj49a3WUNk35q5V/9cvN0N
	 4HNlzIwlffaEPjWykXdXEFZu8oZqY3DabX9/il4bWOjx4c9bYsKoDLTswTzZCFzI9G
	 CQWDs7zzNak/w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 917BB843E5;
	Fri,  5 Dec 2025 12:40:57 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 15932E7
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:40:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 077CC4020C
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:40:56 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aeIWHrCoJdmQ for <buildroot@buildroot.org>;
 Fri,  5 Dec 2025 12:40:55 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=176.9.145.28;
 helo=smtp.bubu1.eu; envelope-from=buildroot@bubu1.eu; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 0D26D412B2
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 0D26D412B2
Received: from smtp.bubu1.eu (smtp.bubu1.eu [176.9.145.28])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 0D26D412B2
 for <buildroot@buildroot.org>; Fri,  5 Dec 2025 12:40:54 +0000 (UTC)
Received: from framework-OT.fritz.box (unknown [212.37.174.96])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp.bubu1.eu (Postfix) with ESMTPSA id E4F0C2C89476;
 Fri, 05 Dec 2025 13:40:52 +0100 (CET)
To: buildroot@buildroot.org
Date: Fri,  5 Dec 2025 13:40:53 +0100
Message-ID: <20251205124054.607309-2-buildroot@bubu1.eu>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251205124054.607309-1-buildroot@bubu1.eu>
References: <20251205124054.607309-1-buildroot@bubu1.eu>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=bubu1.eu; s=bubu; 
 t=1764938453; bh=3MvL13jxCYgfsSJK4Po/ChyFUNF1PEth8xGaDvNY9UA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=qKIR0HaMDouuM2RdJTt6QXDFWL4pQHUDrJlkF7/0OvkqJ0f1uP3SU3nPOnU/uu3Hh
 TU615NPaDWBZeRo0eH8LZ58K/JHEpgGBUNSxJoFpTcx8W7KjXVjGu5Ebfv6rEEMwer
 ZQGS3QX/wtTj5XGtuzMXPl3ELEcd8Ph6mRYnD5m2NLalzGST/QwwHWAuebNmIQQiod
 wlhyYqCtQFusAwFEd0UBAZY/W5Kpl1vL0OR9/cz0h7KM9hl3X9aBWJoWOgzvUiBiFs
 owOpX5fM4rpjmj2hYzgZu1WEnvaUh8OyOF3ye8nlGeG+MjWEVjH76lToL9Saze/vt5
 4gMjHdrkoh51A==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=reject dis=none)
 header.from=bubu1.eu
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=bubu1.eu header.i=@bubu1.eu
 header.a=rsa-sha256 header.s=bubu header.b=qKIR0HaM
Subject: [Buildroot] [PATCH 2/2] package/python-fastapi: bump to 0.123.9
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
From: Marcus Hoffmann via buildroot <buildroot@buildroot.org>
Reply-To: Marcus Hoffmann <buildroot@bubu1.eu>
Cc: James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

This introduces a new trivial runtime dependency (annotated-doc) since
0.120.0.

Changes:
* https://github.com/fastapi/fastapi/releases/tag/0.120.0
* https://github.com/fastapi/fastapi/releases/tag/0.120.1
* https://github.com/fastapi/fastapi/releases/tag/0.120.2
* https://github.com/fastapi/fastapi/releases/tag/0.120.3
* https://github.com/fastapi/fastapi/releases/tag/0.120.4
* https://github.com/fastapi/fastapi/releases/tag/0.121.0
* https://github.com/fastapi/fastapi/releases/tag/0.121.1
* https://github.com/fastapi/fastapi/releases/tag/0.121.2
* https://github.com/fastapi/fastapi/releases/tag/0.121.3
* https://github.com/fastapi/fastapi/releases/tag/0.122.0
* https://github.com/fastapi/fastapi/releases/tag/0.122.1
* https://github.com/fastapi/fastapi/releases/tag/0.123.0
* https://github.com/fastapi/fastapi/releases/tag/0.123.1
* https://github.com/fastapi/fastapi/releases/tag/0.123.2
* https://github.com/fastapi/fastapi/releases/tag/0.123.3
* https://github.com/fastapi/fastapi/releases/tag/0.123.4
* https://github.com/fastapi/fastapi/releases/tag/0.123.5
* https://github.com/fastapi/fastapi/releases/tag/0.123.6
* https://github.com/fastapi/fastapi/releases/tag/0.123.7
* https://github.com/fastapi/fastapi/releases/tag/0.123.8
* https://github.com/fastapi/fastapi/releases/tag/0.123.9

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
---
 package/python-fastapi/Config.in           | 1 +
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 3 files changed, 5 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/Config.in b/package/python-fastapi/Config.in
index 21997daf9a..0dd4499a3f 100644
--- a/package/python-fastapi/Config.in
+++ b/package/python-fastapi/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_PYTHON_FASTAPI
 	bool "python-fastapi"
 	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS # python-pydantic -> python-pydantic-core
+	select BR2_PACKAGE_PYTHON_ANNOTATED_DOC # runtime
 	select BR2_PACKAGE_PYTHON_PYDANTIC # runtime
 	select BR2_PACKAGE_PYTHON_STARLETTE # runtime
 	select BR2_PACKAGE_PYTHON_TYPING_EXTENSIONS # runtime
diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 34bfe22c87..7ef8628579 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  5d539db8065d3579430ed00577e8a86b  fastapi-0.119.1.tar.gz
-sha256  a5e3426edce3fe221af4e1992c6d79011b247e3b03cc57999d697fe76cbf8ae0  fastapi-0.119.1.tar.gz
+md5  b72bd92dd17ba585f8fc3cf37f95c6f2  fastapi-0.123.9.tar.gz
+sha256  ab33d672d8e1cc6e0b49777eb73c32ccf20761011f5ca16755889ab406fd1de0  fastapi-0.123.9.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 4a067494a7..207dc88d8f 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.119.1
+PYTHON_FASTAPI_VERSION = 0.123.9
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/a6/f4/152127681182e6413e7a89684c434e19e7414ed7ac0c632999c3c6980640
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/2c/01/c3fb48c0135d89586a03c3e2c5bc04540dda52079a1af5cac4a63598efb9
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.52.0

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
