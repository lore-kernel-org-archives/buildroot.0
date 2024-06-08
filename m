Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83C4DC25B76
	for <buildroot@archiver.kernel.org>; Sat,  8 Jun 2024 14:01:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 53F8660848;
	Sat,  8 Jun 2024 14:01:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S4GDOKX4HAch; Sat,  8 Jun 2024 14:01:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8C5946084C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 8C5946084C;
	Sat,  8 Jun 2024 14:01:55 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 4F9C31BF41A
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id CE6B8607D7
 for <buildroot@lists.busybox.net>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZGyVm_50DQIc for <buildroot@lists.busybox.net>;
 Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 109B4607AB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 109B4607AB
 for <buildroot@buildroot.org>; Sat,  8 Jun 2024 14:01:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id EF86981D3C; Sat,  8 Jun 2024 14:01:41 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 8 Jun 2024 15:43:37 +0200
X-Git-Refname: refs/heads/2024.02.x
X-Git-Oldrev: 1809ad9ee478ae7ee5543f51d11452b8a182e7f5
X-Git-Newrev: 5f36e64944f439272261360208c45cadd4b39fd3
X-Patchwork-Hint: ignore
Message-Id: <20240608140141.EF86981D3C@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.02.x] package/ivi-homescreen:
 needs gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=5f36e64944f439272261360208c45cadd4b39fd3
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.02.x

ivi-homescreen needs C++17 filesystem resulting in the following build
failure with gcc < 8 since its addition in commit
9d8497e79de3ced144877ba6ee38cc5b7181aaeb:

In file included from /home/buildroot/instance-0/output-1/build/ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a/third_party/flutter/shell/platform/common/path_utils.cc:5:0:
/home/buildroot/instance-0/output-1/build/ivi-homescreen-5ab78a19e95c88cc5d6b173ab1260a211e78cf0a/third_party/./flutter/shell/platform/common/path_utils.h:8:10: fatal error: filesystem: No such file or directory
 #include <filesystem>
          ^~~~~~~~~~~~

Fixes: 9d8497e79de3ced144877ba6ee38cc5b7181aaeb
 - http://autobuild.buildroot.org/results/a5e88d5a4264a6165be31a99f1c123af53fa382e

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit 898cf04e47b5d292afc1ab1e67f59b10b8637b12)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/ivi-homescreen/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/ivi-homescreen/Config.in b/package/ivi-homescreen/Config.in
index dc2ccb0c97..a4f5f6835f 100644
--- a/package/ivi-homescreen/Config.in
+++ b/package/ivi-homescreen/Config.in
@@ -3,7 +3,7 @@ menuconfig BR2_PACKAGE_IVI_HOMESCREEN
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on BR2_HOST_GCC_AT_LEAST_5 # flutter-engine
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # flutter-engine
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17 filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # flutter-engine
 	depends on BR2_TOOLCHAIN_USES_GLIBC # flutter-engine
 	depends on BR2_INSTALL_LIBSTDCPP # flutter-engine
@@ -250,11 +250,11 @@ comment "OpenGL texture plugin needs an EGL backend"
 
 endif # BR2_PACKAGE_IVI_HOMESCREEN
 
-comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 5, dynamic library, host gcc >= 5"
+comment "ivi-homescreen needs a glibc toolchain w/ wchar, C++, gcc >= 8, dynamic library, host gcc >= 5"
 	depends on BR2_PACKAGE_HOST_FLUTTER_SDK_BIN_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_FLUTTER_ENGINE_ARCH_SUPPORTS
 	depends on !BR2_TOOLCHAIN_USES_GLIBC \
-		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_5 \
+		|| !BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_8 \
 		|| BR2_STATIC_LIBS || !BR2_USE_WCHAR \
 		|| !BR2_HOST_GCC_AT_LEAST_5
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
