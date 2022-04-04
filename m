Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A74AC433F5
	for <buildroot@archiver.kernel.org>; Mon,  4 Apr 2022 20:20:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 318814058B;
	Mon,  4 Apr 2022 20:20:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Bf8rpaOwy2Ei; Mon,  4 Apr 2022 20:20:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 2B64040529;
	Mon,  4 Apr 2022 20:20:47 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 7B4CB1BF232
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D84B740327
 for <buildroot@lists.busybox.net>; Mon,  4 Apr 2022 20:19:15 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id yxkv5Bmt4S0K for <buildroot@lists.busybox.net>;
 Mon,  4 Apr 2022 20:19:15 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 16E9D4040C
 for <buildroot@buildroot.org>; Mon,  4 Apr 2022 20:19:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 5BECE82DF6; Mon,  4 Apr 2022 20:09:48 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 4 Apr 2022 22:12:08 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 5ad3082fed22fc5a145f5c7f37ed9b109d29ff83
X-Git-Newrev: f54b5a64f2f51c7e30b291dfa177f855bd88d6f2
X-Patchwork-Hint: ignore
Message-Id: <20220404200948.5BECE82DF6@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pipewire: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=f54b5a64f2f51c7e30b291dfa177f855bd88d6f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since bump to version 0.3.26 in
commit a6d88d3ba5e30e11f4d726f341bc56c1be7c71c9 and
https://gitlab.freedesktop.org/pipewire/pipewire/-/commit/b029000610d122ac12939d02ade2264605ff43de

thread-loop.c:(.text+0x81c): undefined reference to `pthread_setname_np'

Fixes:
 - http://autobuild.buildroot.org/results/6019f4e9676743685e8af81d60ef198c1eba1fde

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/pipewire/Config.in | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/package/pipewire/Config.in b/package/pipewire/Config.in
index dd13f31a73..3bfcf42a81 100644
--- a/package/pipewire/Config.in
+++ b/package/pipewire/Config.in
@@ -1,7 +1,7 @@
 config BR2_PACKAGE_PIPEWIRE
 	bool "pipewire"
 	depends on !BR2_STATIC_LIBS
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL # pthread_setname_np()
 	depends on BR2_USE_MMU # fork()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5
 	select BR2_PACKAGE_BLUEZ5_UTILS_PLUGINS_AUDIO if BR2_PACKAGE_BLUEZ5_UTILS # runtime
@@ -46,7 +46,8 @@ comment "pipewire v4l2 support needs udev and a toolchain w/ headers >= 3.18"
 
 endif
 
-comment "pipewire needs a toolchain w/ dynamic library, threads, gcc >= 5"
+comment "pipewire needs a toolchain w/ dynamic library, NTPL, gcc >= 5"
 	depends on BR2_USE_MMU
-	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS || \
+	depends on BR2_STATIC_LIBS || \
+		!BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
