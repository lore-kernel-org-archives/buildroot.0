Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp2.osuosl.org (smtp2.osuosl.org [140.211.166.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E28C3271E
	for <buildroot@archiver.kernel.org>; Mon,  8 Jul 2024 06:58:48 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp2.osuosl.org (Postfix) with ESMTP id A847D40190;
	Mon,  8 Jul 2024 06:58:48 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp2.osuosl.org ([127.0.0.1])
 by localhost (smtp2.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l27rUZysLFMM; Mon,  8 Jul 2024 06:58:47 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.34; helo=ash.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp2.osuosl.org 8F37240459
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp2.osuosl.org (Postfix) with ESMTP id 8F37240459;
	Mon,  8 Jul 2024 06:58:47 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
 by ash.osuosl.org (Postfix) with ESMTP id 825081BF2C2
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:46 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 7017F81098
 for <buildroot@lists.busybox.net>; Mon,  8 Jul 2024 06:58:46 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WGud0EqEqmxO for <buildroot@lists.busybox.net>;
 Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org B6A9981095
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id B6A9981095
 for <buildroot@buildroot.org>; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id A17DC83D28; Mon,  8 Jul 2024 06:58:45 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 8 Jul 2024 08:39:59 +0200
X-Git-Refname: refs/heads/2024.05.x
X-Git-Oldrev: 99e58bdad0f5a1e3c82ee2b03c4f211d4033ae8f
X-Git-Newrev: e1c896b10f56666c172e87a1aa18907862e6c178
X-Patchwork-Hint: ignore
Message-Id: <20240708065845.A17DC83D28@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.05.x]
 support/scripts/apply-patches: fallback $TAR to `tar`
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

commit: https://git.buildroot.net/buildroot/commit/?id=e1c896b10f56666c172e87a1aa18907862e6c178
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.05.x

Commit f77d698f83b230f7efcb7d28af3aacfa9589cc89 changed apply-patches to
use $TAR instead of `tar`, but did not define a fallback if $TAR is not
defined. This results in an error when calling apply-patches.sh from
outside Buildroot's Makefile. Our team uses this script to setup local
checkouts of Buildroot package's with patches for development.

Signed-off-by: Brandon Maier <brandon.maier@collins.com>
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
(cherry picked from commit 118c824b565442bfe1d4ae1c0a39d330e624b854)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 support/scripts/apply-patches.sh | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/support/scripts/apply-patches.sh b/support/scripts/apply-patches.sh
index 4e633b23be..73aa6c8e5f 100755
--- a/support/scripts/apply-patches.sh
+++ b/support/scripts/apply-patches.sh
@@ -46,6 +46,8 @@ patchdir=${2-../kernel-patches}
 shift 2
 patchpattern=${@-*}
 
+export TAR=${TAR:-tar}
+
 # use a well defined sorting order
 export LC_COLLATE=C
 
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
