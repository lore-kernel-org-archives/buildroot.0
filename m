Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79E8DCAC5B8
	for <buildroot@archiver.kernel.org>; Sun,  5 Oct 2025 20:37:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2E12382F11;
	Sun,  5 Oct 2025 20:37:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3SzlJC8oLfVY; Sun,  5 Oct 2025 20:37:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 0DBB4830C2
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 0DBB4830C2;
	Sun,  5 Oct 2025 20:37:43 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 76DAC226
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:37:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5CEB382F11
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:37:41 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 888QrpAEVSvS for <buildroot@buildroot.org>;
 Sun,  5 Oct 2025 20:37:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5BFD182E22
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5BFD182E22
 for <buildroot@buildroot.org>; Sun,  5 Oct 2025 20:37:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id F410C8693A; Sun,  5 Oct 2025 20:37:39 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sun, 5 Oct 2025 22:36:30 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d2b2bab84af75465d94a2f577ac81f481aa02c2c
X-Git-Newrev: 2f6a82b633643ce4d1e30579e345497aea3d2a1c
X-Patchwork-Hint: ignore
Message-Id: <20251005203739.F410C8693A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/vulkan-headers: needs C++
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=2f6a82b633643ce4d1e30579e345497aea3d2a1c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
