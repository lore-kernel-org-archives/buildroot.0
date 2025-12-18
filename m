Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8018D6E2DC
	for <buildroot@archiver.kernel.org>; Thu, 18 Dec 2025 18:53:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 36487410D8;
	Thu, 18 Dec 2025 18:53:04 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tOKbTGhh49_v; Thu, 18 Dec 2025 18:53:03 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DD7014108A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766083983;
	bh=WvtX1dtLuHjzq1sW8VyhYvW1ZKeV2fUvkXKQQisv2nI=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=UIF4FuumQs0rJN7f7qr1CcI2iVH4b+/2z+yvBxoOgmFmsKTbWECpc2H8/iTtDIZOD
	 CptzTaSdkroYLxrW5CVFOMX06phiM2N9G8QPNk6jscODtZQOneDgp7ZHobKutoSVyT
	 7MLkvzonA/X8oL7zj8dMlA/13VO0V0DSZS8112EYP6tFtuAZZrgUV3TEbW9Ey15lED
	 fVAYgou/oecFezTZoYY8DaDl6LFDjvFUwvqoNd/P5lfZRuQASBXcafd3BlpXnt0TTv
	 9cvAYVMrm4oFIqYn2vt6skTpLSnMLmYQ0UJ7pEVy3DHaEdQf3NMFmGS2JvuS2hgazy
	 LHWfxtv9uJl/A==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id DD7014108A;
	Thu, 18 Dec 2025 18:53:02 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2A3C31A6
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 112B44139C
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:53:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TJm--0sR9Ykn for <buildroot@buildroot.org>;
 Thu, 18 Dec 2025 18:53:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 48D5341395
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 48D5341395
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 48D5341395
 for <buildroot@buildroot.org>; Thu, 18 Dec 2025 18:52:58 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1ba4b.dip0.t-ipconnect.de [84.161.186.75])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id B1705A4C08A4;
 Thu, 18 Dec 2025 19:52:55 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:58690)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vWJ7N-000000008Mp-3xXh;
 Thu, 18 Dec 2025 18:52:54 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu, 18 Dec 2025 19:52:54 +0100
Message-ID: <20251218185254.3943149-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766083975;
 bh=74CIZEOjseWrgMXxPv4s0RgPeqLlCjEsw9KNjVlVymk=;
 h=From:To:Cc:Subject:Date:From;
 b=i+rEQcGNl4N3aks8Lnph4khlIxWbnTHf9o6XNatbmMcWuaY6IMYcYdDDux3hmhuvl
 fOP+jYR6imEgKBx6WJgxVIlukx6hsq8V9M1HfCNiZktt8LqLFlpcLPk0c1A1WSBk0b
 kPnfAkBMS7FJoJB46D01LqnNZoZaHsjDfuYTG8cqL8acUQnzE67IzrPSz/gj8rfRDa
 iUslMNh7ergUX5MFo8dajprLWms92202AIlk6LYkd1LDv/mXXtD4c00WQwmaqLGamy
 6j17Oqf/KnGOIENuVuUtP/4BxozcQaCRFtcjaKLiN88hZclS9wO15AKrBbTEUOGUuI
 ES8bcREgKmcUQ==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202511301023 header.b=i+rEQcGN
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.2
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

https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 39564b6af3..88fd71f987 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.1
+MESA3D_HEADERS_VERSION = 25.3.2
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 4bfc1d4584..f045d37f91 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000829.html
-sha256  059d0d985622f49588f01aa29152804f4da8ffe6add046e00a52923379c2d8da  mesa-25.3.1.tar.xz
-sha512  7e2f7295f1f4df129935b60d75c890f6ae585ecc511f69f55a61826df5f2434ffdb4109c632af9842a986bf9beed430a0404d377e8335b71fa36682bd10533ba  mesa-25.3.1.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-December/000831.html
+sha256  e69dab0d0ea03e3e8cb141b032f58ea9fcf3b9c1f61b31f6592cb4bbd8d0185d  mesa-25.3.2.tar.xz
+sha512  499cb0aa254b5a706fb6c2414c23b9d5d03d9397475f7ad16744b982303a2a2bf643ef7adc64870645ee4355b5f95695becd6caff7d7f7caf698e6269589aa13  mesa-25.3.2.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 6fcbf96c80..41b72dd08e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.1
+MESA3D_VERSION = 25.3.2
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
