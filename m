Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 005C7CAC5BB
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:20:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B7AB661623;
	Thu, 25 Sep 2025 20:20:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id VNwC9FdXCVBd; Thu, 25 Sep 2025 20:20:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org CD9E1615E9
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id CD9E1615E9;
	Thu, 25 Sep 2025 20:20:01 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by lists1.osuosl.org (Postfix) with ESMTP id 130751EB
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 37473814D4
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 1Sy2YPKk1czu for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 6CA9E81D3A
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 6CA9E81D3A
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 6A58886443; Thu, 25 Sep 2025 20:19:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 22:07:51 +0200
X-Git-Refname: refs/heads/2025.02.x
X-Git-Oldrev: eaa81141919351a8adbe2db0bf20608e31c73785
X-Git-Newrev: 9fecfa04406624fbf46f5a5d8d1d1921276ab6b7
X-Patchwork-Hint: ignore
Message-Id: <20250925201943.6A58886443@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.02.x] package/libxmlrpc: add
 BR2_USE_MMU dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=9fecfa04406624fbf46f5a5d8d1d1921276ab6b7
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.02.x

Build fails with:
server.c: In function 'ServerDaemonize':
server.c:1590:13: error: implicit declaration of function 'fork'
[-Wimplicit-function-declaration]
 1590 |     switch (fork()) {
      |             ^~~~

Hence, add BR2_USE_MMU to avoid building with toolchains without MMU
support.

Fixes:
https://autobuild.buildroot.org/results/10464159f2a9ff41ea0921a45ce12ecd0fa50ae7/

Signed-off-by: Yegor Yefremov <yegorslists@googlemail.com>
[Julien: move BR2_USE_MMU up to fix check-package error]
Signed-off-by: Julien Olivain <ju.o@free.fr>
(cherry picked from commit 059138326eb1e411dfcedc7947263e95a74efd4b)
Signed-off-by: Thomas Perale <thomas.perale@mind.be>
---
 package/libxmlrpc/Config.in | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/package/libxmlrpc/Config.in b/package/libxmlrpc/Config.in
index 33d512328e..798c286f2d 100644
--- a/package/libxmlrpc/Config.in
+++ b/package/libxmlrpc/Config.in
@@ -1,6 +1,7 @@
 config BR2_PACKAGE_LIBXMLRPC
 	bool "libxmlrpc"
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	depends on BR2_USE_MMU # fork()
 	select BR2_PACKAGE_LIBCURL
 	help
 	  XML-RPC is a quick-and-easy way to make procedure calls over
@@ -24,4 +25,5 @@ comment "cli tool needs a toolchain w/ dynamic library"
 endif # BR2_PACKAGE_LIBXMLRPC
 
 comment "libxmlrpc needs a toolchain w/ threads"
+	depends on BR2_USE_MMU
 	depends on !BR2_TOOLCHAIN_HAS_THREADS
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
