Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3502BCD379F
	for <buildroot@archiver.kernel.org>; Tue,  3 Sep 2024 16:28:24 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 043E760764;
	Tue,  3 Sep 2024 16:28:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 2ku0QFvAwRco; Tue,  3 Sep 2024 16:28:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1BF6A60815
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1BF6A60815;
	Tue,  3 Sep 2024 16:28:22 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by ash.osuosl.org (Postfix) with ESMTP id 44D3E1BF373
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 2F45740317
 for <buildroot@lists.busybox.net>; Tue,  3 Sep 2024 16:28:09 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 3ajU8HspAep7 for <buildroot@lists.busybox.net>;
 Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3867340314
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 3867340314
 for <buildroot@buildroot.org>; Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 26B0386A21; Tue,  3 Sep 2024 16:28:08 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Tue, 3 Sep 2024 18:24:37 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: a0d1df2ac511404241f6f74d00bcde4b8fdeba8b
X-Git-Newrev: 4d7d17c7282afa61465d1ba9afcdb16f6f80e7ef
X-Patchwork-Hint: ignore
Message-Id: <20240903162808.26B0386A21@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x] package/pistache: needs
 NPTL
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

commit: https://git.buildroot.net/buildroot/commit/?id=4d7d17c7282afa61465d1ba9afcdb16f6f80e7ef
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

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
(cherry picked from commit b6db4e2a79da7aadcbe2beda3e00381afb9e3f28)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
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
