Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B362CD3B993
	for <buildroot@archiver.kernel.org>; Tue,  9 Dec 2025 19:44:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8B47740737;
	Tue,  9 Dec 2025 19:44:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E9j9TyqWSsxM; Tue,  9 Dec 2025 19:44:49 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 895CD4024E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765309489;
	bh=8oZIS8bhk0fEF2y+zFwz/m/iE28PNAwZipBiccPfS9E=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Xt2BPdgZXTb6c26Tm3reYTodiYn7BpmdxiV2cXpHUJ42ka8fQG3IAydTi8YJO2cM4
	 4XP1gxluOPXTkTLdZSSOeHhMlONH/5L8yENg2gao6LWElUVZi693XH9R2aFA0tIRfV
	 v5zj1FJ0YawHuzJwfqG9E1i2O0NMg3c5rXzVnZqYbEYZE6uWGb9xWC9dqHG1DzKwdk
	 tTcqVnYkwyGwmtltTJd6qjm1g356HAnJR69vLpTx29f2XWvabezlKHMCTXjctTQkGb
	 7VEZrEgG+zMvnr4u2glxrqT+/rpC+nQUATrGeRf7ennHLWqX6XhfHrbFF8BOeOmHwo
	 42PbhHzJ90pnw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 895CD4024E;
	Tue,  9 Dec 2025 19:44:49 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 7ED0AE7
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 7117740B99
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:47 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OzE_kU4CwFnr for <buildroot@buildroot.org>;
 Tue,  9 Dec 2025 19:44:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 5DFD240967
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 5DFD240967
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 5DFD240967
 for <buildroot@buildroot.org>; Tue,  9 Dec 2025 19:44:46 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1b151.dip0.t-ipconnect.de [84.161.177.81])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B3F58A4C2D05;
 Tue,  9 Dec 2025 20:40:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45534)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vT3Yv-000000006DN-3Avm;
 Tue, 09 Dec 2025 19:39:53 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue,  9 Dec 2025 20:39:45 +0100
Message-ID: <20251209193951.1000100-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251209193951.1000100-1-bernd@kuhls.net>
References: <20251209193951.1000100-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765309217;
 bh=5IuOtmMxXTQ/wN3mXZOSkyBTUGbq8RpdTM+Ww15L7RI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TThgXNyD/+ZoUXZN2pAHXXp3P5By0lfUB36Ab2R61XAhtTVEUmytNuZt07NBJ+hhy
 Q0HX03OpMxwTvMCiTfRKl/zjjk4DACmRbUrVqDtTOtEdquqgv7KFRZXodC5Ami1UuX
 X+QXe+D1uW2YszLwCkpdfkdLx09k5R8jIECaMcMKciVWIlXOx0Z6+XzfIsmm4dOtXQ
 /q+XYW00ygYZduGlVfrp3tVnXKwfoU9pUHOSM4Lp+OzpkBACosJX6I/VEjSspiO+6A
 66Kp4C8Fr5cxWAV+2WBoA70s8mWvLLCyBj7SA136tN1Jul6QSO22hU264Xt9+IUEYW
 DTJArF9qyGFFQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TThgXNyD
Subject: [Buildroot] [PATCH/next 25/31] package/python-cachetools: bump
 version to 6.2.2
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

https://github.com/tkem/cachetools/blob/v6.2.2/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cachetools/python-cachetools.hash | 4 ++--
 package/python-cachetools/python-cachetools.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-cachetools/python-cachetools.hash b/package/python-cachetools/python-cachetools.hash
index 5831c2acba..2a11fa1afb 100644
--- a/package/python-cachetools/python-cachetools.hash
+++ b/package/python-cachetools/python-cachetools.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cachetools/json
-md5  34b0025a306749e0b3619662362a76e2  cachetools-6.2.1.tar.gz
-sha256  3f391e4bd8f8bf0931169baf7456cc822705f4e2a31f840d218f445b9a854201  cachetools-6.2.1.tar.gz
+md5  f6a09127cf6d315ef12138b20a22f69e  cachetools-6.2.2.tar.gz
+sha256  8e6d266b25e539df852251cfd6f990b4bc3a141db73b939058d809ebd2590fc6  cachetools-6.2.2.tar.gz
 # Locally computed sha256 checksums
 sha256  23c4eff7a1c027a977a0b79c4497e17582c334c5f17ef6ac8ca0b52d1e7d8417  LICENSE
diff --git a/package/python-cachetools/python-cachetools.mk b/package/python-cachetools/python-cachetools.mk
index 576202a650..3e3100067d 100644
--- a/package/python-cachetools/python-cachetools.mk
+++ b/package/python-cachetools/python-cachetools.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_CACHETOOLS_VERSION = 6.2.1
+PYTHON_CACHETOOLS_VERSION = 6.2.2
 PYTHON_CACHETOOLS_SOURCE = cachetools-$(PYTHON_CACHETOOLS_VERSION).tar.gz
-PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/cc/7e/b975b5814bd36faf009faebe22c1072a1fa1168db34d285ef0ba071ad78c
+PYTHON_CACHETOOLS_SITE = https://files.pythonhosted.org/packages/fb/44/ca1675be2a83aeee1886ab745b28cda92093066590233cc501890eb8417a
 PYTHON_CACHETOOLS_SETUP_TYPE = setuptools
 PYTHON_CACHETOOLS_LICENSE = MIT
 PYTHON_CACHETOOLS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
