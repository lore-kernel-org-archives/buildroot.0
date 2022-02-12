Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B82EEC433F5
	for <buildroot@archiver.kernel.org>; Sat, 12 Feb 2022 22:01:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4F2ED402F3;
	Sat, 12 Feb 2022 22:01:16 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id vNKZ8-YccUIm; Sat, 12 Feb 2022 22:01:15 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7D17F403C5;
	Sat, 12 Feb 2022 22:01:14 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id EBDE21BF4DD
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:01:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D8D9C400AB
 for <buildroot@lists.busybox.net>; Sat, 12 Feb 2022 22:01:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id FLyYY6V0-tg6 for <buildroot@lists.busybox.net>;
 Sat, 12 Feb 2022 22:00:59 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C698340022
 for <buildroot@buildroot.org>; Sat, 12 Feb 2022 22:00:59 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 0005E825B3; Sat, 12 Feb 2022 21:53:27 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 12 Feb 2022 23:00:38 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: b538b43c7665f54e3d1e47cfd7bbe824cd6d7544
X-Git-Newrev: cdefb4538e07ef37d77aa3634907b15652d31ff9
X-Patchwork-Hint: ignore
Message-Id: <20220212215328.0005E825B3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/android-tools: fastboot needs gcc
 >= 5
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

commit: https://git.buildroot.net/buildroot/commit/?id=cdefb4538e07ef37d77aa3634907b15652d31ff9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add gcc >= 5
dependency to fastboot:

Makefile:591: *** libsepol is in the dependency chain of libselinux that has added it to its _DEPENDENCIES variable without selecting it or depending on it from Config.in.  Stop.

Fixes:
 - http://autobuild.buildroot.org/results/2430ba4afb40569ed54506201494baeebf6c5d42

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/android-tools/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/android-tools/Config.in b/package/android-tools/Config.in
index a36c4db189..bc76d545c1 100644
--- a/package/android-tools/Config.in
+++ b/package/android-tools/Config.in
@@ -38,6 +38,7 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	bool "fastboot"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libselinux
 	depends on !BR2_STATIC_LIBS # libselinux
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libselinux -> libsepol
 	depends on BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT_GOOD_KERNEL_HEADERS
 	select BR2_PACKAGE_LIBSELINUX
 	select BR2_PACKAGE_ZLIB
@@ -46,8 +47,9 @@ config BR2_PACKAGE_ANDROID_TOOLS_FASTBOOT
 	  the target, which can be used to reflash other target devices
 	  implementing the fastboot protocol.
 
-comment "fastboot needs a toolchain w/ threads, dynamic library"
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+comment "fastboot needs a toolchain w/ threads, dynamic library, gcc >= 5"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
 
 comment "fastboot needs headers >= 3.10 (PowerPC64), headers >= 3.16 (MIPS64)"
 	depends on !BR2_arc
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
