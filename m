Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F4BFF8875
	for <buildroot@archiver.kernel.org>; Thu, 30 Apr 2026 05:26:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 892DB84898;
	Thu, 30 Apr 2026 05:26:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Qxsd9hvECvID; Thu, 30 Apr 2026 05:26:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8592384899
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1777526761;
	bh=l0vC476Guk3J+bBpY1aggb8pIGngvurYnu91kxsMAuQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=oRo2UdNZPZ7CMG0BtbdnGw4FxOIM976KL70h5GCl8gKIU4S2W8RaUyWSo3gf1yXws
	 dhLXy6MRLrnfRdo0RJsWLpwc4gRdY3QtULIGd35O/Ejh6Y434qmE5gR1071Va/gXza
	 hUA1HzrhjoeEPvbJg1TxmziGN7cWrneqw0UojBteOtdLaY9DsT7G766S5bZf1nOOOy
	 /DrkPF3g+Z5093HTVmcRqtaCpAgBHGBU8ox3xmSg1SsG46VRFm8bwQvozPQS8LjKKp
	 GEuMaPxrBAue0iyp26oTYCF+4HB9VKaZvag0Y2i2LRJUMtCzKnWPo4V5GSCnzK1xks
	 bQ3RTmhhZtBTQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8592384899;
	Thu, 30 Apr 2026 05:26:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id E911B18F
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:26:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E6F0184899
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:26:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eBxjEvz_cKkz for <buildroot@buildroot.org>;
 Thu, 30 Apr 2026 05:26:00 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 01FC384898
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 01FC384898
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 01FC384898
 for <buildroot@buildroot.org>; Thu, 30 Apr 2026 05:25:59 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bb47.dip0.t-ipconnect.de [84.161.187.71])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 134AAA4C1709;
 Thu, 30 Apr 2026 07:25:58 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:44878)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.2)
 (envelope-from <bernd@kuhls.net>) id 1wIJuP-000000006Os-1Cm2;
 Thu, 30 Apr 2026 05:25:57 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu, 30 Apr 2026 07:25:57 +0200
Message-ID: <20260430052557.2947532-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1777526758;
 bh=asqcr+niQB1M1BNCXFhCRiQe0cNGC0O3p0Z4NcOk7sc=;
 h=From:To:Cc:Subject:Date:From;
 b=ov3eOUvBlBSdn8i73PwiqdBnJ2dLhkQrSPMPSmanEynucBOLr95dVRRTUarn5+/AH
 0N77P0GCCinT1ydNArTyXI2Pz++K46Fy0KTBqzGJldGVrGqZqrBMxbvivt4tQ4sjtg
 SCXM5rKdrKj4x8ZeMe1uj0P9NdwYs9m3j1e51yZ6uzBpGMLGYOnlRC3+65vp1i+iB4
 Ud+auivpQahFu6bK7R4LmLNF2iEe+u0kBDHCpKbkcqKw6TW/O6nEU8ieCl4lX4cd39
 /hZRkMJK40mhDH1hFgI514aXL8olN7ACU2Q6tNCAe9+jMeNbRXvhbWGv71/yl+K3ka
 8S1/p3zrbFt/w==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=ov3eOUvB
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.6
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

https://lists.freedesktop.org/archives/mesa-announce/2026-April/000848.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 01883a8ce1..1098aee9c1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.5
+MESA3D_HEADERS_VERSION = 26.0.6
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index f486734cd5..eed4265147 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html
-sha256  d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368  mesa-26.0.5.tar.xz
-sha512  8aa03a46269b2443be15cbd516d523af78fdd35e5273f5346b9142d2d21e245f6d5fd47e7e90176b0444ea967540eaa7c62d217f599ca5a216ef83244ee97d5c  mesa-26.0.5.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000848.html
+sha256  1d3c3b8a8363b8cc354175bb4a684ad8b035211cc1d6fa17aeb9b9623c513f89  mesa-26.0.6.tar.xz
+sha512  7f298234cb7b353ac40dc4d116866115160d1a52de6da8d4f1343af7ed47ca11e1a07b70aad8d24221906e0b520a4c140c12ffa7e7e706e3f25f301842a37e68  mesa-26.0.6.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 047cfaba2a..adac0e5c0e 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.5
+MESA3D_VERSION = 26.0.6
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
