Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5E1AC54E58
	for <buildroot@archiver.kernel.org>; Thu, 21 Mar 2024 21:05:28 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 979168282C;
	Thu, 21 Mar 2024 21:05:28 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ybDqQooA8rLe; Thu, 21 Mar 2024 21:05:27 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org AF7C282A83
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id AF7C282A83;
	Thu, 21 Mar 2024 21:05:26 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id E40611BF2BD
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:29 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7944F60712
 for <buildroot@lists.busybox.net>; Thu, 21 Mar 2024 21:03:27 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id CpfjWTyymndx for <buildroot@lists.busybox.net>;
 Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 9B0606084E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 9B0606084E
 for <buildroot@buildroot.org>; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 4AE9C837A8; Thu, 21 Mar 2024 21:03:26 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Thu, 21 Mar 2024 21:11:13 +0100
X-Git-Refname: refs/heads/2023.02.x
X-Git-Oldrev: d8a0e663145e15dcd47eccf816cbf03158d404cd
X-Git-Newrev: 299412bed4c34bd576a0cf65b70fa45379c9ec21
X-Patchwork-Hint: ignore
Message-Id: <20240321210326.4AE9C837A8@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2023.02.x] package/squid: needs gcc
 and host gcc >= 8
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

commit: https://git.buildroot.net/buildroot/commit/?id=299412bed4c34bd576a0cf65b70fa45379c9ec21
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2023.02.x

cf_gen.cc is compiled by host compiler and unconditionally uses auto
since bump to version 6.6 in commit
c13199c9326fa2daa574f08ec8fc063a48d0eb06 and
https://github.com/squid-cache/squid/commit/09835feb258c3058d028918e36d959dccb3f7496
resulting in the following build failure with host gcc < 8:

/usr/bin/g++ -O2 -I/home/buildroot/autobuild/run/instance-1/output-1/host/include -o cf_gen ./cf_gen.cc -I. -I../include/ -I../src
./cf_gen.cc: In function 'int main(int, char**)':
./cf_gen.cc:268:63: error: forming reference to void
                     auto &newEntry = entries.emplace_back(name);
                                                               ^

So add a dependency on host gcc >= 8 and gcc >= 8 as advocated by
upstream in
https://github.com/squid-cache/squid/blob/9d3433c4ac6cd547c10cf298b8a5e61a463fb753/doc/release-notes/release-6.sgml.in:

  This release adds a dependency on C++17 support in any compiler used to build Squid.
  GCC 8+ and Clang 8+ support C++17.

While at it, drop BR2_TOOLCHAIN_HAS_GCC_BUG_64735 which is always false
with gcc >= 7

Fixes: c13199c9326fa2daa574f08ec8fc063a48d0eb06
 - http://autobuild.buildroot.org/results/f1766d1a3b2ce7745fa23cdeae1101806cd97aea

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit b8db5c466046dc2f3d9c411e6c9924667dd1a40c)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/squid/Config.in | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 89b5a377c7..149884d815 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,18 +1,18 @@
-comment "squid needs a toolchain w/ C++, threads, gcc >= 7 not affected by bug 64735"
+comment "squid needs a toolchain w/ C++, threads, gcc >= 8, host gcc >= 8"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
-	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_INSTALL_LIBSTDCPP || \
+	depends on !BR2_INSTALL_LIBSTDCPP || \
 		!BR2_TOOLCHAIN_HAS_THREADS || \
-		!BR2_TOOLCHAIN_GCC_AT_LEAST_7
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_8 || \
+		!BR2_HOST_GCC_AT_LEAST_8
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_INSTALL_LIBSTDCPP
 	depends on BR2_TOOLCHAIN_HAS_THREADS
-	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
-	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_8 # C++17
+	depends on BR2_HOST_GCC_AT_LEAST_8 # C++17
 	# needs fork()
 	depends on BR2_USE_MMU
 	select BR2_PACKAGE_LIBCAP
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
