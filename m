Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98C910706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:20:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BC4B1415B3;
	Sat, 14 Mar 2026 14:20:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CJMpWNuuhFpf; Sat, 14 Mar 2026 14:20:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D5BAD415B4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498051;
	bh=/0wfTbPZBh42wffQZELA++2csyDqRFaYHXoSZNYlYlM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=Ug3C3pv9RVKkKCSLj1vFEcUgr9O+DRRKmhX1B3eIr6KEiERNAmcZxXbLR4/xQsYza
	 A/d85J1PlYGzf09OUxcpXp8kItJbkV3EYwRO7UVBo82epeY5GaO8mrR3TXIWB1ZluY
	 sFgQVlMYVaDyMegnK+Y8bF8SKIAQaVirSXvZ3KAhDdxgJ32HHddKKCmwLSIjI2ffCZ
	 axPTYcnE6NLWs+kMAoPU8uPNSI/S2NatNjC6shVdrmowp1UkB4mb5ON9SdRuzeF7V4
	 kxSMtCOtDG9S/IzsL5GWZNWJ9fYmLFFMaA4mLrQukUqBdwSuL3XAmu689q0EeBMJ/K
	 XLcmPTO11nCbQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D5BAD415B4;
	Sat, 14 Mar 2026 14:20:51 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BCB21B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id BD0CB415B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:50 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DVulu5NgEzbT for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:20:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org B591C415B3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B591C415B3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id B591C415B3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:20:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E13BA4C19CC;
 Sat, 14 Mar 2026 15:07:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-2ZQ9;
 Sat, 14 Mar 2026 14:06:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:25 +0100
Message-ID: <20260314140633.2967249-29-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497223;
 bh=TLid3Ep+gZJVOtTGUE8KjpgEefUBFR3f2CpJEOzeJUI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vu7wSg5+RT9u6NybQuiwSTjCyEn5FEhHq8h4/jyLUwtn0X3SfP/MCtDYLreUKlm1X
 QSkDPR+wtv/tkwDlvMkWU+1JSqFZCTaS6EOEdeHQ3P+MKjL2KBZd9SGB1qQPzO8IZX
 p1Euq+iH7xNaneKKU4GY0q2iISCKwfMDmYPBz68q1ChmVqTEEcrSdVLYj430tTNdIH
 Gmoset89MrGpqwlJ8dV0pyKFK8uMyhc25OT2DqPYvTPPP6kCgB27AgqG+GZAle1BNd
 yp/vc7bfq0iVvsrEs3UWLzkfn14qYIpwhEqdkDHcagV/6Twcv4KYzt085JcBtVBjqU
 hCb/Iq7AlXYBQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vu7wSg5+
Subject: [Buildroot] [PATCH 29/96] package/python-jsonmodels: bump version
 to 2.8.0
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

https://github.com/jazzband/jsonmodels/blob/2.8.0/HISTORY.rst

Upstream switched to hatch:
https://github.com/jazzband/jsonmodels/commit/1c4dab695a6187ff19e5a8e0aced313af6de28a5

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-jsonmodels/python-jsonmodels.hash | 4 ++--
 package/python-jsonmodels/python-jsonmodels.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-jsonmodels/python-jsonmodels.hash b/package/python-jsonmodels/python-jsonmodels.hash
index 1b0548fd25..f7cde97b4d 100644
--- a/package/python-jsonmodels/python-jsonmodels.hash
+++ b/package/python-jsonmodels/python-jsonmodels.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/jsonmodels/json
-md5  96132e252887f840d23792c03fad2039  jsonmodels-2.4.tar.gz
-sha256  abc8dc334a1794513e511a75639f77c271ef6a2992b6793f3753c7335dd18775  jsonmodels-2.4.tar.gz
+md5  8fe7bda2a40b92e5d3fcdb7e676fd8ad  jsonmodels-2.8.0.tar.gz
+sha256  9c37ae58f0417252b743ee1fa85fc937d9696e16520824f6b221f19f62f08f9c  jsonmodels-2.8.0.tar.gz
 # Locally computed sha256 checksums
 sha256  3b1219763eec6924ddd4c4d61dee6a53c5fc9ab62707a9ad763ee363d3050cc5  LICENSE
diff --git a/package/python-jsonmodels/python-jsonmodels.mk b/package/python-jsonmodels/python-jsonmodels.mk
index 4e4eecf233..faf40cfcde 100644
--- a/package/python-jsonmodels/python-jsonmodels.mk
+++ b/package/python-jsonmodels/python-jsonmodels.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_JSONMODELS_VERSION = 2.4
+PYTHON_JSONMODELS_VERSION = 2.8.0
 PYTHON_JSONMODELS_SOURCE = jsonmodels-$(PYTHON_JSONMODELS_VERSION).tar.gz
-PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/68/00/524668dc751f9ef91e73c795b2073bf2ddb79728a474d1bcab9c6dc426d8
-PYTHON_JSONMODELS_SETUP_TYPE = setuptools
+PYTHON_JSONMODELS_SITE = https://files.pythonhosted.org/packages/04/85/0e02cbc656ef7f0f5d3db13be5b622c231bf55bbad6a8c4612ce95fcb8cf
+PYTHON_JSONMODELS_SETUP_TYPE = hatch
 PYTHON_JSONMODELS_LICENSE = BSD-3-Clause
 PYTHON_JSONMODELS_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
