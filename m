Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2781BCCFA13
	for <buildroot@archiver.kernel.org>; Fri,  1 May 2026 12:36:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 002DD6F770;
	Fri,  1 May 2026 12:36:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ugzg77XKpvoL; Fri,  1 May 2026 12:36:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 03BB76F682
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777638985;
	bh=alzO8kFvUop1UxZLyWS8aq/zXxH+7SwNADemYYOOQv0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=DDeTaR5vmWv4WHm2Jnj3KF78dDmpRQF89W/JtNHu+Q9pskBfFYfi0wJkk1ntAnsaG
	 9JKJZKSwMZDUZC8vAFH7AqrK9FQ/q/9OSJtD7PxFx6NmKa4SwH9fCn5Z5pToxSWlH0
	 XqkZMKDbtzLUk26msx/11t8OvLbO+RbLm50HdAQQHSAfiO1L7Wr4F+kSsGQN1+f/Yp
	 kXhbPk3Q1THYTn/XRVtjxso3fRsK3o/Lx4MwW724L8GQwGRn3qNGC0jao+iAjdsCLG
	 82wPYHiuyxNKedTn27pjrBHPCkgUgbjJHV2jDAp4/FsYDqdWrgEK9EMi66NCpYvrgJ
	 lq1klNgQG8GLw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 03BB76F682;
	Fri,  1 May 2026 12:36:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 0B8E5293
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id F1F0C42099
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id K-2PFgDEENtn for <buildroot@buildroot.org>;
 Fri,  1 May 2026 12:36:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org CC1A44207F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org CC1A44207F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id CC1A44207F
 for <buildroot@buildroot.org>; Fri,  1 May 2026 12:36:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c2eb.dip0.t-ipconnect.de [79.214.194.235])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id C1178A4C2ECE;
 Fri,  1 May 2026 14:31:05 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:45080)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIn1J-000000008NC-1asQ;
 Fri, 01 May 2026 12:31:01 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Fri,  1 May 2026 14:29:53 +0200
Message-ID: <20260501123100.1918951-8-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260501123100.1918951-1-bernd@kuhls.net>
References: <20260501123100.1918951-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777638665;
 bh=m888abldCm8Bb2yDb9ljyiSyksZpdxUOONF8f7OaenA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=Uh69axttWnphWsvWVV8Exm6jsOdZs9bMUQOTO0DVXZbW5v3sziJKpdj6jf3kUepx6
 +BcQniojKDHv8bVWK5Xrc064Cb5eT1yR8+JM1GAFSElGoAUNLhp1dzvWT1n/mYx93n
 70suXwE8jXPoyrjqhd1YN7YM3EmbgaFokaxzQbIBkeqIoCQ7xeiKCv4dNdhN0U+Yk9
 yl++G0nOiCZ41zXZNmZnNCTtFRXFYFZA5dCRpnWH2dnhZLgE+f/j2RibX3ZcZTRprB
 zIMwbZGNadqoIesk0FSDA+RzkNzu9226w6Wvws5WMBDC1rhlSpgpsD6S+q1GSS/02b
 awEjCbtZx9Lxg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Uh69axtt
Subject: [Buildroot] [PATCH 08/75] package/python-botocore: bump version to
 1.43.1
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

https://github.com/boto/botocore/blob/1.43.1/CHANGELOG.rst

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-botocore/python-botocore.hash | 4 ++--
 package/python-botocore/python-botocore.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-botocore/python-botocore.hash b/package/python-botocore/python-botocore.hash
index d7b9d72baf..fdeb9291ee 100644
--- a/package/python-botocore/python-botocore.hash
+++ b/package/python-botocore/python-botocore.hash
@@ -1,6 +1,6 @@
 # md5, sha256 from https://pypi.org/pypi/botocore/json
-md5  5dede248bc91c7213fc8ffb42b76e318  botocore-1.42.68.tar.gz
-sha256  3951c69e12ac871dda245f48dac5c7dd88ea1bfdd74a8879ec356cf2874b806a  botocore-1.42.68.tar.gz
+md5  6a8e7551f86c8701377928541b1a9f4b  botocore-1.43.1.tar.gz
+sha256  270d6357d662550fdb84973ec247e02bece0b6283d90bf37319c7753515336e4  botocore-1.43.1.tar.gz
 # Locally computed sha256 checksums
 sha256  0d542e0c8804e39aa7f37eb00da5a762149dc682d7829451287e11b938e94594  LICENSE.txt
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  tests/unit/auth/aws4_testsuite/LICENSE
diff --git a/package/python-botocore/python-botocore.mk b/package/python-botocore/python-botocore.mk
index 545c4d44dd..ff892c60f8 100644
--- a/package/python-botocore/python-botocore.mk
+++ b/package/python-botocore/python-botocore.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_BOTOCORE_VERSION = 1.42.68
+PYTHON_BOTOCORE_VERSION = 1.43.1
 PYTHON_BOTOCORE_SOURCE = botocore-$(PYTHON_BOTOCORE_VERSION).tar.gz
-PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/3f/22/87502d5fbbfa8189406a617b30b1e2a3dc0ab2669f7268e91b385c1c1c7a
+PYTHON_BOTOCORE_SITE = https://files.pythonhosted.org/packages/03/b7/416ae6f1461d6fec3b3aaffc4759371319c71a21f7ab4c3106ee574fda8d
 PYTHON_BOTOCORE_SETUP_TYPE = setuptools
 PYTHON_BOTOCORE_LICENSE = Apache-2.0
 PYTHON_BOTOCORE_LICENSE_FILES = LICENSE.txt tests/unit/auth/aws4_testsuite/LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
