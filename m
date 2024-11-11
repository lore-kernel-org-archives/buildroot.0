Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32E1AD2E9F0
	for <buildroot@archiver.kernel.org>; Mon, 11 Nov 2024 14:36:02 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E7D5980AF0;
	Mon, 11 Nov 2024 14:36:01 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id S2ru2E1kOfkt; Mon, 11 Nov 2024 14:36:01 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org D708680C9A
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp1.osuosl.org (Postfix) with ESMTP id D708680C9A;
	Mon, 11 Nov 2024 14:36:00 +0000 (UTC)
Received: from smtp1.osuosl.org (smtp1.osuosl.org [IPv6:2605:bc80:3010::138])
 by lists1.osuosl.org (Postfix) with ESMTP id 5A47BDB1
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp1.osuosl.org (Postfix) with ESMTP id 48EB180C53
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:54 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
 by localhost (smtp1.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id l6qvs33XagqQ for <buildroot@buildroot.org>;
 Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 4308780C4C
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp1.osuosl.org (Postfix) with ESMTP id 4308780C4C
 for <buildroot@buildroot.org>; Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 3B94186092; Mon, 11 Nov 2024 14:35:52 +0000 (UTC)
From: Peter Korsgaard <peter@korsgaard.com>
To: buildroot@buildroot.org
Date: Mon, 11 Nov 2024 15:32:10 +0100
X-Git-Refname: refs/heads/2024.08.x
X-Git-Oldrev: 1b02ba29abe2bfe71db7f5e4c3affbcde08db3e1
X-Git-Newrev: a480672ef0a36c0ed4de47e9a2a6d7940b938b37
X-Patchwork-Hint: ignore
Message-Id: <20241111143552.3B94186092@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/2024.08.x] package/nethogs: add
 patch to fix version generation
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

commit: https://git.buildroot.net/buildroot/commit/?id=a480672ef0a36c0ed4de47e9a2a6d7940b938b37
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/2024.08.x

This fixes nethogs being built with the (mangled) buildroot version
name from the outer buildroot git repo.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
(cherry picked from commit 3d28ee3318dee87e4339e709a46ac1eac25810f6)
Signed-off-by: Peter Korsgaard <peter@korsgaard.com>
---
 ...01-determineVersion-sh-prevent-traversing.patch | 31 ++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch b/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch
new file mode 100644
index 0000000000..6f39c53128
--- /dev/null
+++ b/package/nethogs/0001-determineVersion-sh-prevent-traversing.patch
@@ -0,0 +1,31 @@
+From 6423bdf05d51efc5441c82248098f99e4c1f59c3 Mon Sep 17 00:00:00 2001
+From: Marcus Hoffmann <marcus.hoffmann@othermo.de>
+Date: Fri, 20 Sep 2024 12:06:26 +0200
+Subject: [PATCH] determineVersion.sh: prevent traversing into outer git repo
+ for git-describe call
+
+When building nethogs inside another git repo (as is i.e. done as part
+of a buildroot build) the version is picked up from the outer git repo,
+which is confusing as well as introducing reproducibility problems when
+rebuilding the same nethogs version produces different results if the
+outer repository changes.
+
+Upstream: https://github.com/raboof/nethogs/commit/6423bdf05d51efc5441c82248098f99e4c1f59c3
+Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
+---
+ determineVersion.sh | 7 +++++--
+ 1 file changed, 5 insertions(+), 2 deletions(-)
+
+diff --git a/determineVersion.sh b/determineVersion.sh
+index 7c5f1de..3d80d9d 100755
+--- a/determineVersion.sh
++++ b/determineVersion.sh
+@@ -1,3 +1,6 @@
+ #!/bin/bash
+-
+-(git describe --tags 2>/dev/null || pwd | sed -e "s/.*\\///" | sed -e "s/[^-]*//") | tail -c +2
++if [ $(git rev-parse --show-toplevel 2>/dev/null) == $(pwd) ]; then
++  git describe --tags 2>/dev/null | tail -c +2
++else
++  pwd | sed -e "s/.*\\///" | sed -e "s/[^-]*//" | tail -c +2
++fi
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
