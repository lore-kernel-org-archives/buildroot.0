Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 708FE10706DD
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4874A415A5;
	Sat, 14 Mar 2026 14:20:18 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x71T1GNkkmcD; Sat, 14 Mar 2026 14:20:16 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C92104158E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498016;
	bh=FFefsSwl2OJlvooY/FXPlU2kou4TtDGx3RLq4/j/+O8=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=sXCadKYAcl57oMDagcjNbLo8kne/od4P2LpGQzTIl5EsHROyu725lumgjMLGUtgsS
	 uG0b4EdRWrxNPhul1EtAX/Gc8tF98voxB+jWcujb4gceG0IVXl8Eczpt4YwduCQOJS
	 gG240xvXbUDf1S0qTVS6iVo++F47ot4z95V68LAzuBVvyyNJpdz/vYhoRjfKBmo1jE
	 /omvEDpMv22O7mm9xKaKBMIYb1Pv1W4qxW34qsZ13vPNmWwOhQqS6xeJFJPjRhLFNq
	 4I7dn68IqhrtoZtkgAsn1a7PQzvBEQQ4PT/g0QI8bTIrI0f4UTH5kyJ6clWmKBokeG
	 vAOWQvE+dwftw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C92104158E;
	Sat, 14 Mar 2026 14:20:16 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9C90B201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9A3AD82258
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id xgEI1jQnR3js for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:20:14 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 8CBAE81A1C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8CBAE81A1C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 8CBAE81A1C
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:14 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id BF3CDA4C1915;
 Sat, 14 Mar 2026 15:07:02 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-0y4I;
 Sat, 14 Mar 2026 14:06:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:21 +0100
Message-ID: <20260314140633.2967249-25-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497222;
 bh=2LPzNm52K4rTxfSHlzpLQCLMbr+u2elsnk6OtuxywMY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=N8gc74G8cdvcLQqaiO3vog48mlmuO3pyQXdCXo9RCAH5FSyVZKpwNZC3TW0I+M+v/
 6eq4aLjP1epCw5Nh1NXIPAg2HXpsCkNI8P4uFgLjiLy6MWoDQ2HtLLTW+TtUV2/ZYW
 hJ0r0ff/+8Hh69Hnz/RQr+3HEiCJLnJDDE6H9x1+Obdek9LjQ+1tNFhwHFr4KisqKI
 Opl6YJTPCuyYi0qq/n6hkW7KFmx9q4eR7Mnk8t/CDYkLN6rUHueXFm/LeSqE7Ym2E1
 gQ1q0vH4j9SNca86RYCmu8eEMmIGC3g0uapizKXjUSXRkrvrZTmOIwnKxXEcSvUqA4
 VV+9/+jOASCcQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=N8gc74G8
Subject: [Buildroot] [PATCH 25/96] package/python-httplib2: bump version to
 0.31.2
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

https://github.com/httplib2/httplib2/blob/v0.31.2/CHANGELOG

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-httplib2/python-httplib2.hash | 4 ++--
 package/python-httplib2/python-httplib2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-httplib2/python-httplib2.hash b/package/python-httplib2/python-httplib2.hash
index 5d18967a6d..ffcf5cbd63 100644
--- a/package/python-httplib2/python-httplib2.hash
+++ b/package/python-httplib2/python-httplib2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/httplib2/json
-md5  b413de41724354a543f3cd33c0e75361  httplib2-0.31.0.tar.gz
-sha256  ac7ab497c50975147d4f7b1ade44becc7df2f8954d42b38b3d69c515f531135c  httplib2-0.31.0.tar.gz
+md5  957581afb1aa862ea8efbca88e13bd45  httplib2-0.31.2.tar.gz
+sha256  385e0869d7397484f4eab426197a4c020b606edd43372492337c0b4010ae5d24  httplib2-0.31.2.tar.gz
 # Locally computed sha256 checksums
 sha256  589eec38f72df2be203711d3b8cbece9b908c5e7ff00bc3cab7f63bae9e366b4  LICENSE
diff --git a/package/python-httplib2/python-httplib2.mk b/package/python-httplib2/python-httplib2.mk
index 5609a25a54..ea5b8e0008 100644
--- a/package/python-httplib2/python-httplib2.mk
+++ b/package/python-httplib2/python-httplib2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HTTPLIB2_VERSION = 0.31.0
+PYTHON_HTTPLIB2_VERSION = 0.31.2
 PYTHON_HTTPLIB2_SOURCE = httplib2-$(PYTHON_HTTPLIB2_VERSION).tar.gz
-PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/52/77/6653db69c1f7ecfe5e3f9726fdadc981794656fcd7d98c4209fecfea9993
+PYTHON_HTTPLIB2_SITE = https://files.pythonhosted.org/packages/c1/1f/e86365613582c027dda5ddb64e1010e57a3d53e99ab8a72093fa13d565ec
 PYTHON_HTTPLIB2_SETUP_TYPE = setuptools
 PYTHON_HTTPLIB2_LICENSE = MIT
 PYTHON_HTTPLIB2_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
