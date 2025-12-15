Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 13D28D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:14:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id BE7D5807D0;
	Mon, 15 Dec 2025 19:14:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qPMMIAqtEb_t; Mon, 15 Dec 2025 19:14:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D11F380767
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826077;
	bh=Xdgtt4moxYtEEQr7oALoX7t+kiCgoAwgaxR8ZgsKZik=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QZAtK93Ct3ebSogd0XaDJqT+YJOVf6yi5wbCiH24twqDK4BaR4W4W8IVAS5eSGw23
	 1MDAuFoIFsME0vL62ihHRvlm2p2X9c0RGdCmKqUUIbfZ0Jfq6yYMcTyRuXbWe+5hwF
	 1wV3z8uvFJQYkcfXd4Wss+FcygrnTnFeZVwD+ndIXjzcuLirJkn7q6ClEq41xOOB6J
	 oLNINGlFGQddctmVMzNoEX+bNwHPcE0elhFwqjad4wiqr3oZO6aejTEOCM0lkeaNPe
	 BogjZ5n8d9iifK3/NPPjn3U84q/2oEVWNGrZ2Tq6gVYk1H2vGtWP9uqjHvh1LVrSrm
	 VEZTmbl/PEG+g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D11F380767;
	Mon, 15 Dec 2025 19:14:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 3A520151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2C25760EAD
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id PzhZwPUwYp1Q for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:14:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org ED25960DE7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org ED25960DE7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id ED25960DE7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:14:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 1F24AA4C4267;
 Mon, 15 Dec 2025 20:14:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-1fnI;
 Mon, 15 Dec 2025 19:14:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:51 +0100
Message-ID: <20251215191416.421755-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826057;
 bh=7cG/NPHC9M2CpXur4RBRxWdW/02j5ns3c9eB6cCpxtY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Ojb5KtbrQkBjE7b8zkEsAwi5euTw+pheozgz6356P8sWG4BbLiLfnb8bexnq8zFAg
 a88pp5FdG1z65nZUfdOqG50WF74jH1t7Rw00nYioqHGE/sT8XvuKLMw+SjqYDucb6x
 hH9jXV1ZCx9tityg8cB5eQ/A/CjIN7g3G0Mm753fvWqRyFLCAicqbPYWe5nJ3Ou6Zm
 c7oGETFu2jyY5YI94iMPsR2WuvdeVciW0ixZVWsDYJ8QZoWyWlFdF+IEqEHArZEFu4
 s0mX0/bQ+cwpBxbaMLVm5vWDyvrbgwv9rgdpaJgdVUXkMO+vKYiXFosYouBD8oRYYc
 8vZEucblP24FA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ojb5Ktbr
Subject: [Buildroot] [PATCH 02/27] package/python-propcache: bump version to
 0.4.1
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/aio-libs/propcache/blob/v0.4.1/CHANGES.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-propcache/python-propcache.hash | 4 ++--
 package/python-propcache/python-propcache.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-propcache/python-propcache.hash b/package/python-propcache/python-propcache.hash
index 6e89eac6aa..347f232927 100644
--- a/package/python-propcache/python-propcache.hash
+++ b/package/python-propcache/python-propcache.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/propcache/json
-md5  1c073b491620a9f6d568276d61f80277  propcache-0.3.2.tar.gz
-sha256  20d7d62e4e7ef05f221e0db2856b979540686342e7dd9973b815599c7057e168  propcache-0.3.2.tar.gz
+md5  9efab9358cf05265dbee69297e0de96a  propcache-0.4.1.tar.gz
+sha256  f48107a8c637e80362555f37ecf49abe20370e557cc4ab374f04ec4423c97c3d  propcache-0.4.1.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-propcache/python-propcache.mk b/package/python-propcache/python-propcache.mk
index e1050c4919..88d1f2cfba 100644
--- a/package/python-propcache/python-propcache.mk
+++ b/package/python-propcache/python-propcache.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PROPCACHE_VERSION = 0.3.2
+PYTHON_PROPCACHE_VERSION = 0.4.1
 PYTHON_PROPCACHE_SOURCE = propcache-$(PYTHON_PROPCACHE_VERSION).tar.gz
-PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/a6/16/43264e4a779dd8588c21a70f0709665ee8f611211bdd2c87d952cfa7c776
+PYTHON_PROPCACHE_SITE = https://files.pythonhosted.org/packages/9e/da/e9fc233cf63743258bff22b3dfa7ea5baef7b5bc324af47a0ad89b8ffc6f
 PYTHON_PROPCACHE_SETUP_TYPE = setuptools
 PYTHON_PROPCACHE_LICENSE = Apache-2.0
 PYTHON_PROPCACHE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
