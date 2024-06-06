Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6C6AC27C4F
	for <buildroot@archiver.kernel.org>; Thu, 13 Jun 2024 10:08:43 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id B705561116;
	Thu, 13 Jun 2024 10:08:43 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gaCFVBbyrB8x; Thu, 13 Jun 2024 10:08:40 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 6D86561124
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp3.osuosl.org (Postfix) with ESMTP id 6D86561124;
	Thu, 13 Jun 2024 10:08:38 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
 by ash.osuosl.org (Postfix) with ESMTP id 54AA61BF354
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:22 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id 378FB413F0
 for <buildroot@lists.busybox.net>; Thu, 13 Jun 2024 10:05:02 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MueCnl6mRx68 for <buildroot@lists.busybox.net>;
 Thu, 13 Jun 2024 10:05:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 3BD86413F1
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id 3BD86413F1
 for <buildroot@buildroot.org>; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 2EA7787ED8; Thu, 13 Jun 2024 10:05:00 +0000 (UTC)
From: Yann E. MORIN <yann.morin.1998@free.fr>
To: buildroot@buildroot.org
Date: Thu, 6 Jun 2024 13:37:12 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 87b9b126d23be1e95b3d2b82438f65e28f554a87
X-Git-Newrev: f820d41f0a7479bd43b72dcc4f70b978e5d0ed70
X-Patchwork-Hint: ignore
Message-Id: <20240613100500.2EA7787ED8@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/delve: only select host-go when
 needed
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

commit: https://git.buildroot.net/buildroot/commit/?id=f820d41f0a7479bd43b72dcc4f70b978e5d0ed70
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

Commit 58a291470acf (package/pkg-golang: select BR2_PACKAGE_HOST_GO)
ensured that we had the host-go enabled for all packages that need it.

However, for delve, the select was added to the _ARCH_SUPPORTS symbol,
which means that host-go is built as soon as delve supports the target,
even when devle itself is not enabled.

Move the select to the main symbol.

Fixes: 58a291470acf458239202bd81bfc642b9cadd298

Signed-off-by: Yann E. MORIN <yann.morin.1998@free.fr>
---
 package/delve/Config.in | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/delve/Config.in b/package/delve/Config.in
index 288dc1ea15..2ba70e8ceb 100644
--- a/package/delve/Config.in
+++ b/package/delve/Config.in
@@ -7,12 +7,12 @@ config BR2_PACKAGE_DELVE_ARCH_SUPPORTS
 	default y if BR2_x86_64
 	depends on BR2_PACKAGE_HOST_GO_TARGET_ARCH_SUPPORTS
 	depends on BR2_PACKAGE_HOST_GO_TARGET_CGO_LINKING_SUPPORTS
-	select BR2_PACKAGE_HOST_GO
 
 config BR2_PACKAGE_DELVE
 	bool "delve"
 	depends on BR2_PACKAGE_DELVE_ARCH_SUPPORTS
 	depends on BR2_TOOLCHAIN_HAS_THREADS
+	select BR2_PACKAGE_HOST_GO
 	help
 	  Delve is a debugger for the Go programming language.
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
