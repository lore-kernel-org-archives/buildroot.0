Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FEF5CD11DF
	for <buildroot@archiver.kernel.org>; Thu, 28 Mar 2024 21:50:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 550E5400B8;
	Thu, 28 Mar 2024 21:50:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id fCkHb5Up0wtk; Thu, 28 Mar 2024 21:50:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 4FB22417EE
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4FB22417EE;
	Thu, 28 Mar 2024 21:50:00 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B10CA1BF47A
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:49:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9DDCC417EE
 for <buildroot@lists.busybox.net>; Thu, 28 Mar 2024 21:49:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id N5FLk4t97OrT for <buildroot@lists.busybox.net>;
 Thu, 28 Mar 2024 21:49:57 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org A267B400B8
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org A267B400B8
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id A267B400B8
 for <buildroot@buildroot.org>; Thu, 28 Mar 2024 21:49:57 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6ccba.dip0.t-ipconnect.de [79.214.204.186])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 642A7A4C02BA;
 Thu, 28 Mar 2024 22:49:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:34090)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rpxdC-000000005gi-49Gp;
 Thu, 28 Mar 2024 21:49:55 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 28 Mar 2024 22:49:54 +0100
Message-Id: <20240328214954.2249481-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1711662595;
 bh=nZzXjSDsTGeOdJs8LfCnvGMPb0cv7x2OPTx8zXDhwhk=;
 h=From:To:Cc:Subject:Date:From;
 b=R3HchB2FS77QYTNPujAsBiwzr2wbqxE2bVeNddI8ziq0csLXNTQVFatbbPG2YU0o8
 YvqwIQLG2VY4JTZrRup7cycGMatSKPwLaAHBmtp5SqwXLwjFaUs9Yo6f61ZW1lbFHH
 z6lLB5rdGe6KypMCB/lgxlMaiI2FufBla6HjYH5hwxZx2mORCcHmUrbwTnujC6e7tR
 EWdCGIDso07BxOEl2qlld0xa8g4cUUvlsn4/NeM3Ej0c/G63QMdyFKlDmoru+Esk8r
 Jr27T4QNLGdvPiT1IloHCFyar3oXyhLtuRF+mlxTfZ338264CLlFDvkQ0SefcV7x0x
 vPfxnNz43Obpw==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=R3HchB2F
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.4
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
Cc: Romain Naour <romain.naour@gmail.com>,
 "Yann E . MORIN" <yann.morin.1998@free.fr>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

Release notes:
https://lists.freedesktop.org/archives/mesa-dev/2024-March/226176.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 7f39fefaf5..0756296a01 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.3
+MESA3D_HEADERS_VERSION = 24.0.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 1e94c2c612..e2e0be2641 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html
-sha256  77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe  mesa-24.0.3.tar.xz
-sha512  76b3b479877c40f729d7f530af4e3577fa74363edcd3d9474350d498a51dbb761fc034b39bee8547e97c30fd3a520cbc50c742d5a187746e83ddab1df44f37e9  mesa-24.0.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-dev/2024-March/226176.html
+sha256  90febd30a098cbcd97ff62ecc3dcf5c93d76f7fa314de944cfce81951ba745f0  mesa-24.0.4.tar.xz
+sha512  1d05b07026417fbe9cf18f7b18f2db9fe5fe327555c590283d87f69bbdd51f64135928a1dbe155d750187fc268bbdbb070bc1ae9ffc3e013b8707b391969d515  mesa-24.0.4.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index bdb7ea9a6c..c2343488ed 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.3
+MESA3D_VERSION = 24.0.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
