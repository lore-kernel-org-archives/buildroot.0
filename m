Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63758C433EF
	for <buildroot@archiver.kernel.org>; Sun, 10 Apr 2022 21:12:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1974D41677;
	Sun, 10 Apr 2022 21:12:13 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
	by localhost (smtp4.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id r4n0Eoefzdwt; Sun, 10 Apr 2022 21:12:12 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp4.osuosl.org (Postfix) with ESMTP id EEF8E415EB;
	Sun, 10 Apr 2022 21:12:10 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 3C8A91BF995
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 3A6848402C
 for <buildroot@lists.busybox.net>; Sun, 10 Apr 2022 21:11:43 +0000 (UTC)
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id I_jIli3HnDMv for <buildroot@lists.busybox.net>;
 Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 745258402B
 for <buildroot@buildroot.org>; Sun, 10 Apr 2022 21:11:42 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4021)
 id 1C1E88396C; Sun, 10 Apr 2022 21:02:02 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Sun, 10 Apr 2022 23:10:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: c0aaf9cc9e85f63ab4334db8c6deca25e6f8e878
X-Git-Newrev: b5f07f62eb0392c3bddd63ac16d12adec7e98812
X-Patchwork-Hint: ignore
Message-Id: <20220410210202.1C1E88396C@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/liburing: needs MMU
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

commit: https://git.buildroot.net/buildroot/commit/?id=b5f07f62eb0392c3bddd63ac16d12adec7e98812
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

liburing needs MMU since its addition in commit
03ca6f4e39874583060317e7e15e9e360220877e:

setup.c: In function 'io_uring_ring_dontfork':
setup.c:119:8: warning: implicit declaration of function 'madvise'; did you mean 'raise'? [-Wimplicit-function-declaration]
  119 |  ret = madvise(ring->sq.sqes, len, MADV_DONTFORK);
      |        ^~~~~~~
      |        raise

Fixes:
 - http://autobuild.buildroot.org/results/33f3c58e98daab07139b4f400b85f87c0e314240

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 package/liburing/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/liburing/Config.in b/package/liburing/Config.in
index d65a3f1322..fc13f1c17c 100644
--- a/package/liburing/Config.in
+++ b/package/liburing/Config.in
@@ -1,5 +1,6 @@
 config BR2_PACKAGE_LIBURING
 	bool "liburing"
+	depends on BR2_USE_MMU # madvise()
 	depends on BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 # C11/stdatomic.h
 	depends on BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
 	help
@@ -11,5 +12,6 @@ config BR2_PACKAGE_LIBURING
 	  https://git.kernel.dk/cgit/liburing
 
 comment "liburing needs a toolchain w/ gcc >= 4.9, headers >= 5.1"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_GCC_AT_LEAST_4_9 || \
 		!BR2_TOOLCHAIN_HEADERS_AT_LEAST_5_1
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
