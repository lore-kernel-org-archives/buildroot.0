Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6A3C87FCB
	for <buildroot@archiver.kernel.org>; Fri,  1 Aug 2025 04:42:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DA39140D21;
	Fri,  1 Aug 2025 04:42:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0bOOxYsFKfnf; Fri,  1 Aug 2025 04:42:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 1772840CB5
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1772840CB5;
	Fri,  1 Aug 2025 04:42:10 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [IPv6:2605:bc80:3010::137])
 by lists1.osuosl.org (Postfix) with ESMTP id 9588513D
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 04:42:08 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 92A5E40CB5
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 04:42:08 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Rxd-XZtSzpH2 for <buildroot@buildroot.org>;
 Fri,  1 Aug 2025 04:42:07 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp4.osuosl.org 5714840994
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 5714840994
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp4.osuosl.org (Postfix) with ESMTPS id 5714840994
 for <buildroot@buildroot.org>; Fri,  1 Aug 2025 04:42:06 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a0a17.dip0.t-ipconnect.de [91.58.10.23])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id A493BA4C25A2;
 Fri,  1 Aug 2025 06:42:03 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42946)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1uhhal-000000002AQ-09jw;
 Fri, 01 Aug 2025 04:42:03 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri,  1 Aug 2025 06:42:03 +0200
Message-Id: <20250801044203.9827-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1754023323;
 bh=+96YqALf9+6zxJ9vRqxVmWbZhovS900VKx5OD8uJQRQ=;
 h=From:To:Cc:Subject:Date:From;
 b=zBbm8TD5jp6aM7vxfGaSTPY1vaGWbiApuFPdT34VvVnHk6Bp/tbCkUM6z53xG3zW6
 DTFbwjgcetAj1exPKPxJYKNWB3lyCHT1sAIS77EmvKqRPI0a0dex85HK8MwdGEDpvz
 152uMUMXl/+TyY0+IXWuRQedlablhKfHCtNfJ+o62m+Fw1Ra6zZSalxNfDESKM4CeE
 4nn+AajmMvhRuwmzYT8B2y/DUXpRqvepQZH4CD+l48U2jpjZddknPhvkHE69IfTisF
 jp63D1wiGpv+TfJtseg7mLxVm3leZALLYWCJTBxCNCJ20SjuCrA4gtLTz1rfmMS5Ki
 TftuqGBA27Ovw==
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp4.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=zBbm8TD5
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.1.7
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

Release notes:
https://lists.freedesktop.org/archives/mesa-announce/2025-July/000814.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index a53eeea202..8dd0581b41 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.1.6
+MESA3D_HEADERS_VERSION = 25.1.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 95f41e1593..9514b5e0e6 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-July/000811.html
-sha256  9f2b69eb39d2d8717d30a9868fdda3e0c0d3708ba32778bbac8ddb044538ce84  mesa-25.1.6.tar.xz
-sha512  f6ee07d1a44095106463d0fcef18cf3953b36f86ffda1a1549dcbb8c1a89189f0cbbe66bf556d594140e9a855583972774251f2c0763f73fce77155f18ae6d2b  mesa-25.1.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-July/000814.html
+sha256  4afd26a3cc93c3dd27183d4c4845f1ca7d683f6343900b54995809b3271ebed6  mesa-25.1.7.tar.xz
+sha512  a62fc6970efce3b4861094be2ef3139a3b18a6a51d770ead9f04d39592abc0a13a04702c552637e63bc965236f66ad545d30a9ec446b24f0bfc5bbb7cf0f0757  mesa-25.1.7.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index f05f568c67..74994fe02a 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.1.6
+MESA3D_VERSION = 25.1.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.39.5

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
