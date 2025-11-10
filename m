Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F257CCF9E3
	for <buildroot@archiver.kernel.org>; Mon, 10 Nov 2025 18:18:30 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id D611A816DA;
	Mon, 10 Nov 2025 18:18:29 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EkhMQr_cv5mp; Mon, 10 Nov 2025 18:18:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org EC47F81780
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id EC47F81780;
	Mon, 10 Nov 2025 18:18:28 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 881B51CC
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:18:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 67B6281785
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:18:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id vAAf90A0XRkd for <buildroot@buildroot.org>;
 Mon, 10 Nov 2025 18:18:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 69ABB81780
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 69ABB81780
 for <buildroot@buildroot.org>; Mon, 10 Nov 2025 18:18:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 59E48842F3; Mon, 10 Nov 2025 18:18:26 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 10 Nov 2025 19:09:41 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: ea9687cb2c3249b82fec99ea8b05f3322ac92ddc
X-Git-Newrev: 0f1a2e875e375bf9950c604de0595070d2a9a779
X-Patchwork-Hint: ignore
Message-Id: <20251110181826.59E48842F3@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nbd: Fix build on musl + gcc14
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

commit: https://git.buildroot.net/buildroot/commit/?id=0f1a2e875e375bf9950c604de0595070d2a9a779
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Fixes:
https://autobuild.buildroot.net/results/1e8/1e88151bb3aad1c1769e12b4930a2c33cd1c6830/

Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 .../0001-nbd-client-Fix-build-on-musl-gcc14.patch  | 46 ++++++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch b/package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
new file mode 100644
index 0000000000..72f43b1f9c
--- /dev/null
+++ b/package/nbd/0001-nbd-client-Fix-build-on-musl-gcc14.patch
@@ -0,0 +1,46 @@
+From 4664b8dd3bc124c27b160720113339c1da97c2c4 Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Mon, 20 May 2024 17:50:51 -0700
+Subject: [PATCH] nbd-client: Fix build on musl + gcc14
+
+GCC-14 has promoted incompatible-pointer-types warning into error which is
+now flagged especially with when building on musl
+
+Fixes following error
+
+| ../nbd-3.26.1/nbd-client.c: In function 'openunix':
+| ../nbd-3.26.1/nbd-client.c:345:27: error: passing argument 2 of 'connect' from incompatible pointer type [-Wincompatible-pointer-types]
+|   345 |         if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
+|       |                           ^~~~~~~~
+|       |                           |
+|       |                           struct sockaddr_un *
+| In file included from ../nbd-3.26.1/nbd-client.c:25:
+| /mnt/b/yoe/master/build/tmp/work/core2-64-yoe-linux-musl/nbd/3.26.1/recipe-sysroot/usr/include/sys/socket.h:386:19: note: expected 'const struct sockaddr *' but argument is of type 'struct sockaddr_un *'
+|   386 | int connect (int, const struct sockaddr *, socklen_t);
+|       |                   ^~~~~~~~~~~~~~~~~~~~~~~
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+
+Upstream: https://github.com/NetworkBlockDevice/nbd/commit/4664b8dd3bc124c27b160720113339c1da97c2c4
+
+Signed-off-by: Bernd Kuhls <bernd@kuhls.net>
+---
+ nbd-client.c | 2 +-
+ 1 file changed, 1 insertion(+), 1 deletion(-)
+
+diff --git a/nbd-client.c b/nbd-client.c
+index f4e120f..bc79bdf 100644
+--- a/nbd-client.c
++++ b/nbd-client.c
+@@ -342,7 +342,7 @@ int openunix(const char *path) {
+ 		return -1;
+ 	};
+ 
+-	if (connect(sock, &un_addr, sizeof(un_addr)) == -1) {
++	if (connect(sock, (struct sockaddr*)&un_addr, sizeof(un_addr)) == -1) {
+ 		err_nonfatal("CONNECT failed");
+ 		close(sock);
+ 		return -1;
+-- 
+2.47.3
+
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
