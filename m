Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B48510706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:16:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3634E406B3;
	Sat, 14 Mar 2026 14:16:53 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8WXo-P1am4Xo; Sat, 14 Mar 2026 14:16:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5C9F5406B8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497812;
	bh=PuRl7U2ILPKJuze32VN1WdVgExu7uCiHoYQ4/OxFR6Y=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sX8p8dVbiI+SjqAjJa57dIJhmh13bgbKQQ+YmiG9dM+jcE4OkKr90YDxkSy6pXKZY
	 d5clKg4UExzO3nUMvYx2ObNG9QcTMbWxWjVNzdAg7Fna8FNo6Jwz1BgF5ErUemp+v8
	 IocuAImUjrnt+GwathfJ4AZ/mGLicyIayOPdt9lL4q4HW/rbGuVJ5Gpuo6/iLX2Zmh
	 x0GLFrVcdVykV39o45rAJjHUNlSsgJFQamdHcTA6S3mtG+FRkpKgfygzyHa0ShvlFq
	 gHfcvuutqwgf+AbzGUEGMO+664vilQG6cD45WE+iQN3kf+EjH24PUOPmsWVdjyu9Xh
	 iM8z8f8bknQfw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5C9F5406B8;
	Sat, 14 Mar 2026 14:16:52 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 115853C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id EB15D406AA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id c5T3UkyzwsHl for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:16:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org E0B83406A4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org E0B83406A4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id E0B83406A4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:16:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B7FF6A4C172A;
 Sat, 14 Mar 2026 15:06:58 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-1jF6;
 Sat, 14 Mar 2026 14:06:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:01 +0100
Message-ID: <20260314140633.2967249-5-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497218;
 bh=lp2RtFIBB3c+gh12+/sUnZkA/LKqQKtWglmisHv5e2Q=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=KtuSfJPAsCSfSm1M8xerNS8dN/ECbupxPsHZHfUqEHQvMxPupM8vrUWM3ZCwKdImS
 ys2vbAORbrQAaI2i1PAcxBruN/I2nC2mhWjnQG3GEQmIwqyGpzoHJziokQ5/h2A7xP
 4RpCHj82axHu51J4WpTcQFRd2QOON9/X5YYyHnYyVM+1Xwls1fr5Nk07GQpAlNSNe3
 fE67U7AE2/Uu3FVAPuDLGkeEERRDJKqGTVkg6UCieoci7RRCMvxLJUBuYV40t++h7t
 +NxSaAcDkwPZAmiLpmrPrCXxHD/65vCNqDv8e2NXI6yrEyuMnGKO2YPTq3WnImx33k
 AVXCKqu7lJhmw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=KtuSfJPA
Subject: [Buildroot] [PATCH 05/96] package/python-apispec: bump version to
 6.10.0
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
 Ralf Dragon <hypnotoad@lindra.de>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Mauro Condarelli <mc5686@mclink.it>, Heiko Thiery <heiko.thiery@gmail.com>,
 Marcus Hoffmann <bubu@bubu1.eu>, Joseph Kogut <joseph.kogut@gmail.com>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Gwenhael Goavec-Merou <gwenhael.goavec-merou@trabucayre.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Lionel Flandrin <lionel@svkt.org>, Fiona Klute <fiona.klute@gmx.de>,
 Colin Foster <colin.foster@in-advantage.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Romain Naour <romain.naour@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/marshmallow-code/apispec/blob/6.10.0/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-apispec/python-apispec.hash | 4 ++--
 package/python-apispec/python-apispec.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-apispec/python-apispec.hash b/package/python-apispec/python-apispec.hash
index 45571f4c53..cd3a0c8aaf 100644
--- a/package/python-apispec/python-apispec.hash
+++ b/package/python-apispec/python-apispec.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/apispec/json
-md5  ccd10389ca94fe9acc7ff542b9bf1fa2  apispec-6.9.0.tar.gz
-sha256  7a38ce7c3eedc7771e6e33295afdd8c4b0acdd9865b483f8cf6cc369c93e8d1e  apispec-6.9.0.tar.gz
+md5  847fa44044377f3e52bf15abc471fe8c  apispec-6.10.0.tar.gz
+sha256  0a888555cd4aa5fb7176041be15684154fd8961055e1672e703abf737e8761bf  apispec-6.10.0.tar.gz
 # Locally computed sha256 checksums
 sha256  f345555ff39d6b573342781a6346a5202a8f14bce424fee41f910c6c5379cc7d  LICENSE
diff --git a/package/python-apispec/python-apispec.mk b/package/python-apispec/python-apispec.mk
index 2cc8bc2304..ddbb211244 100644
--- a/package/python-apispec/python-apispec.mk
+++ b/package/python-apispec/python-apispec.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_APISPEC_VERSION = 6.9.0
+PYTHON_APISPEC_VERSION = 6.10.0
 PYTHON_APISPEC_SOURCE = apispec-$(PYTHON_APISPEC_VERSION).tar.gz
-PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/02/ad/30cd449f3a0cf213dd13d9af7ba869214d8c66d517939964d3f490307e46
+PYTHON_APISPEC_SITE = https://files.pythonhosted.org/packages/4a/f1/1f5a9332df3ecd90cc5ab69bc58a4174b8ba2ac1720c4c26b01d20751bf5
 PYTHON_APISPEC_SETUP_TYPE = flit
 PYTHON_APISPEC_LICENSE = MIT
 PYTHON_APISPEC_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
