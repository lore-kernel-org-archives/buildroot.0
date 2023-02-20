Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3B6CC05027
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 17:15:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6CCD282255;
	Mon, 20 Feb 2023 17:15:20 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CCD282255
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id DbjG0Pzc5k3v; Mon, 20 Feb 2023 17:15:19 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id A0F0E82251;
	Mon, 20 Feb 2023 17:15:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org A0F0E82251
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 38FFB1BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:14:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 13AF381062
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 17:14:40 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 13AF381062
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id wgOd5SoWkdJc for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 17:14:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 551F5813E1
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 17:14:39 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 551F5813E1
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 45181863E9; Mon, 20 Feb 2023 17:14:39 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 20 Feb 2023 18:13:07 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ee13e3fb41dc7c0c001127733b5a599c1e509747
X-Git-Newrev: 5f1858e859833da272fce70bf445ca1b53ebffe1
X-Patchwork-Hint: ignore
Message-Id: <20230220171439.45181863E9@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/rockchip-mali: needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f1858e859833da272fce70bf445ca1b53ebffe1
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

rockchip-mali pre-built libraries needs C++ since the addition of the
package in commit 97c74a73e5dee17530647f89b2c7d8692781eb14:

readelf -a output/build/rockchip-mali-721653b5b3b525a4f80d15aa7e2f9df7b7e60427/lib/aarch64-linux-gnu/libmali-bifrost-g31-rxp0-gbm.so|grep NEEDED
 0x0000000000000001 (NEEDED)             Shared library: [libpthread.so.0]
 0x0000000000000001 (NEEDED)             Shared library: [libdl.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [librt.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libdrm.so.2]
 0x0000000000000001 (NEEDED)             Shared library: [libm.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libstdc++.so.6]
 0x0000000000000001 (NEEDED)             Shared library: [libgcc_s.so.1]
 0x0000000000000001 (NEEDED)             Shared library: [libc.so.6]

While at it, add a comment when dependencies are not met

Fixes:
 - No autobuilder failures (yet), found when debugging an issue with
   rockchip-mali and glslsandbox-player

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/rockchip-mali/Config.in | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/package/rockchip-mali/Config.in b/package/rockchip-mali/Config.in
index d616284911..5a23954af3 100644
--- a/package/rockchip-mali/Config.in
+++ b/package/rockchip-mali/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_ROCKCHIP_MALI
 	bool "rockchip-mali"
+	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_USES_GLIBC
 	depends on BR2_ARM_EABIHF || BR2_aarch64
 	# lidbrm. This would normally need a Config.in comment, but
@@ -30,3 +31,8 @@ config BR2_PACKAGE_PROVIDES_LIBGBM
 	default "rockchip-mali"
 
 endif
+
+comment "rockchip-mali needs a glibc toolchain w/ C++, threads"
+	depends on BR2_ARM_EABIHF || BR2_aarch64
+	depends on !BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_USES_GLIBC || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
