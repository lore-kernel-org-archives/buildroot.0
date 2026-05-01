Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFDFDCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:37:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id C45E34260A;
	Fri,  1 May 2026 12:37:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id lTUyTQa1zvah; Fri,  1 May 2026 12:37:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2232B425FE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639069;
	bh=HxsXM9KC1Q5N4MuSlOnCe7n8kcW94W4rgvlwtnIwiTo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gUK9rdiOJkjNe6iowXYzWKy3vw/9uG0WTIIVJ+oKk6nj2uTUL3d8ugTM3l6aHgcUb
	 ukSSdAppgA8dBb02tA+3XW7dRmizvz+WP8MINo9TKSbtU6PJHLSqSonbojOEZpOw1C
	 j+IhDqZyfw/vUuf3tNge3jajVWYCg/U5CjFZilpgYiXuFScLYiDhykUbLq0p3NNhNt
	 h0M0g8Ibs40mLJSubK39/IX3xbToFViY5RfTxJynxLigheXTIfd036pgfCRlrNbNR+
	 1KQtvfjucVPoJ2bZfY4MgOR8lAQFMednf7X0SWu8Y+OT/Cj/UbHAnG+cCBlQpu7XOn
	 JDs6Xce7WYiow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2232B425FE;
	Fri,  1 May 2026 12:37:49 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id A7578293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8D07B85284
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KCYeyG6dLzpe for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:37:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 857F585266
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 857F585266
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 857F585266
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:37:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 9F310A4C2ED6;
 Fri,  1 May 2026 14:31:06 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-0Vp9;
 Fri, 01 May 2026 12:31:00 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:50 +0200
Message-ID: <20260501123100.1918951-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638666;
 bh=f9MvjaKuq1wHQxY+hryPNqVqvB3rAc6xbqK1GB4Fdjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=lfW/Rg94oi7hjHTu0TpUnkFBXy71ajaldj+UQowwj+P7vA0oDtvFLrotMCCn0hIvc
 WlTvw++VD2tkwUE6HRXHV0LpDTTMKXGcUS1XeBuNnKMV0Y7/0WlbcXQ55uekwMyN3m
 2bYTUrxISlQ6cR0Xo1MMjxzDGZvOYvCaAlSTIMV2acFx8hMBESXXVL3RL+Zr2g2abu
 ZFdnv2WHp91p++z8X0ilJm7nq3FvujqSV0XVlzMdsuKYgzC2b/0SjthEY/pVhemNJ8
 F6m+FHt0VZVKtdaGfDEsC528tIvQ/W1UnQHT9jQ8nsXYbjoBg+bdiaPYRnyIAFoSay
 zU5ednHgJ1kCg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=lfW/Rg94
Subject: [Buildroot] [PATCH 05/75] package/python-bitarray: bump version to
 3.8.1
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

https://github.com/ilanschnell/bitarray/blob/3.8.1/CHANGE_LOG

Updated license hash due to copyright year bump:
https://github.com/ilanschnell/bitarray/commit/730c524980371b6f6ff2a455d9a39f8272eb9c3f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-bitarray/python-bitarray.hash | 6 +++---
 package/python-bitarray/python-bitarray.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-bitarray/python-bitarray.hash b/package/python-bitarray/python-bitarray.hash
index dee6613e69..990dda1348 100644
--- a/package/python-bitarray/python-bitarray.hash
+++ b/package/python-bitarray/python-bitarray.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/bitarray/json
-md5  eedc882e4497c9b281f95af354f728d9  bitarray-3.8.0.tar.gz
-sha256  3eae38daffd77c9621ae80c16932eea3fb3a4af141fb7cc724d4ad93eff9210d  bitarray-3.8.0.tar.gz
+md5  7199aad3582d77d568cd673a3477a6f6  bitarray-3.8.1.tar.gz
+sha256  f90bb3c680804ec9630bcf8c0965e54b4de84d33b17d7da57c87c30f0c64c6f5  bitarray-3.8.1.tar.gz
 # Locally computed sha256 checksums
-sha256  a554c25090ad5a5ea8ad35629dacffbb4d887234b011550218a5a1f9090e5274  LICENSE
+sha256  e19b1180b6ee73307a8545716be9b36318cf4f926aaf3eb43f7fde3396a102dd  LICENSE
diff --git a/package/python-bitarray/python-bitarray.mk b/package/python-bitarray/python-bitarray.mk
index 00b9a98d4b..bdfe0494ee 100644
--- a/package/python-bitarray/python-bitarray.mk
+++ b/package/python-bitarray/python-bitarray.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BITARRAY_VERSION = 3.8.0
+PYTHON_BITARRAY_VERSION = 3.8.1
 PYTHON_BITARRAY_SOURCE = bitarray-$(PYTHON_BITARRAY_VERSION).tar.gz
-PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/95/06/92fdc84448d324ab8434b78e65caf4fb4c6c90b4f8ad9bdd4c8021bfaf1e
+PYTHON_BITARRAY_SITE = https://files.pythonhosted.org/packages/fc/47/b5da717e7bbe97a6dc4c986f053ca55fd3276078d78f68f9e8b417d1425a
 PYTHON_BITARRAY_SETUP_TYPE = setuptools
 PYTHON_BITARRAY_LICENSE = Python-2.0
 PYTHON_BITARRAY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
