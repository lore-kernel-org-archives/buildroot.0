Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18E39C282D1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id AFDB8606D5;
	Fri, 28 Feb 2025 16:29:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id EAIOLtvTDUDU; Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org C14B46FAEA
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id C14B46FAEA;
	Fri, 28 Feb 2025 16:29:43 +0000 (UTC)
Received: from smtp2.osuosl.org (smtp2.osuosl.org [IPv6:2605:bc80:3010::133])
 by lists1.osuosl.org (Postfix) with ESMTP id 0333468
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:31 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp2.osuosl.org (Postfix) with ESMTP id D88EB40469
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:30 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 67E1c7d8Tkni for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org D4EBF40413
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp2.osuosl.org (Postfix) with ESMTP id D4EBF40413
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C03E087A7D; Fri, 28 Feb 2025 16:29:29 +0000 (UTC)
From: Julien Olivain <ju.o@free.fr>
To: buildroot@buildroot.org
Date: Tue, 19 Nov 2024 22:13:40 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: f3b82925a9a4ce71024f78663547c78ab665d840
X-Git-Newrev: 575d971820dedf7a0c6e217deb57ecd4db1218f5
X-Patchwork-Hint: ignore
Message-Id: <20250228162929.C03E087A7D@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/go: ensure there is a
 host-go provider, take 2
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=575d971820dedf7a0c6e217deb57ecd4db1218f5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 7b2a164b7460 (package/go/go-bin: new host-go provider) broke the
case for prompt-less, host-only go packages, as the main host-go symbol
would not be selected.

This very same use-case was initially broken when the first go-src
provider was introduced with fa2536ec9401 (package/go: make host package
a virtual package), and subsequently fixed in 99a5d51c6e9f (package/go:
ensure there is a host-go provider), so 7b2a164b7460 is causing a
regression of a fixed regression.

Fix that the very same way it was originally fixed.

Signed-off-by: Yann E. MORIN <yann.morin@orange.com>
Cc: Yann E. MORIN <yann.morin.1998@free.fr>
Cc: Thomas Perale <thomas.perale@mind.be>
Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/go/Config.in.host | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/package/go/Config.in.host b/package/go/Config.in.host
index 30260b573b..7e354b3298 100644
--- a/package/go/Config.in.host
+++ b/package/go/Config.in.host
@@ -78,13 +78,13 @@ config BR2_PACKAGE_HOST_GO_BIN
 
 endchoice
 
+endif
+
 config BR2_PACKAGE_PROVIDES_HOST_GO
 	string
-	# Default to host-go-src
+	# Default to host-go-bin unless src explicitly requested
 	default "host-go-src" if BR2_PACKAGE_HOST_GO_SRC
-	default "host-go-bin" if BR2_PACKAGE_HOST_GO_BIN
-
-endif
+	default "host-go-bin"
 
 source "package/go/go-bin/Config.in.host"
 source "package/go/go-bootstrap-stage1/Config.in.host"
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
