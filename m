Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E76C7CAC5B0
	for <buildroot@archiver.kernel.org>; Thu, 25 Sep 2025 20:03:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B9C9541655;
	Thu, 25 Sep 2025 20:03:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id KgLkqi-wUVXL; Thu, 25 Sep 2025 20:03:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 3BA1B41800
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 3BA1B41800;
	Thu, 25 Sep 2025 20:03:33 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by lists1.osuosl.org (Postfix) with ESMTP id 0D41C177
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:58 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id A5D9961529
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id dT8MulNx6MQP for <buildroot@buildroot.org>;
 Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 175A66153F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 175A66153F
 for <buildroot@buildroot.org>; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 1595286441; Thu, 25 Sep 2025 20:02:43 +0000 (UTC)
To: buildroot@buildroot.org
Date: Thu, 25 Sep 2025 21:58:18 +0200
X-Git-Refname: refs/heads/2025.05.x
X-Git-Oldrev: 2d703d9437644cce3e54ec23416474f0a7df4ee5
X-Git-Newrev: 20d4df73faa5f2220a25f92643a5ca970c232a5e
X-Patchwork-Hint: ignore
Message-Id: <20250925200243.1595286441@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2025.05.x] package/libxmlrpc: add
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

commit: https://git.buildroot.net/buildroot/commit/?id=20d4df73faa5f2220a25f92643a5ca970c232a5e
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2025.05.x

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
