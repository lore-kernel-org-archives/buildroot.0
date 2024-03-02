Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64E78C54798
	for <buildroot@archiver.kernel.org>; Sat,  2 Mar 2024 15:30:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 325E360A77;
	Sat,  2 Mar 2024 15:30:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id JN6wYPA1Cs5D; Sat,  2 Mar 2024 15:30:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 94AEE60A6B
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 94AEE60A6B;
	Sat,  2 Mar 2024 15:30:30 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id DA7AE1BF836
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id C80B460748
 for <buildroot@lists.busybox.net>; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id DNBjSYJV6ghg for <buildroot@lists.busybox.net>;
 Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1E6FB605EB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 1E6FB605EB
 for <buildroot@buildroot.org>; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 0888787DE4; Sat,  2 Mar 2024 15:30:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 2 Mar 2024 16:29:31 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 73c83dbe3e8e212b4b3d563b5ddf86354d6a6b29
X-Git-Newrev: b6d96266a174024c5f6f8647cf19617056aef56c
X-Patchwork-Hint: ignore
Message-Id: <20240302153026.0888787DE4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/spirv-tools: needs gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6d96266a174024c5f6f8647cf19617056aef56c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

spirv-tools unconditionally includes filesystem since its addition in
commit 0a01085abeb7d8a097cb68b9f7f4faec7711543c resulting in the
following build failure:

/home/buildroot/autobuild/run/instance-1/output-1/build/spirv-tools-1.3.261.1/tools/objdump/objdump.cpp:15:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~

Fixes: 0a01085abeb7d8a097cb68b9f7f4faec7711543c
 - http://autobuild.buildroot.org/results/aaeb0ca8773842768f9311fc804bb7529d9e3bfa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/spirv-tools/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/spirv-tools/Config.in b/package/spirv-tools/Config.in
index 39fdb80b86..fa9b615c56 100644
--- a/package/spirv-tools/Config.in
+++ b/package/spirv-tools/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_SPIRV_TOOLS
 	bool "spirv-tools"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	select BR2_PACKAGE_SPIRV_HEADERS
 	help
 	  The SPIR-V Tools project provides an API and commands for
@@ -9,6 +9,6 @@ config BR2_PACKAGE_SPIRV_TOOLS
 
 	  https://github.com/KhronosGroup/SPIRV-Tools
 
-comment "spirv-tools needs a toolchain w/ C++, gcc >= 7"
+comment "spirv-tools needs a toolchain w/ C++, gcc >= 8"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
