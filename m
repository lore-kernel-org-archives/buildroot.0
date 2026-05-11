Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7FA44CD484E
	for <buildroot@archiver.kernel.org>; Mon, 11 May 2026 19:33:10 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2B3E6606D9;
	Mon, 11 May 2026 19:33:10 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id DdEeEtVvLzkU; Mon, 11 May 2026 19:33:08 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 2CB3A606CC
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=buildroot.org;
	s=default; t=1778527988;
	bh=A0Ih7W00yWQb4WCvKtxh3NjEjqjPEOxF77uC1ENg6Zc=;
	h=To:Date:Subject:List-Id:List-Unsubscribe:List-Archive:List-Post:
	 List-Help:List-Subscribe:From:Reply-To:From;
	b=aE4mZDQM3PhpsTaANfCo5vHZj5IVFQNrNyOr2tZi0h2IAP3yED8M0h8tdQSGgHro0
	 BMRWyLcXA5sQ1fyDIKUh5uwJNozvAKNxegsBC01d5/f3ZBA4AOlXiVvpqCelPVUMZb
	 S3MDGyZZuBDLh0XWQJ6A3dju8ZEms6xK9GRpJ5vUhBzaiZn0l7gupfZBJpqSRqDXzX
	 UcB7rhl788VkNqSIVSY5thc72AB/rWKQ0Z8pjfpwxkX+Hut9ZWVLgJLFxUt6lz2IJU
	 rnfQvm9J72QCcN+ghekloROeZkW2AMCWRlLSpuBZ+pdlmwJvAdNTO5YsbR0rKBdq64
	 Xei/VjXlCwUEQ==
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp3.osuosl.org (Postfix) with ESMTP id 2CB3A606CC;
	Mon, 11 May 2026 19:33:08 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id C505F223
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:33:06 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id AB24740830
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:33:06 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id gVPrMIQiyVkP for <buildroot@buildroot.org>;
 Mon, 11 May 2026 19:33:06 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org EF27C4082F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id EF27C4082F
 for <buildroot@buildroot.org>; Mon, 11 May 2026 19:33:05 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 182F685E43; Mon, 11 May 2026 19:33:02 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 11 May 2026 21:32:28 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 3563ae95863b52e51837779f3bd8bbb92c20dcba
X-Git-Newrev: 262db97f122f0ab231927bd63e252bd8343b0311
X-Patchwork-Hint: ignore
Message-Id: <20260511193302.182F685E43@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/dash: fix hash file
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

commit: https://gitlab.com/buildroot.org/buildroot/-/commit/262db97f122f0ab231927bd63e252bd8343b0311
branch: https://gitlab.com/buildroot.org/buildroot/-/tree/master

Buildroot commit 3563ae95863b52e51837779f3bd8bbb92c20dcba
introduced an incorrectly formatted hash file. This commit
fixes the issue.

Signed-off-by: Julien Olivain <ju.o@free.fr>
---
 package/dash/dash.hash | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/dash/dash.hash b/package/dash/dash.hash
index 3f7a9a0b32..3fcdb1a5da 100644
--- a/package/dash/dash.hash
+++ b/package/dash/dash.hash
@@ -1,5 +1,5 @@
 # From http://gondor.apana.org.au/~herbert/dash/files/dash-0.5.13.4.tar.gz.sha512sum
-sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675 dash-0.5.13.4.tar.gz
+sha512  383d0ea8316fea3ce523dc535173a94a22e58bfaec2dec3309d3496a864e5e67711965563db82e7e181f8d7b67a25033107b4c9453c3d6b3820c6586d1f99675  dash-0.5.13.4.tar.gz
 # Locally calculated
 sha256  d10dfd41cda59165560db39ca915c2c4a7636fff04281d8d2df77ad92c753e2b  dash-0.5.13.4.tar.gz
 sha256  254a7894923ff62e69184a991dcbccae97edee58a1105e8efbe78caf10595d72  COPYING
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
