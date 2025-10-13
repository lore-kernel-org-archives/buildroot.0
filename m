Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DB31CCD18D
	for <buildroot@archiver.kernel.org>; Mon, 13 Oct 2025 17:56:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A20780E30;
	Mon, 13 Oct 2025 17:56:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id BqSpqC2yEfaZ; Mon, 13 Oct 2025 17:56:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 32AE2810CB
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 32AE2810CB;
	Mon, 13 Oct 2025 17:56:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id A44A2BC
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:56:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8AC2760768
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:56:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id RGkmssUWoVqF for <buildroot@buildroot.org>;
 Mon, 13 Oct 2025 17:56:19 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8B52D6078E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8B52D6078E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8B52D6078E
 for <buildroot@buildroot.org>; Mon, 13 Oct 2025 17:56:19 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A8822A4C69FD;
 Mon, 13 Oct 2025 19:55:15 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:43350)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v8MlO-000000005Im-3KqB;
 Mon, 13 Oct 2025 17:55:15 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 13 Oct 2025 19:54:46 +0200
Message-ID: <20251013175513.86276-9-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251013175513.86276-1-bernd@kuhls.net>
References: <20251013175513.86276-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760378115;
 bh=LmPBvzI/2LTMmdMukz67/caVRxmMki4aph6yZz15eP8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TpBWte2hMBNOr4mU/urJi1YSVjspMfkiom4JlCQUve9Hbf1UB9NpcZMPYqBpx9Bqi
 bsfk5wMg6qAEAD81/Lfjts8tS0EzOAZxv5qL2SPqL8SEvRX1gq7+oMSfvADrJr4ARl
 oRtxB9mcCWoKnLkDpm/oZv8c/pl+3u3NHiCFX7n2cdR2TJDGR7bL+7KfX27jjkMj0g
 LcJE/gZ76j2ST6PAZW4NOcKxvP48iGCKFVeMkrHUxBzI209Ka5uLAwPO3LNeoZ/ZcD
 kFLP4qddRety+7OP0e64q54+6YkcpydXASLMlVu6k5Wm2zG9FC0Lx7dNe06ClzOie9
 CxxloYNkXrzIQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=TpBWte2h
Subject: [Buildroot] [PATCH 09/36] package/python-pyasn1: bump version to
 0.6.1
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

Changelog: https://github.com/pyasn1/pyasn1/blob/v0.6.1/CHANGES.rst

Updated project URL according to https://pypi.org/project/pyasn1/

Updated license hash due to copyright year bump:
https://github.com/pyasn1/pyasn1/commit/acb78299d1270a2fea0d11e5509777b7c5777f3f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyasn1/Config.in          | 2 +-
 package/python-pyasn1/python-pyasn1.hash | 6 +++---
 package/python-pyasn1/python-pyasn1.mk   | 4 ++--
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/python-pyasn1/Config.in b/package/python-pyasn1/Config.in
index fea63813b9..fb576ffb71 100644
--- a/package/python-pyasn1/Config.in
+++ b/package/python-pyasn1/Config.in
@@ -3,4 +3,4 @@ config BR2_PACKAGE_PYTHON_PYASN1
 	help
 	  ASN.1 types and codecs.
 
-	  https://github.com/etingof/pyasn1
+	  https://github.com/pyasn1/pyasn1
diff --git a/package/python-pyasn1/python-pyasn1.hash b/package/python-pyasn1/python-pyasn1.hash
index 4347a43c46..4268d82c38 100644
--- a/package/python-pyasn1/python-pyasn1.hash
+++ b/package/python-pyasn1/python-pyasn1.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyasn1/json
-md5  dffae4ff9f997a83324b3f33fe62be54  pyasn1-0.4.8.tar.gz
-sha256  aef77c9fb94a3ac588e87841208bdec464471d9871bd5050a287cc9a475cd0ba  pyasn1-0.4.8.tar.gz
+md5  75cdc260597f112fdfefec85379e710d  pyasn1-0.6.1.tar.gz
+sha256  6f580d2bdd84365380830acf45550f2511469f673cb4a5ae3857a3170128b034  pyasn1-0.6.1.tar.gz
 # Locally computed sha256 checksums
-sha256  22c5cc6922ab5d69fba32d8c5ee4cdd14981508cb53afc0ebd85593847fd95a5  LICENSE.rst
+sha256  2aad5fc00f705c4a1addb83eed10a6a75d286a3779f0cf8519d87e62bc4735fd  LICENSE.rst
diff --git a/package/python-pyasn1/python-pyasn1.mk b/package/python-pyasn1/python-pyasn1.mk
index 60050bef18..7a5cde40fb 100644
--- a/package/python-pyasn1/python-pyasn1.mk
+++ b/package/python-pyasn1/python-pyasn1.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYASN1_VERSION = 0.4.8
+PYTHON_PYASN1_VERSION = 0.6.1
 PYTHON_PYASN1_SOURCE = pyasn1-$(PYTHON_PYASN1_VERSION).tar.gz
-PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/a4/db/fffec68299e6d7bad3d504147f9094830b704527a7fc098b721d38cc7fa7
+PYTHON_PYASN1_SITE = https://files.pythonhosted.org/packages/ba/e9/01f1a64245b89f039897cb0130016d79f77d52669aae6ee7b159a6c4c018
 PYTHON_PYASN1_SETUP_TYPE = setuptools
 PYTHON_PYASN1_LICENSE = BSD-2-Clause
 PYTHON_PYASN1_LICENSE_FILES = LICENSE.rst
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
