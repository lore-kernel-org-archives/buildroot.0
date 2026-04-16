Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82584F43841
	for <buildroot@archiver.kernel.org>; Thu, 16 Apr 2026 07:35:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 58EFF807D5;
	Thu, 16 Apr 2026 07:35:31 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MlZGuZjW7gtc; Thu, 16 Apr 2026 07:35:30 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 70A06809CF
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1776324930;
	bh=iO0vKOgKmh1JlvJk0QrE9cJNL7sSOY+INxeNWhIgBOQ=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=B6ZhJITzeWJ1BnNQs6BLBog2LQ/Xqf0WVj22B/r8E0KZfy8u9Rq0DaV0b/mfXTxXL
	 /JJ107G3VRKnPk4sJj3fwmTi8rX+Wtbwk1aa0k+5jOFNcGy10+6Q+4Ru/j4RS2Hind
	 /WgF4wPJxBYd5D/5yTniDY6nP5QTUrdI8vTej2Fzys504rn5Uh+5wynOZ6V4SqeRQk
	 aIpDb4Pm9ur+vIatS/2nRORBC2vMbrfodF1A6VehsX7DxACBGWDOQgUp1Z+hECghQZ
	 OpacuDOQAfdQHpYJ41uqQRw62G+U0H8cprrfIPbQTVVxxzjv/axPyuPu5pKMknx+Vg
	 uW1QA3cUoeSuw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 70A06809CF;
	Thu, 16 Apr 2026 07:35:30 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by lists1.osuosl.org (Postfix) with ESMTP id ACC34127
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 92B7D40128
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SsHZVVJzihor for <buildroot@buildroot.org>;
 Thu, 16 Apr 2026 07:35:28 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp2.osuosl.org 811A540106
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 811A540106
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp2.osuosl.org (Postfix) with ESMTPS id 811A540106
 for <buildroot@buildroot.org>; Thu, 16 Apr 2026 07:35:28 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6cf3d.dip0.t-ipconnect.de [79.214.207.61])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 641E2A4C0BEA;
 Thu, 16 Apr 2026 09:35:26 +0200 (CEST)
Received: from bruckner.lan.fli4l ([192.168.1.1]:60814)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1wDHG1-000000007OO-3sVD;
 Thu, 16 Apr 2026 07:35:26 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Thu, 16 Apr 2026 09:35:25 +0200
Message-ID: <20260416073525.3605421-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1776324926;
 bh=psYnt22+2NPJ05K+pWk40nYHD/RchH1BxiZZA0EqSGA=;
 h=From:To:Cc:Subject:Date:From;
 b=q5167o/NfXwJwsYuy2Q1c4+CKrttNE4VYis036KCGxDMql7d+Ky6MkZ3BojlbVg+5
 mkyiTzYBgMAW+VMQGuaxXheRKn+NSUNsVtQ0PXPSy1y1ko1RK75mY1G6RGyyJB72TV
 3km+QLXQ9+tKA9bmHFIZjPewWSNGxiHasQfIVlzMUPKaGM0TfR1QQQyu3DLYNFOCoM
 +PY9V73RmCzS0usl5I6S1mnofbmg8yM2UDk+hHY6EXbebVV/0C85+zoIBaS+UnLgXr
 Elo1EtrWrOPwgphVfbRsFTaixDcJL+QKQhXpTk/6r2MtD1dFoWz1sUDZFVOYhn2bRq
 GnqkKjLkoWP/g==
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp2.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=q5167o/N
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 26.0.5
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

https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index 3fe82e9ba5..01883a8ce1 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 26.0.4
+MESA3D_HEADERS_VERSION = 26.0.5
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9a56e54406..f486734cd5 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000843.html
-sha256  6d91541e086f29bb003602d2c81070f2be4c0693a90b181ca91e46fa3953fe78  mesa-26.0.4.tar.xz
-sha512  ddb59df633116a7ccd9d2d3a2e2009945909e3f774956efcbc032a2f963641cce50d0f319bebdc041df17700aa827aa2ccbc61c9e40b4020de9ff027eab27e23  mesa-26.0.4.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-April/000845.html
+sha256  d229c9937d9a25ca0a8958c59f425174563d300ec42acbea2dbe84a055023368  mesa-26.0.5.tar.xz
+sha512  8aa03a46269b2443be15cbd516d523af78fdd35e5273f5346b9142d2d21e245f6d5fd47e7e90176b0444ea967540eaa7c62d217f599ca5a216ef83244ee97d5c  mesa-26.0.5.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index 79f063d7e3..fb5499de81 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 26.0.4
+MESA3D_VERSION = 26.0.5
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
