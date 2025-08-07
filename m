Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46358C87FCA
	for <buildroot@archiver.kernel.org>; Thu,  7 Aug 2025 17:19:33 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id 1DCE840499;
	Thu,  7 Aug 2025 17:19:33 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WA5bFrwgN2uv; Thu,  7 Aug 2025 17:19:32 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 4D8A84049D
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 4D8A84049D;
	Thu,  7 Aug 2025 17:19:32 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0DAE331
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:19 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 0668E400A2
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:16 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id Omzp_nvXiUEh for <buildroot@buildroot.org>;
 Thu,  7 Aug 2025 17:19:15 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org C7CB34006D
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id C7CB34006D
 for <buildroot@buildroot.org>; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C627086FCC; Thu,  7 Aug 2025 17:19:14 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 7 Aug 2025 19:08:13 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: c65fa3c7df6d6ed4ec27bdbb33fab329020e0f43
X-Git-Newrev: 102b89bf9da6c60fc0ec6c9257149ad23649f8ec
X-Patchwork-Hint: ignore
Message-Id: <20250807171914.C627086FCC@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libcddb: Fix
 build with gcc-14
X-BeenThere: buildroot@buildroot.org
X-Mailman-Version: 2.1.30
Precedence: list
List-Id: Discussion and development of buildroot <buildroot.buildroot.org>
List-Unsubscribe: <https://lists.buildroot.org/mailman/options/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=unsubscribe>
List-Archive: <http://lists.buildroot.org/pipermail/buildroot/>
List-Post: <mailto:buildroot@buildroot.org>
List-Help: <mailto:buildroot-request@buildroot.org?subject=help>
List-Subscribe: <https://lists.buildroot.org/mailman/listinfo/buildroot>,
 <mailto:buildroot-request@buildroot.org?subject=subscribe>
From: Arnout Vandecappelle via buildroot <buildroot@buildroot.org>
Reply-To: Arnout Vandecappelle <arnout@rnout.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=102b89bf9da6c60fc0ec6c9257149ad23649f8ec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

libcddb fail to build with gcc-14 with error:

    cddb_net.c: In function 'timeout_connect':
    cddb_net.c:328:63: error: passing argument 5 of 'getsockopt' from incompatible pointer type [-Wincompatible-pointer-types]
      328 |                 getsockopt(sockfd, SOL_SOCKET, SO_ERROR, &rv, &l);
          |                                                               ^~
          |                                                               |
          |                                                               size_t * {aka long unsigned int *}

This commit adds a patch to fix the issue.

Fixes:
https://autobuild.buildroot.net/results/723/7236cf5fd4f33aabd3178586f877dff04d754abe/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
[Julien: add error message in commit log]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit f1b4657bc0f53d6f102f0ec0100cfdc88b1a5eec)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libcddb/0001-gcc15.patch | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/package/libcddb/0001-gcc15.patch b/package/libcddb/0001-gcc15.patch
new file mode 100644
index 0000000000..379e654951
--- /dev/null
+++ b/package/libcddb/0001-gcc15.patch
@@ -0,0 +1,17 @@
+Fix incorrect type.
+
+Upstream: https://sourceforge.net/p/libcddb/patches/9/#b9ea
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+
+--- libcddb-1.3.2/lib/cddb_net.c	2009-03-01 03:28:07.000000000 +0000
++++ libcddb-1.3.2/lib/cddb_net.c	2025-07-03 17:58:30.064232649 +0100
+@@ -305,7 +305,7 @@
+             int rv;
+             fd_set wfds;
+             struct timeval tv;
+-            size_t l;
++            socklen_t l;
+ 
+             /* set up select time out */
+             tv.tv_sec = timeout;
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
