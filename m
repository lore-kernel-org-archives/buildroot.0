Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0395CCD187
	for <buildroot@archiver.kernel.org>; Thu,  9 Oct 2025 09:56:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B44E061294;
	Thu,  9 Oct 2025 09:56:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 8UaBK63eJcLU; Thu,  9 Oct 2025 09:55:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 886D86127F
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 886D86127F;
	Thu,  9 Oct 2025 09:55:58 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 057FE21B
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7291B605AA
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Ue4nXrqm2fBw for <buildroot@buildroot.org>;
 Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 75419611D5
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 75419611D5
 for <buildroot@buildroot.org>; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 72E8986C3B; Thu,  9 Oct 2025 09:55:40 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 9 Oct 2025 08:45:05 +0200
X-Git-Refname: refs/heads/2025.08.x
X-Git-Oldrev: 84f762ef070072caf0af729d64a15cc39d29a5d4
X-Git-Newrev: e8394621f7d5ffc5afcf7c9c3e00f31f051c898f
X-Patchwork-Hint: ignore
Message-Id: <20251009095540.72E8986C3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.08.x] package/vulkan-headers:
 needs C++
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

commit: https://git.buildroot.net/buildroot/commit/?id=e8394621f7d5ffc5afcf7c9c3e00f31f051c898f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.08.x

Since Buildroot commit [1] "package/vulkan-{headers,loader,tools}:
bump to 1.4.317 release", the vulkan-headers package is failing at
configuration time with toolchains without C++ support, with error:

    The C++ compiler
      "/bin/false"
    is not able to compile a simple test program.

This is due to upstream commit [2], which added CXX to the CMake
project file.

This commit fixes the issue by adding the C++ dependency.

Fixes:
https://autobuild.buildroot.org/results/10f63398940d52be9a8ee306daf4203ceca25eb8

[1] https://gitlab.com/buildroot.org/buildroot/-/commit/52664093dee0f280db191c391167848dc5b09745
[2] https://github.com/KhronosGroup/Vulkan-Headers/commit/85256c712ce9ee9755ae74faacc3e6a1d2c5eddf

Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 2f6a82b633643ce4d1e30579e345497aea3d2a1c)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/vulkan-headers/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/vulkan-headers/Config.in b/package/vulkan-headers/Config.in
index c0fc8f20b0..fdab31893f 100644
--- a/package/vulkan-headers/Config.in
+++ b/package/vulkan-headers/Config.in
@@ -1,7 +1,11 @@
 config BR2_PACKAGE_VULKAN_HEADERS
 	bool "vulkan-headers"
+	depends on BR2_INSTALL_LIBSTDCPP
 	help
 	  The Khronos official Vulkan header files and API
 	  registry.
 
 	  https://github.com/KhronosGroup/Vulkan-Headers
+
+comment "vulkan-headers needs a toolchain w/ C++"
+	depends on !BR2_INSTALL_LIBSTDCPP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
