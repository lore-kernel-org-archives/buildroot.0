Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98EF9CD484C
	for <buildroot@archiver.kernel.org>; Wed, 12 Nov 2025 22:02:21 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5C2C882FE7;
	Wed, 12 Nov 2025 22:02:21 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1uERoz9YkUdW; Wed, 12 Nov 2025 22:02:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 37E7581E42
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 37E7581E42;
	Wed, 12 Nov 2025 22:02:20 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 18701158
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 22:02:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 0A5A1606C6
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 22:02:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id XZDLLJZfeY1n for <buildroot@buildroot.org>;
 Wed, 12 Nov 2025 22:02:17 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org 2A41F60653
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2A41F60653
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id 2A41F60653
 for <buildroot@buildroot.org>; Wed, 12 Nov 2025 22:02:16 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bd38.dip0.t-ipconnect.de [84.161.189.56])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 7E488A4C5E2A;
 Wed, 12 Nov 2025 23:02:13 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:54582)
 by fli4l.lan.fli4l with esmtp (Exim 4.99)
 (envelope-from <bernd@kuhls.net>) id 1vJIur-000000005oD-0cC8;
 Wed, 12 Nov 2025 22:02:13 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Wed, 12 Nov 2025 23:02:13 +0100
Message-ID: <20251112220213.3737716-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1762984933;
 bh=1xHHrIgbHptp2KteKs7o2Z1MGfhcOI11KVrbmZMxsf8=;
 h=From:To:Cc:Subject:Date:From;
 b=wFIIW1e5gaCrvC5WntOVN6kky/rUwpQ+SJ94UYVmpCpGaTdPYrRXav1fRGfKiuDZc
 IFlWkGCQ26SdF5Qpyc6PVYMXP4KJBrgZiNXSBXsJq1iJeYZItJpAul2WkmAJmShe8j
 Pp0EWlo16YqlCCZXaRmN0T4F3PGbzWSTf9q8M/jm3Z8klLt0x3JjTS72X9KuY/2U0j
 rQLk1Moq290WmzTuoe7j/pvSDVBc+COLpa+IZuwmoEajvDBoojLM44LOBGqMZ2bEkd
 yBDY9rHVgf4NHvtSVQ1q6X7ONCPzsVM+PNertJP8ZXFRwYTmKFho9BB5E3CUb0y5RQ
 Gr1Z3kDaEC2nw==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=wFIIW1e5
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.2.7
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
https://lists.freedesktop.org/archives/mesa-announce/2025-November/000828.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 6156a1f398..75d7405504 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.2.6
+MESA3D_HEADERS_VERSION = 25.2.7
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f8de60f491..e2b3d9ca79 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2025-October/000826.html
-sha256  361c97e8afa5fe20141c5362c5b489040751e12861c186a16c621a2fb182fc42  mesa-25.2.6.tar.xz
-sha512  c34f55132ee9097a7c4961745bf07a08fc612bf0f7c570c023fedb16c8eafbefdc1cc022f722c345780bb14ec4ce25d9a206a9196d9d51c97b389db5160de9cc  mesa-25.2.6.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2025-November/000828.html
+sha256  b40232a642011820211aab5a9cdf754e106b0bce15044bc4496b0ac9615892ad  mesa-25.2.7.tar.xz
+sha512  87dd815e0d11d6ec0eb969ee93d3f376103bb899d90599e0b7902394e41c58139384df79f89633e132ca969348d3320f55308a74651d409b454d51f1bcda27bc  mesa-25.2.7.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index db48a378fc..5305ea2de1 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.2.6
+MESA3D_VERSION = 25.2.7
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
