Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B6A6C433EF
	for <buildroot@archiver.kernel.org>; Sun,  5 Jun 2022 19:41:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2D7AD840B7;
	Sun,  5 Jun 2022 19:41:20 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id E--rGb535ypv; Sun,  5 Jun 2022 19:41:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C65078407F;
	Sun,  5 Jun 2022 19:41:17 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id E36171BF388
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E09528409D
 for <buildroot@lists.busybox.net>; Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id B4DZMOnwcs0N for <buildroot@lists.busybox.net>;
 Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 17CD58406A
 for <buildroot@buildroot.org>; Sun,  5 Jun 2022 19:41:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 82E3686BB2; Sun,  5 Jun 2022 19:29:27 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 Jun 2022 21:40:23 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 77926e7008d6f95a982e1f094dea4dae71e05961
X-Git-Newrev: ff5c1da7f74dbe44afb2454517bffe07cbcb317e
X-Patchwork-Hint: ignore
Message-Id: <20220605192927.82E3686BB2@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: thermal needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff5c1da7f74dbe44afb2454517bffe07cbcb317e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

tmon needs threads since its addition in kernel 3.13 and
https://github.com/torvalds/linux/commit/94f69966faf8e70bd655ea25f9dd5b9400567b75:

tmon.c:23:10: fatal error: pthread.h: No such file or directory
   23 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/d7b3d15ebf80ca6dbbbd4554af541182c777e4de

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
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
