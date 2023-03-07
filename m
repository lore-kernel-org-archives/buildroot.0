Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF267C6FA99
	for <buildroot@archiver.kernel.org>; Tue,  7 Mar 2023 21:33:50 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 9B5E661145;
	Tue,  7 Mar 2023 21:33:50 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B5E661145
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id NP3YdfQahVTN; Tue,  7 Mar 2023 21:33:49 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id AE9386113F;
	Tue,  7 Mar 2023 21:33:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org AE9386113F
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 03CC31BF3B0
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:33:23 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id DFF4340277
 for <buildroot@lists.busybox.net>; Tue,  7 Mar 2023 21:33:22 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org DFF4340277
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Yp_TXNCrs0ZW for <buildroot@lists.busybox.net>;
 Tue,  7 Mar 2023 21:33:18 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2C0D440258
 for <buildroot@buildroot.org>; Tue,  7 Mar 2023 21:33:18 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 2C0D440258
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1352486A3B; Tue,  7 Mar 2023 21:33:18 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 7 Mar 2023 22:22:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 83e06196ab2193b73b4d7c1decc12bdd654a91e1
X-Git-Newrev: 08a52da2058829216400822e2cd7a1c1c2600eeb
X-Patchwork-Hint: ignore
Message-Id: <20230307213318.1352486A3B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] linux: fix CIP RT kernel on microblaze
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

commit: https://git.buildroot.net/buildroot/commit/?id=08a52da2058829216400822e2cd7a1c1c2600eeb
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure with CIP RT kernel on microblaze raised
since bump to version 5.10.83-cip1-rt1 in commit
b5778d7b76c098010a4abc339938f2694e8cf57f and
https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/?id=32ac92b5a39e2ef91308929bf5ed0804094b4183:

arch/microblaze/mm/init.c:71:2: error: #endif without #if
   71 | #endif /* CONFIG_HIGHMEM */
      |  ^~~~~

Fixes:
 - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 .../0001-arch-microblaze-mm-init.c-fix-build.patch | 37 ++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch b/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
new file mode 100644
index 0000000000..4760d9e4fb
--- /dev/null
+++ b/linux/5.10.162-cip24-rt10/0001-arch-microblaze-mm-init.c-fix-build.patch
@@ -0,0 +1,37 @@
+From 1fc03e1fdc8bb606d1c95e9fa557a9e5f6df17ec Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 25 Feb 2023 17:26:56 +0100
+Subject: [PATCH] arch/microblaze/mm/init.c: fix build
+
+Fix the following build failure on microblaze raised since
+https://git.kernel.org/pub/scm/linux/kernel/git/cip/linux-cip.git/commit/arch/microblaze/mm/init.c?h=v5.10.168-cip27-rt11&id=32ac92b5a39e2ef91308929bf5ed0804094b4183:
+
+arch/microblaze/mm/init.c:71:2: error: #endif without #if
+   71 | #endif /* CONFIG_HIGHMEM */
+      |  ^~~~~
+
+Fixes:
+ - http://autobuild.buildroot.org/results/27291870cf7539d26e45c45f34322d24a6dbca33
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+[Upstream status: sent to
+Sebastian Andrzej Siewior <bigeasy@linutronix.de>]
+---
+ arch/microblaze/mm/init.c | 1 +
+ 1 file changed, 1 insertion(+)
+
+diff --git a/arch/microblaze/mm/init.c b/arch/microblaze/mm/init.c
+index 1f4b5b34e600..a444778e59de 100644
+--- a/arch/microblaze/mm/init.c
++++ b/arch/microblaze/mm/init.c
+@@ -49,6 +49,7 @@ unsigned long lowmem_size;
+ EXPORT_SYMBOL(min_low_pfn);
+ EXPORT_SYMBOL(max_low_pfn);
+ 
++#ifdef CONFIG_HIGHMEM
+ static void __init highmem_init(void)
+ {
+ 	pr_debug("%x\n", (u32)PKMAP_BASE);
+-- 
+2.39.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
