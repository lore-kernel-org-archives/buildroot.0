Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C01B310706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:06:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5D140FE3;
	Sat, 14 Mar 2026 14:06:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id acgZUAhhFoXp; Sat, 14 Mar 2026 14:06:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org B39B240FE4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497197;
	bh=u4s8Qdo+rl4NRe8HWQN+uv3yvFNsQGzb0tbDw6j/q4k=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:Cc:From;
	b=NTszlYF71AMCqlbqese++chQf8mWwAG63KN32zMT1aBd8AenhmXHi0w1oPHahdRH6
	 QVA4Zw1viprBvIvkBjtDGqwBSqL032dNVaur+MAtLroj/HTvV6oDzW4OHM2X5gt/7n
	 PDAd6k3N/GAfSronrI6HC26rfCdm90G3xGrNz1k+IYXr55yBKM//j1fOBJOZx4QBjc
	 oa1g6dfVNMWFGetzJhUor1+Rm/OQT2ZelS3ohOne/0sZR2wUztMEy/sYdVAuZ1ydYK
	 1ZcJBfcrrtWG61X5d4YS89CuTOCLK212DNgYS4lA4iQO2NgfACBbKzaIY+JVcQ1yqp
	 sJM63Cshqmm9g==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id B39B240FE4;
	Sat, 14 Mar 2026 14:06:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 90036201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:06:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 81637605D2
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:06:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k3avWxh7tjn2 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:06:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 756D1605CE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 756D1605CE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 756D1605CE
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:06:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 91094A4C13D3;
 Sat, 14 Mar 2026 15:06:33 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdR-000000003UM-0BqF;
 Sat, 14 Mar 2026 14:06:33 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:04:57 +0100
Message-ID: <20260314140633.2967249-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497193;
 bh=40Udnwn0FEHKQM5WtQumzZxdULDVdE+pGZSeFRMENyI=;
 h=From:To:Cc:Subject:Date:From;
 b=H0lnTB2XR4ZANUjKBI8O/3l/S4VNoVP8B+RVYpDmt1KU1qO/7sYk/zQT/iMGxznid
 cB1X5Kt/BUyUPNG5P9btDRlZf4QVBlVIVkrN15Uj+oucX+L/QbsXM/PLpWYkaSO19i
 ZZAhusqJl+bfpJiM+mUFwah0ipfj0g/HYUcaOAzax2lz6u9KPQZBimIgbBpzFwgnWK
 SmSqobpn4lQtszhw3+bqMqNYv9Er5N4CM2JZNcCMeIEMBtVBNOiLg/AXpjPPfxlJWq
 Y+xLDZpmzJd2WS1jwPW6uNfMsat65PT4A1cnoqcBTeBN2BFOnylDG3k+HsRsf3CwXl
 ivCCGcr2IcMgg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=H0lnTB2X
Subject: [Buildroot] [PATCH 01/96] package/python-hatchling: bump version to
 1.29.0
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

https://github.com/pypa/hatch/blob/hatchling-v1.29.0/docs/history/hatchling.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-hatchling/python-hatchling.hash | 4 ++--
 package/python-hatchling/python-hatchling.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-hatchling/python-hatchling.hash b/package/python-hatchling/python-hatchling.hash
index b6fb2b6d3e..8443d4f412 100644
--- a/package/python-hatchling/python-hatchling.hash
+++ b/package/python-hatchling/python-hatchling.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/hatchling/json
-md5  0d40370d4684147d6e3d1e3800298bd0  hatchling-1.28.0.tar.gz
-sha256  4d50b02aece6892b8cd0b3ce6c82cb218594d3ec5836dbde75bf41a21ab004c8  hatchling-1.28.0.tar.gz
+md5  52ab8110a3a114ddeeb7dd82a624ca53  hatchling-1.29.0.tar.gz
+sha256  793c31816d952cee405b83488ce001c719f325d9cda69f1fc4cd750527640ea6  hatchling-1.29.0.tar.gz
 # Locally computed sha256 checksums
 sha256  7f143a8127ad4873862d70854b5bd2abd0085aa73e64fd2b08704a3b9f5c07fc  LICENSE.txt
diff --git a/package/python-hatchling/python-hatchling.mk b/package/python-hatchling/python-hatchling.mk
index a5a29aa20b..e82cb8d5b4 100644
--- a/package/python-hatchling/python-hatchling.mk
+++ b/package/python-hatchling/python-hatchling.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_HATCHLING_VERSION = 1.28.0
+PYTHON_HATCHLING_VERSION = 1.29.0
 PYTHON_HATCHLING_SOURCE = hatchling-$(PYTHON_HATCHLING_VERSION).tar.gz
-PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/0b/8e/e480359492affde4119a131da729dd26da742c2c9b604dff74836e47eef9
+PYTHON_HATCHLING_SITE = https://files.pythonhosted.org/packages/cf/9c/b4cfe330cd4f49cff17fd771154730555fa4123beb7f292cf0098b4e6c20
 PYTHON_HATCHLING_LICENSE = MIT
 PYTHON_HATCHLING_LICENSE_FILES = LICENSE.txt
 PYTHON_HATCHLING_SETUP_TYPE = pep517
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
