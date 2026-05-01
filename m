Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 385A3CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:40:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 0DCF94212B;
	Fri,  1 May 2026 12:40:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id NuOyIIAplbHn; Fri,  1 May 2026 12:40:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 220BC4155A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639225;
	bh=FSvvrQv/Ef20fMogITJCSLp0bAd94l043kAODjIENNM=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=l0VOc2KD0YRArx2E3qTpwtc/QcJ14BNVKIxQbdloqsdlpvq35fl3Mn6fPCEDIeNbi
	 5rDk4UTyH/4GpoiWzgJH3+xEIrq0iwbXMlVNlx/kOofkN8/kF3Ea2XiFHJglkC4Kg1
	 TXb7nBSIKTeTdsKk/th5gH/hI0RpvN/dhutmQ47JHSz7Qhk4Qr0cthGCrcBMvO7lgi
	 N6SJ828l2FSIQub2AJBtHb+zgY/FKLR867pfODwzrmHMCOKWfXP9Y/zB/0INza/Hyl
	 WU69hnK4pp+1Ejy/Vgxdt30lelSnlzOrjpefz29SO9zZXPIEgC2Z59//MGWPQzkUcl
	 C0VlHdf42S17Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 220BC4155A;
	Fri,  1 May 2026 12:40:25 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E8018293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CE22584D73
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id luai-jWPJh0M for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:40:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org B29A784BDE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B29A784BDE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id B29A784BDE
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:40:22 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 638E6A4C2EED;
 Fri,  1 May 2026 14:31:08 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1M-000000008NC-3z87;
 Fri, 01 May 2026 12:31:04 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:34 +0200
Message-ID: <20260501123100.1918951-49-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638668;
 bh=vzuebkDs42q+UhNxwPzqkSj13kkHwiLn6tyIVz3rmos=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=qpZ4Y1T9QUMGOPqmmCGr0ftsVU58fwtLShECz+VY3BjezesvQEFDKPWSEUvz3WKou
 uRaYgl3fKW932oQkOB0+st2OgBlODknZI2IIFiDucXzcwOR8P8amgSRAozs47cPWy6
 NNGoOrP3DVza95SZJTNPpGvAKNADB4wlwG6z5ykTmcsMIs7IdF9VLda1zukSbLWI+o
 HR71caiOjlXhhkX32yudpNvhcgiNT79mCabo01bN7fquoR+BvZmY8m0Ez1uWsGVIyW
 Pu3lvDy6LpaS6bJHPmp+Od8tOoYgXejRwbf79EijigreaPOXmWOoYQS4hpfSNDPj0M
 Cz+GyS71hlk5A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=qpZ4Y1T9
Subject: [Buildroot] [PATCH 49/75] package/python-regex: bump version to
 2026.4.4
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

https://github.com/mrabarnett/mrab-regex/blob/2026.4.4/changelog.txt

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-regex/python-regex.hash | 4 ++--
 package/python-regex/python-regex.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-regex/python-regex.hash b/package/python-regex/python-regex.hash
index 3251993d45..c99fc9dd62 100644
--- a/package/python-regex/python-regex.hash
+++ b/package/python-regex/python-regex.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/regex/json
-md5  d0ce2a36afe1d6fe7b6e188963db1b22  regex-2026.2.28.tar.gz
-sha256  a729e47d418ea11d03469f321aaf67cdee8954cde3ff2cf8403ab87951ad10f2  regex-2026.2.28.tar.gz
+md5  b9f15f11cde393d1959851ee9775fcda  regex-2026.4.4.tar.gz
+sha256  e08270659717f6973523ce3afbafa53515c4dc5dcad637dc215b6fd50f689423  regex-2026.4.4.tar.gz
 # Locally computed sha256 checksums
 sha256  bff55ef4cdcc8c14ce259f8e8ab60e264418440d6335f4dc138273fbd506144d  LICENSE.txt
diff --git a/package/python-regex/python-regex.mk b/package/python-regex/python-regex.mk
index 281a0e83a1..44c12789bf 100644
--- a/package/python-regex/python-regex.mk
+++ b/package/python-regex/python-regex.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_REGEX_VERSION = 2026.2.28
+PYTHON_REGEX_VERSION = 2026.4.4
 PYTHON_REGEX_SOURCE = regex-$(PYTHON_REGEX_VERSION).tar.gz
-PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/8b/71/41455aa99a5a5ac1eaf311f5d8efd9ce6433c03ac1e0962de163350d0d97
+PYTHON_REGEX_SITE = https://files.pythonhosted.org/packages/cb/0e/3a246dbf05666918bd3664d9d787f84a9108f6f43cc953a077e4a7dfdb7e
 PYTHON_REGEX_SETUP_TYPE = setuptools
 PYTHON_REGEX_LICENSE = Apache-2.0
 PYTHON_REGEX_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
