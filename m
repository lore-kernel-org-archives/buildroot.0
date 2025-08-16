Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BC9BCA0EE6
	for <buildroot@archiver.kernel.org>; Sat, 16 Aug 2025 20:38:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id C90876152D;
	Sat, 16 Aug 2025 20:38:22 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gGNZw0zh3Smv; Sat, 16 Aug 2025 20:38:22 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 1317F61529
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 1317F61529;
	Sat, 16 Aug 2025 20:38:22 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id F313E75
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:38:20 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id F08CB61528
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:38:20 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id YdlYq-vFnnqc for <buildroot@buildroot.org>;
 Sat, 16 Aug 2025 20:38:20 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3E56D6140F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3E56D6140F
 for <buildroot@buildroot.org>; Sat, 16 Aug 2025 20:38:20 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 36A6D87654; Sat, 16 Aug 2025 20:38:20 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 16 Aug 2025 22:37:54 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 826f9e43a1fa89fd3e6d165b1c3b66bf61e9bfe9
X-Git-Newrev: 562eb870fe6455e396d35354c80ce50d7e1c01b6
X-Patchwork-Hint: ignore
Message-Id: <20250816203820.36A6D87654@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/start-stop-daemon: fix build
 issues with musl and GCC 14
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
From: Thomas Petazzoni via buildroot <buildroot@buildroot.org>
Reply-To: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=562eb870fe6455e396d35354c80ce50d7e1c01b6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Unlike glibc and uClibc, musl doesn't play tricks with transparent
unions for the second argument to bind() to accept the various sockaddr
variants, but rather just defines it as "struct sockaddr*". As GCC 14 no
longer allows arbitrary implicit pointer casts, this results in a build
error. Import the upstream patch that adds the cast.

Fixes: https://autobuild.buildroot.org/results/00b/00b42a35a80c2deb61f2cd40aedd231597bbb290
Signed-off-by: Florian Larysch <fl@n621.de>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
