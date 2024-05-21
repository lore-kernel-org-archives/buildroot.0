Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCF2EC25B74
	for <buildroot@archiver.kernel.org>; Tue, 21 May 2024 04:58:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 7CF7240106;
	Tue, 21 May 2024 04:58:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id P0lV92oB1fnS; Tue, 21 May 2024 04:58:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 636F64040A
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 636F64040A;
	Tue, 21 May 2024 04:58:06 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 30E241C4F6D
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:58:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 1DE3E4040A
 for <buildroot@lists.busybox.net>; Tue, 21 May 2024 04:58:05 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id J-9qdy1UZ5u2 for <buildroot@lists.busybox.net>;
 Tue, 21 May 2024 04:58:04 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 45F3140106
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 45F3140106
 for <buildroot@buildroot.org>; Tue, 21 May 2024 04:58:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2F62487490; Tue, 21 May 2024 04:58:04 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Tue, 21 May 2024 06:57:48 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 7bea8c984e2fcff3dd058dbaecfbb6f96e1d66a2
X-Git-Newrev: 898cf04e47b5d292afc1ab1e67f59b10b8637b12
X-Patchwork-Hint: ignore
Message-Id: <20240521045804.2F62487490@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/ivi-homescreen: needs gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=898cf04e47b5d292afc1ab1e67f59b10b8637b12
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
