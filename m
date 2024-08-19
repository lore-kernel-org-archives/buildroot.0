Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60624C5320E
	for <buildroot@archiver.kernel.org>; Mon, 19 Aug 2024 10:49:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 29D6280A08;
	Mon, 19 Aug 2024 10:49:59 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 5GE8mefDdy9V; Mon, 19 Aug 2024 10:49:58 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 2335880A47
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 2335880A47;
	Mon, 19 Aug 2024 10:49:58 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 7980C1BF39D
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:49:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 6895B403EF
 for <buildroot@lists.busybox.net>; Mon, 19 Aug 2024 10:49:57 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id nBZL-2AF-o4e for <buildroot@lists.busybox.net>;
 Mon, 19 Aug 2024 10:49:56 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4EE25403EE
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 4EE25403EE
 for <buildroot@buildroot.org>; Mon, 19 Aug 2024 10:49:56 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 466D28600F; Mon, 19 Aug 2024 10:49:56 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 19 Aug 2024 12:48:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: a7fe8c88d1d01ed59cdd477b87e26213d1ed9c21
X-Git-Newrev: ad6e6f5d598a9311fc9141e4b9b08820562d1792
X-Patchwork-Hint: ignore
Message-Id: <20240819104956.466D28600F@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: needs thread support
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

commit: https://git.buildroot.net/buildroot/commit/?id=ad6e6f5d598a9311fc9141e4b9b08820562d1792
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Botan commit 313e439c786d68bcf374b2cb0edfe3ffd891db94 added a
dependency to pthread.h. Add a dependency to thread support.

Fixes:
 - http://autobuild.buildroot.org/results/205/205d7505803990508bbd545393902789063ababd

Signed-off-by: Waldemar Brodkorb <wbx@openadk.org>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/botan/Config.in | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index c74128bb9d..c61b368801 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -16,6 +16,7 @@ config BR2_PACKAGE_BOTAN
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
@@ -23,7 +24,8 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, gcc >= 10"
+comment "botan needs a toolchain w/ threads, C++, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10 \
+		|| !BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
