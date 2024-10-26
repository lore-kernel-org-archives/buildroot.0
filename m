Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0545DD10BFD
	for <buildroot@archiver.kernel.org>; Sat, 26 Oct 2024 14:34:37 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B97AD404D0;
	Sat, 26 Oct 2024 14:34:36 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id uXT6kefKwXmo; Sat, 26 Oct 2024 14:34:35 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 8D5854050B
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 8D5854050B;
	Sat, 26 Oct 2024 14:34:35 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 1F6562318
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:34:34 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 00A546062C
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:34:34 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id WRpRcVyqwvlE for <buildroot@buildroot.org>;
 Sat, 26 Oct 2024 14:34:33 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 3FE4360621
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 3FE4360621
 for <buildroot@buildroot.org>; Sat, 26 Oct 2024 14:34:33 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 31C9B83BEA; Sat, 26 Oct 2024 14:34:33 +0000 (UTC)
To: buildroot@buildroot.org
Date: Sat, 26 Oct 2024 16:32:42 +0200
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 9f3e805428302c16769da78ce6604d5db77fbc39
X-Git-Newrev: 3d28ee3318dee87e4339e709a46ac1eac25810f6
X-Patchwork-Hint: ignore
Message-Id: <20241026143433.31C9B83BEA@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/nethogs: add patch to fix version
 generation
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

commit: https://git.buildroot.net/buildroot/commit/?id=3d28ee3318dee87e4339e709a46ac1eac25810f6
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

This fixes nethogs being built with the (mangled) buildroot version
name from the outer buildroot git repo.

Signed-off-by: Marcus Hoffmann <buildroot@bubu1.eu>
Signed-off-by: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
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
