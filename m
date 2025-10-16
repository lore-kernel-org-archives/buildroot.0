Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D8D3CCD199
	for <buildroot@archiver.kernel.org>; Thu, 16 Oct 2025 20:52:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D1A7340433;
	Thu, 16 Oct 2025 20:52:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id d2Cbsdspn61F; Thu, 16 Oct 2025 20:52:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org C59474041B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id C59474041B;
	Thu, 16 Oct 2025 20:52:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2BBE2968
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:52:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 281D760615
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:52:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id q548IyskQkZy for <buildroot@buildroot.org>;
 Thu, 16 Oct 2025 20:52:27 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org D9731605A0
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D9731605A0
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id D9731605A0
 for <buildroot@buildroot.org>; Thu, 16 Oct 2025 20:52:25 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0643.dip0.t-ipconnect.de [91.58.6.67])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0BD7BA4C6E9A;
 Thu, 16 Oct 2025 22:52:23 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54320)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1v9UxS-000000001YX-2eLN;
 Thu, 16 Oct 2025 20:52:22 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 16 Oct 2025 22:52:22 +0200
Message-ID: <20251016205222.16679-2-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251016205222.16679-1-bernd@kuhls.net>
References: <20251016205222.16679-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1760647943;
 bh=cW9mkBQUlwoRDQFyi48Tr+ehKPUxMjwEPvUT/I5dzk8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=MavQqRdxUDh8dXYvAHVE5x8ZvqleVMhOYrtVZyGAXrTijxze+U8DJzUVOvK7SYa4O
 30DkBrGSU5xGtjMk3xCfxzqSF+eqdu1j3cuPBFFENLklL35qp6rYSJC/psnFmUlmtU
 a9s0poHDmc2DQzz3TiYVVV5K1AEWw2SX0Ilt/6ZdgS4ZdLAxdYYsHdZu64CqjYe9hh
 XNGTFY3ibWCSBG62lG5LoSnAnbUJ7f/YWuLkzl4QECiJPX7O73IH1WBcvOavWspHR+
 UWgg+gSqzu1an45xn0U2TD78NSp6LeV87MwHDMJvLdZNw/o6sJZYEMTvJrtW2XHLRl
 2GZdo7jSC8LCA==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=MavQqRdx
Subject: [Buildroot] [PATCH 2/2] package/python-lmdb: bump version to 1.7.5
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
Cc: James Hilliard <james.hilliard1@gmail.com>,
 Mauro Condarelli <mc5686@mclink.it>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Added dependencies to python-cffi & python-patch-ng due to upstream
commit:
https://github.com/jnwatson/py-lmdb/commit/3f6f458df64fdbf4a2dbc5ec0aa407b640ef00e2

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-lmdb/Config.in        | 2 ++
 package/python-lmdb/python-lmdb.hash | 4 ++--
 package/python-lmdb/python-lmdb.mk   | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/package/python-lmdb/Config.in b/package/python-lmdb/Config.in
index b63af96ec4..a94badbe76 100644
--- a/package/python-lmdb/Config.in
+++ b/package/python-lmdb/Config.in
@@ -1,5 +1,7 @@
 config BR2_PACKAGE_PYTHON_LMDB
 	bool "python-lmdb"
+	select BR2_PACKAGE_PYTHON_CFFI # runtime
+	select BR2_PACKAGE_PYTHON_PATCH_NG # runtime
 	help
 	  Universal Python binding for the LMDB 'Lightning' Database.
 
diff --git a/package/python-lmdb/python-lmdb.hash b/package/python-lmdb/python-lmdb.hash
index f729c197f8..525c434f2a 100644
--- a/package/python-lmdb/python-lmdb.hash
+++ b/package/python-lmdb/python-lmdb.hash
@@ -1,5 +1,5 @@
 # md5, sha256 from https://pypi.org/pypi/lmdb/json
-md5  f9d67b42a6d708ec1cfc860f67e20387  lmdb-1.6.2.tar.gz
-sha256  d28e3fa59935ff688858760ec52f202ecb8c1089a3f68d1f162ea3078d151e73  lmdb-1.6.2.tar.gz
+md5  0996b2df3b8019b76ce1fa37913e41f0  lmdb-1.7.5.tar.gz
+sha256  f0604751762cb097059d5412444c4057b95f386c7ed958363cf63f453e5108da  lmdb-1.7.5.tar.gz
 # Locally computed sha256 checksums
 sha256  310fe25c858a9515fc8c8d7d1f24a67c9496f84a91e0a0e41ea9975b1371e569  LICENSE
diff --git a/package/python-lmdb/python-lmdb.mk b/package/python-lmdb/python-lmdb.mk
index 1648ed7054..3f92ef066f 100644
--- a/package/python-lmdb/python-lmdb.mk
+++ b/package/python-lmdb/python-lmdb.mk
@@ -4,11 +4,12 @@
 #
 ################################################################################
 
-PYTHON_LMDB_VERSION = 1.6.2
+PYTHON_LMDB_VERSION = 1.7.5
 PYTHON_LMDB_SOURCE = lmdb-$(PYTHON_LMDB_VERSION).tar.gz
-PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/71/54/fb1d5918406a72fcf46fbfaece7c0349d88cd8685f5443a142ddd7dac05b
+PYTHON_LMDB_SITE = https://files.pythonhosted.org/packages/c7/a3/3756f2c6adba4a1413dba55e6c81a20b38a868656517308533e33cb59e1c
 PYTHON_LMDB_LICENSE = OLDAP-2.8
 PYTHON_LMDB_LICENSE_FILES = LICENSE
+PYTHON_LMDB_DEPENDENCIES = host-python-cffi host-python-patch-ng
 PYTHON_LMDB_CPE_ID_VENDOR = py-lmdb_project
 PYTHON_LMDB_CPE_ID_PRODUCT = py-lmdb
 PYTHON_LMDB_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
