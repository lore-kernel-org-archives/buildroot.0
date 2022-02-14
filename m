Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28895C433F5
	for <buildroot@archiver.kernel.org>; Mon, 14 Feb 2022 20:43:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id DFD8A401F6;
	Mon, 14 Feb 2022 20:43:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id ZTIQ2kDQh_g6; Mon, 14 Feb 2022 20:43:13 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id 2C439401A1;
	Mon, 14 Feb 2022 20:43:12 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 5FAFE1BF348
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3E14140368
 for <buildroot@lists.busybox.net>; Mon, 14 Feb 2022 20:42:44 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id IWt7cTGn652X for <buildroot@lists.busybox.net>;
 Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 4D6E5404F3
 for <buildroot@buildroot.org>; Mon, 14 Feb 2022 20:42:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4052)
 id 2E57882BDC; Mon, 14 Feb 2022 20:35:07 +0000 (UTC)
From: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
To: buildroot@buildroot.org
Date: Mon, 14 Feb 2022 21:39:58 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: d661740201405970f65c16c39a79f4148705af30
X-Git-Newrev: 8679f6a7e7c0e6245ebdea47ea2257bfaccc7d37
X-Patchwork-Hint: ignore
Message-Id: <20220214203507.2E57882BDC@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libuhttpd: depends on gcc >= 4.9
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

commit: https://git.buildroot.net/buildroot/commit/?id=8679f6a7e7c0e6245ebdea47ea2257bfaccc7d37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Add a dependency on gcc >= 4.9 to avoid the following build failure
with gcc 4.8.3 raised since bump to version 3.14.1 in commit
61797c52f5deef2cb67e60cf075ca243078c8855 and
https://github.com/zhaojh329/libuhttpd/commit/ffdf7de3a4a1f5a62aa3814ac96e889958a30840:

/home/peko/autobuild/instance-1/output-1/build/libuhttpd-3.14.1/src/cgi.c:41:5: error: initializer element is not a constant expression [-Werror]
     {"accept", strlen("accept"), "HTTP_ACCEPT"},
     ^

It should be noted that upstream rejected a patch to remove -Werror:
https://github.com/zhaojh329/libuhttpd/pull/12

Fixes:
 - http://autobuild.buildroot.org/results/a3a970a6398dcb0e4e03f4277f1a50c6b5eff7bd

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
---
 package/libuhttpd/Config.in | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/package/libuhttpd/Config.in b/package/libuhttpd/Config.in
index 52bbd313bc..97fc984ea0 100644
--- a/package/libuhttpd/Config.in
+++ b/package/libuhttpd/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBUHTTPD
 	bool "libuhttpd"
 	depends on BR2_USE_MMU # fork()
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
 	select BR2_PACKAGE_LIBEV
 	select BR2_PACKAGE_WOLFSSL_ALL if BR2_PACKAGE_WOLFSSL
 	help
@@ -8,3 +9,7 @@ config BR2_PACKAGE_LIBUHTTPD
 	  library based on libev
 
 	  https://github.com/zhaojh329/libuhttpd
+
+comment "libuhttpd needs a toolchain w/ gcc >= 4.9"
+	depends on BR2_USE_MMU
+	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
