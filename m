Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B36D43341
	for <buildroot@archiver.kernel.org>; Thu, 11 Dec 2025 19:58:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B473541118;
	Thu, 11 Dec 2025 19:58:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id H2M6W_Ykee43; Thu, 11 Dec 2025 19:58:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 9D74041109
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765483105;
	bh=wZJO5bKG2/dejKz6Vl19gqmr3zAK0RAG9XLZT3RYXgA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p9HblcrYTklb9SgjC83THPQ65KOdxiYXhxvi+PfhhGxlHmnodQ/DKcJw6X990gZE6
	 IW7RjkQXsJmgKIriXbmHvpKUGcj3FxDp+Jacy/chP3hPI95hoQ9b18jfg7vXqV9y4L
	 UfV2sI0ceChGtgFSxmA6tluMNy6K+Y27D2je0+jOYsmz06ZtnDt8QGZTyd2bHygtYS
	 +cLLC74jnyUIjJUHyDqp9/Ycm8dOuSVXeFNQjSZ3Fb1d2tMfb151I16IAkQiMy/Q+J
	 LYMJ0wAw5IjcME4xSIlNcwvO7nRbTMW7M8pq6aKl79gNv/BU2JlTqsBGbV4BTuWHFp
	 ZeidNuzx+ORcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9D74041109;
	Thu, 11 Dec 2025 19:58:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id B48BF2C6
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9B35341109
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 864UzszDkdm6 for <buildroot@buildroot.org>;
 Thu, 11 Dec 2025 19:58:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 92BE640A6E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 92BE640A6E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 92BE640A6E
 for <buildroot@buildroot.org>; Thu, 11 Dec 2025 19:58:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF1AFA4C38F3;
 Thu, 11 Dec 2025 20:55:37 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39350)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vTml7-000000008Hh-0OC7;
 Thu, 11 Dec 2025 19:55:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 11 Dec 2025 20:55:20 +0100
Message-ID: <20251211195527.3276900-14-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251211195527.3276900-1-bernd@kuhls.net>
References: <20251211195527.3276900-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765482937;
 bh=Q35DhN2ksuqQVlvtFhGUCTNw20cHafRkGPDuTPTMjNE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=DNRybPjqtCLaCLwlp+PIbMKBzc13GR3vdY49WzZZqBZ8TyU+JR4VEh5Ch1pMd/6t4
 ZHC8pNoD5DCSgRpnxwBuvgZY2FC7jsEn2buOHiwplDGT31OypBvl8biFNcj5nibb2J
 DCbIdIfbndX/OR6kj1b+PV9D4Qfs969G65u7ESOcqx91N0KEFeqM66Y4uPmjp2Zhfg
 vxOzsrNhY8Wf8gFvJK4o4AXqP51laGIQp0xxbBEToNzqr9Zv9N6HSUXeazN34Ni7af
 78r0yVK8sk5DKuDqpJeJbot/uPXtvz+f37de3vq7Cli2fMi7oLR3hVO+cbSocMr+in
 1rZNytcaKA8qQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=DNRybPjq
Subject: [Buildroot] [PATCH/next 14/21] package/python-gast: bump version to
 0.7.0
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

https://github.com/serge-sans-paille/gast/compare/0.6.0...0.7.0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-gast/python-gast.hash | 4 ++--
 package/python-gast/python-gast.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-gast/python-gast.hash b/package/python-gast/python-gast.hash
index 4071a07919..11f38c6824 100644
--- a/package/python-gast/python-gast.hash
+++ b/package/python-gast/python-gast.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/gast/json
-md5  4a088eca6fd6bae16bc2fd2ff828de51  gast-0.6.0.tar.gz
-sha256  88fc5300d32c7ac6ca7b515310862f71e6fdf2c029bbec7c66c0f5dd47b6b1fb  gast-0.6.0.tar.gz
+md5  786783d275172090375b8202c1fbf309  gast-0.7.0.tar.gz
+sha256  0bb14cd1b806722e91ddbab6fb86bba148c22b40e7ff11e248974e04c8adfdae  gast-0.7.0.tar.gz
 # Locally computed sha256 checksums
 sha256  6a04bbabd9b48bea6bf7c0bd3f3a062e1476b3c403a746448fd69b0d902e148f  LICENSE
diff --git a/package/python-gast/python-gast.mk b/package/python-gast/python-gast.mk
index 771d7a4be4..e40e5a7f05 100644
--- a/package/python-gast/python-gast.mk
+++ b/package/python-gast/python-gast.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_GAST_VERSION = 0.6.0
+PYTHON_GAST_VERSION = 0.7.0
 PYTHON_GAST_SOURCE = gast-$(PYTHON_GAST_VERSION).tar.gz
-PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/3c/14/c566f5ca00c115db7725263408ff952b8ae6d6a4e792ef9c84e77d9af7a1
+PYTHON_GAST_SITE = https://files.pythonhosted.org/packages/91/f6/e73969782a2ecec280f8a176f2476149dd9dba69d5f8779ec6108a7721e6
 PYTHON_GAST_SETUP_TYPE = setuptools
 PYTHON_GAST_LICENSE = BSD-3-Clause
 PYTHON_GAST_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
