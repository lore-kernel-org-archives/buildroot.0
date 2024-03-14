Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA93DC54E5D
	for <buildroot@archiver.kernel.org>; Thu, 14 Mar 2024 21:17:53 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 7D48F60878;
	Thu, 14 Mar 2024 21:17:53 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bVLEJkgBH-X5; Thu, 14 Mar 2024 21:17:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8D7AC60895
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8D7AC60895;
	Thu, 14 Mar 2024 21:17:52 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F316E1BF3E9
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:17:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id DF2A28214E
 for <buildroot@lists.busybox.net>; Thu, 14 Mar 2024 21:17:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id JbeEHpJuYSgM for <buildroot@lists.busybox.net>;
 Thu, 14 Mar 2024 21:17:50 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org BE2D582147
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org BE2D582147
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id BE2D582147
 for <buildroot@buildroot.org>; Thu, 14 Mar 2024 21:17:49 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0585.dip0.t-ipconnect.de [91.58.5.133])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B6D2EA4C0B23;
 Thu, 14 Mar 2024 22:17:47 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:57884)
 by fli4l.lan.fli4l with esmtp (Exim 4.97.1)
 (envelope-from <bernd@kuhls.net>) id 1rksSR-000000000kf-0R1c;
 Thu, 14 Mar 2024 21:17:47 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Thu, 14 Mar 2024 22:17:47 +0100
Message-Id: <20240314211747.21185-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202312101026; t=1710451067;
 bh=HS4PF3o2hOiiojmx+wXa1ZJdazFoV9ScYWlzpbTxfy8=;
 h=From:To:Cc:Subject:Date:From;
 b=bqHRZ1qvl/72VVEzwJCaVCm/EiyyIlQjcWog7Ltzd+VByVC93nv49dqZSv8FZSnoq
 CymrbW04diasCPs3Tdd2JxHCIIln9Pw8yvijB5bvEkNvaWlAE/lTuwZUF5RtMpG+n2
 d5IH1z7eKMjej56mrtqEPQSXtLb/FhF4/ZCRM6BwwQxDVvx0kzEexRyJdI3Kx4n6Ra
 +dzqpJTuHwB4itzOnGEjgj9UKkyJty7t2y/2NXQubRNOfc1cO7kjH3braXzVaA3r1N
 HERYQ1vneKKEUYjPQYuEd9U9cGs3/ks9xoT81f4TAd4QLrKFKbdiIcxm1Dme/9gM43
 rHeKC/nRtqA8w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202312101026 header.b=bqHRZ1qv
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
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
https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 1e1bd8dac9..7f39fefaf5 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 24.0.2
+MESA3D_HEADERS_VERSION = 24.0.3
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index dc795d4a86..1e94c2c612 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,5 +1,5 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2024-February/000751.html
-sha256  94e28a8edad06d8ed2b83eb53f253b9eb5aa62c3080f939702e1b3039b56c9e8  mesa-24.0.2.tar.xz
-sha512  b975b5019ea37a2cc76c26e7a0b055a72f7c1cef888418cd654fd89ec667914c89cff5571d4c57828f2ce28a1b80ed707329cb88d60407fd875e6a6ebfaab7b3  mesa-24.0.2.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2024-March/000752.html
+sha256  77aec9a2a37b7d3596ea1640b3cc53d0b5d9b3b52abed89de07e3717e91bfdbe  mesa-24.0.3.tar.xz
+sha512  76b3b479877c40f729d7f530af4e3577fa74363edcd3d9474350d498a51dbb761fc034b39bee8547e97c30fd3a520cbc50c742d5a187746e83ddab1df44f37e9  mesa-24.0.3.tar.xz
 # License
 sha256  a00275a53178e2645fb65be99a785c110513446a5071ff2c698ed260ad917d75  docs/license.rst
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index b9cf68759a..bdb7ea9a6c 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 24.0.2
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
