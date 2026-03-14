Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 230DA10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:14:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id ED6F741388;
	Sat, 14 Mar 2026 14:14:28 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uD15ONKhoMga; Sat, 14 Mar 2026 14:14:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 21881410A4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497668;
	bh=9ufcOOg9RaW7IoYj+mylQ4AbdM3IbfjbN6bsnr5dIGU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ge1RsAE+tz5YDCIUaQyh6aP1iR/TXsDyzXciXidQQr1YV9KkKU8J3oCggXsJD5PXn
	 1DHUr3NV8+imgCJvuF+g1tz5ZJiqOd8MG2IqmQSnRXzyzoiTMfATkBNVOyvCgpd0kW
	 z4Rq/tQdhYkcTLUPCvXd+FcJ5hlo/1rRtTFRoCnT6N9yaq/SlUZwgrhQZ0NDIRwC0F
	 x+UJ6dXGAJ3vz6OL/BdY40BfMvuNnMZI6PaJxQtIn5xJkkXcy+twgztq3Gk2uLa3H2
	 xbuln4Cu8E5pftR5CYxlVuhLjAQFf9jVnqgO7NEshhR0s48FB2NMsElDo90rmhfaRB
	 Uy+3a5AxmcvKw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 21881410A4;
	Sat, 14 Mar 2026 14:14:28 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 191903C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 0AC5B410F8
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ftOiO8gzsyy7 for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:14:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org EB1B141388
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EB1B141388
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id EB1B141388
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B9EF8A4C16B6;
 Sat, 14 Mar 2026 15:06:54 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdZ-000000003UM-0TCH;
 Sat, 14 Mar 2026 14:06:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:26 +0100
Message-ID: <20260314140633.2967249-90-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497214;
 bh=/XzPeMGmFmmj1q0OWnIHudT7e0G0kYVaMERY+YXvvJo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=vMG1HSPJ29UFHvGBzZ2FIrprjEBVZzEcd65y5GNDneAc9OP3qNhGh/a/iDDq9Wi7p
 YfrIhRKp31k9IUBJDsXC3pqMI/sjAsQZZblKk9mY1JJrAh+uDXDvHQ33AI7LD8WsqC
 FcAGvUBlCXTcno5HOJb5R3rBQdCCz2b2rwQrfYeS266bjNiOFjVi9A4mN0DAmr7EUo
 sOdRqlwObs5/VwHXaENQAbl0uh0q/vOcpl6NnkP8u/KSU4xC5C2ea24WF733I2DZ04
 COVVHUvXK0/F45uLkjvNse+s0GIGQQw0oIh2aEzPdqR2AjMt2fo0mIWOcmVdsRIgmA
 tbKKNX9DJQX4Q==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=vMG1HSPJ
Subject: [Buildroot] [PATCH 90/96] package/python-wheel: bump version to
 0.46.3
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

https://github.com/pypa/wheel/blob/0.46.3/docs/news.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-wheel/python-wheel.hash | 4 ++--
 package/python-wheel/python-wheel.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-wheel/python-wheel.hash b/package/python-wheel/python-wheel.hash
index 40836a5d1c..7ec38ec86b 100644
--- a/package/python-wheel/python-wheel.hash
+++ b/package/python-wheel/python-wheel.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/wheel/json
-md5  dddc505d0573d03576c7c6c5a4fe0641  wheel-0.45.1.tar.gz
-sha256  661e1abd9198507b1409a20c02106d9670b2576e916d58f520316666abca6729  wheel-0.45.1.tar.gz
+md5  61fb0c9633fe7492933a8f338db23508  wheel-0.46.3.tar.gz
+sha256  e3e79874b07d776c40bd6033f8ddf76a7dad46a7b8aa1b2787a83083519a1803  wheel-0.46.3.tar.gz
 # Locally computed sha256 checksums
 sha256  30c23618679108f3e8ea1d2a658c7ca417bdfc891c98ef1a89fa4ff0c9828654  LICENSE.txt
diff --git a/package/python-wheel/python-wheel.mk b/package/python-wheel/python-wheel.mk
index 417db7c167..b68a1c102b 100644
--- a/package/python-wheel/python-wheel.mk
+++ b/package/python-wheel/python-wheel.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHEEL_VERSION = 0.45.1
+PYTHON_WHEEL_VERSION = 0.46.3
 PYTHON_WHEEL_SOURCE = wheel-$(PYTHON_WHEEL_VERSION).tar.gz
-PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/8a/98/2d9906746cdc6a6ef809ae6338005b3f21bb568bea3165cfc6a243fdc25c
+PYTHON_WHEEL_SITE = https://files.pythonhosted.org/packages/89/24/a2eb353a6edac9a0303977c4cb048134959dd2a51b48a269dfc9dde00c8a
 PYTHON_WHEEL_SETUP_TYPE = flit
 PYTHON_WHEEL_LICENSE = MIT
 PYTHON_WHEEL_LICENSE_FILES = LICENSE.txt
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
