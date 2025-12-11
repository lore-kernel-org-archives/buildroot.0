Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19F8CD43343
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:56:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id E823740196;
	Thu, 11 Dec 2025 19:56:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I7lN0kgJUqrf; Thu, 11 Dec 2025 19:56:46 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1BBB140376
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483006;
	bh=EESILCwm13vFZJNYVwhnDGfZbfYw2WL8IBfqR2hzrak=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=omS6iDT+Lujra6UknELm3yC90Hn7VpKRKKd/tOxri3/UjMMnWwflRq0cIifGa0pce
	 cEt/Ob9RwVKwD75Hcq7BTfCV+YY5TdA5iIkTLYsc/7mYUxEtu/OC7/m0i9trEfS1FU
	 dwJJHJgoJ8DXAGUjm6+lfxMgTXG7vTTBH1EcG9nBslM9gbzBCe/wzWbQS0yqVJaXSc
	 SPtnciuqJHAPnilS7BelZ5XREc5xbCzdzKHcYsQ1HiK5phLsgINH7ko4v7FdlYTLQ/
	 0ptE+cmzYjgSI8WxH5hm1lLwqosJrmPFVZWxbV59vakCndMSmOdqfHLGvZXHPx5N4M
	 gnMiWNFOE5Gog==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1BBB140376;
	Thu, 11 Dec 2025 19:56:46 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 5F0BF2C1
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 50DD64005C
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 23mLt99JNIam for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:56:43 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org E5C8940012
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E5C8940012
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id E5C8940012
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:56:42 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8954DA4C37DA;
 Thu, 11 Dec 2025 20:55:35 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml6-000000008Hh-2gxr;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:14 +0100
Message-ID: <20251211195527.3276900-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482935;
 bh=+no53wwGWRyE5h0bnNJ2cdfenKgbc67d1DwJCzIPUJE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=EryXpH0DXWtM21hneD2XNeGz1K6lVfOY5vMMvu+K7fZbjLsZqkYJkmBitvR5LSlhp
 +hM4XPoHFXi9qfzI1b8ybsxwtrfntYnsO3zu+0I09wFolSpgNgZQe+6oMdoUT+pIB3
 cLuqJwahMVVy5U+qeqeOgnge2YlvcHhHquIO/0RzHiH/evJDOauwbLRfpElNdH4Z8e
 SySLldwf1yGB/CcUJKkjK8c9nPfEgHhOyamHX2fNnE9ctSMJj25Q066cBW6toEMgFa
 NxyKC+5lfhBRTP3I99adcpHyyPuvWu8gWJqHgaGfnFJ0WGCwpMnZ6NwSd2SETYlDFN
 EGyaZ2YZhuqmw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=EryXpH0D
Subject: [Buildroot] [PATCH/next 08/21] package/python-fastapi: bump version
 to 0.124.2
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
Cc: Louis Aussedat <aussedat.louis@gmail.com>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Lionel Flandrin <lionel@svkt.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/fastapi/fastapi/blob/0.124.2/docs/en/docs/release-notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 7ef8628579..dc6549d670 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  b72bd92dd17ba585f8fc3cf37f95c6f2  fastapi-0.123.9.tar.gz
-sha256  ab33d672d8e1cc6e0b49777eb73c32ccf20761011f5ca16755889ab406fd1de0  fastapi-0.123.9.tar.gz
+md5  d82c1c5040c1d29b7e0cb4bce9ac0e51  fastapi-0.124.2.tar.gz
+sha256  72e188f01f360e2f59da51c8822cbe4bca210c35daaae6321b1b724109101c00  fastapi-0.124.2.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 207dc88d8f..34aa3781b5 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.123.9
+PYTHON_FASTAPI_VERSION = 0.124.2
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/2c/01/c3fb48c0135d89586a03c3e2c5bc04540dda52079a1af5cac4a63598efb9
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/58/b7/4dbca3f9d847ba9876dcb7098c13a4c6c86ee8db148c923fab78e27748d3
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
