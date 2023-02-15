Return-Path: <buildroot-bounces@buildroot.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from smtp1.osuosl.org (smtp1.osuosl.org [140.211.166.138])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CA1EC636D4
	for <buildroot@archiver.kernel.org>; Wed, 15 Feb 2023 21:15:17 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by smtp1.osuosl.org (Postfix) with ESMTP id E4E1181447;
	Wed, 15 Feb 2023 21:15:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org E4E1181447
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp1.osuosl.org ([127.0.0.1])
	by localhost (smtp1.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id oM0jCKenvh_Y; Wed, 15 Feb 2023 21:15:16 +0000 (UTC)
Received: from ash.osuosl.org (ash.osuosl.org [140.211.166.34])
	by smtp1.osuosl.org (Postfix) with ESMTP id 28C8881432;
	Wed, 15 Feb 2023 21:15:15 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp1.osuosl.org 28C8881432
Received: from smtp3.osuosl.org (smtp3.osuosl.org [140.211.166.136])
 by ash.osuosl.org (Postfix) with ESMTP id A70ED1BF3A0
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:15:13 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by smtp3.osuosl.org (Postfix) with ESMTP id 8EC6660A70
 for <buildroot@lists.busybox.net>; Wed, 15 Feb 2023 21:15:13 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 8EC6660A70
X-Virus-Scanned: amavisd-new at osuosl.org
Received: from smtp3.osuosl.org ([127.0.0.1])
 by localhost (smtp3.osuosl.org [127.0.0.1]) (amavisd-new, port 10024)
 with ESMTP id kFEi-SKM0syl for <buildroot@lists.busybox.net>;
 Wed, 15 Feb 2023 21:15:12 +0000 (UTC)
Received: from busybox.osuosl.org (busybox.osuosl.org [140.211.167.122])
 by smtp3.osuosl.org (Postfix) with ESMTP id 78EC760A6B
 for <buildroot@buildroot.org>; Wed, 15 Feb 2023 21:15:12 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp3.osuosl.org 78EC760A6B
Received: by busybox.osuosl.org (Postfix, from userid 4053)
 id 67B3985D35; Wed, 15 Feb 2023 21:15:12 +0000 (UTC)
From: Arnout Vandecappelle <arnout@mind.be>
To: buildroot@buildroot.org
Date: Wed, 15 Feb 2023 22:14:20 +0100
X-Git-Refname: refs/heads/master
X-Git-Oldrev: 8eee178355cafa156d93bdc0cd447618dd1a1abc
X-Git-Newrev: c3a1f0fe1b912727bb7b5baebe938f75036e566b
X-Patchwork-Hint: ignore
Message-Id: <20230215211512.67B3985D35@busybox.osuosl.org>
Subject: [Buildroot] [git commit] package/pkg-golang: disable version
 control information
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

commit: https://git.buildroot.net/buildroot/commit/?id=c3a1f0fe1b912727bb7b5baebe938f75036e566b
branch: https://git.buildroot.net/buildroot/commit/?id=refs/heads/master

By default go tries to include version control (VCS) information in
binaries. Since Buildroot separates version control from the build
process it is sensible to disable this behavior.

This avoids build errors when building with a git repository higher
up in the tree owned by root. In this case the go build system
calls `git status --porcelain` which returns with an error:
fatal: detected dubious ownership in repository at '/build'

Signed-off-by: Stefan Agner <stefan@agner.ch>
Reviewed-by: Christian Stewart <christian@paral.in>
Signed-off-by: Arnout Vandecappelle <arnout@mind.be>
---
 package/pkg-golang.mk | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/package/pkg-golang.mk b/package/pkg-golang.mk
index cdc67b32c0..da9c9a21ac 100644
--- a/package/pkg-golang.mk
+++ b/package/pkg-golang.mk
@@ -45,7 +45,8 @@ $(2)_BUILD_OPTS += \
 	-modcacherw \
 	-tags "$$($(2)_TAGS)" \
 	-trimpath \
-	-p $$(PARALLEL_JOBS)
+	-p $$(PARALLEL_JOBS) \
+	-buildvcs=false
 
 # Target packages need the Go compiler on the host at download time (for
 # vendoring), and at build and install time.
_______________________________________________
buildroot mailing list
buildroot@buildroot.org
https://lists.buildroot.org/mailman/listinfo/buildroot
