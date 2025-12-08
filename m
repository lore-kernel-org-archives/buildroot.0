Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08F88D3B7E2
	for <buildroot@archiver.kernel.org>; Mon,  8 Dec 2025 17:55:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D292B6087E;
	Mon,  8 Dec 2025 17:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MnGewb-U23mw; Mon,  8 Dec 2025 17:55:41 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 00F3560BDC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1765216541;
	bh=CBz2fE7X3lUMp57XDR0ZVtLJBaDURLgoInnuNWC3TIA=;
	h=From:To:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=Dfqc18nJ4NskNhcAvs4kiYGPaiSUjh6rkvdll4rl0+yOLBdV2IGCRL2XQipPWnYs3
	 x5AHoXB9qpUuS4v8oYuPcOD0AhegcxnpRcUGXUnQ//GsBqXraMQhpFg2PLOTC3KDOV
	 ORwqKaaCrUpf1XtKNYCMdQt/EGPwKhx1tBairu+OQCnyxCzuCaVpDP8eCghHjmEuL6
	 0DmaTnFXjfunwJKXP5vUZvVP/VUs23QEgkobUsRo49Czt0spwL1D6P21N6HKtknqOk
	 xGxiI10zCTV6LWxHYzTeK11x/n1FfJWd0rWFhWo79iJ7z846cUgI7/H/4Z42obO1Uv
	 l2a8zyaKgJYag==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 00F3560BDC;
	Mon,  8 Dec 2025 17:55:41 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 93DE02F1
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:55:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86CA0408FD
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:55:39 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id L-pZZ3gCe-Cv for <buildroot@buildroot.org>;
 Mon,  8 Dec 2025 17:55:38 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 74CEA4088A
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 74CEA4088A
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 74CEA4088A
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 17:55:38 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c020.dip0.t-ipconnect.de [79.214.192.32])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 46CB8A4C2554
 for <buildroot@buildroot.org>; Mon,  8 Dec 2025 18:55:11 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:56900)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vSfS2-000000006PE-2SE7
 for buildroot@buildroot.org; Mon, 08 Dec 2025 17:55:11 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Mon,  8 Dec 2025 18:55:10 +0100
Message-ID: <20251208175510.3923692-3-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251208175510.3923692-1-bernd@kuhls.net>
References: <20251208175510.3923692-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1765216511;
 bh=okwQ6JDQ7U/rNBIWl7zlFTem7vMSAdbgVubJ5gSiDug=;
 h=From:To:Subject:Date:In-Reply-To:From;
 b=G1asZiQTOnpIO45vLymmr7a9m2mwdNB/Q6k+CFpxu38vLSyFefiaBBeVeSXFGx0E6
 1J898uhF3iArUInjyeAezOzlhmu7D06+rO5yiNDiS2/ssiWdySkYR6DSGX8aBibqZo
 Z7sHlZmOnk4pUXgXCi0ORMM66MZbObGPR8D86lPz59powRZHjTyNbOzS6u6t1cvohA
 uLeI2Po/zu/WSF/gpYJDPaZ2Jcr6St0psoq+sIlpVm+ACCIqTpKj1eJbxwIS8K60ZZ
 iLSJwxl90Gy7QTtWffAR7jVrNQlshRRM+6Q7Jpk3cSjU8pMbaNjCgHKLQitK4iIUlN
 OEjIqWTfuHkLg==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=G1asZiQT
Subject: [Buildroot] [PATCH 3/3] package/libmhash: remove package
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
index e5d4afd441..5806c64cd2 100644
--- a/Config.in.legacy
+++ b/Config.in.legacy
@@ -146,6 +146,12 @@ endif
 
 comment "Legacy options removed in 2025.11"
 
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
index 2261b3d81a..6ab0404aa6 100644
--- a/package/Config.in
+++ b/package/Config.in
@@ -1620,7 +1620,6 @@ menu "Crypto"
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
