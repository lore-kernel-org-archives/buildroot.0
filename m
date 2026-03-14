Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB1D10706DC
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:14:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 03A5F410F8;
	Sat, 14 Mar 2026 14:14:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vdXVL2c7bk5H; Sat, 14 Mar 2026 14:14:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2751941106
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497680;
	bh=niwvFjAM5ezlOHKA46+uHEzfxyW7hx4JAl1RWVL99RI=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=ehCvi24Oqe7gajV3ahguCpGZayk5WNXyCz3mlgVyiSR9hBZqG9Zlh/rU6gUbt3wSO
	 No+9rNnoGdNPCMondP+cBy9IF7Ei1SOyTn3f4LZucs5cPYoaOsGkhgeqtTWQH5x/3d
	 4yTDDnKGD6FE/atPOof7d6tlqFk1apeRJCDrwLdR9NM5zxuzcmLxj6erTYDgFNQ6SS
	 13V3MnJt2bKM9HKzqi2+ncVd3KIzzcCI6+i0+ZOdHjYskRenB7ZtzTONuRPcC8ZDwZ
	 jw5cEwQPGckw+f/xxys4LHNnVhQaMtzYlzEN7WPofPlu8t5SM0vIdjezLRr+rIcgxS
	 UASkd/AQpUPkQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2751941106;
	Sat, 14 Mar 2026 14:14:40 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0BF7A201
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 05EDC60787
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IAUIl7_DbHbL for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:14:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org E39BF6077F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E39BF6077F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id E39BF6077F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:14:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 121F7A4C0615;
 Sat, 14 Mar 2026 15:06:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdZ-000000003UM-0qbS;
 Sat, 14 Mar 2026 14:06:41 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:27 +0100
Message-ID: <20260314140633.2967249-91-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497215;
 bh=yj83/xreb5edYxTVM2a/skqz77BwpImVdqP9CFnHvMA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=GCpUYwtZcdGDAhuAxlqNMN2nhb5m2H/LxOf4gpdiysr6D02RBa4XvRSba1DSipgFy
 fUKmnSxMPFVnBhiLVe2DjeEitm7qDlqFWtkOD4Z1gmQ+n+sQ2E7/ASU7APhDiPQaeh
 6nP7icECeqPKL/cX8heivIHi2/DqbgEgWmpsxJ8rfsRs8dt5VYoC/Kufh/3nsbw5jl
 qRO1+lGyWzAFK+sycPqxeut2wn7km/Jh/z42Hat1tz7AlK4LoL43FoH3wQMhB/jJ9e
 kN1sfN7/fmI5xUBQktB/rxTfgqu1xjnVL3Z77pcOtDWev7jM2iB7wLEMWMHqmrc8ND
 GBC689v2/RdJg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=GCpUYwtZ
Subject: [Buildroot] [PATCH 91/96] package/python-whitenoise: bump version
 to 6.12.0
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

https://github.com/evansd/whitenoise/blob/6.12.0/docs/changelog.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-whitenoise/python-whitenoise.hash | 4 ++--
 package/python-whitenoise/python-whitenoise.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-whitenoise/python-whitenoise.hash b/package/python-whitenoise/python-whitenoise.hash
index 1659961825..792e3c917d 100644
--- a/package/python-whitenoise/python-whitenoise.hash
+++ b/package/python-whitenoise/python-whitenoise.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/whitenoise/json
-md5  212cafd7f8d972a5d6740bfc88b3f17b  whitenoise-6.11.0.tar.gz
-sha256  0f5bfce6061ae6611cd9396a8231e088722e4fc67bc13a111be74c738d99375f  whitenoise-6.11.0.tar.gz
+md5  864b21f485449341ea6b7ab68fb16146  whitenoise-6.12.0.tar.gz
+sha256  f723ebb76a112e98816ff80fcea0a6c9b8ecde835f8ddda25df7a30a3c2db6ad  whitenoise-6.12.0.tar.gz
 # Locally computed sha256 checksums
 sha256  ebfd469b4fb6b5adada547747e1e8da725ecf20595d54aced043275d4f4a3600  LICENSE
diff --git a/package/python-whitenoise/python-whitenoise.mk b/package/python-whitenoise/python-whitenoise.mk
index 91f3b6d2d7..6a11c1db3e 100644
--- a/package/python-whitenoise/python-whitenoise.mk
+++ b/package/python-whitenoise/python-whitenoise.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_WHITENOISE_VERSION = 6.11.0
+PYTHON_WHITENOISE_VERSION = 6.12.0
 PYTHON_WHITENOISE_SOURCE = whitenoise-$(PYTHON_WHITENOISE_VERSION).tar.gz
-PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/15/95/8c81ec6b6ebcbf8aca2de7603070ccf37dbb873b03f20708e0f7c1664bc6
+PYTHON_WHITENOISE_SITE = https://files.pythonhosted.org/packages/cb/2a/55b3f3a4ec326cd077c1c3defeee656b9298372a69229134d930151acd01
 PYTHON_WHITENOISE_SETUP_TYPE = setuptools
 PYTHON_WHITENOISE_LICENSE = MIT
 PYTHON_WHITENOISE_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
