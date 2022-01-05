Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8643AC433F5
	for <buildroot@archiver.kernel.org>; Wed,  5 Jan 2022 21:00:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id 3A0B7409ED;
	Wed,  5 Jan 2022 21:00:38 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
	by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id rRxH7ttPp_9J; Wed,  5 Jan 2022 21:00:37 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 4A571409D2;
	Wed,  5 Jan 2022 21:00:36 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id DDA191BF955
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id D710282D75
 for <buildroot@lists.busybox.net>; Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id khbdIKYhdkCM for <buildroot@lists.busybox.net>;
 Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4090E82BE5
 for <buildroot@buildroot.org>; Wed,  5 Jan 2022 21:00:34 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4049)
 id 160CA832CE; Wed,  5 Jan 2022 20:54:28 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Wed, 5 Jan 2022 21:59:00 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 2fb55340ef0781243b18a6f2519c02b5c1d7bf28
X-Git-Newrev: 1a087dd17fcfb7df2053cde6286803d6ae326c14
X-Patchwork-Hint: ignore
Message-Id: <20220105205428.160CA832CE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/refpolicy: add host gcc >= 5
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=1a087dd17fcfb7df2053cde6286803d6ae326c14
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 56d9b887685c86fd4fbadda247cdbe733d499e81 forgot to add host
gcc >= 5 dependency

Fixes:
 - No autobuilder failures (yet)

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/refpolicy/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/refpolicy/Config.in b/package/refpolicy/Config.in
index 043cc40a72..0e72b895df 100644
--- a/package/refpolicy/Config.in
+++ b/package/refpolicy/Config.in
@@ -2,6 +2,7 @@ config BR2_PACKAGE_REFPOLICY
 	bool "refpolicy"
 	depends on BR2_TOOLCHAIN_HAS_THREADS # libsepol
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_5 # libsepol
+	depends on BR2_HOST_GCC_AT_LEAST_5 # host-setools -> host-libsepol
 	# Even though libsepol is not necessary for building, we get
 	# the policy version from libsepol, so we select it, and treat
 	# it like a runtime dependency.
@@ -114,6 +115,7 @@ endif
 
 endif
 
-comment "refpolicy needs a toolchain w/ threads, gcc >= 5"
+comment "refpolicy needs a toolchain w/ threads, gcc >= 5, host gcc >= 5"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_5
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_5 || \
+		!BR2_HOST_GCC_AT_LEAST_5
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
