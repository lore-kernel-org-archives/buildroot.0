Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2622810706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:13:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 00D5B41345;
	Sat, 14 Mar 2026 14:13:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id t664fheLlj4u; Sat, 14 Mar 2026 14:13:53 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2D9D641346
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497633;
	bh=dvBoCaDA/aJWVlHRsSgTpZZ0csmLcjJIPixe8qfewNA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=elxRVpSmP1gkOA3avlxShdTllX8EgVVWXbAAL2Jz3Wqx+J7QtU26/HLMyoDHUhgPz
	 ffLKik7WbYjqB8QsE31OMBL0SckzGH/FaYaPEmQ56J48dJXThdzAYY8u5ebrtUO/7I
	 aKOWiQsPE8EqY93EFgAH2a0POKjwPxxj6+IvY5tUflLZs392t2sTSzsPi3qgKqkAb1
	 pU3ewMzVVd9xFGreLTXhge+IrKBJZ0e4RkAOAOarJFEz5QLAzt/eCAgV6lUKrQ23xT
	 w7AbI9BqDlRWo9KDeH5AnwNPTfC6eloNoH6j9hI4++phOE6bPg8vHraAn5m2g3WZdp
	 GwRhxThzoFwcw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2D9D641346;
	Sat, 14 Mar 2026 14:13:53 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 9B1E3201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:51 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 80DDC8228F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:51 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id yjbTJuuXZXpM for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:13:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 6FBBF8228E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6FBBF8228E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 6FBBF8228E
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:13:50 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C48CFA4C1559;
 Sat, 14 Mar 2026 15:06:53 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-3UUS;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:23 +0100
Message-ID: <20260314140633.2967249-87-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497213;
 bh=soo3Tfdp20QGaxIAhCeCaYpYzPWdYaRq1TIbhnawPpQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=jXfKcQm7M090LBhHz3J7qEemYTLZjw6g266R9f3J+6V98ArmrKG3dvfRsZ8XSlP9k
 XOq2pfsLdxpSwWQ4WSVZQHCiJCl+qanAa5PhJuKjenFCSsx6dvMSQckxetMHIi+Rn+
 H0sMT7zJwEqTgNmXtSXzkV7vL19V22cEssk8hMGI6uVPtcOvy8Iyrg3zLulMeNuAzs
 Izmppoau8B7JHIGqtM9bQvq8Hwnh/hBh0JV5MsBp7APOHRBdjINoGFJq/VECP/GibW
 ENgROnSE53gMF/1CbNU1vAjX/EWi1XHH9qE+p/+ezvqyFLkp3/NAGXlPtfvo/iRKOa
 3rf8Sh9bUdG2Q==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=jXfKcQm7
Subject: [Buildroot] [PATCH 87/96] package/python-weasyprint: security bump
 version to 68.1
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

https://github.com/Kozea/WeasyPrint/blob/v68.1/docs/changelog.rst

Version 68.0 fixes CVE-2025-68616.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-weasyprint/python-weasyprint.hash | 4 ++--
 package/python-weasyprint/python-weasyprint.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-weasyprint/python-weasyprint.hash b/package/python-weasyprint/python-weasyprint.hash
index d67415bcc6..6c482e0445 100644
--- a/package/python-weasyprint/python-weasyprint.hash
+++ b/package/python-weasyprint/python-weasyprint.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/weasyprint/json
-md5  55d8d8d72a1e7e6b209f7485fd5ad1f6  weasyprint-67.0.tar.gz
-sha256  fdfbccf700e8086c8fd1607ec42e25d4b584512c29af2d9913587a4e448dead4  weasyprint-67.0.tar.gz
+md5  be6662c500fe803df4f2d1bf512671af  weasyprint-68.1.tar.gz
+sha256  d3b752049b453a5c95edb27ce78d69e9319af5a34f257fa0f4c738c701b4184e  weasyprint-68.1.tar.gz
 # Locally computed sha256 checksums
 sha256  bfd14eccfa6100575460e685556b183399d4bd335904e3c9521b0116d21c54da  LICENSE
diff --git a/package/python-weasyprint/python-weasyprint.mk b/package/python-weasyprint/python-weasyprint.mk
index 73bcb1b12a..b36d96fd1d 100644
--- a/package/python-weasyprint/python-weasyprint.mk
+++ b/package/python-weasyprint/python-weasyprint.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WEASYPRINT_VERSION = 67.0
+PYTHON_WEASYPRINT_VERSION = 68.1
 PYTHON_WEASYPRINT_SOURCE = weasyprint-$(PYTHON_WEASYPRINT_VERSION).tar.gz
-PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/fd/bc/79a65b3a406cb62a1982fec8b49134b25a3b31abb094ca493c9fddff5492
+PYTHON_WEASYPRINT_SITE = https://files.pythonhosted.org/packages/db/3e/65c0f176e6fb5c2b0a1ac13185b366f727d9723541babfa7fa4309998169
 PYTHON_WEASYPRINT_SETUP_TYPE = flit
 PYTHON_WEASYPRINT_LICENSE = BSD-3-Clause
 PYTHON_WEASYPRINT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
