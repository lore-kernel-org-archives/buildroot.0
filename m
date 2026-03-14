Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBD7710706DF
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:21:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B4C00410BA;
	Sat, 14 Mar 2026 14:21:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id qCcSiygWUsfZ; Sat, 14 Mar 2026 14:21:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D4AEF41272
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773498064;
	bh=HVeJY7hxeqQSfiQeExtebgK29aVc5cCtywXyytwPJEQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ZZBLLmJwppig3Ny8brLrb87lPiHiEt1GLRVLFLPcSSwrdDzQLpQU1pJIhjmD+zUxu
	 R7kgptyd2MecD1LxoIWi2tzcQ6VArZU2iI6gs1d/uOkzn/4VcI+vB0Cw8CQGoGKI+y
	 EsfGyLIIVELcynLlEGvXip84OtFrL+JKj5VNrC9nFQYfC02yAUaCGm+kDxmzf/twb7
	 kBriJCbYyN/AWu6bveXkSEY21/JNEwSBypIYoKO6NQ/+65KpJ8UZfQWBPAhKccviuV
	 Tz6fPEG4q+Nb1rme/xY/oWOKbaa8qnp0mfixylVL/DmLDNTOU3i2kw7Nk7V33k0KEk
	 RCxqEnT5HSZZg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id D4AEF41272;
	Sat, 14 Mar 2026 14:21:04 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A0EF201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 57D66415B3
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id llMqXJuGYzhC for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:21:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 4A503410BA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4A503410BA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 4A503410BA
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:21:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6E59DA4C19FC;
 Sat, 14 Mar 2026 15:07:03 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdT-000000003UM-2BW7;
 Sat, 14 Mar 2026 14:06:35 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:24 +0100
Message-ID: <20260314140633.2967249-28-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497223;
 bh=6POPWsmKfvmi4oj0HRz7XfmqJiJO0Kvi2/F0AjT/o4I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Bx9bm/IrtNFb1+EN+A2gM69NWaVLQZxZzahhlLhGNu3fqvYpVmcCSlGTfwV7Ez0Y/
 iET/RSW6TgcObfJN2eO7tuuUL3mau8pIKk054v0OMGuYv4LDBzj5jjzCO55PGAGjbH
 seZE0CaHl8JcA99qj9wNHKwtKNkto6ap0Y6s/I0AJwH3I6+4fLDYZgc9TaqYHeRukT
 2SJzJNhX7O0yYmHLn+kBo8X1R9iKJalH44iS8MdiILSxFXP51WQtLLEr8fC2sc0Q1T
 j776faFPxBhQICbJl8/0noL5DMWx04+8OqZIAMm3EoPSwOh72tm0UbhVdW0l/15GSF
 xDjcsmJoxQp3A==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Bx9bm/Ir
Subject: [Buildroot] [PATCH 28/96] package/python-jmespath: bump version to
 1.1.0
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

Upstream removed the old license file
https://github.com/jmespath/jmespath.py/commit/772c03afe10f5b09c5f5a31742a76777f4f0fc34

and added a new one
https://github.com/jmespath/jmespath.py/commit/5634c661b8e42294f04de610ef8906b59ed96eee

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-jmespath/python-jmespath.hash | 5 +++--
 package/python-jmespath/python-jmespath.mk   | 6 +++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/package/python-jmespath/python-jmespath.hash b/package/python-jmespath/python-jmespath.hash
index 03f64f3b74..147688a899 100644
--- a/package/python-jmespath/python-jmespath.hash
+++ b/package/python-jmespath/python-jmespath.hash
@@ -1,5 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/jmespath/json
-md5  2dd28beb22d698f58fe2281bfe5fe3a3  jmespath-1.0.1.tar.gz
-sha256  90261b206d6defd58fdd5e85f478bf633a2901798906be2ad389150c5c60edbe  jmespath-1.0.1.tar.gz
+md5  ecc9e47d433b539b7fc87e61972d3746  jmespath-1.1.0.tar.gz
+sha256  472c87d80f36026ae83c6ddd0f1d05d4e510134ed462851fd5f754c8c3cbb88d  jmespath-1.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  66b313cce80ed0623fc7db3f24863a0c80fd83eb341a46b57864158ae74faa56  LICENSE.txt
+sha256  6eefacfa4d71b82d08408c751470ac8d9854538da2142cb27be0287fb13d0ab9  LICENSE
diff --git a/package/python-jmespath/python-jmespath.mk b/package/python-jmespath/python-jmespath.mk
index a94a13a229..b717e2e3ed 100644
--- a/package/python-jmespath/python-jmespath.mk
+++ b/package/python-jmespath/python-jmespath.mk
@@ -4,11 +4,11 @@
 #
 ################################################################################
 
-PYTHON_JMESPATH_VERSION = 1.0.1
+PYTHON_JMESPATH_VERSION = 1.1.0
 PYTHON_JMESPATH_SOURCE = jmespath-$(PYTHON_JMESPATH_VERSION).tar.gz
-PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/00/2a/e867e8531cf3e36b41201936b7fa7ba7b5702dbef42922193f05c8976cd6
+PYTHON_JMESPATH_SITE = https://files.pythonhosted.org/packages/d3/59/322338183ecda247fb5d1763a6cbe46eff7222eaeebafd9fa65d4bf5cb11
 PYTHON_JMESPATH_SETUP_TYPE = setuptools
 PYTHON_JMESPATH_LICENSE = MIT
-PYTHON_JMESPATH_LICENSE_FILES = LICENSE.txt
+PYTHON_JMESPATH_LICENSE_FILES = LICENSE
 
 $(eval $(python-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
