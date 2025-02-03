Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp4.osuosl.org (smtp4.osuosl.org [140.211.166.137])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04A21C282C1
	for <buildroot@archiver.kernel.org>; Fri, 28 Feb 2025 16:35:45 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp4.osuosl.org (Postfix) with ESMTP id B6BBC42EF7;
	Fri, 28 Feb 2025 16:35:44 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp4.osuosl.org ([127.0.0.1])
 by localhost (smtp4.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id 6UNrzxChX2cr; Fri, 28 Feb 2025 16:35:43 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.166.142; helo=lists1.osuosl.org; envelope-from=buildroot-bounces@buildroot.org; receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp4.osuosl.org 7A91B4F1D6
Received: from lists1.osuosl.org (lists1.osuosl.org [140.211.166.142])
	by smtp4.osuosl.org (Postfix) with ESMTP id 7A91B4F1D6;
	Fri, 28 Feb 2025 16:35:43 +0000 (UTC)
Received: from smtp3.osuosl.org (smtp3.osuosl.org [IPv6:2605:bc80:3010::136])
 by lists1.osuosl.org (Postfix) with ESMTP id 2476994F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 10E166068F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:27 +0000 (UTC)
X-Virus-Scanned: amavis at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id MPFwBmr1v_AI for <buildroot@buildroot.org>;
 Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
X-Comment: SPF check N/A for local connections - client-ip=140.211.167.122;
 helo=busybox.osuosl.org; envelope-from=buildroot-git-push@osuosl.org;
 receiver=<UNKNOWN> 
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 326556065F
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 326556065F
 for <buildroot@buildroot.org>; Fri, 28 Feb 2025 16:30:26 +0000 (UTC)
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 21B6E84767; Fri, 28 Feb 2025 16:30:25 +0000 (UTC)
To: buildroot@buildroot.org
Date: Mon, 3 Feb 2025 16:09:53 +0100
X-Git-Refname: refs/heads/next
X-Git-Oldrev: 9a271f9646cfcbe494f8356dfe43dab53fdec298
X-Git-Newrev: 4e99bc14eb8bdb25464c8e0f9c718119c71d59b5
X-Patchwork-Hint: ignore
Message-Id: <20250228163026.21B6E84767@busybox.osuosl.org>
Subject: [Buildroot] [git commit branch/next] boot/xilinx-prebuilt: merge
 hash files
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
Reply-To: Arnout Vandecappelle <arnout@mind.be>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: buildroot-bounces@buildroot.org
Sender: "buildroot" <buildroot-bounces@buildroot.org>

commit: https://git.buildroot.net/buildroot/commit/?id=4e99bc14eb8bdb25464c8e0f9c718119c71d59b5
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/next

There is actually no need to have two hash files for the xilinx-prebuilt
package.  As long as the boot/xilinx-prebuilt/xilinx-prebuilt.hash contains
the hash value for the default version as well as any version used by a
xilinx board defconfig, a single hash file is all that is needed.

In the future, when bumping the defconfig files independently of the
xilinx-prebuilt default version, all that has to be done is the following
process.

Patch Series:
1. Add new version hash to boot/xilinx-prebuilt/xilinx-prebuilt.hash.
2. Bump board defconfigs to new version.
3. Bump xilinx-prebuilt default version.

For this reason, this patch merges the two xilinx-prebuilt.hash files and
removes the board/xilinx xilinx-prebuilt.hash file.

Signed-off-by: Neal Frager <neal.frager@amd.com>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash | 2 --
 boot/xilinx-prebuilt/xilinx-prebuilt.hash                 | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash b/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
deleted file mode 100644
index fe6963872c..0000000000
--- a/board/xilinx/patches/xilinx-prebuilt/xilinx-prebuilt.hash
+++ /dev/null
@@ -1,2 +0,0 @@
-# Locally calculated
-sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
diff --git a/boot/xilinx-prebuilt/xilinx-prebuilt.hash b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
index 048b93dcf4..ddb2cf8bd1 100644
--- a/boot/xilinx-prebuilt/xilinx-prebuilt.hash
+++ b/boot/xilinx-prebuilt/xilinx-prebuilt.hash
@@ -1,5 +1,6 @@
 # Locally calculated
 sha256  7abcba4e0e44e3a4adf9c1f971d918575226d7604dfd64a386baaa00c1c6c35f  xilinx-prebuilt-xilinx_v2024.1.tar.gz
+sha256  ef61a4b249ecbf632a25cc34c3b03b8290be44397ff739467ac92ec1701e23bf  xilinx-prebuilt-xilinx_v2024.2.tar.gz
 
 # Locally calculated
 sha256  7b2074b607264a07347e1a7ef0323229585942793469f34b2cf9628f7623e05f  LICENSE
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
