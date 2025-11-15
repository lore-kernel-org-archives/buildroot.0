Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D001CCE8D6B
	for <buildroot@archiver.kernel.org>; Mon, 17 Nov 2025 20:08:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id A3E93613A3;
	Mon, 17 Nov 2025 20:08:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TC4sytQathqF; Mon, 17 Nov 2025 20:08:21 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org BFDD66149B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id BFDD66149B;
	Mon, 17 Nov 2025 20:08:21 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11C7B158
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:08:03 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 85A8A6143E
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:55 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HAFp4PFR6hXK for <buildroot@buildroot.org>;
 Mon, 17 Nov 2025 20:07:54 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 749C961374
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 749C961374
 for <buildroot@buildroot.org>; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A3381410; Mon, 17 Nov 2025 20:07:53 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 15 Nov 2025 17:36:54 +0100
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 13c7a9f2ffd347dc48c222994cc99a5cb32052a6
X-Git-Newrev: 03b99918de35d3e1644cf4e41e3331991c988c0a
X-Patchwork-Hint: ignore
Message-Id: <20251117200753.70A3381410@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/libheif: needs
 threads since v1.20.1
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=03b99918de35d3e1644cf4e41e3331991c988c0a
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

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
(cherry picked from commit 02f5061eb01c32427ec953f5cd5b367244f2a360)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
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
index f6e14888eb..8d91a109db 100644
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
