Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44105CCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:33:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 121CC42322;
	Fri,  1 May 2026 12:33:12 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cYxFCMWpV4OZ; Fri,  1 May 2026 12:33:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3C04241FAF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638790;
	bh=Y5O7Ax6obHgF9/GErkW/8ejuRNqK+m4cFS4FI8ebTGE=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=lJj2Qwz9Bh3Tw1r7vgGyD4Wj82bBLd7QGXq5Mqywg4FKQBxfPxGeNMBRKBhRt1yP3
	 l782+WcA7zgaWKQ9abEmuQUK0DGVRO8q3mrW0FHtxVRcgp+I3OKoYmP0BFWJJB+y/H
	 pQfe5BfBZKWYBMxHcUE4Smp+sYIWimOJmK2dwHI4W+lyYrqXr8CvJoq7PBEhjx/Rl+
	 i5ra+FxnwsleQEjmSzyU/dmNL3XdveiaRbYdscshy/VlnS/WQw6EIGr3TN3sJBrpYo
	 dGZORxcfN55urWy6yD7PN9Ed5eKRk1KFM3LjlEIb0eY8On2LQqMCijx4ebV/oaulJ9
	 2CrSKYVrWoVow==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C04241FAF;
	Fri,  1 May 2026 12:33:10 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id E915E127
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id DABD86F4D4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id e4cGha95Q0Na for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:33:08 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org B5A666F4C4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org B5A666F4C4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id B5A666F4C4
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:33:07 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 50160A4C2E8E;
 Fri,  1 May 2026 14:31:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1L-000000008NC-1HCc;
 Fri, 01 May 2026 12:31:02 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:30:15 +0200
Message-ID: <20260501123100.1918951-30-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638663;
 bh=n7VY7lVB3lBBAzDy2yc6eoiJx4hf09svTTps5ZQKo0E=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Djfj8IXQH/y0n460b9onoNkjs+mMLlwR09TpW1Zifc6TQBu3WCXbdc8vO72URwzxd
 BVYIm6wYw/ytXKrz+G7mYMono0dbTB0XtKTbM0JITXB3AQicGnnosTne/8Z9BCele3
 3rgvINQ1FGmKs8P4iJHvbOP8QDA7dCAv0gW9sX8CmEF8IvFLdQv8k9sVYwNSrWd8wT
 mZZWYoQ3aGsxe1QveG09Ce93+zn+ISWchZ/ObItzzOUhdS7e7PFc0JY+SNyV+Y7WLd
 NwrM7yVw7CcCXLDDVWQIqR14Pkf/sqdKa+6B/IU/oQJpYYuLqld8/D9MLqV7Io9Z5F
 AcTA1qL8JqsVA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Djfj8IXQ
Subject: [Buildroot] [PATCH 30/75] package/python-matplotlib: security bump
 version to 3.10.9
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

https://github.com/matplotlib/matplotlib/releases/tag/v3.10.9

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-matplotlib/python-matplotlib.hash | 4 ++--
 package/python-matplotlib/python-matplotlib.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-matplotlib/python-matplotlib.hash b/package/python-matplotlib/python-matplotlib.hash
index f6b8c444bf..aadddc7d99 100644
--- a/package/python-matplotlib/python-matplotlib.hash
+++ b/package/python-matplotlib/python-matplotlib.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/matplotlib/json
-md5  bb3330a3bdcce6cf2e57b13795f3a005  matplotlib-3.10.8.tar.gz
-sha256  2299372c19d56bcd35cf05a2738308758d32b9eaed2371898d8f5bd33f084aa3  matplotlib-3.10.8.tar.gz
+md5  6bec2e78642cbd44c012718835ab024e  matplotlib-3.10.9.tar.gz
+sha256  fd66508e8c6877d98e586654b608a0456db8d7e8a546eb1e2600efd957302358  matplotlib-3.10.9.tar.gz
 # Locally computed sha256 checksums
 sha256  5a1a81ea301728c8bba2933da832c0cd62229daf20893a024ab3d53244468dbc  LICENSE/LICENSE
diff --git a/package/python-matplotlib/python-matplotlib.mk b/package/python-matplotlib/python-matplotlib.mk
index 6dcf8d0fa1..067bd68685 100644
--- a/package/python-matplotlib/python-matplotlib.mk
+++ b/package/python-matplotlib/python-matplotlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_MATPLOTLIB_VERSION = 3.10.8
+PYTHON_MATPLOTLIB_VERSION = 3.10.9
 PYTHON_MATPLOTLIB_SOURCE = matplotlib-$(PYTHON_MATPLOTLIB_VERSION).tar.gz
-PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/8a/76/d3c6e3a13fe484ebe7718d14e269c9569c4eb0020a968a327acb3b9a8fe6
+PYTHON_MATPLOTLIB_SITE = https://files.pythonhosted.org/packages/63/1b/4be5be87d43d327a0cf4de1a56e86f7f84c89312452406cf122efe2839e6
 PYTHON_MATPLOTLIB_LICENSE = Python-2.0
 PYTHON_MATPLOTLIB_LICENSE_FILES = LICENSE/LICENSE
 PYTHON_MATPLOTLIB_DEPENDENCIES = \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
