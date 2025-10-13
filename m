Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB7D1CCD18D
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 17:59:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9DB4561426;
	Mon, 13 Oct 2025 17:59:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e1EffixI52Ix; Mon, 13 Oct 2025 17:59:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BCBEB61447
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BCBEB61447;
	Mon, 13 Oct 2025 17:59:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id F0560BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E243980C39
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uShWV1tsUop2 for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 17:59:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org E412380C22
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E412380C22
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id E412380C22
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:59:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 79F11A4C6A0D;
 Mon, 13 Oct 2025 19:55:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlQ-000000005Im-2ndb;
 Mon, 13 Oct 2025 17:55:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:54:59 +0200
Message-ID: <20251013175513.86276-22-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378117;
 bh=y9FPjRAu8V1IrmI1JNpPLOlRV/BPEOgd/jHTv1DQuWo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=RcCjsKGdmUrwj7bDP8egG4VorlpLIfV5aioqRivE8JrJF3+sT9XdNirmkU/rTb+NK
 gOhEOajZaTIqtuM8SvXa9wxdDiNSerEzvHSaBhrQnEGQUC2fnjyMsBRSzbTEjpdC4Z
 dzZC2DU+ygBjsaNi2PEuGSoAhLKwx5bk9veMWUS8gyDEeVkgORKCOmwVuNPpsIQzda
 RoGOc7UZBxHPw9dDzF++H7hjyxjf2a0FZUZBqEcscmU8QDn6cAleOx3+upmqZ3JPZd
 nZZvlgMv8C0CZRKr6M67SSkRjdmCa+jTZGfKxpnYNjrND8gv2GmAtLEi0WGO9MWkOw
 y+HGQJK1xXvvg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202506031021 header.b=RcCjsKGd
Subject: [Buildroot] [PATCH 22/36] package/python-pyyaml: bump version to
 6.0.3
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
Cc: Geoffrey Ragot <geoffreyragot@gmail.com>,
 Joseph Kogut <joseph.kogut@gmail.com>, Olivier Matz <olivier.matz@6wind.com>,
 =?UTF-8?q?Fl=C3=A1vio=20Tapaj=C3=B3s?= <flavio.tapajos@newtesc.com.br>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Nasser Afshin <afshin.nasser@gmail.com>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Ludovic Desroches <ludovic.desroches@microchip.com>,
 Falco Hyfing <hyfinglists@gmail.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Michael Trimarchi <michael@amarulasolutions.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>, Marcus Hoffmann <bubu@bubu1.eu>,
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyyaml/python-pyyaml.hash | 6 +++---
 package/python-pyyaml/python-pyyaml.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-pyyaml/python-pyyaml.hash b/package/python-pyyaml/python-pyyaml.hash
index 47bd6d1ef9..96450f0858 100644
--- a/package/python-pyyaml/python-pyyaml.hash
+++ b/package/python-pyyaml/python-pyyaml.hash
@@ -1,5 +1,5 @@
-# md5, sha256 from https://pypi.org/pypi/PyYAML/json
-md5  9600ee49b2b4e1a0237cf4173b6dc594  pyyaml-6.0.2.tar.gz
-sha256  d584d9ec91ad65861cc08d42e834324ef890a082e591037abe114850ff7bbc3e  pyyaml-6.0.2.tar.gz
+# md5, sha256 from https://pypi.org/pypi/pyyaml/json
+md5  dbc6f815cd75160ccf12e470be1c8d6e  pyyaml-6.0.3.tar.gz
+sha256  d76623373421df22fb4cf8817020cbb7ef15c725b9d5e45f17e189bfc384190f  pyyaml-6.0.3.tar.gz
 # Locally computed sha256 checksums
 sha256  8d3928f9dc4490fd635707cb88eb26bd764102a7282954307d3e5167a577e8a4  LICENSE
diff --git a/package/python-pyyaml/python-pyyaml.mk b/package/python-pyyaml/python-pyyaml.mk
index 1101b59276..bfbf5276a6 100644
--- a/package/python-pyyaml/python-pyyaml.mk
+++ b/package/python-pyyaml/python-pyyaml.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYYAML_VERSION = 6.0.2
+PYTHON_PYYAML_VERSION = 6.0.3
 PYTHON_PYYAML_SOURCE = pyyaml-$(PYTHON_PYYAML_VERSION).tar.gz
-PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/54/ed/79a089b6be93607fa5cdaedf301d7dfb23af5f25c398d5ead2525b063e17
+PYTHON_PYYAML_SITE = https://files.pythonhosted.org/packages/05/8e/961c0007c59b8dd7729d542c61a4d537767a59645b82a0b521206e1e25c2
 PYTHON_PYYAML_SETUP_TYPE = setuptools
 PYTHON_PYYAML_LICENSE = MIT
 PYTHON_PYYAML_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
