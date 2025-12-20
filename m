Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA1DFE67483
	for <buildroot@archiver.kernel.org>; Sat, 20 Dec 2025 21:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 7B34E81EC4;
	Sat, 20 Dec 2025 21:44:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RcFU8SOH2kW9; Sat, 20 Dec 2025 21:44:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D9253818CA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766267073;
	bh=LX/wFNN77JtPib4y6u52UJYHicJtGYfyEHUnhDTwO5A=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eJjlZC2rohMso77U3LCauHj2ZhIL5zlvVcJn3CofKn90IBrIxqBLke7BemrHdhJoY
	 uEZvur5s51ituMOfY/2rs6Kq13ngKZca7758Mf2i6KyliARBVcBuOMB4P+lDWPZJlk
	 QW4pEtenlS0C7DpT8oqh17pWT92mUFmqtjh8yz65GS3LDbkeyHC7jYT1n+O+zxWkJP
	 bNPsCzJTXeh7DXO5hscch5fgHFpqszbJ32o0OMe2I2/QDAf2FcBtlNIMBjWrmpBz94
	 DrcngN6YevmbWevEMwaYkr/kGnBbzE7GBAC3RqHSSd7lVvVrsjOSnLMO5tAvPlVcLo
	 +j94yLmTWbnBw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9253818CA;
	Sat, 20 Dec 2025 21:44:33 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 848FC119
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 76C20406E5
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l58A2nRfii0f for <buildroot@buildroot.org>;
 Sat, 20 Dec 2025 21:44:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 6D110406DD
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 6D110406DD
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 6D110406DD
 for <buildroot@buildroot.org>; Sat, 20 Dec 2025 21:44:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c714.dip0.t-ipconnect.de [79.214.199.20])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8C305A4C4D7D;
 Sat, 20 Dec 2025 22:42:10 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39116)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vX4iF-000000002DO-0gqN;
 Sat, 20 Dec 2025 21:42:06 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 20 Dec 2025 22:41:54 +0100
Message-ID: <20251220214206.1089100-6-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251220214206.1089100-1-bernd@kuhls.net>
References: <20251220214206.1089100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766266930;
 bh=HO6QMQjC2yvjFh3LHPq7s/QbVerSlWaaUz5TQGN92ok=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QPuKNAPgbs0UbkoXXmdRWNoulJZe+janHAh0KUPd96bH09QFMkrqw6WWOAlFGsWzg
 HCyA0QiqX1o5WUqRe+GVI6+G/T/soDZz08DPPdT6/LfrWeA6ieGarESUOE/UXcpB6h
 Z+gvuQUa4x6PAERIcDxCDgjWsmJcJlhJ8C3ESWHwrb5UZqAoHIH/76cfEBc11GhA6v
 +rvAdKBBKX4VQIInHzZjZe03RDOU5bVXnzGJ9HJTPiiAmltvjbtGCthTUM3/ewzo+1
 cC3PqbfehjzCmazJrE1sS/waxDoybo6kJvkw8rJLM5gdQU3QkONp9YM/Bssad/C7oB
 sErMG4g96JJng==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QPuKNAPg
Subject: [Buildroot] [PATCH 06/18] package/python-fastapi: bump version to
 0.126.0
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
Cc: =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>, Joris Offouga <offougajoris@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/fastapi/fastapi/blob/0.126.0/docs/en/docs/release-notes.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-fastapi/python-fastapi.hash | 4 ++--
 package/python-fastapi/python-fastapi.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-fastapi/python-fastapi.hash b/package/python-fastapi/python-fastapi.hash
index 14f14a411f..6814876e50 100644
--- a/package/python-fastapi/python-fastapi.hash
+++ b/package/python-fastapi/python-fastapi.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/fastapi/json
-md5  8deab8ab1b623e1428e4753110295297  fastapi-0.124.4.tar.gz
-sha256  0e9422e8d6b797515f33f500309f6e1c98ee4e85563ba0f2debb282df6343763  fastapi-0.124.4.tar.gz
+md5  bbc8c95d2b4566f55b8628f4ed4bd673  fastapi-0.126.0.tar.gz
+sha256  f099fceb2a6d56dd21c59c4543d00be123dedacff869e76ae31ba3c0f963e2cd  fastapi-0.126.0.tar.gz
 # Locally computed sha256 checksums
 sha256  4ec89ffc81485b97fec584b2d4a961032eeffe834453894fd9c1274906cc744e  LICENSE
diff --git a/package/python-fastapi/python-fastapi.mk b/package/python-fastapi/python-fastapi.mk
index 36954f8b0e..aa076779af 100644
--- a/package/python-fastapi/python-fastapi.mk
+++ b/package/python-fastapi/python-fastapi.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FASTAPI_VERSION = 0.124.4
+PYTHON_FASTAPI_VERSION = 0.126.0
 PYTHON_FASTAPI_SOURCE = fastapi-$(PYTHON_FASTAPI_VERSION).tar.gz
-PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/cd/21/ade3ff6745a82ea8ad88552b4139d27941549e4f19125879f848ac8f3c3d
+PYTHON_FASTAPI_SITE = https://files.pythonhosted.org/packages/03/6c/28773e19bc203a2f3cf1d54a8e96ca7d05b58157a350aa4d8d37f2a5ba07
 PYTHON_FASTAPI_SETUP_TYPE = pep517
 PYTHON_FASTAPI_LICENSE = MIT
 PYTHON_FASTAPI_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
