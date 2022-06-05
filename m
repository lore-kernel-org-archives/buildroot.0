Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66208C43334
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:41:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 0E0196128F;
	Sun,  5 Jun 2022 19:41:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id bi9i-aDXBEwz; Sun,  5 Jun 2022 19:41:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2740361283;
	Sun,  5 Jun 2022 19:41:30 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0132A1BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:41:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E063B8407F
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id q6tPAMvovY2h for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 2094784075
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 8E4EA86BB3; Sun,  5 Jun 2022 19:29:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 21:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ff5c1da7f74dbe44afb2454517bffe07cbcb317e
X-Git-Newrev: b1dd0548d3f351c88e447d08f87e93f3151947c7
X-Patchwork-Hint: ignore
Message-Id: <20220605192927.8E4EA86BB3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf needs dynamic
 library
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

commit: https://git.buildroot.net/buildroot/commit/?id=b1dd0548d3f351c88e447d08f87e93f3151947c7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

traceevent needs dynamic library since its addition in kernel 3.14 and
https://github.com/torvalds/linux/commit/c877bbd8eceb14c5eac6779cc804fa8b34044736:

event-plugin.c:10:10: fatal error: dlfcn.h: No such file or directory
   10 | #include <dlfcn.h>
      |          ^~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/24206071721479a6ba4d0267e7e20ef9498e1e05

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/linux-tools/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 6c1c1d7abe..732ac65a25 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -50,6 +50,7 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on !BR2_STATIC_LIBS # dlfcn.h
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
@@ -69,6 +70,10 @@ config BR2_PACKAGE_LINUX_TOOLS_PERF
 
 	  https://perf.wiki.kernel.org/
 
+comment "perf needs a toolchain w/ dynamic library"
+	depends on BR2_TOOLCHAIN_HAS_SYNC_4
+	depends on BR2_STATIC_LIBS
+
 if BR2_PACKAGE_LINUX_TOOLS_PERF
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF_TUI
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
