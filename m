Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8B59F94CA7
	for <buildroot@archiver.kernel.org>; Tue, 21 Apr 2026 18:39:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9FD3A607AC;
	Tue, 21 Apr 2026 18:39:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0zpZUguQ6RPd; Tue, 21 Apr 2026 18:39:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org A7EE560854
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776796744;
	bh=NQugQ8FrZhZi2CMB4g0J79y/empgpGO1hxqdpdkgKK8=;
	h=From:To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=PCeDXKtGAzIrXizrHc9hEstRF//3rZnN2EoXrV44QKpe2pxj0YaVJqh3E6H3ec8eh
	 1eVmpRMTV+tSKG7cHLGVg78CvIEzdjeVwXcGrOOkXkKN3616IwHtjncIXymUHQLIbP
	 /A+FLDl31OjTguzTW3dISAhmeDJhfnfdwaWxNVjUH4+NyCTcozKXwNLovCaVweZKYM
	 3eICDPXeU784b9TiCrJjAJ15c3Erc7dbqGutmnzpuXmFjgCs2wz22LniJXbQtWb+Jp
	 gfchh7PI0cO96oSaM65irD66M8LOtw+3NO5EhClgg8aO3jcMy8OoYB0waWl5EdwXYh
	 6Bz3+VYSmRdMw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id A7EE560854;
	Tue, 21 Apr 2026 18:39:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id CBE20183
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:39:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id BDDFC83D08
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:39:03 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wm9O2pWnz_oN for <buildroot@buildroot.org>;
 Tue, 21 Apr 2026 18:39:02 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 7B77B83CD7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 7B77B83CD7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 7B77B83CD7
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 18:39:02 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0177.dip0.t-ipconnect.de [91.58.1.119])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 3283EA4C05FE
 for <buildroot@buildroot.org>; Tue, 21 Apr 2026 20:38:46 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42168)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wFFzh-000000007x8-3RfC
 for buildroot@buildroot.org; Tue, 21 Apr 2026 18:38:45 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Tue, 21 Apr 2026 20:38:43 +0200
Message-ID: <20260421183845.2456995-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: -
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776796726;
 bh=jBynAJr21kFe2murJ9NH9EF6hWt4g4gs0Wt6t5HgAfM=;
 h=From:To:Subject:Date:From;
 b=foF5KNTpECmJksLBM3KNTwRzJdSXFj326TcmFwsLdLxmU786U98MnZ4Gqf/CfAZQn
 W7/tpiz/CrD4JyMv3HbLAJP6oT0uCNbaHR+lRlbPzvLXTK+1YEGSKW/YmB3ztciU59
 y9h2CaihKddw9QpbaZJQcWJq+V43aS7ze4jPCDihKCwwFTtnajieErcdfkk7vrC6Xk
 fxS8Gk1n0+lT7LlB3bPvZFwi/Tn+gTA/42sIxoOaTeYF67hfhFPU2rqVAiFihz7FPL
 t0fQvhuzsFTKBojeBpAOCMgfnGJEKjoFBodlV8kvQlJ/8gV/M2MYDrXRqPNcs3I3n4
 HHeHv1ROC8Z4A==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=foF5KNTp
Subject: [Buildroot] [PATCH 1/3] package/davfs2: bump version to 1.7.3
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

https://github.com/alisarctl/davfs2/blob/rel-1-7-3/ChangeLog

Removed patch 0002 which is not needed anymore due to upstream removal
of the neon version check:
https://github.com/alisarctl/davfs2/commit/6b614bed3e814eb820a43a433c1f2c715c301f61

Upstream added musl support with this version:
https://github.com/alisarctl/davfs2/commit/270607253e4cbfa40ff59fc67a850b252bf0b0fa

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 ...2-configure.ac-add-neon-version-0.33.patch | 27 -------------------
 package/davfs2/Config.in                      |  6 ++---
 package/davfs2/davfs2.hash                    |  2 +-
 package/davfs2/davfs2.mk                      |  4 +--
 4 files changed, 5 insertions(+), 34 deletions(-)
 delete mode 100644 package/davfs2/0002-configure.ac-add-neon-version-0.33.patch

diff --git a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch b/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
deleted file mode 100644
index 93eff48cd5..0000000000
--- a/package/davfs2/0002-configure.ac-add-neon-version-0.33.patch
+++ /dev/null
@@ -1,27 +0,0 @@
-From 1c539d158ae73e867d0d30b8c3d27f48d742ed06 Mon Sep 17 00:00:00 2001
-From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Date: Sat, 30 Mar 2024 09:18:15 +0100
-Subject: [PATCH] configure.ac: add neon version 0.33
-
-Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
-Upstream: https://savannah.nongnu.org/bugs/?65247
----
- configure.ac | 2 +-
- 1 file changed, 1 insertion(+), 1 deletion(-)
-
-diff --git a/configure.ac b/configure.ac
-index 4f86cde..ede9b1e 100644
---- a/configure.ac
-+++ b/configure.ac
-@@ -36,7 +36,7 @@ AC_PROG_LN_S
- # Checks for libraries.
- AM_GNU_GETTEXT_VERSION(0.19.8)
- AM_GNU_GETTEXT([external])
--NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32])
-+NE_REQUIRE_VERSIONS([0], [27 28 29 30 31 32 33])
- DAV_CHECK_NEON
- 
- # Checks for header files.
--- 
-2.43.0
-
diff --git a/package/davfs2/Config.in b/package/davfs2/Config.in
index 31a680563c..082a422059 100644
--- a/package/davfs2/Config.in
+++ b/package/davfs2/Config.in
@@ -1,10 +1,10 @@
-comment "davfs2 needs a glibc toolchain"
+comment "davfs2 needs a glibc or musl toolchain"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_USES_GLIBC
+	depends on BR2_TOOLCHAIN_USES_UCLIBC
 
 config BR2_PACKAGE_DAVFS2
 	bool "davfs2"
-	depends on BR2_TOOLCHAIN_USES_GLIBC # fstab.h
+	depends on !BR2_TOOLCHAIN_USES_UCLIBC # fstab.h
 	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_NEON
 	select BR2_PACKAGE_NEON_XML
diff --git a/package/davfs2/davfs2.hash b/package/davfs2/davfs2.hash
index 1cbacc388f..f23f21aed5 100644
--- a/package/davfs2/davfs2.hash
+++ b/package/davfs2/davfs2.hash
@@ -1,4 +1,4 @@
 # Locally calculated
-sha256  251db75a27380cca1330b1b971700c5e5dcc0c90e5a47622285f0140edfe3a2f  davfs2-1.7.0.tar.gz
+sha256  a5368161eb5055651d7e5e8180c1606da95e78c941b6bb8a9286df7923cfcba9  davfs2-1.7.3.tar.gz
 # License file, locally calculated
 sha256  0ae0485a5bd37a63e63603596417e4eb0e653334fa6c7f932ca3a0e85d4af227  COPYING
diff --git a/package/davfs2/davfs2.mk b/package/davfs2/davfs2.mk
index 9f9e4a7073..be30dd0c45 100644
--- a/package/davfs2/davfs2.mk
+++ b/package/davfs2/davfs2.mk
@@ -4,13 +4,11 @@
 #
 ################################################################################
 
-DAVFS2_VERSION = 1.7.0
+DAVFS2_VERSION = 1.7.3
 DAVFS2_SITE = http://download.savannah.nongnu.org/releases/davfs2
 DAVFS2_LICENSE = GPL-3.0+
 DAVFS2_LICENSE_FILES = COPYING
 DAVFS2_CPE_ID_VENDOR = werner_baumann
-# 0002-configure.ac-add-neon-version-0.33.patch
-DAVFS2_AUTORECONF = YES
 
 DAVFS2_DEPENDENCIES = \
 	neon \
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
