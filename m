Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 342E2C433F5
	for <buildroot@archiver.kernel.org>; Mon, 30 May 2022 20:25:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BF84D41B87;
	Mon, 30 May 2022 20:25:42 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UHpoV6RvG1Z9; Mon, 30 May 2022 20:25:41 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7DBA841A62;
	Mon, 30 May 2022 20:25:40 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 59F1D1BF97C
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:25:26 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 479AE83403
 for <buildroot@lists.busybox.net>; Mon, 30 May 2022 20:25:26 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id RrDbrT8yRKuH for <buildroot@lists.busybox.net>;
 Mon, 30 May 2022 20:25:25 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9C752833FB
 for <buildroot@buildroot.org>; Mon, 30 May 2022 20:25:25 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4045)
 id BC00F867A7; Mon, 30 May 2022 20:13:51 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 30 May 2022 22:20:48 +0200
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 935617e016ab3fee14af2d515b598591f7798298
X-Git-Newrev: 80907060476f1a8b3ed69da2c11e5d1dbe670d87
X-Patchwork-Hint: ignore
Message-Id: <20220530201351.BC00F867A7@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/xmrig: introduce
 BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=80907060476f1a8b3ed69da2c11e5d1dbe670d87
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

This allows to avoid duplicating the list of architectures supported
by xmrig.

Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/xmrig/Config.in | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/package/xmrig/Config.in b/package/xmrig/Config.in
index 4c70abec6f..4dd16fa2b0 100644
--- a/package/xmrig/Config.in
+++ b/package/xmrig/Config.in
@@ -1,7 +1,14 @@
+# archs officially supported by upstream
+config BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
+	bool
+	default y if BR2_ARM_CPU_ARMV7A
+	default y if BR2_aarch64
+	default y if BR2_x86_64
+	default y if BR2_i386
+
 config BR2_PACKAGE_XMRIG
 	bool "xmrig"
-	# archs officially supported by upstream
-	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
 	depends on BR2_USE_MMU # libuv
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # libuv
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # libuv
@@ -16,7 +23,7 @@ config BR2_PACKAGE_XMRIG
 	  https://xmrig.com
 
 comment "xmrig needs a glibc or musl toolchain w/ NPTL, dynamic library, C++"
-	depends on BR2_ARM_CPU_ARMV7A || BR2_aarch64 || BR2_x86_64 || BR2_i386
+	depends on BR2_PACKAGE_XMRIG_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
