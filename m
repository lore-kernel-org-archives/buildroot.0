Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69D2F10706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:10:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4082D41105;
	Sat, 14 Mar 2026 14:10:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id A6J790weJl3k; Sat, 14 Mar 2026 14:10:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5DBDB4110F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497426;
	bh=0t6Jvs6zPEBuovcwsEM98YitIxdOKxFrhNhdAsGjARE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=HKDCK2t/HfmLZpDnzBcPF60szQ1F68HLYyTQOU8dovQCwPFsH0tHW4hhHSQxV/Rtq
	 0hyd3qunRboRr0i1Pnk9H6fy4n+CK0nKp81TsMNBrucYpEnrmAkDZVP2a2VGxFe4FL
	 afMNGNFvv/xRDuvB0XKyQ3HKTVbcNbmne8WwkKAyUOoVkPEjssyY9K7LzhnP50/0ki
	 eRwoKVIASWaNbhPH8+MlMnLag8nUl0oVLUR2kOhoeHJvgrhfdsJlut0gz6ozcGrQyT
	 PiqZYHVMasd9jwAExBzScAjh57ZUK6NQpwOfJ8F08OoN778HCMKKVuVLSSjKft7ZlH
	 WyVsdltCd03qQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5DBDB4110F;
	Sat, 14 Mar 2026 14:10:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 726B23C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 5789E6066F
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id UEhqZB1RZY7z for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:10:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 4CF7B60640
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 4CF7B60640
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 4CF7B60640
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:10:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 6A5ABA4C1433;
 Sat, 14 Mar 2026 15:06:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdX-000000003UM-0d9Y;
 Sat, 14 Mar 2026 14:06:39 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:05 +0100
Message-ID: <20260314140633.2967249-69-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497208;
 bh=mJztcHTQYUdvQ3hgvWIyQBvuzl1ahGwntd4topI8hXQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=pKiWushhy3VTI5cX020pQNCnQshYnkFQvfluY9xuCKAE+9rQzZ/2vmrMpbCeaZ7wp
 endOFCgaGAhBj6LywgJHfxJZ80xR9VxnSqnuuflvZjzlzmESM6gD2p7XEu6m4kHCm8
 mToQHdyFnbDTPrVQ3NeYUhF89M3iY7UokjTNsPPMTryfMufRNrY6fS2RVspczrtW1j
 1ZQOupZoyI0HwBfeB8a6b4ev1f7wqicmfVHjaY8UtwvoO/x72QBgd5l4SYzZkenmn4
 z3sPs+D799I/HQ0Ip74pT8dR3519eTAiXhvviWFmir/KqaJFQca5DwXZrChMt8la2I
 AlBc4vEYS8Bzg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=pKiWushh
Subject: [Buildroot] [PATCH 69/96] package/python-sqlalchemy: bump version
 to 2.0.48
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

https://github.com/sqlalchemy/sqlalchemy/blob/rel_2_0_48/doc/build/changelog/changelog_20.rst

Updated license hash due to copyright year bump:
https://github.com/sqlalchemy/sqlalchemy/commit/9ea4237f2136081ee784d12b53f4c0605a5a15a0

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-sqlalchemy/python-sqlalchemy.hash | 6 +++---
 package/python-sqlalchemy/python-sqlalchemy.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-sqlalchemy/python-sqlalchemy.hash b/package/python-sqlalchemy/python-sqlalchemy.hash
index cfc42fd77d..e94ae9acf2 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.hash
+++ b/package/python-sqlalchemy/python-sqlalchemy.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/sqlalchemy/json
-md5  9df94d7a8629cf43d2190d5e511fa47f  sqlalchemy-2.0.45.tar.gz
-sha256  1632a4bda8d2d25703fdad6363058d882541bdaaee0e5e3ddfa0cd3229efce88  sqlalchemy-2.0.45.tar.gz
+md5  6c8b6f2648f192707671d55e96ee5ce9  sqlalchemy-2.0.48.tar.gz
+sha256  5ca74f37f3369b45e1f6b7b06afb182af1fd5dde009e4ffd831830d98cbe5fe7  sqlalchemy-2.0.48.tar.gz
 # Locally computed sha256 checksums
-sha256  9821720b58d4a565b61321007a8ad43ab6991a3959e66cd5db4dd9eae69c7dfc  LICENSE
+sha256  e862bb5b904fb5513c3e14288d7a25a12eb0ecc7847a0a965d310e9a955e7cb9  LICENSE
diff --git a/package/python-sqlalchemy/python-sqlalchemy.mk b/package/python-sqlalchemy/python-sqlalchemy.mk
index cf5440a715..88ef21f7b7 100644
--- a/package/python-sqlalchemy/python-sqlalchemy.mk
+++ b/package/python-sqlalchemy/python-sqlalchemy.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SQLALCHEMY_VERSION = 2.0.45
+PYTHON_SQLALCHEMY_VERSION = 2.0.48
 PYTHON_SQLALCHEMY_SOURCE = sqlalchemy-$(PYTHON_SQLALCHEMY_VERSION).tar.gz
-PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/be/f9/5e4491e5ccf42f5d9cfc663741d261b3e6e1683ae7812114e7636409fcc6
+PYTHON_SQLALCHEMY_SITE = https://files.pythonhosted.org/packages/1f/73/b4a9737255583b5fa858e0bb8e116eb94b88c910164ed2ed719147bde3de
 PYTHON_SQLALCHEMY_SETUP_TYPE = setuptools
 PYTHON_SQLALCHEMY_LICENSE = MIT
 PYTHON_SQLALCHEMY_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
