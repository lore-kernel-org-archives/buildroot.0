Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59000C54798
	for <buildroot@archiver.kernel.org>; Thu,  7 Mar 2024 17:40:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9659941B40;
	Thu,  7 Mar 2024 17:40:45 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ew66ubW1wnrP; Thu,  7 Mar 2024 17:40:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A4C3841B3C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id A4C3841B3C;
	Thu,  7 Mar 2024 17:40:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 0EAC71BF396
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:40:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id EFC07605A7
 for <buildroot@lists.busybox.net>; Thu,  7 Mar 2024 17:40:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id d_5hMJnM0CKO for <buildroot@lists.busybox.net>;
 Thu,  7 Mar 2024 17:40:39 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 852C6605C3
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 852C6605C3
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 852C6605C3
 for <buildroot@buildroot.org>; Thu,  7 Mar 2024 17:40:37 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd61.dip0.t-ipconnect.de [84.161.189.97])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 84D26A4C1050;
 Thu,  7 Mar 2024 18:40:34 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46860)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1riHjO-000000003wW-175J;
 Thu, 07 Mar 2024 18:40:34 +0100
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu,  7 Mar 2024 18:40:34 +0100
Message-Id: <20240307174034.36477-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1709833234;
 bh=4GN3qK5ckR5ISnp9CnbFv4Hvi5L0JI6nurvTV9g2zTc=;
 h=From:To:Cc:Subject:Date:From;
 b=sXBj7uSw3Sbp+qh3Sr72aweBUFRr5S2TFz3FQKR0g3yFtXJYlb43wTWkteKhnF4gI
 F5E/hzNbvyEuBhlfwCdhgyRpM8IQM6MmPQZ4U+XbPKXvkTxM6fx6yWh9xwZ3J5zy2M
 bOGho+fgR9tEKTfeHC9TvMH2awy/A1krnI+gkC90jXAPv/gVpGqH/9tTI/YEqpFdNF
 I3FiSv8+vM+jYkUgW+8RJfsM5MHAQDwTonOXcc4WXdgAdnxznNaWYPmGKhEwFcNpcJ
 B6Dku6ue0mA22CosEfTPMtL8ObzDuuapu9Qea7AkJllO7rOyrbH3CKBptBJP1e99uK
 1MUbMUZ36a7ug==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=sXBj7uSw
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.2
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

https://lists.freedesktop.org/archives/mesa-announce/2024-February/000749.html
https://lists.freedesktop.org/archives/mesa-announce/2024-February/000751.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1d006dbc91..1e1bd8dac9 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.0
+MESA3D_HEADERS_VERSION = 24.0.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 49b42e2132..dc795d4a86 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
-sha256  dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56fb07be2b8c304c36  mesa-24.0.0.tar.xz
-sha512  9dfdea7cebb37b9c020335e24194b39b399f48b5af6eec30c3455108276ac4e29e7b06df942cb2abc7afa667784968c0c43d19b9afe30ef03021b9cb6a789f15  mesa-24.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000751.html
+sha256  94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8  mesa-24.0.2.tar.xz
+sha512  b975b5019ea37a2cc76c26e7a0b055a72f7c1cef888418cd654fd89ec667914c89cff5571d4c57828f2ce28a1b80ed707329cb88d60407fd875e6a6ebfaab7b3  mesa-24.0.2.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 2d13f7336f..80e67c477e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.0
+MESA3D_VERSION = 24.0.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
