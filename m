Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8387F10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:17:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A6D340D38;
	Sat, 14 Mar 2026 14:17:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id COy-D2LEOvDk; Sat, 14 Mar 2026 14:17:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 731F140DC8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497848;
	bh=wjUQqDMIabvoihcisHiXFScKpoyywUj1ye/iQ+Wm4oE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=p9dNQ5CmZH2rSj4hUZOyb33RmCKt9Nfp6mJkfAmtuT7lSvIBo9T+d7hwUdmDVeXAi
	 v4hrTVUcz5PgiJ9uVKk7zvPHyWBrKZNwajI9eaa/SiULPsvJpRpThGJy820ZoMadUv
	 fSqpsoQG4dYOPUH6eonIYRbNm6FcAuJ0mwVNoDrv74FdYWhLKnx0W9yy5F83EC4BB+
	 p5AHwwDjSQueGaU1arDUEFg4oKxEOK2HHEZzP0KtpqOORkV0C9reGNRthqgJvXztzA
	 aicqYzcbyhfRnO2/ZHKS+oym2vVmqgYx1YrvJfxxwiYFWsZpu2TsgcjCP96ybzYVFU
	 8goFFiLkQGhYA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 731F140DC8;
	Sat, 14 Mar 2026 14:17:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 05FEB1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E080181303
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id GYqRUIyERxWG for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:17:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C843D812FC
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C843D812FC
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C843D812FC
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:17:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A1778A4C179C;
 Sat, 14 Mar 2026 15:06:59 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdS-000000003UM-0FeI;
 Sat, 14 Mar 2026 14:06:34 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:08 +0100
Message-ID: <20260314140633.2967249-12-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497219;
 bh=88bkxLUfnsRoSSv9jfcnmRrQ4ltiFGJEBn43mECNoGc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=gS65ow8vYL63VkL/N6NtmQ6IpEoeae2hIiNcoGg0vnHJiWqtm7IHrad9VuNbS4CIu
 tessXhFc/YTafHW9OV+5LJR/sgMXK1yHxHKALMKr3Yk2s8gwAdGx00oKQDy+9RUi0F
 R6Csb0vXGmDGB7b7CBTRNbMmRrcpA0eqRld60MZussoyX9XbT0WspQXpcAZ9TpV3YG
 lH9z8SqlelxkkIo0qzEVIDM+T4FOj91pCvcAi4KiEJTw7hIMjg7jJJuiTy4qCXUQlf
 oIGNuaiwm14GUFrfuhNU5yjUc3+GvTyH2KoTqAJEa7rYfMsPet8P6qJSaYcUyOiXOI
 AdSLsXCmVvdkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=gS65ow8v
Subject: [Buildroot] [PATCH 12/96] package/python-cssselect: bump version to
 1.4.0
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

https://github.com/scrapy/cssselect/blob/v1.4.0/CHANGES
"Switched the build system to ``hatchling``."

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-cssselect/python-cssselect.hash | 4 ++--
 package/python-cssselect/python-cssselect.mk   | 6 +++---
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-cssselect/python-cssselect.hash b/package/python-cssselect/python-cssselect.hash
index d9b89d1c61..9e7f8e6244 100644
--- a/package/python-cssselect/python-cssselect.hash
+++ b/package/python-cssselect/python-cssselect.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/cssselect/json
-md5  e0148abb13430399cbdbc173c3fa1c80  cssselect-1.3.0.tar.gz
-sha256  57f8a99424cfab289a1b6a816a43075a4b00948c86b4dcf3ef4ee7e15f7ab0c7  cssselect-1.3.0.tar.gz
+md5  3aca561a6fe4e51d2993e0a0f604e30a  cssselect-1.4.0.tar.gz
+sha256  fdaf0a1425e17dfe8c5cf66191d211b357cf7872ae8afc4c6762ddd8ac47fc92  cssselect-1.4.0.tar.gz
 # Locally computed sha256 checksums
 sha256  5c8da9f744e0afba81a48c9b5dbe73048f798b3287d6f1af8a05ee08ebb10892  LICENSE
diff --git a/package/python-cssselect/python-cssselect.mk b/package/python-cssselect/python-cssselect.mk
index 1a5087f495..d58aea52a8 100644
--- a/package/python-cssselect/python-cssselect.mk
+++ b/package/python-cssselect/python-cssselect.mk
@@ -4,10 +4,10 @@
 #
 ################################################################################
 
-PYTHON_CSSSELECT_VERSION = 1.3.0
+PYTHON_CSSSELECT_VERSION = 1.4.0
 PYTHON_CSSSELECT_SOURCE = cssselect-$(PYTHON_CSSSELECT_VERSION).tar.gz
-PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/72/0a/c3ea9573b1dc2e151abfe88c7fe0c26d1892fe6ed02d0cdb30f0d57029d5
-PYTHON_CSSSELECT_SETUP_TYPE = setuptools
+PYTHON_CSSSELECT_SITE = https://files.pythonhosted.org/packages/ec/2e/cdfd8b01c37cbf4f9482eefd455853a3cf9c995029a46acd31dfaa9c1dd6
+PYTHON_CSSSELECT_SETUP_TYPE = hatch
 PYTHON_CSSSELECT_LICENSE = BSD-3-Clause
 PYTHON_CSSSELECT_LICENSE_FILES = LICENSE
 
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
