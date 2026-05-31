Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4A5CD6E52
	for <buildroot@archiver.kernel.org>; Sun, 31 May 2026 17:48:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D33AF60B83;
	Sun, 31 May 2026 17:48:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2v2xTvSBnvgW; Sun, 31 May 2026 17:48:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org F225D60FB8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1780249714;
	bh=FZo+t0RHc5iAXaGGgFqpLVQ5RFc25y3frd9qWt9VPzw=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=MyB2pvTXggGGzG4B16y8NnxvhlISE+8ctJutWwbh87Qon4cuZfZoa+cjLe2wtR/mm
	 DqZ4pmuLniVx/majO72d03XcHF9ap7O2K6Vvd92ov5fwahvQQauLMeG6Pbh/wuUrI3
	 e0E2xo4rSrOBOdhMmNb7UnAf+psSpzkLKaYDREH+HDyKEBfkQEkPi0/kRVwGw3V2VM
	 FXQtPA0XUiD2ZiwrSuVeJmkOT6bkzuVsZLy3MU8P8tBqpAgTcNDoBx5C+KEmmj3+IW
	 Sw77RjTd+quWzSs6vYza1z4S8gpVvt4qsiBvSojd0lmcCVKWUeTuMEGRIs55aPwluN
	 Xi1IgW1Ocs+fA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id F225D60FB8;
	Sun, 31 May 2026 17:48:33 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id B79CEF4
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:48:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id A944884F25
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:48:32 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGsrT5jwoMPW for <buildroot@buildroot.org>;
 Sun, 31 May 2026 17:48:31 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 9271184EDA
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9271184EDA
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 9271184EDA
 for <buildroot@buildroot.org>; Sun, 31 May 2026 17:48:31 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0bc7.dip0.t-ipconnect.de [91.58.11.199])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 0C7E8A4C05B8;
 Sun, 31 May 2026 19:48:17 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:51248)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.4)
 (envelope-from <bernd@kuhls.net>) id 1wTkGn-000000000Fr-0EQL;
 Sun, 31 May 2026 17:48:16 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Date: Sun, 31 May 2026 19:48:15 +0200
Message-ID: <20260531174816.1681614-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: --
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202605290044; t=1780249697;
 bh=6JT+sPV0glkX7TwiV3QeCr1qXHSnkgzPe/soBWVqTgI=;
 h=From:To:Cc:Subject:Date:From;
 b=EhMhnSWB6SdprNWvYO0Olq5IFVvNMPb13/uDXJa6Ip0N/8kOUOykbplCgAwUUimdl
 DBJhm6vvC5+DZ01rfy+dg243FqodflIay56P3brSkqmFSX+5v+cjfzEtsMVOhaenn+
 lVW6BJbS6TCK5ezhA9vLXU0LBjDBv4ce5QTJiJPOXxVBZumKQ5DhRZIQFItGvi595C
 1+XGVEobO3vN7S/5zeV4ZAqE1g3gwl0WQYD/FEMZUNr3905+lchS7t2cOFyxjmlorS
 /jO2VPX/GuYr37A6QHqwlBuHafHZ594kABpi2OKeYA8VeGv9fuPxNCgvjm/7G1szGN
 cweAL+uWICwRA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202605290044 header.b=EhMhnSWB
Subject: [Buildroot] [PATCH/next v2 1/2] package/minizip-zlib: bump version
 to 1.3.2
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

https://github.com/madler/zlib/releases/tag/v1.3.2
https://github.com/madler/zlib/blob/v1.3.2/ChangeLog

Added upstream patch which adds ints.h as installed header to prevent
build errors which would be caused by this bump.

Updated license hash due to copyright year bumps:
https://github.com/madler/zlib/commit/570720b0c24f9686c33f35a1b3165c1f568b96be
https://github.com/madler/zlib/commit/9e35567064baded660f61732b247ef5abc809014

Switched _SITE to https.

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: Gitlab pipelines passed:
    https://gitlab.com/bkuhls/buildroot/-/commits/3847d430587a9d874b378a77a80cfbe98f2fc784

 ...ncy-to-ints.h-in-minizip-Makefile.am.patch | 26 +++++++++++++++++++
 package/minizip-zlib/minizip-zlib.hash        |  4 +--
 package/minizip-zlib/minizip-zlib.mk          |  4 +--
 3 files changed, 30 insertions(+), 4 deletions(-)
 create mode 100644 package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch

diff --git a/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
new file mode 100644
index 0000000000..98e16251d8
--- /dev/null
+++ b/package/minizip-zlib/0001-Add-dependency-to-ints.h-in-minizip-Makefile.am.patch
@@ -0,0 +1,26 @@
+From cb14dc9ade3759352417a300e6c2ed73268f1d97 Mon Sep 17 00:00:00 2001
+From: Rui Chen <rui@chenrui.dev>
+Date: Tue, 17 Feb 2026 10:48:39 -0500
+Subject: [PATCH] Add dependency to ints.h in minizip Makefile.am.
+
+So that ints.h is part of the installation.
+
+Upstream: https://github.com/madler/zlib/commit/cb14dc9ade3759352417a300e6c2ed73268f1d97
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ contrib/minizip/Makefile.am | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/contrib/minizip/Makefile.am b/contrib/minizip/Makefile.am
+index d343011eb..b7dea4f7e 100644
+--- a/contrib/minizip/Makefile.am
++++ b/contrib/minizip/Makefile.am
+@@ -27,6 +27,7 @@ libminizip_la_LDFLAGS = $(AM_LDFLAGS) -version-info 1:0:0 -lz
+ minizip_includedir = $(includedir)/minizip
+ minizip_include_HEADERS = \
+ 	crypt.h \
++	ints.h \
+ 	ioapi.h \
+ 	mztools.h \
+ 	unzip.h \
diff --git a/package/minizip-zlib/minizip-zlib.hash b/package/minizip-zlib/minizip-zlib.hash
index cbd9313870..bc8b046426 100644
--- a/package/minizip-zlib/minizip-zlib.hash
+++ b/package/minizip-zlib/minizip-zlib.hash
@@ -1,4 +1,4 @@
 # From http://www.zlib.net/
-sha256  38ef96b8dfe510d42707d9c781877914792541133e1870841463bfa73f883e32  zlib-1.3.1.tar.xz
+sha256  d7a0654783a4da529d1bb793b7ad9c3318020af77667bcae35f95d0e42a792f3  zlib-1.3.2.tar.xz
 # License files, locally calculated
-sha256  845efc77857d485d91fb3e0b884aaa929368c717ae8186b66fe1ed2495753243  LICENSE
+sha256  e32ff4e00d9d94930537635291da39e7e612703334bf6fde8c7f1686fe8a45a2  LICENSE
diff --git a/package/minizip-zlib/minizip-zlib.mk b/package/minizip-zlib/minizip-zlib.mk
index 6d4a2d2e20..32af7ff0eb 100644
--- a/package/minizip-zlib/minizip-zlib.mk
+++ b/package/minizip-zlib/minizip-zlib.mk
@@ -4,9 +4,9 @@
 #
 ################################################################################
 
-MINIZIP_ZLIB_VERSION = 1.3.1
+MINIZIP_ZLIB_VERSION = 1.3.2
 MINIZIP_ZLIB_SOURCE = zlib-$(MINIZIP_ZLIB_VERSION).tar.xz
-MINIZIP_ZLIB_SITE = http://www.zlib.net
+MINIZIP_ZLIB_SITE = https://www.zlib.net
 MINIZIP_ZLIB_LICENSE = Zlib
 MINIZIP_ZLIB_LICENSE_FILES = LICENSE
 MINIZIP_ZLIB_INSTALL_STAGING = YES
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
