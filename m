Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A063D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:17:56 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 000B140A9D;
	Mon, 15 Dec 2025 19:17:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qLcuCY6-E8zM; Mon, 15 Dec 2025 19:17:55 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2B59A40A4C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826275;
	bh=JRfUYep8pLdUGPpky0m0UHelmAbLNkH2nWl7fu+1gbU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QfXsSJy8SQtgYONYVzCfa8TS86QB/TJVvC4CpXO6YOQeOVBu6ieSDeZAHjYzvVEAV
	 dTxnY7D6CuFZBi0YwzdfuoJcoek4xag9TqMLczMQe4kRmO44QAsbwZyCWlvOa4Zkg4
	 VWmBF5N3bRF/X0F0CdbaCfzOqdqUOVNJ+gjVmu/PowxBHuMCBhJ46Mm77Z0ZrabhLE
	 TUESQ80jYMkcqDHPQJ+MIR7d4rteNbDHqPkS0N4pvVYIFAmK8taN1V9S6R0W00Uphg
	 uvyoO6SZSRYvcY5bzWLvTOytPkNzL2hpx/3Do8AR66h6rPZHPKlOxmUwabMJBJOdMj
	 A0Q3JwcfQ0v4w==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2B59A40A4C;
	Mon, 15 Dec 2025 19:17:55 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 45D2D151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 38473407FE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vS_t4jA9jSHT for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:17:53 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 1F5F04046A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 1F5F04046A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 1F5F04046A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:53 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8B54CA4C4357;
 Mon, 15 Dec 2025 20:14:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-2SxA;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:06 +0100
Message-ID: <20251215191416.421755-17-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826069;
 bh=1BkplxEaVYK1Z1/Yu3Yp4Pw2aKcO51onilBF30e61e4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NPvgfzXXe8tjuk8tNBTFNYz88MF0+/LEW68lPQEdm/UYk68tAOYPL/zcsVR4gtsDM
 Q9Yt/Oq+HqjnjxA5z+6DAWDZ5nj5BnItZ/FBtL6xNuACtLWp86QAJy+m36UcZTHNcr
 Q2KLmC3bFL+6QVJxbohE/4Psi78HhW5JyJlemtYzRcVACHpSHUyWIu7I7A8MuZmhUw
 0FnueOusIP55iIZ+0XcVlBJ1SrnIm8DDLyQ2mDnfxmkMLwqY48TW+hp10rhlwgBiVw
 qFD8EMqqNf+tL226Hst2zUSMRobwGN65pnQGnTTgZF2WWNBLJePJc43lxDSwDzROHs
 fT8txXp4kKAwA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=NPvgfzXX
Subject: [Buildroot] [PATCH 17/27] package/python-pyspnego: bump version to
 0.12.0
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

https://github.com/jborean93/pyspnego/blob/v0.12.0/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyspnego/python-pyspnego.hash | 4 ++--
 package/python-pyspnego/python-pyspnego.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyspnego/python-pyspnego.hash b/package/python-pyspnego/python-pyspnego.hash
index dd8203088a..1feca5d305 100644
--- a/package/python-pyspnego/python-pyspnego.hash
+++ b/package/python-pyspnego/python-pyspnego.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyspnego/json
-md5  8d138eeb84bba8ea48b3287dfb3b9ed1  pyspnego-0.11.2.tar.gz
-sha256  994388d308fb06e4498365ce78d222bf4f3570b6df4ec95738431f61510c971b  pyspnego-0.11.2.tar.gz
+md5  f1e4eb073641fc00dfd0ce053963c73b  pyspnego-0.12.0.tar.gz
+sha256  e1d9cd3520a87a1d6db8d68783b17edc4e1464eae3d51ead411a51c82dbaae67  pyspnego-0.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  286517c93031c343f809f64b38563a783614b762e1367242af6cdd4107335471  LICENSE
diff --git a/package/python-pyspnego/python-pyspnego.mk b/package/python-pyspnego/python-pyspnego.mk
index 4dccc57fad..5e982ac7cf 100644
--- a/package/python-pyspnego/python-pyspnego.mk
+++ b/package/python-pyspnego/python-pyspnego.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSPNEGO_VERSION = 0.11.2
+PYTHON_PYSPNEGO_VERSION = 0.12.0
 PYTHON_PYSPNEGO_SOURCE = pyspnego-$(PYTHON_PYSPNEGO_VERSION).tar.gz
-PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/6b/f8/53f1fc851dab776a183ffc9f29ebde244fbb467f5237f3ea809519fc4b2e
+PYTHON_PYSPNEGO_SITE = https://files.pythonhosted.org/packages/f9/e4/8b32a91aeba6fbc6943a630c44b2fe038615e5c7dec8814316fafdcf4bf4
 PYTHON_PYSPNEGO_SETUP_TYPE = setuptools
 PYTHON_PYSPNEGO_LICENSE = MIT
 PYTHON_PYSPNEGO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
