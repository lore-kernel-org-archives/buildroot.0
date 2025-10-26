Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EFACCF9E9
	for <buildroot@archiver.kernel.org>; Sun, 26 Oct 2025 21:18:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id D681441044;
	Sun, 26 Oct 2025 21:18:25 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id jMaOqZ5KZrPo; Sun, 26 Oct 2025 21:18:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org AC69F407E7
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id AC69F407E7;
	Sun, 26 Oct 2025 21:18:24 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 6B9AA43F
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 21:18:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 68B0A610A1
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 21:18:23 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id cH0aLeIJNzf9 for <buildroot@buildroot.org>;
 Sun, 26 Oct 2025 21:18:22 +0000 (UTC)
Received-SPF: Pass (mailfrom) identity=mailfrom; client-ip=85.13.140.57;
 helo=dd20012.kasserver.com; envelope-from=bernd@kuhls.net; receiver=<UNKNOWN> 
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp3.osuosl.org BECBA6109E
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BECBA6109E
Received: from dd20012.kasserver.com (dd20012.kasserver.com [85.13.140.57])
 by smtp3.osuosl.org (Postfix) with ESMTPS id BECBA6109E
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 21:18:21 +0000 (UTC)
Received: from fli4l.lan.fli4l (p5b3a04a9.dip0.t-ipconnect.de [91.58.4.169])
 by dd20012.kasserver.com (Postfix) with ESMTPSA id 86D42A4C49DE
 for <buildroot@buildroot.org>; Sun, 26 Oct 2025 22:18:17 +0100 (CET)
Received: from bruckner.lan.fli4l ([192.168.1.1]:42010)
 by fli4l.lan.fli4l with esmtp (Exim 4.98.2)
 (envelope-from <bernd@kuhls.net>) id 1vD881-000000000sE-1kXj
 for buildroot@buildroot.org; Sun, 26 Oct 2025 21:18:17 +0000
From: Bernd Kuhls <bernd@kuhls.net>
To: buildroot@buildroot.org
Date: Sun, 26 Oct 2025 22:18:17 +0100
Message-ID: <20251026211817.2695263-1-bernd@kuhls.net>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
X-Spamd-Bar: /
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=kuhls.net; 
 s=kas202506031021; t=1761513497;
 bh=98QZnrnKqGHRjMdXHjgQppIhHKvpe2aZO1phhH8Dcd4=;
 h=From:To:Subject:Date:From;
 b=uS7fWJoHsuuW/8+Oz5D9iTHGQz74Unly2NbXB4LJTULdnyjZW4IJMcNsLALAHDvfz
 fX8M63cMOFGIWjBC8KV5v2lodJWorkOKwcE+1WZYLxLgTUx0EqP4I4Fym4Dt3vdl19
 toDTEsjaPQeoa7pwUJf71mOAxTeluqqeykQGhC1mZIGiApMj4aNEjxvMxQXKwbVLeE
 P9AT2W6YiTAjZleK0WIr72l3MnGBH/YanHcr0z6izsrgoRgahJqrwSQwNMlYLV1fnn
 wYUVzRKX0WtO9aVxtZn4JzqqISiPGBawjEr7tBPBoKkTX9Xj84lO0n2rJFnNjv2PE0
 N7ksfD+gOCa6Q==
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dmarc=pass (p=none dis=none)
 header.from=kuhls.net
X-Mailman-Original-Authentication-Results: smtp3.osuosl.org;
 dkim=pass (2048-bit key,
 unprotected) header.d=kuhls.net header.i=@kuhls.net header.a=rsa-sha256
 header.s=kas202506031021 header.b=uS7fWJoH
Subject: [Buildroot] [PATCH 1/1] package/libheif: needs threads
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

Buildroot commit accb006d9b62079b56bc1f1388b558a60dde277a bumped libheif
to version 1.20.1 which includes several commits unconditionally depen-
ding on std::mutex which requires a toolchain with threads:

https://github.com/strukturag/libheif/commit/14f956726c79747fc1fb8c041ed767c1632704eb
https://github.com/strukturag/libheif/commit/6bb8cdaa8a7ba78066c899c3791546b80051c70a

Added dependency to BR2_TOOLCHAIN_HAS_THREADS to Config.in, removed
configure options handling non-threaded toolchains and adjusted a
Config.in comment of the only dependee kodi-imagedecoder-heif.

Fixes:
https://autobuild.buildroot.net/results/28b/28bf68147382dada33cbf9b299396dfdee3fbbe6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
---
 package/kodi-imagedecoder-heif/Config.in | 2 +-
 package/libheif/Config.in                | 6 ++++--
 package/libheif/libheif.mk               | 7 -------
 3 files changed, 5 insertions(+), 10 deletions(-)

diff --git a/package/kodi-imagedecoder-heif/Config.in b/package/kodi-imagedecoder-heif/Config.in
index d0950385a0..f41b164ff4 100644
--- a/package/kodi-imagedecoder-heif/Config.in
+++ b/package/kodi-imagedecoder-heif/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_KODI_IMAGEDECODER_HEIF
 	bool "kodi-imagedecoder-heif"
 	depends on BR2_INSTALL_LIBSTDCPP # libde265, libheif, tinyxml2
-	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265
+	depends on BR2_TOOLCHAIN_HAS_THREADS # libde265, libheif
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730 # libheif
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # libheif
 	select BR2_PACKAGE_LIBDE265
diff --git a/package/libheif/Config.in b/package/libheif/Config.in
index 1452cf2718..0ae86a07f4 100644
--- a/package/libheif/Config.in
+++ b/package/libheif/Config.in
@@ -3,11 +3,13 @@ config BR2_PACKAGE_LIBHEIF
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  libheif is an HEIF and AVIF file format decoder and encoder.
 
 	  https://github.com/strukturag/libheif
 
-comment "libheif needs a toolchain w/ C++, gcc >= 4.8"
+comment "libheif needs a toolchain w/ C++, threads, gcc >= 4.8"
 	depends on !BR2_TOOLCHAIN_HAS_BINUTILS_BUG_30730
-	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_HAS_THREADS
diff --git a/package/libheif/libheif.mk b/package/libheif/libheif.mk
index 13e8295b0e..d82ec6a0ec 100644
--- a/package/libheif/libheif.mk
+++ b/package/libheif/libheif.mk
@@ -72,17 +72,10 @@ else
 LIBHEIF_CONF_OPTS += -DWITH_X265=OFF
 endif
 
-ifeq ($(BR2_TOOLCHAIN_HAS_THREADS),y)
-LIBHEIF_CONF_OPTS += -DENABLE_MULTITHREADING_SUPPORT=ON
 ifeq ($(BR2_TOOLCHAIN_HAS_GCC_BUG_64735),y)
 LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=OFF
 else
 LIBHEIF_CONF_OPTS += -DENABLE_PARALLEL_TILE_DECODING=ON
 endif
-else
-LIBHEIF_CONF_OPTS += \
-	-DENABLE_MULTITHREADING_SUPPORT=OFF \
-	-DENABLE_PARALLEL_TILE_DECODING=OFF
-endif
 
 $(eval $(cmake-package))
-- 
2.47.3

_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
