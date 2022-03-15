Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5F8AC433EF
	for <buildroot@archiver.kernel.org>; Tue, 15 Mar 2022 21:22:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6DD3B404EB;
	Tue, 15 Mar 2022 21:22:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id lSkWPw9oeJs6; Tue, 15 Mar 2022 21:22:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 6A8A540154;
	Tue, 15 Mar 2022 21:22:36 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id CF1F21BF284
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:07 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B94960AAD
 for <buildroot@lists.busybox.net>; Tue, 15 Mar 2022 21:21:05 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id PCsZQQQ2QI-F for <buildroot@lists.busybox.net>;
 Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id D62DA60B83
 for <buildroot@buildroot.org>; Tue, 15 Mar 2022 21:21:04 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id E6D258408A; Tue, 15 Mar 2022 21:12:22 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Tue, 15 Mar 2022 22:10:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 56b49691abf4625d3d5915f3956b02f0fbd2ed4b
X-Git-Newrev: 5783a418f4b30931068b81f850fc06cd8d3d9732
X-Patchwork-Hint: ignore
Message-Id: <20220315211222.E6D258408A@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/gcr: depends on !gnupg
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

commit: https://git.buildroot.net/buildroot/commit/?id=5783a418f4b30931068b81f850fc06cd8d3d9732
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Since gcr selects gnupg2, it's incompatible with gnupg. Add this
dependency and corresponding comment.

While we're at it, also hide the existing comment when
!BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS.

Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
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
