Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B3F7CAC5A7
	for <buildroot@archiver.kernel.org>; Sun, 21 Sep 2025 22:20:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id D76FD6120B;
	Sun, 21 Sep 2025 22:20:26 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 0NUNICYd_z4k; Sun, 21 Sep 2025 22:20:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 305F861212
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 305F861212;
	Sun, 21 Sep 2025 22:20:26 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 2304E1C0
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 22:20:25 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id EE3F441101
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 22:20:24 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id HCv6lzFXTrIV for <buildroot@buildroot.org>;
 Sun, 21 Sep 2025 22:20:24 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org E8EFA40E8E
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id E8EFA40E8E
 for <buildroot@buildroot.org>; Sun, 21 Sep 2025 22:20:23 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id E362386155; Sun, 21 Sep 2025 22:20:23 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 22 Sep 2025 00:19:11 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: e8be2cbc168d9ecdba350646862560b8716d54ab
X-Git-Newrev: 059138326eb1e411dfcedc7947263e95a74efd4b
X-Patchwork-Hint: ignore
Message-Id: <20250921222023.E362386155@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/libxmlrpc: add BR2_USE_MMU
 dependency
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

commit: https://git.buildroot.net/buildroot/commit/?id=059138326eb1e411dfcedc7947263e95a74efd4b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

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
