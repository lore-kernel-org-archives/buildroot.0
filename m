Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AAB4CCCD187
	for <buildroot@archiver.kernel.org>; Sun, 12 Oct 2025 20:20:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7F3B460901;
	Sun, 12 Oct 2025 20:20:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id n2yJS0XCCOv0; Sun, 12 Oct 2025 20:20:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 744C560847
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 744C560847;
	Sun, 12 Oct 2025 20:20:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id BBC47BC
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id ADBE560846
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TnIEwpQwh_1R for <buildroot@buildroot.org>;
 Sun, 12 Oct 2025 20:20:30 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 299E160847
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 299E160847
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 299E160847
 for <buildroot@buildroot.org>; Sun, 12 Oct 2025 20:20:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a02db.dip0.t-ipconnect.de [91.58.2.219])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A0099A4C6713;
 Sun, 12 Oct 2025 22:20:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:39868)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v82Xy-000000004zD-43Zd;
 Sun, 12 Oct 2025 20:20:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 12 Oct 2025 22:19:42 +0200
Message-ID: <20251012202002.178080-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251012202002.178080-1-bernd@kuhls.net>
References: <20251012202002.178080-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760300403;
 bh=DH4nFcGGfJpXa0kXsp8exhp0HMujNbxG5UvcdeQQPHA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=NVZfxRK+wiswxsiwyMqFOIcl8tynm4avwPvBfZaQxRAXE3h7o+Tvw9YbFlmQHgTot
 fOAx8OLwDQWRYc0hfg0h3zrK5WYUTeisAbASnvPaqOBNhqmlw6jFxDROk53BB9t1Ws
 6XZmYsdOVSXsRnruN+p8b/KWX8DBKRT2APfbyIiTRwFAZzgEPalP0sSyyKKtpCFHrK
 uPb+7T4YfcMHGo9GIGNf+oeNIas2aPXdyKPJKq4oHai/eFcYfufxkNOoXZGw3ztN/A
 0zK8R+ShPYonLYd49sDmrXJrARykcWJ+W4CP+hMGBVMsAQYFAcJQhQz9m2dswGXRpq
 5irNk/E3Pk3sQ==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=NVZfxRK+
Subject: [Buildroot] [PATCH 03/23] package/python-falcon: bump version to
 4.1.0
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
Cc: Grzegorz Blach <grzegorz@blach.pl>,
 James Hilliard <james.hilliard1@gmail.com>,
 Romain Naour <romain.naour@gmail.com>, Mauro Condarelli <mc5686@mclink.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-falcon/python-falcon.hash | 4 ++--
 package/python-falcon/python-falcon.mk   | 4 ++--
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/python-falcon/python-falcon.hash b/package/python-falcon/python-falcon.hash
index 8b2fdb0f47..fb5d4dca71 100644
--- a/package/python-falcon/python-falcon.hash
+++ b/package/python-falcon/python-falcon.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/falcon/json
-md5  779e94857aed44e78536a9d36268e76c  falcon-4.0.2.tar.gz
-sha256  58f4b9c9da4c9b1e2c9f396ad7ef897701b3c7c7c87227f0bd1aee40c7fbc525  falcon-4.0.2.tar.gz
+md5  062a6d925bdf9c0be791d736ab6b0e82  falcon-4.1.0.tar.gz
+sha256  dbc3fa642b43e7662f121d0a7b5d7ea42a1a31fb22ae63572c42ee3ecd1f79d0  falcon-4.1.0.tar.gz
 # Locally computed sha256 checksums
 sha256  cfc7749b96f63bd31c3c42b5c471bf756814053e847c10f3eb003417bc523d30  LICENSE
diff --git a/package/python-falcon/python-falcon.mk b/package/python-falcon/python-falcon.mk
index f5ab76655f..91bcd1dd18 100644
--- a/package/python-falcon/python-falcon.mk
+++ b/package/python-falcon/python-falcon.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_FALCON_VERSION = 4.0.2
+PYTHON_FALCON_VERSION = 4.1.0
 PYTHON_FALCON_SOURCE = falcon-$(PYTHON_FALCON_VERSION).tar.gz
-PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/37/4f/d317952294dee1982cd930c8ee2b8b7fbf04140473882801061b3346c713
+PYTHON_FALCON_SITE = https://files.pythonhosted.org/packages/90/85/a4abc8357f6bc6b6b0b3d80e2c319c895900c518a3528279a222d7a53b7e
 PYTHON_FALCON_SETUP_TYPE = setuptools
 PYTHON_FALCON_LICENSE = Apache-2.0
 PYTHON_FALCON_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
