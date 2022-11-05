Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6214C4332F
	for <buildroot@archiver.kernel.org>; Sat,  5 Nov 2022 22:05:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 5DC38817D3;
	Sat,  5 Nov 2022 22:05:19 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 5DC38817D3
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id fWOzVdXS5ycj; Sat,  5 Nov 2022 22:05:18 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 825DE8125F;
	Sat,  5 Nov 2022 22:05:17 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 825DE8125F
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B18DF1BF3FD
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:05:11 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 8DAB44032A
 for <buildroot@lists.busybox.net>; Sat,  5 Nov 2022 22:05:11 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8DAB44032A
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id XILa8MHpRCtd for <buildroot@lists.busybox.net>;
 Sat,  5 Nov 2022 22:05:10 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C2F6A400D9
 for <buildroot@buildroot.org>; Sat,  5 Nov 2022 22:05:10 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C2F6A400D9
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id B2D4387EAA; Sat,  5 Nov 2022 22:05:10 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 23:03:53 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: db19998035701d08bf1b5fd366e0b5aa9adb8e57
X-Git-Newrev: 958c166837a484e2a9515342c49e93dca734d726
X-Patchwork-Hint: ignore
Message-Id: <20221105220510.B2D4387EAA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/linux-tools: perf needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=958c166837a484e2a9515342c49e93dca734d726
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised (at least) since linux 4.0 and
https://github.com/torvalds/linux/commit/459a3df76c99124fd222586be7f10f862547e7a9:

  CC      /home/autobuild/autobuild/instance-2/output-1/build/linux-6.0.1/tools/perf/builtin-bench.o
In file included from builtin-bench.c:22:
bench/bench.h:66:10: fatal error: pthread.h: No such file or directory
   66 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fies:
 - http://autobuild.buildroot.org/results/b6abd641f528101e74f9af33e54ccefe0731148f

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/linux-tools/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/linux-tools/Config.in b/package/linux-tools/Config.in
index 82e62f826e..8a0b6d5802 100644
--- a/package/linux-tools/Config.in
+++ b/package/linux-tools/Config.in
@@ -47,14 +47,15 @@ config BR2_PACKAGE_LINUX_TOOLS_PCI
 
 	  These tools are available only from kernel version 4.20.
 
-comment "perf needs a toolchain w/ dynamic library"
+comment "perf needs a toolchain w/ dynamic library, threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
 
 config BR2_PACKAGE_LINUX_TOOLS_PERF
 	bool "perf"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_LINUX_TOOLS
 	help
 	  perf (sometimes "Perf Events" or perf tools, originally
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
