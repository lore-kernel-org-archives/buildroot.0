Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95C78C25B76
	for <buildroot@archiver.kernel.org>; Wed,  5 Jun 2024 20:30:12 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 3A322820BD;
	Wed,  5 Jun 2024 20:30:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k5coH5yHkPOf; Wed,  5 Jun 2024 20:30:09 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A7582011
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B6A7582011;
	Wed,  5 Jun 2024 20:30:08 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id B29181BF5A9
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:30:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A034A611A1
 for <buildroot@lists.busybox.net>; Wed,  5 Jun 2024 20:30:07 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pH2GNi1GOvUU for <buildroot@lists.busybox.net>;
 Wed,  5 Jun 2024 20:30:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8A42C6066D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8A42C6066D
 for <buildroot@buildroot.org>; Wed,  5 Jun 2024 20:30:06 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 70A5F87996; Wed,  5 Jun 2024 20:30:06 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Jun 2024 22:25:37 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e19ae5ecad7a12673d61781f9090c2610f2dcf18
X-Git-Newrev: e26e0caf38e5dbf0085a117795c2964e6cc5c1f9
X-Patchwork-Hint: ignore
Message-Id: <20240605203006.70A5F87996@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libzenoh-c: add GLIBC and aarch64,
 x86_64 and arm dependencies
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
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=e26e0caf38e5dbf0085a117795c2964e6cc5c1f9
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

The manual of zenoh-c says that:

zenoh-c only have support for following targets:
aarch64-unknown-linux-gnu, x86_64-unknown-linux-gnu, arm-unknown-linux-gnueabi

This patch provides a blind option BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS,
which is default y for above architectures. Additionally adds a dependency on
GLIBC because one of the autobuilders had a problem with MUSL. Moved also the
BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS from package's dependency
list to the BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS option.

Fixes:
http://autobuild.buildroot.net/results/680f25769526e5eef43d254a10a525b165846c75
http://autobuild.buildroot.net/results/31ed69cb2ffe8e9bc13a27c3fda16c27e9855b56
http://autobuild.buildroot.net/results/fdc74b8a42388b51cc4197c38b552559b97cbb8c
http://autobuild.buildroot.net/results/6e7ad53d44b417f6aa62acd8b2396720f5a14e82
http://autobuild.buildroot.net/results/c85927b1dd25a84981adc5cc537eb07d02da40bc
http://autobuild.buildroot.net/results/5389ac0174791b3d899fda7769b4f0f2dfeb805b
http://autobuild.buildroot.net/results/285bd8f5aa338dbaf9ac0e5f78593b10bd54cbb5

Signed-off-by: Alex Michel <alex.michel@wiedemann-group.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/libzenoh-c/Config.in | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/package/libzenoh-c/Config.in b/package/libzenoh-c/Config.in
index d22807c047..c0028bec6f 100644
--- a/package/libzenoh-c/Config.in
+++ b/package/libzenoh-c/Config.in
@@ -1,9 +1,21 @@
+config BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	bool
+	default y if BR2_aarch64
+	default y if BR2_arm
+	default y if BR2_x86_64
+	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+
 config BR2_PACKAGE_LIBZENOH_C
 	bool "libzenoh-c"
-	depends on BR2_PACKAGE_HOST_RUSTC_TARGET_ARCH_SUPPORTS
+	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_USES_GLIBC
 	select BR2_PACKAGE_HOST_RUSTC
 	help
 	  This package provides a C binding based on the main
 	  Zenoh implementation written in Rust.
 
 	  https://github.com/eclipse-zenoh/zenoh-c
+
+comment "libzenoh-c needs a glibc toolchain"
+	depends on BR2_PACKAGE_LIBZENOH_C_ARCH_SUPPORTS
+	depends on !BR2_TOOLCHAIN_USES_GLIBC
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
