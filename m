Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88402D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 55A2840AFF;
	Mon, 15 Dec 2025 19:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TiKtN96Lljz7; Mon, 15 Dec 2025 19:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DC38C40AA7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826371;
	bh=dBOwmmzTFsHuWvE62Cjuq/9Jssd2S7dZYKDE/XhhMtU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=KJrHfOfl9MlwRLRI0TyRlP8ojV7Aq8NddiU9OwC/ujd3Fib+Lu3X5YuUv1r2I/tyu
	 3TbMcv+cjfXgoyt9QX7iR/Gmg73i6VhtU8rLxRdser2kN4exV5c4j2327sGDzMIPl4
	 GcMcjejTUCF10NRgz5BZY9A8wkh+TfktMwokqIjBnfjL95Ar1s5gyu4eP3Lr8zb5Z5
	 g3LbH765SngPy+tUyke+YtmRWHA/O2xxflQSuSRooQRCwjPwIXzjuX3aw1fkoeiRzD
	 c9Xsv+zVqQv9DOloRFn/bORjoq24NN8DMfu7Sm0YZ5dzmfWkXBgoXD0F2eM46mLo4i
	 7AGOc+dCGyIJQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DC38C40AA7;
	Mon, 15 Dec 2025 19:19:31 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id AD742151
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9ED5C60EB7
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id CkKdmfDczvpf for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:19:29 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 8BABC607B4
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8BABC607B4
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 8BABC607B4
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:19:29 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7F53EA4C4372;
 Mon, 15 Dec 2025 20:14:31 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1S-000000005ED-1GgB;
 Mon, 15 Dec 2025 19:14:18 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:15 +0100
Message-ID: <20251215191416.421755-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826071;
 bh=Ipt3PSoRJw/0WzCHU00ymH9DFZPnakthDx2BquAdhhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=XUVeYrzQwu4rKxyza7ND0Q/91mVTANYPTRm8JRQ90LPWEBZ7HUqEqnvPV4xVNFNuf
 Pm4fNr5tV21qmMZ7JKWT0Fnek0M8t1knfb4HkMfz4jqlh5uVuf0fUQJmw9OnW9snnn
 cHAP+zRlaX0bV4pS53pwROO+fXhu5SiaVkg63VOYWb2M8U9bidDDAUcgGwODWTKMi5
 PQzpKJp87xX06GafGD0uQ91OPSWkYBK6J+KiFxPJeZGRjfAMpdsB7FIknWQ/Obs6Tq
 qWlU7D9XzSmmWEhfMKVMGPRCw1aPJ8cTaHnHz81PUV4ZbWtGX9YYGqI6epGHdgLK8o
 Mi3e3ECvbaA1g==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=XUVeYrzQ
Subject: [Buildroot] [PATCH 26/27] package/python-segno: bump version to
 1.6.6
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
 =?UTF-8?q?Rapha=C3=ABl=20M=C3=A9lotte?= <raphael.melotte@mind.be>,
 Grzegorz Blach <grzegorz@blach.pl>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Guillaume William Brs <guillaume.bressaix@gmail.com>,
 Witold Lipieta <witold.lipieta@thaumatec.com>,
 James Hilliard <james.hilliard1@gmail.com>,
 Marcin Niestroj <m.niestroj@grinn-global.com>,
 Falco Hyfing <hyfinglists@gmail.com>, Mauro Condarelli <mc5686@mclink.it>,
 Steve Calfee <stevecalfee@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/heuer/segno/blob/1.6.6/CHANGES.rst

Updated license hash due to copyright year bump:
https://github.com/heuer/segno/commit/780296986b9b5c7934667935c8d654d0a7e97262

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-segno/python-segno.hash | 6 +++---
 package/python-segno/python-segno.mk   | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/python-segno/python-segno.hash b/package/python-segno/python-segno.hash
index a467b663e8..ce1e9b8691 100644
--- a/package/python-segno/python-segno.hash
+++ b/package/python-segno/python-segno.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/segno/json
-md5  3835036bcf44667eb0a155107ed1ac67  segno-1.6.1.tar.gz
-sha256  f23da78b059251c36e210d0cf5bfb1a9ec1604ae6e9f3d42f9a7c16d306d847e  segno-1.6.1.tar.gz
+md5  088bb1d2ec7f279e91cd3a8936ef7d3d  segno-1.6.6.tar.gz
+sha256  e60933afc4b52137d323a4434c8340e0ce1e58cec71439e46680d4db188f11b3  segno-1.6.6.tar.gz
 # Locally computed sha256 checksums
-sha256  720b7b93e4e80374be9aee88c650a468ae6a6b6471ce4581058dedce23d3cf9d  LICENSE
+sha256  de6c85fccf5d52902aa13dfe2dc6d2a2a106fc3419ed438f3460f0d4b76a6935  LICENSE
diff --git a/package/python-segno/python-segno.mk b/package/python-segno/python-segno.mk
index 03efcb5c0f..f1fc76945f 100644
--- a/package/python-segno/python-segno.mk
+++ b/package/python-segno/python-segno.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_SEGNO_VERSION = 1.6.1
+PYTHON_SEGNO_VERSION = 1.6.6
 PYTHON_SEGNO_SOURCE = segno-$(PYTHON_SEGNO_VERSION).tar.gz
-PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/5d/74/3896e205306a1b43d6b88326e5838572d97b4b74df8c9cd11acfcd9db503
+PYTHON_SEGNO_SITE = https://files.pythonhosted.org/packages/1c/2e/b396f750c53f570055bf5a9fc1ace09bed2dff013c73b7afec5702a581ba
 PYTHON_SEGNO_SETUP_TYPE = flit
 PYTHON_SEGNO_LICENSE = BSD-3-Clause
 PYTHON_SEGNO_LICENSE_FILES = LICENSE
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
