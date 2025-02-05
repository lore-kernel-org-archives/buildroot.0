Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9066C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 17:13:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id 6A2EF84A5E;
	Fri, 28 Feb 2025 17:13:35 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id SqpVG0z9-08w; Fri, 28 Feb 2025 17:13:34 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 8BD8485B77
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id 8BD8485B77;
	Fri, 28 Feb 2025 17:13:34 +0000 (UTC)
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
 by lists1.osuosl.org (Postfix) with ESMTP id 1672D68
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:44:35 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp4.osuosl.org (Postfix) with ESMTP id 71F6A424A7
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:31:40 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id k9ehOqmy1SWL for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:31:39 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org D034742FCF
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp4.osuosl.org (Postfix) with ESMTP id D034742FCF
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id C6E9085E25; Fri, 28 Feb 2025 16:30:32 +0000 (UTC)
To: buildroot@buildroot.org
Date: Wed, 5 Feb 2025 07:55:33 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9fb56e0367022c2d18531fd2d9882dedfc68f31d
X-Git-Newrev: 3572658ad288e25425ae5c1b4a239a0c06cac10d
X-Patchwork-Hint: ignore
Message-Id: <20250228163032.C6E9085E25@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] package/binutils: fix change
 to 2.43 as default version
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

commit: https://git.buildroot.net/buildroot/commit/?id=3572658ad288e25425ae5c1b4a239a0c06cac10d
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

Commit 360fd01de20eb42aa0e6b5e9f7b37eaa104c6fc9 changed the binutils
package to use 2.43.x as the default version, but got the change wrong
in the BINUTILS_VERSION variable assignment. Indeed we don't support
2.43, but 2.43.1. This issue is causing the following build failure:

  ERROR: No hash found for binutils-2.43.tar.xz

Fixes:

  https://gitlab.com/vjardin/buildroot/-/jobs/9043815781

Signed-off-by: Vincent Jardin <vjardin@free.fr>
[Thomas: proper fix, and improved commit log]
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
---
 package/binutils/binutils.mk | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/package/binutils/binutils.mk b/package/binutils/binutils.mk
index 227eeefc4f..fd6fc3de8d 100644
--- a/package/binutils/binutils.mk
+++ b/package/binutils/binutils.mk
@@ -11,7 +11,7 @@ ifeq ($(BINUTILS_VERSION),)
 ifeq ($(BR2_arc),y)
 BINUTILS_VERSION = arc-2023.09-release
 else
-BINUTILS_VERSION = 2.43
+BINUTILS_VERSION = 2.43.1
 endif
 endif # BINUTILS_VERSION
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
