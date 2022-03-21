Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C137EC433EF
	for <buildroot@archiver.kernel.org>; Mon, 21 Mar 2022 07:47:04 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 6CBF4410A6;
	Mon, 21 Mar 2022 07:47:04 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id LciUjtrXVvYB; Mon, 21 Mar 2022 07:47:03 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 9656C410AF;
	Mon, 21 Mar 2022 07:47:02 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id F38431BF316
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:47:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E27178174D
 for <buildroot@lists.busybox.net>; Mon, 21 Mar 2022 07:47:00 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 0RULs2Cbdc7u for <buildroot@lists.busybox.net>;
 Mon, 21 Mar 2022 07:47:00 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3C0628144F
 for <buildroot@buildroot.org>; Mon, 21 Mar 2022 07:47:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 2106A8475F; Mon, 21 Mar 2022 07:38:05 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 21 Mar 2022 08:46:32 +0100
X-Git-Refname: refs/heads/2021.02.x
X-Git-Oldrev: 6eca04a4ecbfe2e545853b17b37b57efb4933f14
X-Git-Newrev: ff5471d6983158cb5ad51e4eab577b72b601e461
X-Patchwork-Hint: ignore
Message-Id: <20220321073806.2106A8475F@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2021.02.x] Revert "package/gcr:
 depends on !gnupg"
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

commit: https://git.buildroot.net/buildroot/commit/?id=ff5471d6983158cb5ad51e4eab577b72b601e461
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2021.02.x

This reverts commit 816861524a079658040d6e059743697affdeafce.

This doesn't work with the gnupg v1/v2 handling here:

package/gcr/Config.in:1:error: recursive dependency detected!
package/gcr/Config.in:1:        symbol BR2_PACKAGE_GCR depends on BR2_PACKAGE_GNUPG
package/gnupg/Config.in:1:      symbol BR2_PACKAGE_GNUPG is selected by BR2_PACKAGE_GNUPG2
package/gnupg2/Config.in:5:     symbol BR2_PACKAGE_GNUPG2 is selected by BR2_PACKAGE_GCR
For a resolution refer to Documentation/kbuild/kconfig-language.txt
subsection "Kconfig recursive dependency limitations"

Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/gcr/Config.in | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/package/gcr/Config.in b/package/gcr/Config.in
index afbec1a317..e233fffed0 100644
--- a/package/gcr/Config.in
+++ b/package/gcr/Config.in
@@ -5,7 +5,6 @@ config BR2_PACKAGE_GCR
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libglib2
 	depends on BR2_USE_MMU # libglib2
 	depends on !BR2_STATIC_LIBS # p11-kit
-	depends on !BR2_PACKAGE_GNUPG # gnupg2
 	select BR2_PACKAGE_GNUPG2 # runtime
 	select BR2_PACKAGE_LIBGCRYPT
 	select BR2_PACKAGE_LIBGLIB2
@@ -16,15 +15,6 @@ config BR2_PACKAGE_GCR
 	  https://developer.gnome.org/gcr/
 
 comment "gcr needs a toolchain w/ wchar, threads, dynamic library"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
 	depends on BR2_USE_MMU
 	depends on !BR2_USE_WCHAR || !BR2_TOOLCHAIN_HAS_THREADS || \
 		BR2_STATIC_LIBS
-
-comment "gcr is incompatible with gnupg, gnupg2 only"
-	depends on BR2_PACKAGE_LIBGPG_ERROR_ARCH_SUPPORTS
-	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on BR2_USE_MMU
-	depends on !BR2_STATIC_LIBS
-	depends on BR2_PACKAGE_GNUPG # gnupg2
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
