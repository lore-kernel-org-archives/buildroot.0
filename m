Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B5F710706DB
	for <buildroot@archiver.kernel.org>; Sat, 14 Mar 2026 14:12:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 14D97410F1;
	Sat, 14 Mar 2026 14:12:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id IxG5eXwRzcI2; Sat, 14 Mar 2026 14:12:28 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 316A8412AF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1773497548;
	bh=dLRfnGqkGA6VcK7CqU08ccK4mpOytD1bk0cnQgkovtk=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=AA2MEci4CalS2+wK17+TBLCh6USYSijoY4y5ikpqm/i4mO4d0E0dtk9BzwvAVTkWd
	 3vua963W7PtxAvRdAjezgvufHr5LgR4tBPo+YTp0q3MejfDiR7yIZnSIRykwyT1qvG
	 z/EHzb1boErhPrAuRa20G1QwCaMrIuPsW0YM51XUnatHE2UFfdyQMbMI6Ji+ZgOFpb
	 YXkHhU1h5vB5mbq+S2yb72TQYGpfvZ4KLbUmLQ6A12sgkTgIwofxvWgCsjbkDoXh3d
	 pmrbe42gkejjAhhqF9lE94Cm0a5ofwd1DvvPQHv3tGl+vJ71v9L0Zp8tYqpu9Ja99z
	 n2S6D2leB107Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 316A8412AF;
	Sat, 14 Mar 2026 14:12:28 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id D8C163C6
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CA561606F4
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ugz_s3qugRuh for <buildroot@buildroot.org>;
 Sat, 14 Mar 2026 14:12:26 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B2070606DB
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B2070606DB
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B2070606DB
 for <buildroot@buildroot.org>; Sat, 14 Mar 2026 14:12:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bc8b.dip0.t-ipconnect.de [84.161.188.139])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 97409A4C145E;
 Sat, 14 Mar 2026 15:06:51 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:41874)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1w1PdY-000000003UM-0QLi;
 Sat, 14 Mar 2026 14:06:40 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 14 Mar 2026 15:06:15 +0100
Message-ID: <20260314140633.2967249-79-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260314140633.2967249-1-bernd@kuhls.net>
References: <20260314140633.2967249-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1773497211;
 bh=bJLgRpb0XxSnSrYxC7CZYPYVNCbxKV+e/5dV519hZbc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=TnhXRUesMghjeth0fRxwRyU5lEt0OfMVGefcex4c/khPem2Q5SbTpE/YdG7UFuKEw
 V4kki3xcKDJetSvCeRvWJe+RjkltKI4Glan2vtGQpT3B9F4Zr+w7wLKm7+nDLXdZd/
 pYfsS3flJoDFyca8ObaCfAPW3nJ3ffFUTknEHpBuR+8297bMKOefxUfTY7QpMoDnqQ
 3T5v8zw+Cmf3iz0/YUvKXvMiOktWaAJES0gQKzNNYI5siocDQWLLD2eJqNG7IaEvdG
 2DJ8jYNtsI6QiumlGF/HuRRPjfWrZaN/Reur1XZ7VN7o1btoV0qHY+m3EV8DdsmW62
 dVkIXmB9nSRdA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=TnhXRUes
Subject: [Buildroot] [PATCH 79/96] package/python-trove-classifiers: bump
 version to 2026.1.14.14
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

https://github.com/pypa/trove-classifiers/releases

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 .../python-trove-classifiers/python-trove-classifiers.hash    | 4 ++--
 package/python-trove-classifiers/python-trove-classifiers.mk  | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-trove-classifiers/python-trove-classifiers.hash b/package/python-trove-classifiers/python-trove-classifiers.hash
index 5e3bd86638..871f8675fe 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  38bcf32894b739e814f3362ce191b62b  trove_classifiers-2025.12.1.14.tar.gz
-sha256  a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633  trove_classifiers-2025.12.1.14.tar.gz
+md5  ded610aa62cf3dc78360e96802ca72e8  trove_classifiers-2026.1.14.14.tar.gz
+sha256  00492545a1402b09d4858605ba190ea33243d361e2b01c9c296ce06b5c3325f3  trove_classifiers-2026.1.14.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index 5a6d8f49d7..5c5ebb5950 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.12.1.14
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2026.1.14.14
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/80/e1/000add3b3e0725ce7ee0ea6ea4543f1e1d9519742f3b2320de41eeefa7c7
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/d8/43/7935f8ea93fcb6680bc10a6fdbf534075c198eeead59150dd5ed68449642
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
