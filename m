Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1D3FC433F5
	for <buildroot@archiver.kernel.org>; Thu, 21 Apr 2022 18:03:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7815E41988;
	Thu, 21 Apr 2022 18:03:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Re9w3Xl4d_Vs; Thu, 21 Apr 2022 18:03:05 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 5A51741983;
	Thu, 21 Apr 2022 18:03:04 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 30FDC1BF406
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 8F6C583148
 for <buildroot@lists.busybox.net>; Thu, 21 Apr 2022 18:01:02 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0iKWOAnT5eCt for <buildroot@lists.busybox.net>;
 Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id A200083F03
 for <buildroot@buildroot.org>; Thu, 21 Apr 2022 18:01:01 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id A9C8083FC0; Thu, 21 Apr 2022 17:50:56 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 21 Apr 2022 19:32:15 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ef58ef062e5c65d28fd1551ec2ab4584a5856928
X-Git-Newrev: a3475c5c69b371c4fe8f74b253d868869eee12c6
X-Patchwork-Hint: ignore
Message-Id: <20220421175056.A9C8083FC0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/uftrace: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=a3475c5c69b371c4fe8f74b253d868869eee12c6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

uftrace needs NPTL since its addition in commit
09c97972d9f90b69cfc36f9ffe9e22c13daf9307 and
https://github.com/namhyung/uftrace/commit/543fe53c256ceaef2d4d7cc44925bf1ad5a068a8:

buildroot/build/uftrace-0.10/buildroot/build/uftrace-0.10/cmds/record.c:670: undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/8f884efb9d45f9145a4799981157c9226390b423

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
