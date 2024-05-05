Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3C09BC4345F
	for <buildroot@archiver.kernel.org>; Sun,  5 May 2024 17:41:01 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id E68C1605F4;
	Sun,  5 May 2024 17:41:00 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id oL1Gy-TWRgww; Sun,  5 May 2024 17:41:00 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org E02F56062C
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id E02F56062C;
	Sun,  5 May 2024 17:40:59 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id 515461BF3F2
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:40:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 441DD6062C
 for <buildroot@lists.busybox.net>; Sun,  5 May 2024 17:40:58 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gfF6TWuw9mOv for <buildroot@lists.busybox.net>;
 Sun,  5 May 2024 17:40:57 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 7FBBF605F4
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 7FBBF605F4
 for <buildroot@buildroot.org>; Sun,  5 May 2024 17:40:57 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 66DBC866DF; Sun,  5 May 2024 17:40:57 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Sun, 5 May 2024 19:40:26 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: bf8e4c2052b4b1fc07aa89b8134a1385855aaa45
X-Git-Newrev: 66ebbebdb4dc7bc56339e0a1f1cb8d2e8e30c2f2
X-Patchwork-Hint: ignore
Message-Id: <20240505174057.66DBC866DF@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/stress-ng: fix uclibc-ng build
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

commit: https://git.buildroot.net/buildroot/commit/?id=66ebbebdb4dc7bc56339e0a1f1cb8d2e8e30c2f2
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fix the following uclibc-ng build failure raised since bump to version
0.17.07 in commit 6fb179b906a1755d77bda9e501c5335ac163f3cb and
https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:

stress-sock.c: In function 'stress_sock_client':
stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
  656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
      |                                   ^~~~~~~~~~~
      |                                   MSG_ZEROCOPY
stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
CC stress-sockfd.c
stress-sock.c: In function 'stress_sock_server':
stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
 1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
      |                                  ^~~~~~~~~~~
      |                                  MSG_ZEROCOPY

Fixes: 6fb179b906a1755d77bda9e501c5335ac163f3cb
 - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065

Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
[yann.morin.1998@free.fr: reference upstream commit now it's merged]
Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 ...ress-sock.c-fix-build-without-SO_ZEROCOPY.patch | 56 ++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
new file mode 100644
index 0000000000..f1f4ab5636
--- /dev/null
+++ b/package/stress-ng/0001-stress-sock.c-fix-build-without-SO_ZEROCOPY.patch
@@ -0,0 +1,56 @@
+From 142c3b2414f0adfb13b59dea993054a0daa6cd52 Mon Sep 17 00:00:00 2001
+From: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Date: Sat, 4 May 2024 10:04:20 +0200
+Subject: [PATCH] stress-sock.c: fix build without SO_ZEROCOPY
+
+uclibc-ng defines MSG_ZEROCOPY but not SO_ZEROCOPY resulting in the
+following build failure since version 0.17.04 and
+https://github.com/ColinIanKing/stress-ng/commit/2ad8aff9bc1ab822cf615c72712c6031a8f60bbd:
+
+stress-sock.c: In function 'stress_sock_client':
+stress-sock.c:656:35: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
+  656 |    if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
+      |                                   ^~~~~~~~~~~
+      |                                   MSG_ZEROCOPY
+stress-sock.c:656:35: note: each undeclared identifier is reported only once for each function it appears in
+CC stress-sockfd.c
+stress-sock.c: In function 'stress_sock_server':
+stress-sock.c:1060:34: error: 'SO_ZEROCOPY' undeclared (first use in this function); did you mean 'MSG_ZEROCOPY'?
+ 1060 |   if (setsockopt(fd, SOL_SOCKET, SO_ZEROCOPY, &so_zerocopy, sizeof(so_zerocopy)) == 0) {
+      |                                  ^~~~~~~~~~~
+      |                                  MSG_ZEROCOPY
+
+Fixes:
+ - http://autobuild.buildroot.org/results/bcff31bd9820cf0b95f8d8c6de44fd4ab8e2f065
+
+Signed-off-by: Fabrice Fontaine <fontaine.fabrice@gmail.com>
+Upstream: https://github.com/ColinIanKing/stress-ng/commit/142c3b2414f0adfb13b59dea993054a0daa6cd52
+---
+ stress-sock.c | 4 ++--
+ 1 file changed, 2 insertions(+), 2 deletions(-)
+
+diff --git a/stress-sock.c b/stress-sock.c
+index 253730168..880530d04 100644
+--- a/stress-sock.c
++++ b/stress-sock.c
+@@ -649,7 +649,7 @@ retry:
+ 				args->name, errno, strerror(errno));
+ 			goto free_controls;
+ 		}
+-#if defined(MSG_ZEROCOPY)
++#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
+ 		if (sock_zerocopy) {
+ 			int so_zerocopy = 1;
+
+@@ -1053,7 +1053,7 @@ static int OPTIMIZE3 stress_sock_server(
+ 		goto die;
+ 	}
+
+-#if defined(MSG_ZEROCOPY)
++#if defined(MSG_ZEROCOPY) && defined(SO_ZEROCOPY)
+ 	if (sock_zerocopy) {
+ 		int so_zerocopy = 1;
+
+--
+2.43.0
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
