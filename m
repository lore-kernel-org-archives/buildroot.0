Return-Path: <SRS0=HL2s=OB=lists.buildroot.org=buildroot-bounces@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 715F5C433F5
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:59:22 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 3995461050
	for <buildroot@archiver.kernel.org>; Sat, 11 Sep 2021 20:59:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.1 mail.kernel.org 3995461050
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=mind.be
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=lists.buildroot.org
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 134AE80D0B;
	Sat, 11 Sep 2021 20:59:22 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Ygg5kTu603Rt; Sat, 11 Sep 2021 20:59:21 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 42A1680C28;
	Sat, 11 Sep 2021 20:59:20 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id CC5AE1BF957
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id C957683005
 for <buildroot@lists.busybox.net>; Sat, 11 Sep 2021 20:58:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 1UDw1pE3zjD0 for <buildroot@lists.busybox.net>;
 Sat, 11 Sep 2021 20:58:47 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B959882C7D
 for <buildroot@buildroot.org>; Sat, 11 Sep 2021 20:58:47 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id EF87F8A257; Sat, 11 Sep 2021 20:57:08 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Sat, 11 Sep 2021 22:46:46 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 30a22bfe11dc71565a0c8afbf075ce65af7f7bfb
X-Git-Newrev: fb6a9acfe19b35a53c666c4ae9eac6a71049b735
X-Patchwork-Hint: ignore
Message-Id: <20210911205708.EF87F8A257@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/boost: fix fiber dependencies
X-BeenThere: buildroot@lists.buildroot.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Discussion and development of buildroot
 <buildroot.lists.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@lists.buildroot.org>
List-Help: <mailto:buildroot-request@lists.buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@lists.buildroot.org?subject=subscribe>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@lists.buildroot.org
Sender: "buildroot" <buildroot-bounces@lists.buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=fb6a9acfe19b35a53c666c4ae9eac6a71049b735
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit d39d8f7cee9b4634e6f490020204f63fae419e8e forgot to update fiber
dependencies resulting in the following build failure:

WARNING: unmet direct dependencies detected for BR2_PACKAGE_BOOST_FILESYSTEM
  Depends on [n]: BR2_PACKAGE_BOOST [=y] && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n]
  Selected by [y]:
  - BR2_PACKAGE_BOOST_FIBER [=y] && BR2_PACKAGE_BOOST [=y] && BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS [=y] && BR2_TOOLCHAIN_HAS_THREADS_NPTL [=y] && !BR2_MIPS_CPU_MIPS32 [=n] && !BR2_MIPS_CPU_MIPS64 [=n] && (BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS [=n] || BR2_TOOLCHAIN_GCC_AT_LEAST_6 [=y]) && !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 [=n]

Fixes:
 - http://autobuild.buildroot.org/results/40b8af6ce273ebd5fca56d6734f64dacd562efb1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Reviewed-by: Michael Nosthoff <buildroot@heine.tech>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/boost/Config.in | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/package/boost/Config.in b/package/boost/Config.in
index d9ce841a92..6813ad80ae 100644
--- a/package/boost/Config.in
+++ b/package/boost/Config.in
@@ -140,8 +140,7 @@ config BR2_PACKAGE_BOOST_FIBER
 	# mips support uses the "pause" instruction, only available
 	# since mips32r2/mips64r2.
 	depends on !BR2_MIPS_CPU_MIPS32 && !BR2_MIPS_CPU_MIPS64
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6 # boost-context -> boost-thread
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS # boost-filesystem
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # boost-context
 	select BR2_PACKAGE_BOOST_CONTEXT
 	select BR2_PACKAGE_BOOST_FILESYSTEM
@@ -151,8 +150,7 @@ config BR2_PACKAGE_BOOST_FIBER
 
 comment "boost-fiber needs a toolchain w/ NPTL"
 	depends on BR2_PACKAGE_BOOST_CONTEXT_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS \
-		|| BR2_TOOLCHAIN_GCC_AT_LEAST_6
+	depends on BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	depends on !BR2_TOOLCHAIN_HAS_THREADS_NPTL
 
 comment "boost-fiber needs a toolchain not affected by GCC bug 64735"
_______________________________________________
buildroot mailing list
buildroot@lists.buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
