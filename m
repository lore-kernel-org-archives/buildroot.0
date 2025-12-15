Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D84E5D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:18:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A9B9240AC1;
	Mon, 15 Dec 2025 19:18:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VkZBbpgWDo8a; Mon, 15 Dec 2025 19:18:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 408D340435
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826299;
	bh=vlgidIxZ4E/DXHUH/agwicY9ivddeGUyci2tDV9MERo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=gK/B+HzNf9I5tKIwFmZx3LmnbnV7a5JFf83Yb2AwVVRFBN+GWkSeJOhajVheHa8Va
	 6ie/h9to2/EemlaydWxv/IakrQD3fzry5VMIaGqFJSrk17AB6Euba74WKiek7yUJDy
	 bhKcLhPxNsMh4TVVW66+jnvXeaTR7avPzsNyS+A24nHDEP+5mTlGTjr2APXtQjUh31
	 WqJqFW8pMosSgdgaFR7pIcb7G/EAuZS26qgnqBOjMPZF4BlFGWdwAvuiYGaArbVtZa
	 d3Vem0a3ZctzOBH3oR3UKzQSa1BSQ/DS3/Bfpw+vJnt1wDfX7yCuJX6xoBdIzw99R6
	 ykFxEKcV1IjiA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 408D340435;
	Mon, 15 Dec 2025 19:18:19 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 3D60F255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 23C51819F3
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9U1uFu2xiZci for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:18:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 0E7948082A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0E7948082A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 0E7948082A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:18:17 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 15217A4C435D;
 Mon, 15 Dec 2025 20:14:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-36WG;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:08 +0100
Message-ID: <20251215191416.421755-19-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826070;
 bh=IfKr6gvO/YHzzwCHzILyDnXtjB38CAiBMqAFCTLq3+k=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=QiZp/964jk/xx1lvJmNSYg54cSqpxtjb+F71bwqFASbrH8GsYMUceMVNQCu1lsmaE
 3dEvQzMKm1lPNrK33+Hl4P9A45EwhJ68YNinwJqaXphrktSl6MfX1MaMGYuV57Tz6A
 QkaZRG7U4NX5a3UeeeoU/RYNMZ6ejwfOj0qEIPWrPLPzuxHTxtMCtxz5zJyj9rk95h
 ZTWD8s8rsDTyjqPbyX+tbxa/sPUioDtR098Qizr8StIobY3Fp+8AmSgB5Fis/SHrJA
 JMZFstPb4MYhqgtasfEResyr++RSut3PcbYDbhg9IvfwIZb5EvzgtwbToUcUqmwGNO
 F8jHZkwYUu8Hw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=QiZp/964
Subject: [Buildroot] [PATCH 19/27] package/python-pythran: bump version to
 0.18.1
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

https://github.com/serge-sans-paille/pythran/blob/0.18.1/Changelog

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pythran/python-pythran.hash | 4 ++--
 package/python-pythran/python-pythran.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pythran/python-pythran.hash b/package/python-pythran/python-pythran.hash
index b0a0b04258..7b428a18f0 100644
--- a/package/python-pythran/python-pythran.hash
+++ b/package/python-pythran/python-pythran.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/pythran/json
-md5  829c5cba97e1339556251b631f4faeca  pythran-0.18.0.tar.gz
-sha256  5c003e8cbedf6dbb68c2869c49fc110ce8b5e8982993078a4a819f1dadc4fc6a  pythran-0.18.0.tar.gz
+md5  9b906f8af949adfd1a132ad9e26f49f9  pythran-0.18.1.tar.gz
+sha256  8803ed948bf841a11bbbb10472a8ff6ea24ebd70e67c3f77b77be3db900eccfe  pythran-0.18.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0be9f14c66a9a3cb66d5263a6495437862ce0c9cdf60d4a6c36d1e51b1244c6e  LICENSE
 sha256  e1c0ed0a99e4462016d79d835f1f479b78c4d4a07fe66598e97f449503ffd178  docs/LICENSE.rst
diff --git a/package/python-pythran/python-pythran.mk b/package/python-pythran/python-pythran.mk
index 358b0c9ec1..271824585a 100644
--- a/package/python-pythran/python-pythran.mk
+++ b/package/python-pythran/python-pythran.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYTHRAN_VERSION = 0.18.0
+PYTHON_PYTHRAN_VERSION = 0.18.1
 PYTHON_PYTHRAN_SOURCE = pythran-$(PYTHON_PYTHRAN_VERSION).tar.gz
-PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/94/0a/95a72f09f25dae48f41e367959075ed4c7a0ff02dd3f54eec111501d648a
+PYTHON_PYTHRAN_SITE = https://files.pythonhosted.org/packages/d4/84/17c4c44a24f5ec709991e603e601bf316d09c4fe915fbe348c689dede998
 PYTHON_PYTHRAN_SETUP_TYPE = setuptools
 PYTHON_PYTHRAN_LICENSE = BSD-3-Clause
 PYTHON_PYTHRAN_LICENSE_FILES = LICENSE docs/LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
