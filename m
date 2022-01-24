Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A2CD9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 24 Jan 2022 21:03:42 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 422D581750;
	Mon, 24 Jan 2022 21:03:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Pijdub6aN_s4; Mon, 24 Jan 2022 21:03:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 91074814AB;
	Mon, 24 Jan 2022 21:03:40 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 4EC731BF3FB
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:03:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4BA6D415D0
 for <buildroot@lists.busybox.net>; Mon, 24 Jan 2022 21:03:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ge13p2K7vs8s for <buildroot@lists.busybox.net>;
 Mon, 24 Jan 2022 21:03:37 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9264440943
 for <buildroot@buildroot.org>; Mon, 24 Jan 2022 21:03:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id A11B2822E9; Mon, 24 Jan 2022 20:56:48 +0000 (UTC)
From: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
To: buildroot@buildroot.org
Date: Mon, 24 Jan 2022 22:03:33 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3edc9055c2098de37d4365a20fe278deaa0cebb6
X-Git-Newrev: 63245fcf9bc801facd7b4775cc4ae9d31c3c8e24
X-Patchwork-Hint: ignore
Message-Id: <20220124205648.A11B2822E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vte: needs gcc >= 10
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.29
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

commit: https://git.buildroot.net/buildroot/commit/?id=63245fcf9bc801facd7b4775cc4ae9d31c3c8e24
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

vte needs C++20 since
https://gitlab.gnome.org/GNOME/vte/-/commit/eec33cce0b9359fddda35703e22bffd1f8f28852
to avoid the following build failure raised since bump to version 0.66.2
in commit 53c0c7dd01228122c7ceb44d65f2800dbcf473f1:

../output-1/build/vte-0.66.2/meson.build:144:0: ERROR: Assert failed: option -std=gnu++20 not supported by gcc

Fixes:
 - http://autobuild.buildroot.org/results/c0d1adeffbf97805a0f669d01929a56ccc66a835

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/vte/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/vte/Config.in b/package/vte/Config.in
index 2635a6007c..45d627885f 100644
--- a/package/vte/Config.in
+++ b/package/vte/Config.in
@@ -5,7 +5,7 @@ config BR2_PACKAGE_VTE
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_USE_MMU
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_USES_MUSL
 	depends on BR2_PACKAGE_HAS_LIBEGL_WAYLAND || \
@@ -22,13 +22,13 @@ config BR2_PACKAGE_VTE
 
 	  http://github.com/GNOME/vte
 
-comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 4.8"
+comment "vte needs a uClibc or glibc toolchain w/ wchar, threads, C++, gcc >= 10"
 	depends on BR2_PACKAGE_HOST_RUSTC_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_USE_WCHAR || !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_10 || \
 		BR2_TOOLCHAIN_USES_MUSL
 
 comment "vte needs an OpenGL or an OpenGL-EGL/wayland backend"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
