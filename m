Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA83210706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:08:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9C80E40756;
	Sat, 14 Mar 2026 14:08:15 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id QNndXkN4bMnX; Sat, 14 Mar 2026 14:08:13 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 6D74A41069
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497293;
	bh=/wazWt3JcMGMYbhp7Lf4aH4fctobz4N20Gx45jFZVVA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=GzslRq17EAhhjs6Eh1n9GvKRsHbPtI6kMKIUdiei3FsRetcmUiOwHkRdoJWSi+bRA
	 MS04KgOI2dUyLjPDC6hoP5qNZmtSCWgJldR9sdDD32MuPUJyDG8m4cu14EHmTCf99E
	 NApBk87BsIcQM4SgSrKr4IZS1BeFJS6PYbM2UpHxTqr4h1m5gFtG+saFV/wkhKyN9x
	 OhnL+XHwVyk2qYVgj73cBaZhEXam0Zh//MpYG8O41woFBRtxmKAgWVmzruct6KSjhE
	 ED4xWkXIhC4K5rJ8o50Z5Wpp6dhJvAiQYXg294WWI0uLAFQ7D01k08KugkybOtOXO7
	 LRABSTUWieQlw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6D74A41069;
	Sat, 14 Mar 2026 14:08:13 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 58B07201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5591182241
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id D6-P99k0KQuE for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:08:11 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 45D178222D
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 45D178222D
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 45D178222D
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:08:11 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C9333A4C13FF;
 Sat, 14 Mar 2026 15:06:44 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdW-000000003UM-0dYN;
 Sat, 14 Mar 2026 14:06:38 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:54 +0100
Message-ID: <20260314140633.2967249-58-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497204;
 bh=EF/MkmrUn+0Exsgb/nfrbMQuzvLiUTFSnUxmsrZZq3E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=kdGfbsaKLBvxYiebIGOU8X6yvkyDSDkeZa58kot0loaWdezOk3cc2D8kDkyCTWNc8
 8HHp+8iG+vmLnTTzdmcOU+9vmC88ndz5TIxVQ6W8h2ADo0RcKp/kcIN4PjEpUhcofC
 WN06A177xDs8+LSsoOyeEZpbIOToR8g0xpGF5yPKE6qrlKSJUKF99GJb2mnO200GRZ
 kCtnB4TBcKAGM+1J6pCZAYDea29t2leN6YbHpo09bPU0VNHHt2sxozFMgumqUSFCy3
 bUtlGGNXJjwSSUqEXGaD8Iap2vzzTl7hw+YwVUl4JZbLuvR23Y9tCZBwLsVjO+Vv0D
 dnYv1hsCoVRLA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=kdGfbsaK
Subject: [Buildroot] [PATCH 58/96] package/python-pypika-tortoise: bump
 version to 0.6.5
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

https://github.com/tortoise/pypika-tortoise/blob/v0.6.5/CHANGELOG.md

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pypika-tortoise/python-pypika-tortoise.hash | 4 ++--
 package/python-pypika-tortoise/python-pypika-tortoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.hash b/package/python-pypika-tortoise/python-pypika-tortoise.hash
index 9dc7ea9aa0..9e8c096c9e 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.hash
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pypika-tortoise/json
-md5  21a08e348b537e745964323874f5a6fc  pypika_tortoise-0.6.3.tar.gz
-sha256  6e17f00e77e78468836cb5c63eb6dc01445f83b1167e4f29f1c678949179c079  pypika_tortoise-0.6.3.tar.gz
+md5  59bd939b42834b622e14aba292d8ec32  pypika_tortoise-0.6.5.tar.gz
+sha256  64d96c9b88450f6360ad22a7063933b6a90961a7317f04b2b63c98fd5d705506  pypika_tortoise-0.6.5.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-pypika-tortoise/python-pypika-tortoise.mk b/package/python-pypika-tortoise/python-pypika-tortoise.mk
index 72669f36b2..9b920e75a3 100644
--- a/package/python-pypika-tortoise/python-pypika-tortoise.mk
+++ b/package/python-pypika-tortoise/python-pypika-tortoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.3
+PYTHON_PYPIKA_TORTOISE_VERSION = 0.6.5
 PYTHON_PYPIKA_TORTOISE_SOURCE = pypika_tortoise-$(PYTHON_PYPIKA_TORTOISE_VERSION).tar.gz
-PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/cc/28/86ec1bccb2609d20349def444ef9dfe84aeccc984caa62f4634d50fee164
+PYTHON_PYPIKA_TORTOISE_SITE = https://files.pythonhosted.org/packages/c2/06/89fe5fff93c5a01dbdeb9f3d843a7e997dc6e3a87222a260a164ff91fb81
 PYTHON_PYPIKA_TORTOISE_SETUP_TYPE = pep517
 PYTHON_PYPIKA_TORTOISE_LICENSE = Apache-2.0
 PYTHON_PYPIKA_TORTOISE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
