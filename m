Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B8D5CA0EEB
	for <buildroot@archiver.kernel.org>; Thu, 21 Aug 2025 19:20:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 5DDC561AE5;
	Thu, 21 Aug 2025 19:20:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id tzcyC-NAMOGs; Thu, 21 Aug 2025 19:20:38 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C28DF617B6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C28DF617B6;
	Thu, 21 Aug 2025 19:20:38 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 11BD01C8
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:14 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 22C61616F1
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:13 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id aClMBzLWHZig for <buildroot@buildroot.org>;
 Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C2F43616F2
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id C2F43616F2
 for <buildroot@buildroot.org>; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 97DEA81373; Thu, 21 Aug 2025 19:20:11 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 21 Aug 2025 10:53:22 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 11e629db03a520c5f968a603eb89fc36e6cae15b
X-Git-Newrev: 129c845e17260d10de6511523fa2d59da014f271
X-Patchwork-Hint: ignore
Message-Id: <20250821192011.97DEA81373@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x]
 package/start-stop-daemon: fix build issues with musl and GCC 14
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
From: Thomas Perale via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Perale <thomas.perale@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=129c845e17260d10de6511523fa2d59da014f271
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

Unlike glibc and uClibc, musl doesn't play tricks with transparent
unions for the second argument to bind() to accept the various sockaddr
variants, but rather just defines it as "struct sockaddr*". As GCC 14 no
longer allows arbitrary implicit pointer casts, this results in a build
error. Import the upstream patch that adds the cast.

Fixes: https://autobuild.buildroot.org/results/00b/00b42a35a80c2deb61f2cd40aedd231597bbb290
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 562eb870fe6455e396d35354c80ce50d7e1c01b6)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 ...struct-sockaddr_un-to-struct-sockaddr-on-.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch b/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
new file mode 100644
index 0000000000..c093b49e2e
--- /dev/null
+++ b/package/start-stop-daemon/0003-s-s-d-Cast-struct-sockaddr_un-to-struct-sockaddr-on-.patch
@@ -0,0 +1,31 @@
+From 209ffbbf7c8fcf49d9296c969feb7a41aece6525 Mon Sep 17 00:00:00 2001
+From: Guillem Jover <guillem@debian.org>
+Date: Tue, 6 Dec 2022 18:37:08 +0100
+Subject: [PATCH] s-s-d: Cast struct sockaddr_un to struct sockaddr on bind()
+ call
+
+Changelog: internal
+Warned-by: gcc -Wincompatible-pointer-types on musl-libc
+
+Upstream: https://git.dpkg.org/cgit/dpkg/dpkg.git/commit/?id=209ffbbf7c8fcf49d9296c969feb7a41aece6525
+Signed-off-by: Florian Larysch <fl@n621.de>
+---
+ utils/start-stop-daemon.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/utils/start-stop-daemon.c b/utils/start-stop-daemon.c
+index 6863151c1..a15c0493f 100644
+--- a/utils/start-stop-daemon.c
++++ b/utils/start-stop-daemon.c
+@@ -632,7 +632,7 @@ create_notify_socket(void)
+ 	su.sun_family = AF_UNIX;
+ 	strncpy(su.sun_path, sockname, sizeof(su.sun_path) - 1);
+ 
+-	rc = bind(fd, &su, sizeof(su));
++	rc = bind(fd, (struct sockaddr *)&su, sizeof(su));
+ 	if (rc < 0)
+ 		fatale("cannot bind to notification socket");
+ 
+-- 
+2.50.1
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
