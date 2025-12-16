Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 418D7D637A1
	for <buildroot@archiver.kernel.org>; Tue, 16 Dec 2025 19:43:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 14E616103C;
	Tue, 16 Dec 2025 19:43:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id x_mFpPucV7E0; Tue, 16 Dec 2025 19:43:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 41EFF61040
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765914206;
	bh=eetleINY2vKAlouUE1Urk7D4TdxomrgmPeBmbOKqhp0=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=mBPXK7C4TvLVZ8pGkncKMfHn73FdEnjYYricpp35ijteXC652LP0XTM4MXLxvNGww
	 /PBUdRxtg0nDcRIFw3xA1cC4tkoty896o/CWGG6wlJ4Q6bOF9f79J11lFuo161sdmX
	 cpLWMXaIMti76k38ePlAX/v2RlFgeLOR3Yl/dQHVJQWSONUE1Ea754z8PR3WUTZ9vA
	 wb9xtHTU6+UnN38/1hJlJbuvxkQB4A6StLQyurCXFdTb18pI7udCfHeZ0YSTpC4ywf
	 1/b/uLXgOuMieG5P+/qucR0Wsd6/J9GITZSnDm97dbmQnenjy1suH+F5rZT7BNiZ1W
	 WZsH2P8UgWIzQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 41EFF61040;
	Tue, 16 Dec 2025 19:43:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 66354372
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 4C77961040
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id E49Rhm1Xg1XB for <buildroot@buildroot.org>;
 Tue, 16 Dec 2025 19:43:24 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 3C49A6103C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C49A6103C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 3C49A6103C
 for <buildroot@buildroot.org>; Tue, 16 Dec 2025 19:43:24 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 20753A4C3B99;
 Tue, 16 Dec 2025 20:41:30 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:47366)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVav9-000000000Bj-2xOj;
 Tue, 16 Dec 2025 19:41:20 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 16 Dec 2025 20:41:04 +0100
Message-ID: <20251216194119.3020421-11-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251216194119.3020421-1-bernd@kuhls.net>
References: <20251216194119.3020421-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765914090;
 bh=vvdvvS7YVVDN/yfIKNQ3Qd7jAQCSKEF/t+TtznSCb8M=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=BU5xO5ObhCf6dsBJ46pSCZd6WxDMygZREtT1tKy4blc+GssVEzBvXnBTFIu+W0s52
 w+9Gm3HEyKU32GrE7xTSWaj0FL/8aIync11ExTp5z8AELHcuscthNcLNneYxSTzqgO
 6bLDyh7oqk/x0aCjfWCDKqXndvwfbgzcYozniFsZhbmkXoVGC563jTbptx80fU7xBy
 2wXZ17JuJ6/A1ww7HSfOl4XLe+VPjrGquw48nLE4rfHmcKlRnKLRPy3HcLb/j1+zlD
 0olfX70OsUYxgtG5VIYcUgrRV3OzjPqL+rist46SSkEE40GhUPsD+Eu5e0Up218Vl+
 DgSFr0M0H5gSg==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=BU5xO5Ob
Subject: [Buildroot] [PATCH 11/26] package/python-trove-classifiers: bump
 version to 2025.12.1.14
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
Cc: =?UTF-8?q?Martin=20Hundeb=C3=B8ll?= <martin@geanix.com>,
 Christophe Vu-Brugier <cvubrugier@fastmail.fm>,
 James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>
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
index 008c3a0b3e..5e3bd86638 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.hash
+++ b/package/python-trove-classifiers/python-trove-classifiers.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/trove-classifiers/json
-md5  769cd978e6756c423958bbfe76f130d8  trove_classifiers-2025.9.11.17.tar.gz
-sha256  931ca9841a5e9c9408bc2ae67b50d28acf85bef56219b56860876dd1f2d024dd  trove_classifiers-2025.9.11.17.tar.gz
+md5  38bcf32894b739e814f3362ce191b62b  trove_classifiers-2025.12.1.14.tar.gz
+sha256  a74f0400524fc83620a9be74a07074b5cbe7594fd4d97fd4c2bfde625fdc1633  trove_classifiers-2025.12.1.14.tar.gz
 # Locally computed sha256 checksums
 sha256  c71d239df91726fc519c6eb72d318ec65820627232b2f796219e87dcf35d0ab4  LICENSE
diff --git a/package/python-trove-classifiers/python-trove-classifiers.mk b/package/python-trove-classifiers/python-trove-classifiers.mk
index a556cbd3dd..5a6d8f49d7 100644
--- a/package/python-trove-classifiers/python-trove-classifiers.mk
+++ b/package/python-trove-classifiers/python-trove-classifiers.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.9.11.17
+PYTHON_TROVE_CLASSIFIERS_VERSION = 2025.12.1.14
 PYTHON_TROVE_CLASSIFIERS_SOURCE = trove_classifiers-$(PYTHON_TROVE_CLASSIFIERS_VERSION).tar.gz
-PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/ca/9a/778622bc06632529817c3c524c82749a112603ae2bbcf72ee3eb33a2c4f1
+PYTHON_TROVE_CLASSIFIERS_SITE = https://files.pythonhosted.org/packages/80/e1/000add3b3e0725ce7ee0ea6ea4543f1e1d9519742f3b2320de41eeefa7c7
 PYTHON_TROVE_CLASSIFIERS_SETUP_TYPE = setuptools
 PYTHON_TROVE_CLASSIFIERS_LICENSE = Apache-2.0
 PYTHON_TROVE_CLASSIFIERS_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
