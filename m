Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DB35BD3B992
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:42:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id B35AF80F06;
	Tue,  9 Dec 2025 19:42:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S8S40GjxXfyA; Tue,  9 Dec 2025 19:42:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org DFBA083EC0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309342;
	bh=J/9zKr7BBlrgH+0+x4ZRU/z8MYVcULx7HxY+eiDoqDM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Y9041XpWYaSOZu5P/nsqS3QoqMFWRyMUJVArHM7ICRj9lXcIfaVf87+PBUPZY9vWf
	 0MHCwuftC3uutEYYY+kWr7e/9auFSeJM3Lzaj0JS+z15JbUHkKFtz/MV+r5I6wUn7g
	 1VGRKyGIyLRJiZR95E4KWduXOxTYLfdlQj5h/yjJ9CWkg108iBNc6C7oPmM9E/sc02
	 wSz/FD8eU1/9L4Mfe5yRt4Z2lCF/l0oaWcMIkXB+zKGMCI0T1N6b2koWF/E1fV2mG6
	 Xk67mLlxUgYJpzo6QJZxknGLyynRVVyKC/dJvpxaM3m1VByTarxJwSW9VkUfasz7So
	 tTKnTsoGQ9esA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id DFBA083EC0;
	Tue,  9 Dec 2025 19:42:21 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 7F5F9E7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6605C83EC0
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lRTQq05WWMQk for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:42:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 5CB1480F06
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5CB1480F06
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 5CB1480F06
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:42:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1A1F5A4C2C76;
 Tue,  9 Dec 2025 20:40:15 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yu-000000006DN-3Y2d;
 Tue, 09 Dec 2025 19:39:52 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:32 +0100
Message-ID: <20251209193951.1000100-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309215;
 bh=XEwGTJTVx+upjAezoNafD/6DEbDKoUZf0ugd3vNSsMw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Y7zPZRzPrQduCjjkDKPqZMVfsy7C7aJnNITmAVI1J5g0qbAWVIsR8Bh2lD/xJPLuK
 azAPJJSN4v1X783MRZzKdIFRN2v4lX/r8PGWBKB2SEkBB3nBm2FYhXt5UFsgK7Oy1h
 lzYpQztJhCjHSXnruuK7S23X7XQO9sDmqqxqISToj15Mt5QsKIA8w5KeupGCooDFnn
 05ZV9FSs01EO9G50cFRbgHb0RM2E18SpbU4iCaPFneUtThChoBIMxNRuBj/6KcKFHo
 kh9UIDAI3RbhhRRzKrgR39VlMhsHGDzi1Ndmm3wOC4n3mXfAZcZ3wkwedeVn0Xie0h
 8E71nHY8UHrsg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Y7zPZRzP
Subject: [Buildroot] [PATCH/next 12/31] package/python-asttokens: bump
 version to 3.0.1
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

Updated license hash:
https://github.com/gristlabs/asttokens/commit/9db9335648659520c7c8453bc39550fa4f95d539

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-asttokens/python-asttokens.hash | 6 +++---
 package/python-asttokens/python-asttokens.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-asttokens/python-asttokens.hash b/package/python-asttokens/python-asttokens.hash
index a8b552913b..ef108bd0d6 100644
--- a/package/python-asttokens/python-asttokens.hash
+++ b/package/python-asttokens/python-asttokens.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/asttokens/json
-md5  7d99c4c80190c3ba64839138ea827970  asttokens-3.0.0.tar.gz
-sha256  0dcd8baa8d62b0c1d118b399b2ddba3c4aff271d0d7a9e0d4c1681c79035bbc7  asttokens-3.0.0.tar.gz
+md5  50670141dde921f807d8257be4a5df9c  asttokens-3.0.1.tar.gz
+sha256  71a4ee5de0bde6a31d64f6b13f2293ac190344478f081c3d1bccfcf5eacb0cb7  asttokens-3.0.1.tar.gz
 # Locally computed sha256 checksums
-sha256  b40930bbcf80744c86c46a12bc9da056641d722716c378f5659b9e555ef833e1  LICENSE
+sha256  62fb8a3a9621dc2388174caaabe9c2317b694bb9a1d46c98bcf5655b68f51be3  LICENSE
diff --git a/package/python-asttokens/python-asttokens.mk b/package/python-asttokens/python-asttokens.mk
index 327ee6af91..4040a7bb73 100644
--- a/package/python-asttokens/python-asttokens.mk
+++ b/package/python-asttokens/python-asttokens.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_ASTTOKENS_VERSION = 3.0.0
+PYTHON_ASTTOKENS_VERSION = 3.0.1
 PYTHON_ASTTOKENS_SOURCE = asttokens-$(PYTHON_ASTTOKENS_VERSION).tar.gz
-PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/4a/e7/82da0a03e7ba5141f05cce0d302e6eed121ae055e0456ca228bf693984bc
+PYTHON_ASTTOKENS_SITE = https://files.pythonhosted.org/packages/be/a5/8e3f9b6771b0b408517c82d97aed8f2036509bc247d46114925e32fe33f0
 PYTHON_ASTTOKENS_SETUP_TYPE = setuptools
 PYTHON_ASTTOKENS_LICENSE = Apache-2.0
 PYTHON_ASTTOKENS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
