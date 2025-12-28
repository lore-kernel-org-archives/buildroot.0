Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 671A5E92724
	for <buildroot@archiver.kernel.org>; Sun, 28 Dec 2025 07:53:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3D7C5608FD;
	Sun, 28 Dec 2025 07:53:37 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YeiwYj4ttmfz; Sun, 28 Dec 2025 07:53:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 64AA46086D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1766908415;
	bh=vBKd4gdWXbLIY8QpMmbUWOevfOak3Sp8hAQQAAyGqdk=;
	h=From:To:Cc:Date:In-Reply-To:References:Subject:List-Id:
	 List-Unsubscribe:List-Archive:List-Post:List-Help:List-Subscribe:
	 From;
	b=rCGEChOAE5XH+jSLhnxXr6qh/1b+30ImUaq36oJozPNPHn0+PyNhvgZfCiVQWdnGP
	 Tk82bZ2WHmJCF4jaGh4wWXHBtG01n9+N+nm+3Z0qeSotaoAA4vGScQZ34oy/EmnQt7
	 XIK7TiglJqCGswaZvUtXVDbtKbWCYKHe3pxxK6JX45uPvvhtcKJJ5/0bQK4dds++eb
	 JaPi4AzyKYsmnwJm2YcSblXwXsY9xMhPNtgB3RG5vgpdaqB0NmfscWfbPHKOS/P3mH
	 m9qeMyrJs9tYa4ML9IVm0sni/B54UnvosqneoStlVEmfiU+k+W166uhI2t3fhxJhcC
	 vy5TgqZt3hGmw==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 64AA46086D;
	Sun, 28 Dec 2025 07:53:35 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 87A661E1
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 85526811EE
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MaI71mbWB3iq for <buildroot@buildroot.org>;
 Sun, 28 Dec 2025 07:53:32 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp1.osuosl.org 4A4F081196
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4A4F081196
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp1.osuosl.org (Postfix) with ESMTPS id 4A4F081196
 for <buildroot@buildroot.org>; Sun, 28 Dec 2025 07:53:32 +0000 (UTC)
Received: from fli4l.lan.fli4l (p4fd6c75a.dip0.t-ipconnect.de [79.214.199.90])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 5A967A4C232B;
 Sun, 28 Dec 2025 08:48:39 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:35324)
 by fli4l.lan.fli4l with esmtp (Exim 4.99.1)
 (envelope-from <bernd@kuhls.net>) id 1vZlVr-000000004ex-3KeK;
 Sun, 28 Dec 2025 07:48:28 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Cc: Andreas Ziegler <br025@umbiko.net>,
 Angelo Compagnucci <angelo.compagnucci@gmail.com>,
 Fabrice Fontaine <fontaine.fabrice@gmail.com>,
 Mahyar Koshkouei <mahyar.koshkouei@gmail.com>,
 Matt Flax <flatmax@flatmax.org>, Simon Dawson <spdawson@gmail.com>,
 Woodrow Douglass <wdouglass@carnegierobotics.com>
Date: Sun, 28 Dec 2025 08:48:20 +0100
Message-ID: <20251228074822.3370464-26-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20251228074822.3370464-1-bernd@kuhls.net>
References: <20251228074822.3370464-1-bernd@kuhls.net>
MIME-Version: 1.0
X-Spamd-Bar: ++
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202511301023; t=1766908119;
 bh=55T7F2E5zPIkDBnMfwQgy6O2mg+Wi+v4LpsoAgvOORk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:From;
 b=tRou/XcbD1TIrBZHBXkJ1BOKKoORqot8rtIY2YcmSq+YEldcHN/3qadH1L0MhHnnc
 Ol1N6352N830w3pZ2fKduphyiA8tNFg1e3Abb1/KTyFcrUK3XY21QkcO3UaYpN8CAl
 2XjTGrIpqv0IaAJr7lFZ18Id0j7RexLFyD+wFHEl5FrFazbs+CjX9VHWHDD6XRwkE6
 xDN7/sLG2D2ASD/tOSnpflqqD7jTcH3UDM8ea4JTMO30xQ4G1iJoyGMhEz6WFi98Dd
 Hm9Mdk4ZyBaRbVuZJ2ly6WBWyV26BfXsBgJbrWMOziiJAkTnTkI40S6L+Il1AijGDc
 PoVJjS+lhsTJw==
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp1.osuosl.org;
 dkim=pass (2048-bit key) header.d=kuhls.net header.i=@kuhls.net
 header.a=rsa-sha256 header.s=kas202511301023 header.b=tRou/Xcb
Subject: [Buildroot] [PATCH v6 25/26] package/vlc: remove optional
 dependency to opencv3
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

OpenCV3 is unmaintained and will be removed from buildroot.

The package does not support OpenCV4:
https://code.videolan.org/videolan/vlc/-/merge_requests/927

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/vlc/Config.in | 6 ------
 package/vlc/vlc.mk    | 8 +-------
 2 files changed, 1 insertion(+), 13 deletions(-)

diff --git a/package/vlc/Config.in b/package/vlc/Config.in
index 964b7660af..d2c1934f37 100644
--- a/package/vlc/Config.in
+++ b/package/vlc/Config.in
@@ -9,7 +9,6 @@ config BR2_PACKAGE_VLC
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_3_7
 	select BR2_PACKAGE_LIBVORBIS if BR2_PACKAGE_OPUS
-	select BR2_PACKAGE_VLC_OPENCV3_BACKEND if BR2_PACKAGE_OPENCV3
 	select BR2_PACKAGE_ZLIB if BR2_PACKAGE_TAGLIB
 	help
 	  VLC is a free and open source cross-platform multimedia player
@@ -18,11 +17,6 @@ config BR2_PACKAGE_VLC
 
 	  http://www.videolan.org/vlc/
 
-config BR2_PACKAGE_VLC_OPENCV3_BACKEND
-	bool
-	select BR2_PACKAGE_OPENCV3_LIB_IMGPROC
-	select BR2_PACKAGE_OPENCV3_LIB_OBJDETECT
-
 comment "vlc needs a toolchain w/ C++, dynamic library, wchar, threads, gcc >= 4.9, headers >= 3.7"
 	depends on !BR2_RISCV_32
 	depends on BR2_USE_MMU
diff --git a/package/vlc/vlc.mk b/package/vlc/vlc.mk
index 2a83b66c92..9091a7e7fa 100644
--- a/package/vlc/vlc.mk
+++ b/package/vlc/vlc.mk
@@ -72,6 +72,7 @@ VLC_CONF_OPTS += \
 	--disable-mtp \
 	--disable-mpc \
 	--disable-notify \
+	--disable-opencv \
 	--disable-projectm \
 	--disable-schroedinger \
 	--disable-shine \
@@ -211,13 +212,6 @@ else
 VLC_CONF_OPTS += --disable-gles2
 endif
 
-ifeq ($(BR2_PACKAGE_OPENCV3),y)
-VLC_CONF_OPTS += --enable-opencv
-VLC_DEPENDENCIES += opencv3
-else
-VLC_CONF_OPTS += --disable-opencv
-endif
-
 ifeq ($(BR2_PACKAGE_OPUS),y)
 VLC_CONF_OPTS += --enable-opus
 VLC_DEPENDENCIES += libvorbis opus
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
