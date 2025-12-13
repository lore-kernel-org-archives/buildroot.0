Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 101F6D59F76
	for <buildroot@archiver.kernel.org>; Sat, 13 Dec 2025 14:30:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D9F4381445;
	Sat, 13 Dec 2025 14:30:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TbGKGVMNdEmT; Sat, 13 Dec 2025 14:30:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC9EA82404
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765636239;
	bh=qkeF4knqz9TmSyNwt9NJBOcUF91/XV7y437Xbp27OcU=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=YZL7fWGI9B3uggpji7wqyPZH+cGxYPPWv1S8PYQX8/dsD8p22zA3ZsDBvDTXJa1Wc
	 1ltCP0AQJuBdu1h46wRVnC23yeNrJ9BgYKA8evGNpmKZumvxj33vHtiqFizdC0RY2k
	 tZ+oGuH0tN7yQO7TLnWq3emDX+KiJT3Z6pJ24YYRoJM9CkjvGwbIf2LzjhOtHIjvSk
	 0VcAKv3n+hwbBsdhyNa6EmMC5LGudefnudwuzV28Vco566Mw1P8ocguRRFPHusXK5p
	 HhJpX28a+TsDQeymGox/SGndBqSlOATnSce9YLC0/d+dUU2yv2TZNCOI2QWU71E54M
	 4u9OUlR4KJ0cg==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC9EA82404;
	Sat, 13 Dec 2025 14:30:38 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id DCEFC13D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:30:36 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id CF22382404
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:30:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L3QHrsR4jlsg for <buildroot@buildroot.org>;
 Sat, 13 Dec 2025 14:30:36 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org C09B881445
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C09B881445
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id C09B881445
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 14:30:35 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cc21.dip0.t-ipconnect.de [79.214.204.33])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 8FB0CA4C405D
 for <buildroot@buildroot.org>; Sat, 13 Dec 2025 15:30:09 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56096)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vUQdN-000000000dj-0v12
 for buildroot@buildroot.org; Sat, 13 Dec 2025 14:30:09 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sat, 13 Dec 2025 15:29:54 +0100
Message-ID: <20251213143008.1329736-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251213143008.1329736-1-bernd@kuhls.net>
References: <20251213143008.1329736-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765636209;
 bh=jhR+CH+oOje85h6CPeW2DQMeY+FGfk9NtLEpGZElfEM=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=A8DbmvLd+hnitS1u2h0TWxaOADewijm6/cZKG8TyVpE5n37ULXk8sl2h+BjfHUhPy
 QR5zEw+OeBAVmyHpzYQvyhWgrxDeaktSg4bU6qAIANflc+69Vnq+pnZZ8grcYHZ14m
 7ZATKR40/9AfPY3yGjT4OX+PQdJBoy7agVPbRwwUvKyMccixkMWVJ5OgOCp5O0O1gx
 vGtMELOQn0MdT5mnXxRP6mXixIV3nxIweoZxRAU30niNGx/4tCtTRG/sP1Uu155Bx7
 MfJGMIIlMgF8m5Cp9AWsmyxwt6RxDIU99m88ugLsNKBfem8hVfMU4tKd3mEkiL+bKX
 BtnI5mzcKZdyg==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=A8DbmvLd
Subject: [Buildroot] [PATCH 03/16] package/libmhash: remove package
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

Analysis of https://sourceforge.net/projects/mhash:
last commit: Nov 2013
last bug report: Oct 2024
last patch sent upstream: Apr 2020

The package is broken with gcc 15.x and no other package depends on it.

Fixes:
https://autobuild.buildroot.net/results/bd8/bd868674f9796879d1d9af52672f7d3e00c333d8/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 Config.in.legacy               |  6 ++++++
 package/Config.in              |  1 -
 package/libmhash/Config.in     |  9 ---------
 package/libmhash/libmhash.hash |  3 ---
 package/libmhash/libmhash.mk   | 14 --------------
 5 files changed, 6 insertions(+), 27 deletions(-)
 delete mode 100644 package/libmhash/Config.in
 delete mode 100644 package/libmhash/libmhash.hash
 delete mode 100644 package/libmhash/libmhash.mk

diff --git a/Config.in.legacy b/Config.in.legacy
index d5eb468985..64b5a703d9 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2026.02"
 
+config BR2_PACKAGE_LIBMHASH
+	bool "libmhash has been removed"
+	select BR2_LEGACY
+	help
+	  libmhash is unmaintained and has been removed
+
 config BR2_PACKAGE_DMRAID
 	bool "dmraid has been removed"
 	select BR2_LEGACY
diff --git a/package/Config.in b/package/Config.in
index 0fe1f4778e..10db568247 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1623,7 +1623,6 @@ menu "Crypto"
 	source "package/libkcapi/Config.in"
 	source "package/libksba/Config.in"
 	source "package/libmd/Config.in"
-	source "package/libmhash/Config.in"
 	source "package/libnss/Config.in"
 	source "package/libp11/Config.in"
 	source "package/libscrypt/Config.in"
diff --git a/package/libmhash/Config.in b/package/libmhash/Config.in
deleted file mode 100644
index 774ff1b1bc..0000000000
--- a/package/libmhash/Config.in
+++ /dev/null
@@ -1,9 +0,0 @@
-config BR2_PACKAGE_LIBMHASH
-	bool "libmhash"
-	help
-	  Mhash is a free (under GNU Lesser GPL) library which provides
-	  a uniform interface to a large number of hash algorithms.
-	  These algorithms can be used to compute checksums, message
-	  digests, and other signatures.
-
-	  http://mhash.sourceforge.net/
diff --git a/package/libmhash/libmhash.hash b/package/libmhash/libmhash.hash
deleted file mode 100644
index 06c1fe4897..0000000000
--- a/package/libmhash/libmhash.hash
+++ /dev/null
@@ -1,3 +0,0 @@
-# Locally computed:
-sha256  56521c52a9033779154432d0ae47ad7198914785265e1f570cee21ab248dfef0  mhash-0.9.9.9.tar.bz2
-sha256  d245807f90032872d1438d741ed21e2490e1175dc8aa3afa5ddb6c8e529b58e5  COPYING
diff --git a/package/libmhash/libmhash.mk b/package/libmhash/libmhash.mk
deleted file mode 100644
index f2da10e662..0000000000
--- a/package/libmhash/libmhash.mk
+++ /dev/null
@@ -1,14 +0,0 @@
-################################################################################
-#
-# libmhash
-#
-################################################################################
-
-LIBMHASH_VERSION = 0.9.9.9
-LIBMHASH_SITE = http://downloads.sourceforge.net/project/mhash/mhash/$(LIBMHASH_VERSION)
-LIBMHASH_SOURCE = mhash-$(LIBMHASH_VERSION).tar.bz2
-LIBMHASH_INSTALL_STAGING = YES
-LIBMHASH_LICENSE = LGPL-2.0
-LIBMHASH_LICENSE_FILES = COPYING
-
-$(eval $(autotools-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
