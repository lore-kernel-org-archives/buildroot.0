Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D3EBC433F5
	for <buildroot@archiver.kernel.org>; Mon, 11 Apr 2022 07:11:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 00E2540516;
	Mon, 11 Apr 2022 07:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id FvuZzaotIYI5; Mon, 11 Apr 2022 07:11:43 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 0668740338;
	Mon, 11 Apr 2022 07:11:42 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 98F511BF2B9
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:11:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 86E234157F
 for <buildroot@lists.busybox.net>; Mon, 11 Apr 2022 07:11:40 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id LJ9MrUOuiWct for <buildroot@lists.busybox.net>;
 Mon, 11 Apr 2022 07:11:39 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 76635409B1
 for <buildroot@buildroot.org>; Mon, 11 Apr 2022 07:11:39 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2975781400; Mon, 11 Apr 2022 07:01:58 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Apr 2022 09:09:05 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 789a08dac5808401629d6fc586b7377f54ebb316
X-Git-Newrev: 2364dafa70245a838f6bfbb95dfc2992e0750a01
X-Patchwork-Hint: ignore
Message-Id: <20220411070158.2975781400@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/valgrind: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=2364dafa70245a838f6bfbb95dfc2992e0750a01
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

valgrind needs threads since the addition of vgdb in
https://sourceware.org/git/?p=valgrind.git;a=commit;h=2ee9e9048658773ceef3d30eb79f44764a024f3c:

vgdb.c:37:10: fatal error: pthread.h: No such file or directory
   37 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/ffa2dbfd6d5efcc50d447c0e759fb4ffce0b59b9

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/valgrind/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/valgrind/Config.in b/package/valgrind/Config.in
index 56e4af21fa..700849130f 100644
--- a/package/valgrind/Config.in
+++ b/package/valgrind/Config.in
@@ -7,14 +7,15 @@ config BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	default y if BR2_powerpc || BR2_powerpc64 || BR2_powerpc64le
 	depends on !BR2_MIPS_SOFT_FLOAT
 
-comment "valgrind needs a toolchain w/ dynamic library"
+comment "valgrind needs a toolchain w/ dynamic library, threads"
 	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_VALGRIND
 	bool "valgrind"
 	depends on BR2_PACKAGE_VALGRIND_ARCH_SUPPORTS
 	depends on !BR2_STATIC_LIBS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  Tool for debugging and profiling Linux programs.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
