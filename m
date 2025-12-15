Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 655D7D5B866
	for <buildroot@archiver.kernel.org>; Mon, 15 Dec 2025 19:17:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3C8724044D;
	Mon, 15 Dec 2025 19:17:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9cD8RDZdeEkC; Mon, 15 Dec 2025 19:17:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5A4A04075E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765826263;
	bh=akTtAPp2DRK9/x2IvssNjBYgJo9mRWzcp+pz6KD5VdY=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 Cc:From;
	b=oPXrfeYz1JjsNJIIMY24kS/84EhyVSW0aUeO7hVkA++JiCLPPbedhSgo58cBuhSZC
	 jOH8uj3N5xa+iNz9Xv3iuB3cAXx5zQuN4gU3h2rJCEa+oqZ+VpNrK6KF/c96Ozs9Ce
	 bkssBjX2ykjoVlXOhyqAeVFaSM6tdODIrS0sELH+6GeUAEmXqSh0xJZc6KfGCKYFnF
	 r4Itx5wCoVhqoHYmclqsSz44S1Bgvh3D0PH2Q2KCVnuZgeAUoP1flm+y5ckMsdHCcD
	 8gHkQlhKgZqdrytYRPhlO0jUdmgp73n2qPVy4r1DXhgK/KLoSnp2s3M9zL8HasMkyW
	 cYUqGGJEFSrIA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A4A04075E;
	Mon, 15 Dec 2025 19:17:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id EE5B7255
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E03668082A
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rzom2CjZBifA for <buildroot@buildroot.org>;
 Mon, 15 Dec 2025 19:17:41 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org CE241807DE
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org CE241807DE
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id CE241807DE
 for <buildroot@buildroot.org>; Mon, 15 Dec 2025 19:17:40 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 520AEA4C4355;
 Mon, 15 Dec 2025 20:14:29 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:40828)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vVE1R-000000005ED-236A;
 Mon, 15 Dec 2025 19:14:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon, 15 Dec 2025 20:14:05 +0100
Message-ID: <20251215191416.421755-16-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251215191416.421755-1-bernd@kuhls.net>
References: <20251215191416.421755-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765826069;
 bh=NopnfSAWRwxcgCmfN+4F1i9XUMDqn7DuIm7DqGbw3x4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=iuAxn9quTaCFY85xYikwG6wy6jNEiyd0eOyAcQ3AjmGuP25RmFPfCN50hCysZolTX
 c+NDvGSk/dQMNXb+H8beYF3/CGB6xgOQKJG3WK2Fw2bEzDPxEimQ/BankakzrNhFnS
 I+rosUYV7+s9L8zqnkWDGye+8zC2QrjpMts/FkKHb/us7ANDJxs/GwsMhYQH9Pclm/
 8AIMqXF4YMd/QlB2zJKxSwBbWPbi2lU/JPIOHHLchajaDRzJEMwgf97ocLDETgXwlF
 CnwelTM4voHxVCi+caUkClXz0Ls6HiCnktoFUJ1GTxECIW7PMW1YJS8oFnW/FLhUOj
 GxM9UyKcQPqCQ==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=iuAxn9qu
Subject: [Buildroot] [PATCH 16/27] package/python-pysmb: bump version to
 1.2.13
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

https://github.com/miketeo/pysmb/blob/pysmb-1.2.13/CHANGELOG

Added comments to Config.in computed by scanpypi.

Updated project URL, old URL is broken.

All hashes were computed by scanpypi.

Updated license hash due to copyright year bump:
https://github.com/miketeo/pysmb/commit/e9d59f356455ab29c03ccaa0a1e0219e3ad3c2e9

Updated _SITE to URL computed by scanpypi.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/python-pysmb/Config.in         | 6 +++---
 package/python-pysmb/python-pysmb.hash | 8 +++++---
 package/python-pysmb/python-pysmb.mk   | 4 ++--
 3 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/package/python-pysmb/Config.in b/package/python-pysmb/Config.in
index bb935dddf1..f9a3aab43c 100644
--- a/package/python-pysmb/Config.in
+++ b/package/python-pysmb/Config.in
@@ -1,8 +1,8 @@
 config BR2_PACKAGE_PYTHON_PYSMB
 	bool "python-pysmb"
 	depends on BR2_INSTALL_LIBSTDCPP
-	select BR2_PACKAGE_PYTHON_PYASN1
-	select BR2_PACKAGE_PYTHON_TQDM
+	select BR2_PACKAGE_PYTHON_PYASN1 # runtime
+	select BR2_PACKAGE_PYTHON_TQDM # runtime
 	help
 	  pysmb is an experimental SMB/CIFS library written in Python.
 	  It implements the client-side SMB/CIFS protocol (SMB1 and
@@ -10,7 +10,7 @@ config BR2_PACKAGE_PYTHON_PYSMB
 	  transfer files to/from SMB/CIFS shared folders like your
 	  Windows file sharing and Samba folders.
 
-	  https://miketeo.net/wp/index.php/projects/pysmb
+	  https://miketeo.net/blog/projects/pysmb
 
 comment "python-pysmb needs a toolchain w/ C++"
 	depends on !BR2_INSTALL_LIBSTDCPP
diff --git a/package/python-pysmb/python-pysmb.hash b/package/python-pysmb/python-pysmb.hash
index cc4f553106..55374ca005 100644
--- a/package/python-pysmb/python-pysmb.hash
+++ b/package/python-pysmb/python-pysmb.hash
@@ -1,3 +1,5 @@
-# Locally computed
-sha256  a3897153177d4a88bd4086ed07890f0b4d1d8d1c99866392edc2ce744ce9c3f1  pysmb-1.2.10.tar.gz
-sha256  8c487d5c10f024e44a9cf1df21d1fd28a80bd2dfddd9f1dcd109a47d721f497f  LICENSE
+# md5, sha256 from https://pypi.org/pypi/pysmb/json
+md5  a719b8d2f333963ccc7cc71d4fdea184  pysmb-1.2.13.tar.gz
+sha256  89d37fc4f061acecf40e6864e555898f2ecc49994ec06949edbb94b94239a808  pysmb-1.2.13.tar.gz
+# Locally computed sha256 checksums
+sha256  d2ffe0ee7a0160534d80e21a8e531d78e67d9c29ca83b0c41ded5f7f6b50b551  LICENSE
diff --git a/package/python-pysmb/python-pysmb.mk b/package/python-pysmb/python-pysmb.mk
index b4d010e1b0..9c8da126c1 100644
--- a/package/python-pysmb/python-pysmb.mk
+++ b/package/python-pysmb/python-pysmb.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-PYTHON_PYSMB_VERSION = 1.2.10
+PYTHON_PYSMB_VERSION = 1.2.13
 PYTHON_PYSMB_SOURCE = pysmb-$(PYTHON_PYSMB_VERSION).tar.gz
-PYTHON_PYSMB_SITE = https://miketeo.net/files/Projects/pysmb
+PYTHON_PYSMB_SITE = https://files.pythonhosted.org/packages/de/79/f9a2f2f3aea92ae5647079fcbf28e3969de9af7953bef10e31898fe435e2
 PYTHON_PYSMB_LICENSE = Libpng
 PYTHON_PYSMB_LICENSE_FILES = LICENSE
 PYTHON_PYSMB_SETUP_TYPE = setuptools
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
