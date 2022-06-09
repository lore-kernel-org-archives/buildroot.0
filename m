Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA166C43334
	for <buildroot@archiver.kernel.org>; Thu,  9 Jun 2022 07:23:47 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8D0F48177A;
	Thu,  9 Jun 2022 07:23:47 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id UyqhoP3rS5BL; Thu,  9 Jun 2022 07:23:46 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id B3E8A81751;
	Thu,  9 Jun 2022 07:23:45 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F311A1BF2B7
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:23:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F128C81471
 for <buildroot@lists.busybox.net>; Thu,  9 Jun 2022 07:23:33 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id aT-NMmDVQmAu for <buildroot@lists.busybox.net>;
 Thu,  9 Jun 2022 07:23:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 46FA381440
 for <buildroot@buildroot.org>; Thu,  9 Jun 2022 07:23:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id BBD4B86E7E; Thu,  9 Jun 2022 07:11:37 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 9 Jun 2022 09:19:41 +0200
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: 491d6dd699dfbe0575c860157269d5366d320afd
X-Git-Newrev: 24c003ea9f42cacaef92af02cfc0d4317e496427
X-Patchwork-Hint: ignore
Message-Id: <20220609071137.BBD4B86E7E@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/linux-tools:
 thermal needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=24c003ea9f42cacaef92af02cfc0d4317e496427
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

tmon needs threads since its addition in kernel 3.13 and
https://github.com/torvalds/linux/commit/94f69966faf8e70bd655ea25f9dd5b9400567b75:

tmon.c:23:10: fatal error: pthread.h: No such file or directory
   23 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d7b3d15ebf80ca6dbbbd4554af541182c777e4de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
(cherry picked from commit ff5c1da7f74dbe44afb2454517bffe07cbcb317e)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/linux-tools/Config.in | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 6217fcfb7a..6c1c1d7abe 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -117,12 +117,16 @@ comment "selftests needs BR2_PACKAGE_BUSYBOX_SHOW_OTHERS and a toolchain w/ dyna
 
 config BR2_PACKAGE_LINUX_TOOLS_TMON
 	bool "tmon"
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LINUX_TOOLS
 	select BR2_PACKAGE_NCURSES
 	help
 	  tmon is a terminal-based tool (using curses) that allows the
 	  user to access thermal information about the system.
 
+comment "tmon needs a toolchain w/ threads"
+	depends on !BR2_TOOLCHAIN_HAS_THREADS
+
 config BR2_PACKAGE_LINUX_TOOLS_HV
 	bool "hv"
 	depends on BR2_i386 || BR2_x86_64
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
