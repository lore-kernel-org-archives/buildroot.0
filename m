Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9BEB9C433F5
	for <buildroot@archiver.kernel.org>; Mon, 10 Jan 2022 07:20:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 49A16827FB;
	Mon, 10 Jan 2022 07:20:48 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id Tkcr0iXM0ib4; Mon, 10 Jan 2022 07:20:47 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 9468482771;
	Mon, 10 Jan 2022 07:20:46 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 0102F1BF334
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id F014481465
 for <buildroot@lists.busybox.net>; Mon, 10 Jan 2022 07:19:36 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id 218POUZwYsNC for <buildroot@lists.busybox.net>;
 Mon, 10 Jan 2022 07:19:33 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 109BA8270B
 for <buildroot@buildroot.org>; Mon, 10 Jan 2022 07:19:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id CAF4A82DFB; Mon, 10 Jan 2022 07:13:16 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 10 Jan 2022 08:17:15 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 89ecfb3c789b57552373eb323e6b2ac9001295a3
X-Git-Newrev: 90be89396bcbdd529f4cff64e44aa9fa3b0983e7
X-Patchwork-Hint: ignore
Message-Id: <20220110071316.CAF4A82DFB@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/squid: needs threads
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

commit: https://git.buildroot.net/buildroot/commit/?id=90be89396bcbdd529f4cff64e44aa9fa3b0983e7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

squid needs threads and
https://github.com/squid-cache/squid/commit/7dba4ac446341548a0b101489785f2cef9a33caa
to avoid the following build failure raised since
bump to version 5.3 in commit efc07b7a1818787229ddb335ca26ff2cf03820ae:

ntlm_fake_auth.cc: In function 'int main(int, char**)':
ntlm_fake_auth.cc:187:18: error: 'std::this_thread' has not been declared
  187 |             std::this_thread::sleep_for(std::chrono::milliseconds(response_delay));
      |                  ^~~~~~~~~~~

Fixes:
 - http://autobuild.buildroot.org/results/2aabc8375d41ad4d047d20ff8ee4fe1c978e7ee1

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/squid/Config.in | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/package/squid/Config.in b/package/squid/Config.in
index 0df2aedef6..6272140768 100644
--- a/package/squid/Config.in
+++ b/package/squid/Config.in
@@ -1,13 +1,16 @@
-comment "squid needs a toolchain w/ C++, gcc >= 4.8 not affected by bug 64735"
+comment "squid needs a toolchain w/ C++, threads, gcc >= 4.8 not affected by bug 64735"
 	depends on BR2_USE_MMU
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_TOOLCHAIN_HAS_GCC_BUG_64735 || \
-		!BR2_INSTALL_LIBSTDCPP || !BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
+		!BR2_INSTALL_LIBSTDCPP || \
+		!BR2_TOOLCHAIN_HAS_THREADS || \
+		!BR2_TOOLCHAIN_GCC_AT_LEAST_4_8
 
 config BR2_PACKAGE_SQUID
 	bool "squid"
 	depends on BR2_TOOLCHAIN_HAS_ATOMIC
 	depends on BR2_INSTALL_LIBSTDCPP
+	depends on BR2_TOOLCHAIN_HAS_THREADS
 	depends on !BR2_TOOLCHAIN_HAS_GCC_BUG_64735 # std::current_exception
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_8 # C++11
 	# needs fork()
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
