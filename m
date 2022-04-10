Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 570A1C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 14:48:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 122C382AC8;
	Sun, 10 Apr 2022 14:48:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 1mT9z91Gg98a; Sun, 10 Apr 2022 14:48:33 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 35C918264A;
	Sun, 10 Apr 2022 14:48:32 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 1FD121BF990
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 0DE628401C
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 14:48:18 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 9cQvjL07gegp for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 5737C84006
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 14:48:17 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 9496C837C4; Sun, 10 Apr 2022 14:38:37 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 16:15:09 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f83216ff1f86c625023bee3037773997fc2987d
X-Git-Newrev: df3cc4bb1c91114d29e48d8bc8206adcc35e9b9c
X-Patchwork-Hint: ignore
Message-Id: <20220410143837.9496C837C4@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/trace-cmd: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=df3cc4bb1c91114d29e48d8bc8206adcc35e9b9c
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

trace-cmd needs NPTL since bump to version 2.9.1 in commit
0e1231a3c0719269ab3546defe4b1fb0f1f5d7d2 and
https://git.kernel.org/pub/scm/utils/trace-cmd/trace-cmd.git/commit/?id=08b9d5076455c93c997376c8089ee12b9071785b:

/nvmedata/autobuild/instance-24/output-1/host/lib/gcc/i586-buildroot-linux-uclibc/10.3.0/../../../../i586-buildroot-linux-uclibc/bin/ld: /nvmedata/autobuild/instance-24/output-1/build/trace-cmd-2.9.7/lib/trace-cmd/libtracecmd.a(trace-timesync.o): in function `tracecmd_tsync_with_host':
trace-timesync.c:(.text+0x12e1): undefined reference to `pthread_setaffinity_np'

Fixes:
 - http://autobuild.buildroot.org/results/9a88aaf92760b34958ef5b1708de83e46ccdb587

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
