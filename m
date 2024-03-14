Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACBEBC54E60
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:20:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5BA0F60668;
	Thu, 14 Mar 2024 21:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 9sY8i4Eh1C7h; Thu, 14 Mar 2024 21:20:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 674846069B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 674846069B;
	Thu, 14 Mar 2024 21:20:48 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id C65281BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:20:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id B30714032A
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:20:46 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id WSAF-IWu2t2U for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:20:46 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org BF248402D7
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org BF248402D7
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id BF248402D7
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:20:45 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0585.dip0.t-ipconnect.de [91.58.5.133])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id E1F9BA4C068C;
 Thu, 14 Mar 2024 22:20:43 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:46942)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rksVH-000000001B1-1Avj;
 Thu, 14 Mar 2024 21:20:43 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:20:43 +0100
Message-Id: <20240314212043.23332-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710451243;
 bh=DP/BkA20k3hmXgG0FcpXgoVqECAYSVyOPg0zFRVAYL8=;
 h=From:To:Cc:Subject:Date:From;
 b=hIR9ySg96xSW9y2J1E2K83Ml/RInPVK9Dnup3+9pVdgdL6bJgjOVeE0TaCDkwSKNv
 prtE8dmxjCtQY73UKlOeB6rO5OH6ajvbFBtaEkEWhVNz2J2ArbsNd12G6ciBXzbU2q
 HHYer94sY5wT4WyWPaL0YQ1KTUtgNZOUK59yHLCMPrAqAttwHHbyC6lvLd15RK5CJ/
 /pG+VPasyPGeMXkLza2rzSgOj1RP1uIg09bbgeAG/4O+n8Rm70kzsYlRw1cwoJ4MR1
 voOLEHDb+KC+47X7V0AMitv9EnjYF0DcUkV1eti8R5RP8F4OjUgEMEMxTKhetOLjhC
 FLWkhijU1i0KA==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202312101026 header.b=hIR9ySg9
Subject: [Buildroot] [PATCH v2 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 24.0.3
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
https://lists.freedesktop.org/archives/mesa-announce/2024-February/000749.html
https://lists.freedesktop.org/archives/mesa-announce/2024-February/000751.html
https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
v2: squashed with uncommitted patch

 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1d006dbc91..7f39fefaf5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.0
+MESA3D_HEADERS_VERSION = 24.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 49b42e2132..1e94c2c612 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000747.html
-sha256  dc7e8c077bc5884df95478263b34bdebb7e88e600689cb56fb07be2b8c304c36  mesa-24.0.0.tar.xz
-sha512  9dfdea7cebb37b9c020335e24194b39b399f48b5af6eec30c3455108276ac4e29e7b06df942cb2abc7afa667784968c0c43d19b9afe30ef03021b9cb6a789f15  mesa-24.0.0.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html
+sha256  77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe  mesa-24.0.3.tar.xz
+sha512  76b3b479877c40f729d7f530af4e3577fa74363edcd3d9474350d498a51dbb761fc034b39bee8547e97c30fd3a520cbc50c742d5a187746e83ddab1df44f37e9  mesa-24.0.3.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 71929014c8..bdb7ea9a6c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.0
+MESA3D_VERSION = 24.0.3
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.2

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
