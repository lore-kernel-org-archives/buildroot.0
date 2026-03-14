Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 279B010706DE
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:21:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id F1CDB40A55;
	Sat, 14 Mar 2026 14:21:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id X40OoHccbTm7; Sat, 14 Mar 2026 14:21:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 136FB40A5B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498114;
	bh=LcCeD/8yzDw7cuqk/oh09YS+Iopax5kLWVjMVhd2LbU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=EKVrNeD4tavFq4PsXEq8nZoYkL8dkMCj6kHl4iYVV8TqeePWYsDIQCcsQPOogGYDG
	 vrY8G4mGJ+A+71fqN2gyZllX1bfVFE0ZnxUyX2G0OSv06VIKsUAuW54ipQXLgjdiPQ
	 g9vj3IEE9L4eQNpXUzoWAiVi3b0skehh4z6r0bsgwF65D7sByviQ7rulSTkPo6k06q
	 mCHU5ueIWdb+gMklEuhni+gw4N5q/zFZ29mEMmsWW00elEFoBpvYztXz7vrDSX5azA
	 NQtlKP3L6m1LkaSGuPunhaZ0gO0Gfq/yUsezr4LekJc1V/cyYObFYSjGOwBDDbNHwy
	 ImWOL1sTNY+oA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 136FB40A5B;
	Sat, 14 Mar 2026 14:21:54 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 02AFD1B4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 5078F4040B
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Co7ZUMm7GAht for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:21:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CCB5240A55
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CCB5240A55
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CCB5240A55
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 12E86A4C1A0D;
 Sat, 14 Mar 2026 15:07:04 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-405C;
 Sat, 14 Mar 2026 14:06:36 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:29 +0100
Message-ID: <20260314140633.2967249-33-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497224;
 bh=COJIAKQU128xN9t+kN+2gppk/AshTy+GfCTKp8FCLuo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=fe9T7jZY1OEEJLuRAnfC6juHtQhLLWkAH4tbhrC8W7/L/wS2SfRB0e0sZZI6jUN5e
 RVf3aY7YnhBIQYEvN01lHdFP4ABaWxWNOBZOtKy7Ir9mNJcvp90FceG72RpGOW49Xy
 1FLi+htsna7ZeKA1eyd9PaPfHaedjdb4Xn9d4SuWvL8ooiXcVY6Srlcq64XV/Molk2
 mMV0B0leDGy1isYp1NLFIifsFW2Yy9w9Jct3OmThfGpyZpn0xPgjnIMHk83VYaCcUZ
 agVBTBN/5e3fy5KiTFVQjvTOc6DUTChAR91oqabwKm4SBzqAqFjSfgfQyuKlIrJd91
 WDuA4Wr0LnJYQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=fe9T7jZY
Subject: [Buildroot] [PATCH 33/96] package/python-markdown2: bump version to
 2.5.5
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

https://github.com/trentm/python-markdown2/blob/2.5.5/CHANGES.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-markdown2/python-markdown2.hash | 4 ++--
 package/python-markdown2/python-markdown2.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-markdown2/python-markdown2.hash b/package/python-markdown2/python-markdown2.hash
index c412c6c012..76a77d97d0 100644
--- a/package/python-markdown2/python-markdown2.hash
+++ b/package/python-markdown2/python-markdown2.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/markdown2/json
-md5  b61518f0e66d3f35d404ed595252853c  markdown2-2.5.4.tar.gz
-sha256  a09873f0b3c23dbfae589b0080587df52ad75bb09a5fa6559147554736676889  markdown2-2.5.4.tar.gz
+md5  81a628175ca4ec7ffb9428e0609d4fe3  markdown2-2.5.5.tar.gz
+sha256  001547e68f6e7fcf0f1cb83f7e82f48aa7d48b2c6a321f0cd20a853a8a2d1664  markdown2-2.5.5.tar.gz
 # Locally computed sha256 checksums
 sha256  f8c7c4d554409cf621b8d653dbfffb719745fd36f5c49b8305258649b403ef9c  LICENSE.txt
diff --git a/package/python-markdown2/python-markdown2.mk b/package/python-markdown2/python-markdown2.mk
index a8737b5b49..1de824e57f 100644
--- a/package/python-markdown2/python-markdown2.mk
+++ b/package/python-markdown2/python-markdown2.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MARKDOWN2_VERSION = 2.5.4
+PYTHON_MARKDOWN2_VERSION = 2.5.5
 PYTHON_MARKDOWN2_SOURCE = markdown2-$(PYTHON_MARKDOWN2_VERSION).tar.gz
-PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/42/f8/b2ae8bf5f28f9b510ae097415e6e4cb63226bb28d7ee01aec03a755ba03b
+PYTHON_MARKDOWN2_SITE = https://files.pythonhosted.org/packages/e4/ae/07d4a5fcaa5509221287d289323d75ac8eda5a5a4ac9de2accf7bbcc2b88
 PYTHON_MARKDOWN2_SETUP_TYPE = setuptools
 PYTHON_MARKDOWN2_LICENSE = MIT
 PYTHON_MARKDOWN2_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
