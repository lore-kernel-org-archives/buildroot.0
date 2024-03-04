Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DECC9C54E41
	for <buildroot@archiver.kernel.org>; Mon,  4 Mar 2024 21:52:49 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B0E6860DFE;
	Mon,  4 Mar 2024 21:52:49 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
	by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id nj0E-q3XvBze; Mon,  4 Mar 2024 21:52:48 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3C52860E09
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 3C52860E09;
	Mon,  4 Mar 2024 21:52:48 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 878FB1BF280
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id E0C188214C
 for <buildroot@lists.busybox.net>; Mon,  4 Mar 2024 21:52:32 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id ste0qxpFdDpb for <buildroot@lists.busybox.net>;
 Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 9EED8821CD
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 9EED8821CD
 for <buildroot@buildroot.org>; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97F51880AE; Mon,  4 Mar 2024 21:52:31 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 4 Mar 2024 22:49:49 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d4fdd78a7207935c24427bbe736c443f0ad2a745
X-Git-Newrev: 11a577c19e23d0b774f357b2d62ac3c41b7f201f
X-Patchwork-Hint: ignore
Message-Id: <20240304215231.97F51880AE@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/botan: needs C++20
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

commit: https://git.buildroot.net/buildroot/commit/?id=11a577c19e23d0b774f357b2d62ac3c41b7f201f
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

C++20 is mandatory since bump to version 3.2.0 in commit
2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813 and
https://github.com/randombit/botan/commit/e2efb744ceda875b193bc5ce589f2c45ceaa3a82
resulting in the following build failure:

powerpc-linux-g++.br_real: error: unrecognized command line option '-std=c++20'; did you mean '-std=c++2a'?

BR2_TOOLCHAIN_HAS_GCC_BUG_64735 dependency can be dropped as gcc > 7 is
not affected by this bug

Fixes: 2f8feb66204ff661e9fd5f508e2dfd1ebc0f2813
 - http://autobuild.buildroot.org/results/4171515ce33832fb07c8b42cda2575067f9e9859

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/botan/Config.in      | 11 +++--------
 package/strongswan/Config.in | 11 +++--------
 2 files changed, 6 insertions(+), 16 deletions(-)

diff --git a/package/botan/Config.in b/package/botan/Config.in
index 8f7f3f5c7a..5c3f31726e 100644
--- a/package/botan/Config.in
+++ b/package/botan/Config.in
@@ -14,10 +14,9 @@ config BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 config BR2_PACKAGE_BOTAN
 	bool "botan"
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # C++20
 	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::future
 	select BR2_PACKAGE_BOOST_FILESYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	select BR2_PACKAGE_BOOST_SYSTEM if BR2_PACKAGE_BOOST && BR2_TOOLCHAIN_SUPPORTS_ALWAYS_LOCKFREE_ATOMIC_INTS
 	help
@@ -25,11 +24,7 @@ config BR2_PACKAGE_BOTAN
 
 	  http://botan.randombit.net
 
-comment "botan needs a toolchain w/ C++, threads, gcc >= 4.8"
+comment "botan needs a toolchain w/ C++, threads, gcc >= 10"
 	depends on !BR2_TOOLCHAIN_HAS_THREADS || !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-
-comment "botan needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
diff --git a/package/strongswan/Config.in b/package/strongswan/Config.in
index 9be5fe177d..a62688f9c3 100644
--- a/package/strongswan/Config.in
+++ b/package/strongswan/Config.in
@@ -35,19 +35,14 @@ config BR2_PACKAGE_STRONGSWAN_BOTAN
 	bool "botan"
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 	depends on BR2_INSTALL_LIBSTDCPP
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_10 # botan
 	select BR2_PACKAGE_BOTAN
 
-comment "botan backend needs a toolchain w/ C++, gcc >= 4.8"
+comment "botan backend needs a toolchain w/ C++, gcc >= 10"
 	depends on !BR2_INSTALL_LIBSTDCPP \
-		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		|| !BR2_TOOLCHAIN_GCC_AT_LEAST_10
 	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
 
-comment "botan backend needs a toolchain not affected by GCC bug 64735"
-	depends on BR2_PACKAGE_BOTAN_ARCH_SUPPORTS
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735
-
 config BR2_PACKAGE_STRONGSWAN_OPENSSL
 	bool "OpenSSL"
 	select BR2_PACKAGE_OPENSSL
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
