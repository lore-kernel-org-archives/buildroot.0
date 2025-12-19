Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 089A1D78770
	for <buildroot@archiver.kernel.org>; Fri, 19 Dec 2025 17:52:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B9B62612D5;
	Fri, 19 Dec 2025 17:52:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id wbCBcSlp1z5n; Fri, 19 Dec 2025 17:52:25 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 95D01612C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766166745;
	bh=YhX8jby/c64Pf46ReEk6k7aQEIxubpQN+Iy2H5pNk0k=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=quHRM2CDBOJ5QIWZeymmuw5PKUDOwDtKZmyckNkbBM3NtnPJeuG+6WMwDfn57AwYU
	 qzQ1d4+RI1ohhKwU7MewBorMTvyHSK0LYCOj5yijZLzctB1nX9WIEScapJ8ai4E4N/
	 Xus0Rk9P5S81UrV0KTNL8mwuPTPVSouIE4QHMD5Pk+z79PqKv6F8hAW2Ve5xbTl1S3
	 u8B4o4rO66jOYITMK5ocab1VG8pd/feNJp7fzsEOhL+MkmDLCjSs3mB69Kq4nZbQyu
	 HD9Ld37sNe6CMVBBfjB21Tyv6//JgMDUNvv9j7v0ywYujP6uV5ADaOHAKIrPlKMxJn
	 WIUNhbcScT3kA==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 95D01612C3;
	Fri, 19 Dec 2025 17:52:25 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 60F61293
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:52:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 535984090D
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:52:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 9t83tNGvz_hz for <buildroot@buildroot.org>;
 Fri, 19 Dec 2025 17:52:23 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 49E364087F
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 49E364087F
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 49E364087F
 for <buildroot@buildroot.org>; Fri, 19 Dec 2025 17:52:23 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a05d4.dip0.t-ipconnect.de [91.58.5.212])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A08F9A4C4AAA;
 Fri, 19 Dec 2025 18:51:48 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:38748)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vWedo-000000002KQ-2f2w;
 Fri, 19 Dec 2025 17:51:48 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
	Simon Dawson <spdawson@gmail.com>
Date: Fri, 19 Dec 2025 18:51:22 +0100
Message-ID: <20251219175141.1907408-4-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251219175141.1907408-1-bernd@kuhls.net>
References: <20251219175141.1907408-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766166708;
 bh=HBhWkyMFhcPzIYEbE7RuIy0hzNXOmvPIhAj9NL/bya0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=hQ1b6X9TvT5wINa72ti/2tiHdI0cb3aVBNsX6K2JHCbiumdPmlhX7s342s+MPdJ2Y
 uycBMPLE3brQ/JJ33LfeqcPGzxky7OEjMqfu00+Iyy8veZ7aT9EPgUFrmnKC4PpY1L
 8JLDmuJbgMJMohZTXQhsZtqGLkA/CBauHzi+1Yqk3hzbrbiFsFsUDrzXVANjy/+Kyc
 OBr5msoV5uzWpNfyAeALCMzRwB0dLJExLfkGBT8prCIePWtSs/aYAV2EnAXbQbU6c8
 cLNWXIlpwylNQUDE/dJqb2Tbkg8+FIsWdB0DSvQhedMylUaZcIUGgwZwpJ17rqXVLR
 cELn9HSdo4sPQ==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=hQ1b6X9T
Subject: [Buildroot] [PATCH v4 03/20] package/libmhash: remove package
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
index 7ff0167ebf..2a22070af9 100644
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
index 2df509047c..154d2dd22a 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1622,7 +1622,6 @@ menu "Crypto"
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
