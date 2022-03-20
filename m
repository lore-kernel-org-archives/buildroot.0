Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF8F4C433F5
	for <buildroot@archiver.kernel.org>; Sun, 20 Mar 2022 18:47:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7B24B408F6;
	Sun, 20 Mar 2022 18:47:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 4mrSiHO2yRCy; Sun, 20 Mar 2022 18:47:48 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7860840896;
	Sun, 20 Mar 2022 18:47:47 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 6BF131BF4D8
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 577FD404A3
 for <buildroot@lists.busybox.net>; Sun, 20 Mar 2022 18:46:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id Dv_DfLklRoax for <buildroot@lists.busybox.net>;
 Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 99DFD40894
 for <buildroot@buildroot.org>; Sun, 20 Mar 2022 18:46:27 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id B36CB8461F; Sun, 20 Mar 2022 18:37:34 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 20 Mar 2022 19:38:26 +0100
X-Git-Refname: refs/heads/2022.02.x
X-Git-Oldrev: fcbce93cfce0a84d32de323b6962c9846b58c887
X-Git-Newrev: cf0c9830c0eef17116081d04ccc10a1aa0850553
X-Patchwork-Hint: ignore
Message-Id: <20220320183734.B36CB8461F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2022.02.x] package/gcr: depends on
 !gnupg
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

commit: https://git.buildroot.net/buildroot/commit/?id=cf0c9830c0eef17116081d04ccc10a1aa0850553
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2022.02.x

Since gcr selects gnupg2, it's incompatible with gnupg. Add this
dependency and corresponding comment.

While we're at it, also hide the existing comment when
!BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
(cherry picked from commit 5783a418f4b30931068b81f850fc06cd8d3d9732)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcr/Config.in | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index e233fffed0..afbec1a317 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -5,6 +5,7 @@ config BR2_PACKAGE_GCR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # p11-kit
+	depends on !BR2_PACKAGE_GNUPG # gnupg2
 	select BR2_PACKAGE_GNUPG2 # runtime
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
@@ -15,6 +16,15 @@ config BR2_PACKAGE_GCR
 	  https://developer.gnome.org/gcr/
 
 comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
+
+comment "gcr is incompatible with gnupg, gnupg2 only"
+	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
+	depends on BR2_USE_WCHAR
+	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU
+	depends on !BR2_STATIC_LIBS
+	depends on BR2_PACKAGE_GNUPG # gnupg2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
