Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEBDD778B1
	for <buildroot@archiver.kernel.org>; Fri, 23 Jan 2026 22:17:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id CE70060A54;
	Fri, 23 Jan 2026 22:17:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id M7gJ4gFH-RC6; Fri, 23 Jan 2026 22:17:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 77C0A60A4E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1769206644;
	bh=bSkh3OLTpa6d2IFKjQAPAdFrQbjOJ6z0Y2kmjtlQ5is=;
	h=From:To:Cc:Date:Subject:List-Id:List-Unsubscribe:List-Archive:
	 List-Post:List-Help:List-Subscribe:From;
	b=GF7ZXTQH57pYqN3XBK7fCMsVEvBjwNzlNfpdgbw9WVJdDZGa1Kn/9BPdTnWDn3qu2
	 Q82PRMBn1RUdFPQ0yLiH11YgQzWkm3HFCamrQKpRLDLRY2zCz3Ccuv0jjkQGBoryy6
	 jp0wNac7PlnC98jQ7srcBlEJD99HUJ2DtoFt7Qml7zaHXxmb98Ss5QSrCRRdonwpA2
	 W4XSrsAg690HPCSlJ8Z5IV/uazRa8TfRiIC5BfKmD5znmXx1a9rSUAButirBcUnN5k
	 3NObDMPM+isr/RsxyY+S1V9YDWmuJTdM5iknRkTt/gY2495FxFU20J84GLFYgdfGMY
	 wJ7pB4HN/TC5Q==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 77C0A60A4E;
	Fri, 23 Jan 2026 22:17:24 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 6CC3D122
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:17:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 50BDB83D2D
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:17:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id eoCLPpzkTj12 for <buildroot@buildroot.org>;
 Fri, 23 Jan 2026 22:17:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 378FC83D2C
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 378FC83D2C
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 378FC83D2C
 for <buildroot@buildroot.org>; Fri, 23 Jan 2026 22:17:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p54a1bdf8.dip0.t-ipconnect.de [84.161.189.248])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id D5969A4C4849;
 Fri, 23 Jan 2026 23:17:19 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35026)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vjPSx-000000003gN-3mad;
 Fri, 23 Jan 2026 22:17:19 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Romain Naour <romain.naour@gmail.com>
Date: Fri, 23 Jan 2026 23:17:19 +0100
Message-ID: <20260123221719.13020-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: +++++++
X-Spam: Yes
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1769206639;
 bh=jbq8prLMG632vmJKS+bHc7asVwB35SaSUCMme0923j0=;
 h=From:To:Cc:Subject:Date:From;
 b=Ua4irbuOMoGfglWd/2sDApe4pK4MsWbHVKErXSTb+CTfreGQwdN4sH2/433qMoi85
 7TjxfO0N9srgczx3rNKl9/cYvHG+m4JXt4a3BBVndMIMMdf2OL4ItXeFkCi5M7x3Rq
 Gpv8jYFEwszSyAdk3irYWN6Umo2iSLfbvFHO6N0jIx18oYRa8/sjlGVNN+XJC4KiaZ
 uEDbzip8JUoVBdGFCoGBaFmrnidi8bG+P1JhwhLBEPCHDzr2d6+fIo2FcPE6j+hCb+
 gbqHMuN9tBUruuajRNrXR6TXCoBaYw18Kryh1ZVsy05DewP97QzEtLia2Kzmc60XQd
 kESC5IKPI9hkA==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=Ua4irbuO
Subject: [Buildroot] [PATCH 1/1] package/{mesa3d,
 mesa3d-headers}: bump version to 25.3.4
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

https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/mesa3d-headers/mesa3d-headers.mk | 2 +-
 package/mesa3d/mesa3d.hash               | 6 +++---
 package/mesa3d/mesa3d.mk                 | 2 +-
 3 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/package/mesa3d-headers/mesa3d-headers.mk b/package/mesa3d-headers/mesa3d-headers.mk
index fe00d10c31..933f7ab731 100644
--- a/package/mesa3d-headers/mesa3d-headers.mk
+++ b/package/mesa3d-headers/mesa3d-headers.mk
@@ -12,7 +12,7 @@ endif
 
 # Not possible to directly refer to mesa3d variables, because of
 # first/second expansion trickery...
-MESA3D_HEADERS_VERSION = 25.3.3
+MESA3D_HEADERS_VERSION = 25.3.4
 MESA3D_HEADERS_SOURCE = mesa-$(MESA3D_HEADERS_VERSION).tar.xz
 MESA3D_HEADERS_SITE = https://archive.mesa3d.org
 MESA3D_HEADERS_DL_SUBDIR = mesa3d
diff --git a/package/mesa3d/mesa3d.hash b/package/mesa3d/mesa3d.hash
index 9ff2a9d82d..f76043488e 100644
--- a/package/mesa3d/mesa3d.hash
+++ b/package/mesa3d/mesa3d.hash
@@ -1,6 +1,6 @@
-# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000832.html
-sha256  05328b3891c000e6a110a3e7321d8bfbb21631d132bf86bd3d4a8f45c535ef6b  mesa-25.3.3.tar.xz
-sha512  232b39f5035f8a65c8f815c8b524e3570f229673a85cd3591fbab9136c80b4ab922dc959f51a9d0a11e91cc66f8cf7f30cd9b846bb9e1607e3a6c820d5c8045a  mesa-25.3.3.tar.xz
+# From https://lists.freedesktop.org/archives/mesa-announce/2026-January/000834.html
+sha256  3a0fc6ec070b45ae25dc2ccb5e52fae1d89141f7c39c4a91fe4eaa80dfff9deb  mesa-25.3.4.tar.xz
+sha512  3043bebebebc90ba443bbc96d71fbae41c76504d54ff6a44a48ad7c3a132db09e3ad1ae607c49f1d58b724a8b6e4263b68ee5722f8b98328481eb2e82164ac3a  mesa-25.3.4.tar.xz
 # License
 sha256  0d1a0472ecc81830e75c20d59b0ea02841e3db21255e0ebad97ab682c54d6615  docs/license.rst
 sha256  323c587d0ccf10e376f8bf9a7f31fb4ca6078105194b42e0b1e0ee2bc9bde71f  licenses/MIT
diff --git a/package/mesa3d/mesa3d.mk b/package/mesa3d/mesa3d.mk
index e41bf68d8e..2468310413 100644
--- a/package/mesa3d/mesa3d.mk
+++ b/package/mesa3d/mesa3d.mk
@@ -5,7 +5,7 @@
 ################################################################################
 
 # When updating the version, please also update mesa3d-headers
-MESA3D_VERSION = 25.3.3
+MESA3D_VERSION = 25.3.4
 MESA3D_SOURCE = mesa-$(MESA3D_VERSION).tar.xz
 MESA3D_SITE = https://archive.mesa3d.org
 MESA3D_LICENSE = MIT, SGI, Khronos
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
