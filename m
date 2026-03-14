Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A42C10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:07:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 64E29407F0;
	Sat, 14 Mar 2026 14:07:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8RvyW8YTZar7; Sat, 14 Mar 2026 14:07:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8F9AD4101E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497257;
	bh=QlgOdHU5pdspORVm2iLEZOFYXBYUgKniBjYDI26jFfQ=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=QJmascFace4xvvaRiTjpK+d7HGAdDOL2Pn/gIY6Z3P3PDhCbkcsqf6a9JAlF33agA
	 E9qaOKYCjZocUFsIS5XlRgPsVJOLMzc2+iLbXze2Du8JGEiBQLyWm0JD4NJQJREEwj
	 Sy3ngX5CzJQgq4dXYVtt9eLDN2EM6v4Pd8oOrCCpLdFYvGBPyu7qFTNhlko/brTb2S
	 iYnQEpF+kF7bwq7n+kfxUeoHKeeZMmudcABC4CHh4jdxqrcuSHL63nwHF3g8icHs8F
	 VyPkkmpL/6aNlhSH6+GQqLYMZPGyePtrXypY5yGTkJlgJqWfVw0xQCILLQf/aYIqLI
	 aSDnIKSGWXfGQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8F9AD4101E;
	Sat, 14 Mar 2026 14:07:37 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id EEDDD3C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id E050E60640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id bHcaMpPS7RXV for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:07:35 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org C52AD60638
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C52AD60638
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id C52AD60638
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:07:34 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D360DA4C13D3;
 Sat, 14 Mar 2026 15:06:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdV-000000003UM-3gvx;
 Sat, 14 Mar 2026 14:06:37 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:05:51 +0100
Message-ID: <20260314140633.2967249-55-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497203;
 bh=zEJss9Oa1ymkz5PLHQgfC3KeyNmi5Lu/bv/renFAxbA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=ufkMN7q6a8TfKKTVnsdb67g/KGZ2opE5SMRgwMXuw/8UdDAYEMHu9J8ohNYkR4v55
 vCIX5ouvrIhgr20JBoLA1zTdDw9TKfInL4FId9xj3A1J66RfoGe4YGfejpnuDWWJln
 ATX8k+XM5douRApAkIEgmTqkrZnGbHDtD2dLovHhiG9bnw3jipGT2yTCxrxTNwyEVC
 TEX8JMjUPIyicvntTaExnW6WoZIkCgB2Wze5DZ1sLWM31L2xDQoBaS3RIFQFF5OmNc
 5GM7DH3ZlOEcLQNTTdQqwFebOP33Y7hWJCsnq4BTeClV0AiEl3AHnUODlRJfrKZTBc
 lyz/sbiAQbJcQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ufkMN7q6
Subject: [Buildroot] [PATCH 55/96] package/python-pyjwt: security bump
 version to 2.12.1
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

https://github.com/jpadilla/pyjwt/blob/2.12.1/CHANGELOG.rst

Fixes CVE-2026-32597:
https://github.com/jpadilla/pyjwt/security/advisories/GHSA-752w-5fwx-jx9f

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pyjwt/python-pyjwt.hash | 4 ++--
 package/python-pyjwt/python-pyjwt.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-pyjwt/python-pyjwt.hash b/package/python-pyjwt/python-pyjwt.hash
index 5128285fec..92de436de8 100644
--- a/package/python-pyjwt/python-pyjwt.hash
+++ b/package/python-pyjwt/python-pyjwt.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/pyjwt/json
-md5  f3273aaf736c24795e78ac48adbab111  pyjwt-2.10.1.tar.gz
-sha256  3cc5772eb20009233caf06e9d8a0577824723b44e6648ee0a2aedb6cf9381953  pyjwt-2.10.1.tar.gz
+md5  12623a5898f60c4c86ad4ad8d92da216  pyjwt-2.12.1.tar.gz
+sha256  c74a7a2adf861c04d002db713dd85f84beb242228e671280bf709d765b03672b  pyjwt-2.12.1.tar.gz
 # Locally computed sha256 checksums
 sha256  797a7a20231d4c433e9f1911db1731d06b5828b98f499819a034f7c0f56f5ce5  LICENSE
diff --git a/package/python-pyjwt/python-pyjwt.mk b/package/python-pyjwt/python-pyjwt.mk
index 18e84b7838..268d83a487 100644
--- a/package/python-pyjwt/python-pyjwt.mk
+++ b/package/python-pyjwt/python-pyjwt.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYJWT_VERSION = 2.10.1
+PYTHON_PYJWT_VERSION = 2.12.1
 PYTHON_PYJWT_SOURCE = pyjwt-$(PYTHON_PYJWT_VERSION).tar.gz
-PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/e7/46/bd74733ff231675599650d3e47f361794b22ef3e3770998dda30d3b63726
+PYTHON_PYJWT_SITE = https://files.pythonhosted.org/packages/c2/27/a3b6e5bf6ff856d2509292e95c8f57f0df7017cf5394921fc4e4ef40308a
 PYTHON_PYJWT_SETUP_TYPE = setuptools
 PYTHON_PYJWT_LICENSE = MIT
 PYTHON_PYJWT_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
