Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 026B7CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:43:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id CC2C642957;
	Fri,  1 May 2026 12:43:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id sdQke1KYMOsE; Fri,  1 May 2026 12:43:14 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 61B3841F68
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639394;
	bh=wja4vj93eNva8evQzdlf0h7cB2r/Hyi6yVWTFqC+Dvg=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DC2d/25sxpHS4swGMawgpWa8Cozim28Ybt2ykcDeCAOytAAAw/F8rPnsDYYOQ2EkO
	 cb9n5d2MS4v5OXBrJa9mdRdEJrnVjFjRQ0Vokhd0k6uRuYpTYCgvUsPkC82S5krE9F
	 DiQw/7NN0gHaMt4L7bLGRYtB6vp8twhRSFkOqdJLQjsBB1J1hMjsnCSDYaWkGJPYqe
	 KeuokFBOCYDBwkkkfDDagYet5zduxHBUDOOwI9RKcdSyV0iGgC9G62T5xSWa7JUmj5
	 AtJw8W+3a0EXgsv/Hgdlx0h3LZXm1fWO77AL08Q0yhTerL6kychxRtEv0zCBEBG6uL
	 Uw8I327793aEg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 61B3841F68;
	Fri,  1 May 2026 12:43:14 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id F332B293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E4FBB6F790
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id W-m62cbdZbAX for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:43:12 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org A8E796128E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A8E796128E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id A8E796128E
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:43:12 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 992F4A4C304E;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1O-000000008NC-0NZk;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:47 +0200
Message-ID: <20260501123100.1918951-62-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=Ipnm2I1m2tMlqXafB04x2eTKVRVTXTh/blWjWbPiI/w=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=SaI817Tb8MOVp9LnHsjFdwIlp9YRZ1a6IbEsO0yvw8NKEBXDw4IbEcm21pHktr/MY
 603b6qOwgSjEr9CbNOBCF2Vkz8W0F6nhHgiu6S70purNn+bEJB5wM5UTZNy0MZ+6O6
 mZWi1wWSH7p8wPvdYvdPVH7pKwEF8bKAR68HGXVAM9fIJzx1VlJFvOzq7SqVzaHsgM
 F9NCI2dq8QXQzO0zAuCFR+ROntL4IKVYI1bn/y+9/Cc+tFfyCsVI3uDTW5Rd66mZuI
 Jt7661nPFEJBkoM4LIvw6JpkY7jp+fCRWMxtvCugS0jxCoLP9Itvnftpa8KxXNM728
 tizRKBKfA2pwg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=SaI817Tb
Subject: [Buildroot] [PATCH 62/75] package/python-textual: bump version to
 8.2.5
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

https://github.com/Textualize/textual/blob/v8.2.5/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-textual/python-textual.hash | 4 ++--
 package/python-textual/python-textual.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-textual/python-textual.hash b/package/python-textual/python-textual.hash
index 00a6759383..a7a60f631f 100644
--- a/package/python-textual/python-textual.hash
+++ b/package/python-textual/python-textual.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/textual/json
-md5  d94bf25d9e81458d56b86aa108bb3fea  textual-8.1.1.tar.gz
-sha256  eef0256a6131f06a20ad7576412138c1f30f92ddeedd055953c08d97044bc317  textual-8.1.1.tar.gz
+md5  c1831151f5fd52aa6f09c834e32df3b7  textual-8.2.5.tar.gz
+sha256  6c894e65a879dadb4f6cf46ddcfedb0173ff7e0cb1fe605ff7b357a597bdbc90  textual-8.2.5.tar.gz
 # Locally computed sha256 checksums
 sha256  94f290a762376dfdb7768e42070618b0abfd2a2799eab1b1c097816c3a39eb57  LICENSE
diff --git a/package/python-textual/python-textual.mk b/package/python-textual/python-textual.mk
index 9401964732..d7ada90102 100644
--- a/package/python-textual/python-textual.mk
+++ b/package/python-textual/python-textual.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TEXTUAL_VERSION = 8.1.1
+PYTHON_TEXTUAL_VERSION = 8.2.5
 PYTHON_TEXTUAL_SOURCE = textual-$(PYTHON_TEXTUAL_VERSION).tar.gz
-PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/72/23/8c709655c5f2208ee82ab81b8104802421865535c278a7649b842b129db1
+PYTHON_TEXTUAL_SITE = https://files.pythonhosted.org/packages/62/1e/1eedc5bac184d00aaa5f9a99095f7e266af3ec46fa926c1051be5d358da1
 PYTHON_TEXTUAL_SETUP_TYPE = poetry
 PYTHON_TEXTUAL_LICENSE = MIT
 PYTHON_TEXTUAL_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
