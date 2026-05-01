Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A10CD3424
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:42:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 848C16F7AB;
	Fri,  1 May 2026 12:42:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 22_3TeiM03oc; Fri,  1 May 2026 12:42:50 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 47A1D6F773
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777639370;
	bh=TgzGB83q2yrUbE9awWOb5m2ZYm8oVbCAdnMzBbGGrUo=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=eRGfWDGna4t+RgfR9yyH+6775/XuQnWgwmVfJCBJgUx0ERJSMd3UdMfNtUnzEsTvk
	 34beTgolg7C+CpP4+7qdPdeuIfDlr0tsdlSN5yyhkRW4+OAgPIw/60gOV/fvjjqQHf
	 mpWy7zddCp5c6TVkfQz6GXl5u66jK0BaRVGAEYWssLzuIh2RNyTfPtjzlDRpuQcHQ9
	 jDBkzjSmHTsktAJWdG1mw/mnCSuSpX57oz/DnxuRP7GwqIIxD6ou4yWkmwuNKmHCe8
	 KCErXf6rpBqzacuIVGRW9boiO5H9lVgW0eKmjvjBj6hvjHR+MGpS2+O/A9X8C/JnVu
	 lrQN7+OiAAM2A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 47A1D6F773;
	Fri,  1 May 2026 12:42:50 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 43358127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 28FC6852E5
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:49 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id guYDHZyfr44F for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:42:48 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 17A41852E4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 17A41852E4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 17A41852E4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:42:48 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7BF4AA4C2F24;
 Fri,  1 May 2026 14:31:09 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1N-000000008NC-3XNq;
 Fri, 01 May 2026 12:31:05 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:44 +0200
Message-ID: <20260501123100.1918951-59-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638669;
 bh=3MaUdyceRxc2HwTJ7SE80riYxftyzuFDG79ckh5e8dE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=CU3RNBia1ucV4U6LpxTZ9GTzgnS/rRMdJnUWLAcSPDWRwOCRVVbX6z9/4yKrZ9KrG
 N9JHhc/c8C1foQskSLa01ZmqzWtxC1lKgH8d+pV/XvECqAqdDSmdBxU7pG6bd05NT9
 +Qg8otfGxn9IVGIUbFpHTt4sO1hU2pwPGBy+w+7bTbDCcF8NOIDwkfG7cSAUyTHhzn
 eojyE/ADwyTzdFj307EMO/M0IfVRKArFPu004QrGT1Pm5lxl5oF5BQ31engMUF4HsS
 9fdDDvgfXP/LG7db30MORVlPaEw7t0xQDoLgWeA2iHwZuZjvvOnwqVQl+wVREuyk0p
 XnzT3QhMYJUJA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=CU3RNBia
Subject: [Buildroot] [PATCH 59/75] package/python-sqlalchemy: bump version
 to 2.0.49
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

https://github.com/sqlalchemy/sqlalchemy/blob/rel_2_0_49/doc/build/changelog/changelog_20.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 4 ++--
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index e94ae9acf2..85ef73d18c 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  6c8b6f2648f192707671d55e96ee5ce9  sqlalchemy-2.0.48.tar.gz
-sha256  5ca74f37f3369b45e1f6b7b06afb182af1fd5dde009e4ffd831830d98cbe5fe7  sqlalchemy-2.0.48.tar.gz
+md5  e7e941a14ffe78d66bf23cdaaccdee7d  sqlalchemy-2.0.49.tar.gz
+sha256  d15950a57a210e36dd4cec1aac22787e2a4d57ba9318233e2ef8b2daf9ff2d5f  sqlalchemy-2.0.49.tar.gz
 # Locally computed sha256 checksums
 sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index 88ef21f7b7..46a180a4d4 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.48
+PYTHON_SQLALCHEMY_VERSION = 2.0.49
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/73/b4a9737255583b5fa858e0bb8e116eb94b88c910164ed2ed719147bde3de
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/09/45/461788f35e0364a8da7bda51a1fe1b09762d0c32f12f63727998d85a873b
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
