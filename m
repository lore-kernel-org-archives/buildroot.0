Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54C52C433F5
	for <buildroot@archiver.kernel.org>; Mon, 23 May 2022 15:37:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id A47754192F;
	Mon, 23 May 2022 15:37:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 8xZBxKaszORA; Mon, 23 May 2022 15:36:59 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 67ADC41926;
	Mon, 23 May 2022 15:36:58 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id CE34D1BF390
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:36:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id BBC96408AF
 for <buildroot@lists.busybox.net>; Mon, 23 May 2022 15:36:50 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 614_c94AhdZ1 for <buildroot@lists.busybox.net>;
 Mon, 23 May 2022 15:36:50 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0FEB4404D8
 for <buildroot@buildroot.org>; Mon, 23 May 2022 15:36:50 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id A1E24863F0; Mon, 23 May 2022 15:25:32 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 23 May 2022 17:36:18 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 48fccc4eb50f8e4229d24bb786f1276acfe2ea02
X-Git-Newrev: 5d43e3e5d67aabf31647f23e9b6586644ec3bc32
X-Patchwork-Hint: ignore
Message-Id: <20220523152532.A1E24863F0@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/uftrace: needs
 NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=5d43e3e5d67aabf31647f23e9b6586644ec3bc32
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

uftrace needs NPTL since its addition in commit
09c97972d9f90b69cfc36f9ffe9e22c13daf9307 and
https://github.com/namhyung/uftrace/commit/543fe53c256ceaef2d4d7cc44925bf1ad5a068a8:

buildroot/build/uftrace-0.10/buildroot/build/uftrace-0.10/cmds/record.c:670: undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/8f884efb9d45f9145a4799981157c9226390b423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit a3475c5c69b371c4fe8f74b253d868869eee12c6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/uftrace/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/uftrace/Config.in b/package/uftrace/Config.in
index 98ddb7cbfb..8f8c5d25fd 100644
--- a/package/uftrace/Config.in
+++ b/package/uftrace/Config.in
@@ -8,7 +8,7 @@ config BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
 config BR2_PACKAGE_UFTRACE
 	bool "uftrace"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on !BR2_STATIC_LIBS
 	select BR2_PACKAGE_ARGP_STANDALONE if \
 	       BR2_TOOLCHAIN_USES_UCLIBC || \
@@ -23,6 +23,6 @@ config BR2_PACKAGE_UFTRACE
 
 	  https://github.com/namhyung/uftrace
 
-comment "uftrace needs a toolchain w/ threads, dynamic library"
+comment "uftrace needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_PACKAGE_UFTRACE_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
