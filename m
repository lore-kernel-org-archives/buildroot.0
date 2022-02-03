Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F957C433F5
	for <buildroot@archiver.kernel.org>; Thu,  3 Feb 2022 20:46:32 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E05E460AFD;
	Thu,  3 Feb 2022 20:46:31 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id whpdPjYR0Wm2; Thu,  3 Feb 2022 20:46:31 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 355006101F;
	Thu,  3 Feb 2022 20:46:30 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 8A1361BF9C6
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 8499640865
 for <buildroot@lists.busybox.net>; Thu,  3 Feb 2022 20:45:12 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id hDCUdiqGdfHB for <buildroot@lists.busybox.net>;
 Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D1BAA4088C
 for <buildroot@buildroot.org>; Thu,  3 Feb 2022 20:45:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 83DBE7FFA5; Thu,  3 Feb 2022 20:38:00 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Thu, 3 Feb 2022 21:44:43 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 657d9731cf52dd7e9a2564ba68ce19e675c1eaee
X-Git-Newrev: 2a7b360b5f8ed86001bb349d937100e9e46584b0
X-Patchwork-Hint: ignore
Message-Id: <20220203203800.83DBE7FFA5@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libglvnd: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=2a7b360b5f8ed86001bb349d937100e9e46584b0
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following build failure raised since the addition of the package
in commit 0378e2e5d9ce9d5676975dfbff501360094fdc1a:

In file included from ../src/util/glvnd_pthread.c:39:
../src/util/glvnd_pthread.h:33:10: fatal error: pthread.h: No such file or directory
   33 | #include <pthread.h>
      |          ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/63624bafc6f7a225d4db0667df977fd6141561aa

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libglvnd/Config.in | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/package/libglvnd/Config.in b/package/libglvnd/Config.in
index cd19fde582..d020c21465 100644
--- a/package/libglvnd/Config.in
+++ b/package/libglvnd/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_LIBGLVND
 	bool "libglvnd"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4 # __sync_*_4 intrisics
 	depends on !BR2_STATIC_LIBS # dlfcn.h
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	help
 	  The GL Vendor-Neutral Dispatch library
 
@@ -45,6 +46,6 @@ config BR2_PACKAGE_PROVIDES_LIBGLES
 
 endif
 
-comment "libglvnd needs a toolchain w/ dynamic library"
+comment "libglvnd needs a toolchain w/ dynamic library, threads"
 	depends on BR2_TOOLCHAIN_HAS_SYNC_4
-	depends on BR2_STATIC_LIBS
+	depends on BR2_STATIC_LIBS || !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
