Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40793D3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:41:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 1799C83FEA;
	Tue,  9 Dec 2025 19:41:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QEuDUdaxP_uZ; Tue,  9 Dec 2025 19:41:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B71668446B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309268;
	bh=+DuwFa4fHOAN4lqVILE6FVz5ON048paOOWREFB+NC9U=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lWnJlcorm7nNq8cP9ZgkzgxTFteHAuXEJZFRgLHpd/5PPtAPLgqIxBR1P77Co7wUs
	 9SiW6NPyR1r/OanqNMk0gRCdlpjHKQtYkMflrtnkBOSQHH9KhYmdllGE4QQ0QykKYm
	 PRejyRGNOgQdaX03ZhAia/PLqM4H+u1rWMcxl+C5+XOTCDC0GQbvYq1dvGE0hhT4vI
	 rvRpAj9NkioKUkGa/Y9VKHMD0a8xUAz7pTQH2aXG8vtJFNARzvGodiZMJwV+kfHa40
	 +piTKuxOwLOv0dq9o/WZRizuPypDxUi4F3iAQXxK69vgSHvgVazoi4bSRX0tb79t6z
	 Fe9EQfItGr0lw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id B71668446B;
	Tue,  9 Dec 2025 19:41:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id E5668E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id CC77D40200
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uxQyNCE7j6CJ for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:41:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org A664A401EB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A664A401EB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id A664A401EB
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:41:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D34B9A4C2C32;
 Tue,  9 Dec 2025 20:40:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-1V4I;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:25 +0100
Message-ID: <20251209193951.1000100-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309213;
 bh=3AAwL4DFG67nrxo2Iuiom5sNJ58Z9EPx4LI2ABy421M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=I+lRVKlhRpltmx50INUQG2nKMUQMEZnl7KIZUxCwjuR0jaArKp9KTdwxNV73jwucv
 IgnWZ7R7FzYWmFkWVK7Fna9Jgg6CtX2zanL9GWKsSBBaYA0dpQyqWPbLtgVWLZf+TM
 ENGNXcA+VEkU9uCxiwgyvlE/OzI22NqFerNOUUHxBXE4LV3AtueiOue756XCm31Y9K
 4su9nlYi3gkAn7q+bgwFzzs2zOfn9yTXHPEmzhkKnoDdB+07VtZ119Uh2fmqNa/aGq
 z3KJvNK+w9Aedfs7+2ek3cV4oFhqH7VFoW66pQX4jWJc7k9KIWoQNmBV4DpvJQ1yvQ
 WDg7EjGZK3qzg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=I+lRVKlh
Subject: [Buildroot] [PATCH/next 05/31] package/python-aiohttp: bump version
 to 3.13.2
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
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Graeme Smecher <gsmecher@threespeedlogic.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Titouan Christophe <titouan.christophe@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Changelog: https://github.com/aio-libs/aiohttp/blob/v3.13.2/CHANGES.rst

Fixes build with python 3.14.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-aiohttp/python-aiohttp.hash | 4 ++--
 package/python-aiohttp/python-aiohttp.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-aiohttp/python-aiohttp.hash b/package/python-aiohttp/python-aiohttp.hash
index 0aa8dbd3bc..abc6191470 100644
--- a/package/python-aiohttp/python-aiohttp.hash
+++ b/package/python-aiohttp/python-aiohttp.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/aiohttp/json
-md5  4ed66dcec63108ae3a7c01d0415b4dd9  aiohttp-3.12.14.tar.gz
-sha256  6e06e120e34d93100de448fd941522e11dafa78ef1a893c179901b7d66aa29f2  aiohttp-3.12.14.tar.gz
+md5  336f47ec48aff07052a7f1dcf38dfbac  aiohttp-3.13.2.tar.gz
+sha256  40176a52c186aefef6eb3cad2cdd30cd06e3afbe88fe8ab2af9c0b90f228daca  aiohttp-3.13.2.tar.gz
 # Locally computed sha256 checksums
 sha256  9f80d0db7d755a941db4572172c270ecbd8f082ba215ddd095985942ed94a9eb  LICENSE.txt
diff --git a/package/python-aiohttp/python-aiohttp.mk b/package/python-aiohttp/python-aiohttp.mk
index 7070d00cec..e7021cbf45 100644
--- a/package/python-aiohttp/python-aiohttp.mk
+++ b/package/python-aiohttp/python-aiohttp.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_AIOHTTP_VERSION = 3.12.14
+PYTHON_AIOHTTP_VERSION = 3.13.2
 PYTHON_AIOHTTP_SOURCE = aiohttp-$(PYTHON_AIOHTTP_VERSION).tar.gz
-PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/e6/0b/e39ad954107ebf213a2325038a3e7a506be3d98e1435e1f82086eec4cde2
+PYTHON_AIOHTTP_SITE = https://files.pythonhosted.org/packages/1c/ce/3b83ebba6b3207a7135e5fcaba49706f8a4b6008153b4e30540c982fae26
 PYTHON_AIOHTTP_SETUP_TYPE = setuptools
 PYTHON_AIOHTTP_LICENSE = Apache-2.0
 PYTHON_AIOHTTP_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
