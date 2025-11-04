Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47289CCFA00
	for <buildroot@archiver.kernel.org>; Tue,  4 Nov 2025 08:29:55 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 12AFF40C81;
	Tue,  4 Nov 2025 08:29:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l5_gGfzblQFZ; Tue,  4 Nov 2025 08:29:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2DD2E40C86
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2DD2E40C86;
	Tue,  4 Nov 2025 08:29:54 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id B6BA9462
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 08:29:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9CF1A60F16
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 08:29:52 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id omEs_2uTFNt3 for <buildroot@buildroot.org>;
 Tue,  4 Nov 2025 08:29:51 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org D428B60C29
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D428B60C29
 for <buildroot@buildroot.org>; Tue,  4 Nov 2025 08:29:51 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id BE43D83C14; Tue,  4 Nov 2025 08:29:51 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 4 Nov 2025 09:22:26 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ae1c7f64503bc9dc97a1bbcc6c20f259d846d9f7
X-Git-Newrev: 02f5061eb01c32427ec953f5cd5b367244f2a360
X-Patchwork-Hint: ignore
Message-Id: <20251104082951.BE43D83C14@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libheif: needs threads since
 v1.20.1
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=02f5061eb01c32427ec953f5cd5b367244f2a360
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Buildroot commit accb006d9b62079b56bc1f1388b558a60dde277a bumped libheif
to version 1.20.1 which includes several commits unconditionally depen-
ding on std::mutex which requires a toolchain with threads:

https://github.com/strukturag/libheif/commit/14f956726c79747fc1fb8c041ed767c1632704eb
https://github.com/strukturag/libheif/commit/6bb8cdaa8a7ba78066c899c3791546b80051c70a

Add dependency to BR2_TOOLCHAIN_HAS_THREADS to Config.in, remove configure
options handling non-threaded toolchains and adjust a Config.in comment of
the only dependee kodi-imagedecoder-heif.

Fixes:
https://autobuild.buildroot.net/results/28b/28bf68147382dada33cbf9b299396dfdee3fbbe6/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
