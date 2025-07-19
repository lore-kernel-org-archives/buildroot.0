Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E856C83F27
	for <buildroot@archiver.kernel.org>; Sat, 19 Jul 2025 10:23:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5860B613EC;
	Sat, 19 Jul 2025 10:23:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id OgrSrUPm6AUT; Sat, 19 Jul 2025 10:23:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 944B2608EE
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 944B2608EE;
	Sat, 19 Jul 2025 10:23:39 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 2B564117
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:23:38 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 1D8D341BA4
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:23:38 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id JmEcO2ksVQ2W for <buildroot@buildroot.org>;
 Sat, 19 Jul 2025 10:23:37 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 726DA40DB1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id 726DA40DB1
 for <buildroot@buildroot.org>; Sat, 19 Jul 2025 10:23:37 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6D4EE865B0; Sat, 19 Jul 2025 10:23:37 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 19 Jul 2025 12:21:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: dcf9df16d89181c9f5022099a9b8874c004f3db9
X-Git-Newrev: f1b4657bc0f53d6f102f0ec0100cfdc88b1a5eec
X-Patchwork-Hint: ignore
Message-Id: <20250719102337.6D4EE865B0@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libcddb: Fix build with gcc-14
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
From: Julien Olivain via buildroot <buildroot@buildroot.org>
Reply-To: Julien Olivain <ju.o@free.fr>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=f1b4657bc0f53d6f102f0ec0100cfdc88b1a5eec
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
