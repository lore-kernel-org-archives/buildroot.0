Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E492C433F5
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 19:59:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D04A683E73;
	Sun, 10 Apr 2022 19:59:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id w1p6XbdMHt6A; Sun, 10 Apr 2022 19:59:04 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 86F11840A5;
	Sun, 10 Apr 2022 19:59:03 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id A45CF1BF338
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:58:41 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 93263415E5
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 19:58:41 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 8OBA08549G0e for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 19:58:40 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 9354B415DD
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 19:58:40 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 57634838C4; Sun, 10 Apr 2022 19:49:00 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 21:55:43 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 3d399c990533f87f6e39cb33715f5cdbffbf25b5
X-Git-Newrev: 15c6374a56691addbf718078143a7ff16ecf3e23
X-Patchwork-Hint: ignore
Message-Id: <20220410194900.57634838C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/trace-cmd: needs
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

commit: https://git.buildroot.net/buildroot/commit/?id=15c6374a56691addbf718078143a7ff16ecf3e23
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

trace-cmd needs NPTL since bump to version 2.9.1 in commit
0e1231a3c0719269ab3546defe4b1fb0f1f5d7d2 and
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=08b9d5076455c93c997376c8089ee12b9071785b:

/nvmedata/autobuild/instance-24/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/10.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-24/output-1/build/trace-cmd-2.9.7/lib/trace-cmd/libtracecmd.a(trace-timesync.o): in function `tracecmd_tsync_with_host':
trace-timesync.c:(.text+0x12e1): undefined reference to `pthread_setaffinity_np'

Fixes:
 - http://autobuild.buildroot.org/results/9a88aaf92760b34958ef5b1708de83e46ccdb587

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit df3cc4bb1c91114d29e48d8bc8206adcc35e9b9c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/trace-cmd/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/trace-cmd/Config.in b/package/trace-cmd/Config.in
index 574541c571..2d0accd7ae 100644
--- a/package/trace-cmd/Config.in
+++ b/package/trace-cmd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TRACE_CMD
 	bool "trace-cmd"
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	# pthread_setaffinity_np
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_USE_MMU # fork()
 	depends on !BR2_STATIC_LIBS # dlopen()
 	help
@@ -13,6 +14,6 @@ config BR2_PACKAGE_TRACE_CMD
 
 	  http://git.kernel.org/cgit/linux/kernel/git/rostedt/trace-cmd.git
 
-comment "trace-cmd needs a toolchain w/ threads, dynamic library"
+comment "trace-cmd needs a toolchain w/ NPTL, dynamic library"
 	depends on BR2_USE_MMU
-	depends on !BR2_TOOLCHAIN_HAS_THREADS || BR2_STATIC_LIBS
+	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || BR2_STATIC_LIBS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
