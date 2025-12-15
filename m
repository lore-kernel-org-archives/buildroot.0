Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E138D5B864
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:16:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C1C6B408EF;
	Mon, 15 Dec 2025 19:16:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id I3nMhjBlvzn8; Mon, 15 Dec 2025 19:16:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AEBFE4043B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826188;
	bh=Q85CKYdaFz8kouFgJwlxwlAfFLO4tPcrVNQUxuXhxkI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=kVajAxNyaZaePj+x3sraXSFTCKliNA84WrJciv5iwTRABcKZRErEFhe2eOYeArbzG
	 n0/fWxw8tcCYLsE3KW9tRPMCGI9IRgWIFCYVKEAoJJCFNRsUIoF43Q3nx2sb2OpLpZ
	 +9/OkuNoZ7Ump6+IZ6z/H7EQyi5qc8G9PDgRDs5emyXKKOc62gkN3xD5QDedjwEfQc
	 Edjra9Dszz8TIEPeqe9wYXFdR4KQpdpUIsVUxGIxTx08dSGG/dmEyTp3mc3r8oSVuQ
	 HCjDJfCRzUesMuwuMrOKA6D+6deYCd/aVaB9ZtRN4e29TSL7ghbyv/DkhIDSVIluwH
	 FYw4NjgtGFeqA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AEBFE4043B;
	Mon, 15 Dec 2025 19:16:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A485255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 107CD819CC
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id C9gqbQ9o2ULL for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:16:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0199480B2A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0199480B2A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0199480B2A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:16:26 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C6020A4C428E;
 Mon, 15 Dec 2025 20:14:27 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1Q-000000005ED-2eiL;
 Mon, 15 Dec 2025 19:14:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:13:54 +0100
Message-ID: <20251215191416.421755-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826067;
 bh=+hUzKnWf4sTvrvrrvNgGQ6XHFGuIuvJ0MLE6GBH6wS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CJPeCIZFSMAUsJBqpBIazFgnL/nRL/txgGkHFoHLRRmFSDoKVDkVxB5p1QDB0IQSJ
 rxvqmdBYpcwOIjHUbTbmbBkutY1tOaUyjp+HffzDh8aA6Kz5MwYKsc17ZgF+UpkIuR
 t85+yfvlVA2FJo6KsRIEdPgyP/b6rni86SWjgsfMeZFVB52Gy7Tu6iGJjrKAb4N2J7
 skPbiMVg3o6OoGP82mb7smSkk8l1TS4s+btUF3I9SH586dD73w3piD21/UQwWPkoI5
 8hcvHlJsZTgDuCmWewT6zzRZYkyJenjcc0qjQk1rot2HspiZnExPHdItygxgrLfsgA
 Fc43Okp5NeZ4w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CJPeCIZF
Subject: [Buildroot] [PATCH 05/27] package/python-pudb: bump version to
 2025.1.5
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

https://github.com/inducer/pudb/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pudb/python-pudb.hash | 4 ++--
 package/python-pudb/python-pudb.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pudb/python-pudb.hash b/package/python-pudb/python-pudb.hash
index 9918f3e041..f897f09735 100644
--- a/package/python-pudb/python-pudb.hash
+++ b/package/python-pudb/python-pudb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pudb/json
-md5  dc73886506e57c8ba2116e5cbe112fb8  pudb-2024.1.3.tar.gz
-sha256  264f239e0538e52e83d3d020143100b3171cae17227674bb1b9f8b075f34849c  pudb-2024.1.3.tar.gz
+md5  35a728fbb6996bbbc9a857e7142883d5  pudb-2025.1.5.tar.gz
+sha256  e6dedb81fc3c8cdcd66cf62e86337cb913570ebb2c994c9ab52012d059e086ad  pudb-2025.1.5.tar.gz
 # Locally computed sha256 checksums
 sha256  a95343fffff49cde3d9bf33cf6bb71cb3bf0ed83f47d98a7ba04b175d29c79ab  LICENSE
diff --git a/package/python-pudb/python-pudb.mk b/package/python-pudb/python-pudb.mk
index 4dedda0bc2..603ce4cc30 100644
--- a/package/python-pudb/python-pudb.mk
+++ b/package/python-pudb/python-pudb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PUDB_VERSION = 2024.1.3
+PYTHON_PUDB_VERSION = 2025.1.5
 PYTHON_PUDB_SOURCE = pudb-$(PYTHON_PUDB_VERSION).tar.gz
-PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/36/27/fb087bdf2cd9c8e56d0347b863ce5995967c15a3e2a0b9245c7a8f6f1598
+PYTHON_PUDB_SITE = https://files.pythonhosted.org/packages/f5/69/0c52c6058da586e173e48ef8f9c45bc805d9df78d5ad4d69467ff68694b5
 PYTHON_PUDB_SETUP_TYPE = hatch
 PYTHON_PUDB_LICENSE = MIT
 PYTHON_PUDB_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
