Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22645C61DA3
	for <buildroot@archiver.kernel.org>; Mon, 20 Feb 2023 21:11:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id BAA3842AF0;
	Mon, 20 Feb 2023 21:11:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org BAA3842AF0
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id jBTIHVJ8fNQl; Mon, 20 Feb 2023 21:11:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 68A1D42AF4;
	Mon, 20 Feb 2023 21:11:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 68A1D42AF4
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 135171BF8C7
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:52:05 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9D56861086
 for <buildroot@lists.busybox.net>; Mon, 20 Feb 2023 20:51:48 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9D56861086
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id dx42XUVY7nBd for <buildroot@lists.busybox.net>;
 Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 2BDED61033
 for <buildroot@buildroot.org>; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2BDED61033
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1BAC08648F; Mon, 20 Feb 2023 20:51:47 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 5 Nov 2022 22:47:12 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 94e47000c27c447de45e7190fbe8d3ef24d7df04
X-Git-Newrev: ceb51d1463acb6918fbb825dc56b2a2b48ab8674
X-Patchwork-Hint: ignore
Message-Id: <20230220205147.1BAC08648F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/bdwgc: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=ceb51d1463acb6918fbb825dc56b2a2b48ab8674
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Fix the following build failure raise since bump to version 8.2.2 in
commit d7619682552dd34f499e9f17b0234af53da743ec and
https://github.com/ivmai/bdwgc/commit/9d8c196268068bb75f86dee0ba75ccd024531e72:

os_dep.c: In function 'block_unmap_inner':
os_dep.c:2668:17: warning: implicit declaration of function 'madvise'; did you mean 'raise'? [-Wimplicit-function-declaration]
 2668 |             if (madvise(start_addr, len, MADV_DONTNEED) == -1)
      |                 ^~~~~~~
      |                 raise

Fixes:
 - http://autobuild.buildroot.org/results/2b9924cb8c36a75e1ca7aefe83e95dc11c10ded6

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/bdwgc/Config.in | 1 +
 package/guile/Config.in | 2 ++
 package/poke/Config.in  | 2 ++
 3 files changed, 5 insertions(+)

diff --git a/package/bdwgc/Config.in b/package/bdwgc/Config.in
index aad2bc9ef2..1124ab0f60 100644
--- a/package/bdwgc/Config.in
+++ b/package/bdwgc/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_BDWGC
 	bool "bdwgc"
+	depends on BR2_USE_MMU # madvise()
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
 	select BR2_PACKAGE_LIBATOMIC_OPS
 	help
diff --git a/package/guile/Config.in b/package/guile/Config.in
index f70e674018..3cf0ec863b 100644
--- a/package/guile/Config.in
+++ b/package/guile/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_GUILE
 	bool "guile"
+	depends on BR2_USE_MMU # bdwgc
 	depends on !BR2_TOOLCHAIN_USES_MUSL # no strtol_l
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
@@ -17,5 +18,6 @@ config BR2_PACKAGE_GUILE
 	  http://www.gnu.org/software/guile
 
 comment "guile needs a uClibc or glibc toolchain w/ threads, wchar, dynamic library"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_USE_WCHAR || \
 		BR2_STATIC_LIBS || BR2_TOOLCHAIN_USES_MUSL
diff --git a/package/poke/Config.in b/package/poke/Config.in
index 40e7a31bab..8bedb12bf8 100644
--- a/package/poke/Config.in
+++ b/package/poke/Config.in
@@ -3,6 +3,7 @@ config BR2_PACKAGE_POKE
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS # bdwgc
 	depends on BR2_USE_WCHAR # needs wctomb
 	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
+	depends on BR2_USE_MMU # bdwgc
 	select BR2_PACKAGE_BUSYBOX_SHOW_OTHERS # less
 	select BR2_PACKAGE_BDWGC
 	select BR2_PACKAGE_LESS # runtime
@@ -25,4 +26,5 @@ config BR2_PACKAGE_POKE
 
 comment "poke needs a toolchain w/ NPTL, wchar"
 	depends on BR2_PACKAGE_LIBATOMIC_OPS_ARCH_SUPPORTS
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL || !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
