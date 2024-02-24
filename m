Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FA73C5478C
	for <buildroot@archiver.kernel.org>; Sat, 24 Feb 2024 17:16:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1E77160861;
	Sat, 24 Feb 2024 17:16:11 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id iMJau17m82fj; Sat, 24 Feb 2024 17:16:10 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org EC965608D8
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id EC965608D8;
	Sat, 24 Feb 2024 17:16:09 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8E22F1BF852
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 17:16:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 7B49540729
 for <buildroot@lists.busybox.net>; Sat, 24 Feb 2024 17:16:06 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0WehqUBV3SRb for <buildroot@lists.busybox.net>;
 Sat, 24 Feb 2024 17:16:05 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org A815640714
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id A815640714
 for <buildroot@buildroot.org>; Sat, 24 Feb 2024 17:16:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 760AC87A5C; Sat, 24 Feb 2024 17:16:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sat, 24 Feb 2024 18:11:10 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: fb6274f5defc1acacd906ee6cd0b12684a866b92
X-Git-Newrev: 01f24d041d36c9d132a7888b7fefe8055b4ad321
X-Patchwork-Hint: ignore
Message-Id: <20240224171605.760AC87A5C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/tio: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=01f24d041d36c9d132a7888b7fefe8055b4ad321
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tio needs threads since version 2.4 and
https://github.com/tio/tio/commit/93e6efc00153e625e4ceb8a51e01b324247d312a
resulting in the following build failure since bump to version 2.7 in
commit 4b33d7a47dd41fed5364a398320c2b7d0687ba5e:

In file included from /home/autobuild/autobuild/instance-7/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/include/stdio.h:27,
                 from ../src/tty.c:23:
/home/autobuild/autobuild/instance-7/output-1/host/riscv64-buildroot-linux-uclibc/sysroot/usr/include/features.h:218:5: warning: #warning requested reentrant code, but thread support was disabled [-Wcpp]
  218 | #   warning requested reentrant code, but thread support was disabled
      |     ^~~~~~~
../src/tty.c:43:10: fatal error: pthread.h: No such file or directory
   43 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes: 4b33d7a47dd41fed5364a398320c2b7d0687ba5e
 - http://autobuild.buildroot.org/results/9b20ff06a0ad24b7e7f4750ebe64e2077e36164a

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/tio/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/tio/Config.in b/package/tio/Config.in
index a84daf8a24..e4241fa5e1 100644
--- a/package/tio/Config.in
+++ b/package/tio/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_TIO
 	bool "tio"
 	depends on !BR2_sparc64 && !BR2_sparc
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_INIH
 	help
 	  "tio" is a simple TTY terminal application which features a
@@ -14,3 +15,7 @@ config BR2_PACKAGE_TIO
 # fix or workaround for now
 comment "tio is disabled for sparc and sparc64 architectures"
 	depends on BR2_sparc64 || BR2_sparc
+
+comment "tio needs a toolchain w/ threads"
+	depends on !BR2_sparc64 && !BR2_sparc
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
