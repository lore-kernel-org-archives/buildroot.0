Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EBA5EC3DA7F
	for <buildroot@archiver.kernel.org>; Fri,  2 Aug 2024 17:52:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id AFAC7844F0;
	Fri,  2 Aug 2024 17:52:19 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EOk5X-MvFFvz; Fri,  2 Aug 2024 17:52:19 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org C34CD84533
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id C34CD84533;
	Fri,  2 Aug 2024 17:52:18 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id B94581BF41C
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:52:16 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id A613F401B7
 for <buildroot@lists.busybox.net>; Fri,  2 Aug 2024 17:52:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id ZeqUYv1wkTz7 for <buildroot@lists.busybox.net>;
 Fri,  2 Aug 2024 17:52:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 9AFE3400FB
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 9AFE3400FB
 for <buildroot@buildroot.org>; Fri,  2 Aug 2024 17:52:15 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 85D1183B7B; Fri,  2 Aug 2024 17:52:15 +0000 (UTC)
To: buildroot@buildroot.org
Date: Fri, 2 Aug 2024 19:50:55 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e4109c1d2d28f737409dce2e346661cbf20084c6
X-Git-Newrev: b6db4e2a79da7aadcbe2beda3e00381afb9e3f28
X-Patchwork-Hint: ignore
Message-Id: <20240802175215.85D1183B7B@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pistache: needs NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=b6db4e2a79da7aadcbe2beda3e00381afb9e3f28
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

pistache needs NPTL as it unconditionally uses pthread_setname_np since
https://github.com/pistacheio/pistache/commit/b283c32963a7cb0500cf69555d320a6e9e252850
resulting in the following uclibc build failure since commit
82e61bed8208857d5d13c384c89086c4dd4e1e79:

../src/common/reactor.cc: In lambda function:
../src/common/reactor.cc:512:25: error: 'pthread_setname_np' was not declared in this scope; did you mean 'pthread_setcanceltype'?
  512 |                         pthread_setname_np(pthread_self(),
      |                         ^~~~~~~~~~~~~~~~~~
      |                         pthread_setcanceltype

Fixes: 82e61bed8208857d5d13c384c89086c4dd4e1e79
 - http://autobuild.buildroot.org/results/b2b22e4f9684aca0246650673fd8c33019712ddf
 - http://autobuild.buildroot.org/results/1597bfe2a57cd3aef54d331447dd81cae020d434

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/pistache/Config.in | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/package/pistache/Config.in b/package/pistache/Config.in
index ca2d2833cd..e66c24d86d 100644
--- a/package/pistache/Config.in
+++ b/package/pistache/Config.in
@@ -2,7 +2,7 @@ config BR2_PACKAGE_PISTACHE
 	bool "pistache"
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_7 # C++17, std::optional
 	depends on BR2_USE_WCHAR
-	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_TOOLCHAIN_HAS_THREADS_NPTL
 	depends on BR2_INSTALL_LIBSTDCPP
 	select BR2_PACKAGE_RAPIDJSON
 	help
@@ -12,8 +12,8 @@ config BR2_PACKAGE_PISTACHE
 
 	  https://github.com/oktal/pistache
 
-comment "pistache needs a toolchain w/ C++, gcc >= 7, threads, wchar"
+comment "pistache needs a toolchain w/ C++, gcc >= 7, NPTL, wchar"
 	depends on !BR2_INSTALL_LIBSTDCPP || \
 		   !BR2_TOOLCHAIN_GCC_AT_LEAST_7 || \
-		   !BR2_TOOLCHAIN_HAS_THREADS || \
+		   !BR2_TOOLCHAIN_HAS_THREADS_NPTL || \
 		   !BR2_USE_WCHAR
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
